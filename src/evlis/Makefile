DATE=	20200621
SCM=	s9
LCASE=	$(SCM) lcase.scm
#LCASE=	dd conv=lcase 2>/dev/null
O=	-O1

all:	stage2

stage.lisp: lisp.lisp liscmp.lisp
	cat lisp.lisp liscmp.lisp >stage.lisp

stage0: stage.lisp lisrun.c liscmp.scm
	cat lisrun.c >stage0.c
	$(SCM) liscmp.scm <stage.lisp >>stage0.c
	cc $O -o stage0 stage0.c

stage1: stage.lisp stage0
	cat lisrun.c >stage1.c
	./stage0 <stage.lisp | $(LCASE) >>stage1.c
	cc $O -o stage1 stage1.c

stage2: stage.lisp stage1
	cat lisrun.c >stage2.c
	./stage1 <stage.lisp | $(LCASE) >>stage2.c
	cc $O -o stage2 stage2.c
	diff -u stage1.c stage2.c
	cp stage2.c boot.c

test:
	sh lcg test.lisp >test.result
	diff -u test.ok test.result && rm -f test.result

csums:
	csum -u <_checksums >_checksums.new
	mv -f _checksums.new _checksums

clean:
	rm -f liscmp stage[012] stage[012].c stage.lisp stage.diff \
		run.lisp run.c run.o run evlis.zip evlis.b \
		test.result core *.core

mksums:	clean
	find . -type f | grep -v _checksums | grep -v evlis.zip \
		| sort | csum -m >_checksums

arc:	clean
	(cd ..; zip -r9 evlis.zip evlis -x evlis/images/*) \
		&& mv ../evlis.zip .
	bdes -k evlis2020 <evlis.zip >evlis.b

