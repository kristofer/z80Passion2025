/* 
 * LISP to C Compiler Runtime
 * Nils M Holm, 2020
 *
 * In the public domain
 *
 * Where there is no public domain, the
 * Creative Commons Zero (CC0) license applies
 */

#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>
#include <fcntl.h>

int	infd = 0;
char	inbuf[256];
int	inptr = 0,
	inlim = 0;

int rreadc(void) {
	if (inptr >= inlim) {
		inlim = read(infd, inbuf, 256);
		if (inlim < 1) return 0;
		inptr = 0;
	}
	inptr++;
	return toupper(inbuf[inptr-1]);
}

int	outfd = 1;
char	outbuf[256];
int	outptr = 0;

void flush(void) {
	write(outfd, outbuf, outptr);
	outptr = 0;
}

void rwritec(int c) {
	if (outptr >= 256) flush();
	outbuf[outptr++] = c;
	if ('\n' == c) flush();
}

void pr(char *s) {
	while (*s) rwritec(*s++);
}

void prnum2(int n) {
	if (n != 0) {
		prnum2(n / 10);
		rwritec('0' + n%10);
	}
}

void prnum(int n) {
	if (0 == n)
		rwritec('0');
	else
		prnum2(n);
}

#define limit	65535

#define cell	unsigned short

void print2(cell n);

void halt(char *s, cell n) {
	flush();
	write(2, "*** ", 4);
	write(2, s, strlen(s));
	if (n != limit) {
		write(2, ": ", 2);
		outfd = 2;
		print2(n);
		flush();
	}
	write(2, "\n", 1);
	exit(1);
}

#define nil	0
#define true	1
#define symlis	2
#define oblist	3
#define stack	4
#define expr	5
#define expr2	6
#define tmp	7
#define funtag	8
#define tname	9
#define frelis	10

#define atomtag	1
#define marktag	2
#define travtag	4

cell	car[limit],
	cdr[limit];
char	tag[limit];

cell	low = limit;

void mark(cell n) {
	cell	p, x;

	p = nil;
	for (;;) {
		if (tag[n] & marktag) {
			if (nil == p) break;
			if (tag[p] & travtag) {
				x = cdr[p];
				cdr[p] = car[p];
				car[p] = n;
				tag[p] &= ~travtag;
				n = x;
			}
			else {
				x = p;
				p = cdr[x];
				cdr[x] = n;
				n = x;
			}
		}
		else if (tag[n] & atomtag) {
			x = cdr[n];
			cdr[n] = p;
			p = n;
			n = x;
			tag[p] |= marktag;
		}
		else {
			x = car[n];
			car[n] = p;
			tag[n] |= marktag;
			p = n;
			n = x;
			tag[p] |= travtag;
		}
	}
}

int	verbose = 0;

#define ref(x) car[x]
#define val(x) cdr[x]

int gc(void) {
	int	i, k;

	k = 0;
	ref(frelis) = nil;
	for (i=0; i<=frelis; i++) mark(i);
	for (i=0; i<limit; i++) {
		if (0 == (tag[i] & marktag)) {
			cdr[i] = ref(frelis);
			ref(frelis) = i;
			k++;
		}
		else {
			tag[i] &= ~marktag;
		}
	}
	if (verbose) {
		if (k < low) low = k;
		prnum(k);
		pr(" CELLS RECLAIMED\n");
	}
	return k;
}

cell cons3(cell a, cell d, cell t) {
	int	n;

	if (nil == ref(frelis)) {
		cdr[tmp] = d;
		if (0 == t) car[tmp] = a;
		gc();
		car[tmp] = cdr[tmp] = nil;
		if (nil == ref(frelis)) halt("OUT OF CELLS", limit);
	}
	n = ref(frelis);
	ref(frelis) = cdr[ref(frelis)];
	car[n] = a;
	cdr[n] = d;
	tag[n] = t;
	return n;
}

cell mkfun(int k) {
	return cons3(cons3(funtag, cons3(k, nil, atomtag),
				atomtag),
			nil, 0);  
}

char *atomname(cell n) {
	static char	s[128];
	int		i;

	i = 0;
	for (n = car[n]; n != nil; n = cdr[n]) {
		if (i > 127) break;
		s[i++] = car[n];
	}
	s[i] = 0;
	return s;
}

void dump(cell n) {
	char	*s;
	int	fd;
	char	*m;

	m = "IMAGE DUMP FAILED\n";
	s = atomname(n);
	fd = creat(s, 0644);
	if (fd < 0) {
		pr(m); return;
	}
	if (write(fd, car, limit*sizeof(cell)) != limit*sizeof(cell))
		pr(m);
	else if (write(fd, cdr, limit*sizeof(cell)) != limit*sizeof(cell))
		pr(m);
	else if (write(fd, tag, limit) != limit)
		pr(m);
	close(fd);
}

void load(cell n) {
	char	*s;
	int	fd;
	char	*m;

	m = "IMAGE LOAD FAILED, ABORTING";
	s = atomname(n);
	fd = open(s, O_RDONLY);
	if (fd < 0) {
		pr("IMAGE NOT LOADED\n");
		return;
	}
	if (read(fd, car, limit*sizeof(cell)) != limit*sizeof(cell))
		halt(m, limit);
	if (read(fd, cdr, limit*sizeof(cell)) != limit*sizeof(cell))
		halt(m, limit);
	if (read(fd, tag, limit) != limit)
		halt(m, limit);
	close(fd);
}

cell pop(void) {
	cell	x;

	x = car[ref(stack)];
	ref(stack) = cdr[ref(stack)];
	return x;
}

cell readc(void) {
	int	c;

	c = rreadc();
	if (0 == c) return nil;
	return cons3(c, nil, atomtag);
}

void writec(cell x) {
	if (tag[x] & atomtag)
		rwritec(car[x]);
	else
		rwritec(car[car[x]]);
}

void print2(cell n) {
	if (n == nil) {
		pr("NIL");
	}
	else if (n == true) {
		pr("T");
	}
	else if (tag[n] & atomtag) {
		pr("<");
		rwritec(car[n]);
		pr(">");
	}
	else if (tag[car[n]] & atomtag) {
		if (funtag == car[car[n]]) {
			pr("<FUNCTION-");
			prnum(car[cdr[car[n]]]);
			pr(">");
		}
		else {
			for (n = car[n]; n != nil; n = cdr[n])
				rwritec(car[n]);
		}
	}
	else {
		rwritec('(');
		while (n != nil) {
			if (n <= 1 || tag[n] & atomtag ||
			    tag[car[n]] & atomtag)
			{
				pr(". ");
				print2(n);
				break;
			}
			print2(car[n]);
			if (cdr[n] != nil) rwritec(' ');
			n = cdr[n];
		}
		rwritec(')');
	}
}

void print(cell n) {
	print2(n);
	rwritec('\n');
}

void init(void) {
	memset(car, 0, limit*sizeof(cell));
	memset(cdr, 0, limit*sizeof(cell));
	memset(tag, 0, limit);
	car[true] = tname;
	cdr[true] = true;
	car[tname] = 84; /* T */
	cdr[tname] = nil;
	tag[tname] = atomtag;
}

#define toframe() \
	car[ref(stack)] = cons3(ref(expr), car[ref(stack)], 0)
#define newframe() ref(stack) = cons3(nil, ref(stack), 0)
#define push() ref(stack) = cons3(ref(expr), ref(stack), 0)
#define label(x) case x:
#define goto(x) k = x; break
#define symbolic() (tag[car[ref(expr)]] & atomtag)
#define atomic() (ref(expr) <= 1 || symbolic())
#define unbind() restore(car[ref(stack)])
#define u(c) toupper(c)
#define car_err() halt("CAR: EXPECTED LIST", ref(expr));
#define cdr_err() halt("CDR: EXPECTED LIST", ref(expr));

void bind(cell v) {
	cell	a, p, n;

	a = cdr[car[ref(stack)]];
	if (tag[car[v]] & atomtag) {
		cdr[car[ref(stack)]] =
			cons3(nil, cons3(v, cons3(val(v), a, 0), 0), 0);
		val(v) = a;
	}
	else {
		for (p = a; p != nil; p = cdr[p]) {
			if (nil == v) break;
			n = car[p];
			car[p] = cons3(car[v], val(car[v]), 0);
			val(car[v]) = n;
			v = cdr[v];
		}
		if (p != nil || v != nil)
			halt("WRONG NUMBER OF ARGUMENTS", limit);
	}
}

int restore(cell p) {
	int	k;

	k = car[p];
	if (nil == car[cdr[p]]) {
		p = cdr[cdr[p]];
		val(car[p]) = car[cdr[p]];
	}
	else {
		for (p = cdr[p]; p != nil; p = cdr[p])
			val(car[car[p]]) = cdr[car[p]];
	}
	return k;
}

int apply(int n) {
	if (!symbolic() || car[car[ref(expr)]] != funtag)
		halt("APPLICATION OF NON-FUNCTION", ref(expr));
	if (n < 0) {
		car[ref(stack)] = cons3(restore(car[cdr[ref(stack)]]),
					car[ref(stack)], 0);
		cdr[ref(stack)] = cdr[cdr[ref(stack)]];
	}
	else {
		car[ref(stack)] = cons3(n, car[ref(stack)], atomtag);
	}
	return car[cdr[car[ref(expr)]]];
}

int retn(void) {
	int	k;

	k = car[car[ref(stack)]];
	ref(stack) = cdr[ref(stack)];
	return k;
}

void run(void);

int main(int argc, char **argv) {
	if (argc > 1) verbose = 1;
	init();
	run();
	print(ref(expr));
	if (verbose) {
		gc();
		prnum(limit-low);
		pr(" CELLS USED MAX\n");
	}
	flush();
}

void setup(void);

