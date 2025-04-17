;* * * * *  Small-C/Plus z88dk * * * * *
;  Version: 22110-51889e5300-20231220
;
;	Reconstructed for z80 Module Assembler
;
;	Module compile time: Thu Apr 17 08:57:51 2025


	C_LINE	0,"sl3.c"

	MODULE	sl3_c


	INCLUDE "z80_crt0.hdr"


	C_LINE	0,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	0,"../../../z88dk/bin/..//include/sys/compiler.h"
	C_LINE	0,"../../../z88dk/bin/..//include/sys/proto.h"
	C_LINE	6,"../../../z88dk/bin/..//include/sys/compiler.h"
	C_LINE	4,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	0,"../../../z88dk/bin/..//include/stdint.h"
	C_LINE	0,"../../../z88dk/bin/..//include/sys/types.h"
	C_LINE	17,"../../../z88dk/bin/..//include/sys/types.h"
	C_LINE	26,"../../../z88dk/bin/..//include/sys/types.h"
	C_LINE	38,"../../../z88dk/bin/..//include/sys/types.h"
	C_LINE	44,"../../../z88dk/bin/..//include/sys/types.h"
	C_LINE	49,"../../../z88dk/bin/..//include/sys/types.h"
	C_LINE	54,"../../../z88dk/bin/..//include/sys/types.h"
	C_LINE	59,"../../../z88dk/bin/..//include/sys/types.h"
	C_LINE	64,"../../../z88dk/bin/..//include/sys/types.h"
	C_LINE	69,"../../../z88dk/bin/..//include/sys/types.h"
	C_LINE	74,"../../../z88dk/bin/..//include/sys/types.h"
	C_LINE	79,"../../../z88dk/bin/..//include/sys/types.h"
	C_LINE	84,"../../../z88dk/bin/..//include/sys/types.h"
	C_LINE	89,"../../../z88dk/bin/..//include/sys/types.h"
	C_LINE	93,"../../../z88dk/bin/..//include/sys/types.h"
	C_LINE	94,"../../../z88dk/bin/..//include/sys/types.h"
	C_LINE	95,"../../../z88dk/bin/..//include/sys/types.h"
	C_LINE	97,"../../../z88dk/bin/..//include/sys/types.h"
	C_LINE	98,"../../../z88dk/bin/..//include/sys/types.h"
	C_LINE	99,"../../../z88dk/bin/..//include/sys/types.h"
	C_LINE	105,"../../../z88dk/bin/..//include/sys/types.h"
	C_LINE	110,"../../../z88dk/bin/..//include/sys/types.h"
	C_LINE	11,"../../../z88dk/bin/..//include/stdint.h"
	C_LINE	13,"../../../z88dk/bin/..//include/stdint.h"
	C_LINE	14,"../../../z88dk/bin/..//include/stdint.h"
	C_LINE	15,"../../../z88dk/bin/..//include/stdint.h"
	C_LINE	17,"../../../z88dk/bin/..//include/stdint.h"
	C_LINE	18,"../../../z88dk/bin/..//include/stdint.h"
	C_LINE	19,"../../../z88dk/bin/..//include/stdint.h"
	C_LINE	21,"../../../z88dk/bin/..//include/stdint.h"
	C_LINE	22,"../../../z88dk/bin/..//include/stdint.h"
	C_LINE	23,"../../../z88dk/bin/..//include/stdint.h"
	C_LINE	25,"../../../z88dk/bin/..//include/stdint.h"
	C_LINE	26,"../../../z88dk/bin/..//include/stdint.h"
	C_LINE	27,"../../../z88dk/bin/..//include/stdint.h"
	C_LINE	29,"../../../z88dk/bin/..//include/stdint.h"
	C_LINE	30,"../../../z88dk/bin/..//include/stdint.h"
	C_LINE	31,"../../../z88dk/bin/..//include/stdint.h"
	C_LINE	33,"../../../z88dk/bin/..//include/stdint.h"
	C_LINE	34,"../../../z88dk/bin/..//include/stdint.h"
	C_LINE	35,"../../../z88dk/bin/..//include/stdint.h"
	C_LINE	37,"../../../z88dk/bin/..//include/stdint.h"
	C_LINE	38,"../../../z88dk/bin/..//include/stdint.h"
	C_LINE	40,"../../../z88dk/bin/..//include/stdint.h"
	C_LINE	41,"../../../z88dk/bin/..//include/stdint.h"
	C_LINE	43,"../../../z88dk/bin/..//include/stdint.h"
	C_LINE	44,"../../../z88dk/bin/..//include/stdint.h"
	C_LINE	49,"../../../z88dk/bin/..//include/stdint.h"
	C_LINE	52,"../../../z88dk/bin/..//include/stdint.h"
	C_LINE	54,"../../../z88dk/bin/..//include/stdint.h"
	C_LINE	55,"../../../z88dk/bin/..//include/stdint.h"
	C_LINE	5,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	0,"../../../z88dk/bin/..//include/fcntl.h"
	C_LINE	34,"../../../z88dk/bin/..//include/fcntl.h"
	C_LINE	36,"../../../z88dk/bin/..//include/fcntl.h"
	C_LINE	37,"../../../z88dk/bin/..//include/fcntl.h"
	C_LINE	39,"../../../z88dk/bin/..//include/fcntl.h"
	C_LINE	41,"../../../z88dk/bin/..//include/fcntl.h"
	C_LINE	42,"../../../z88dk/bin/..//include/fcntl.h"
	C_LINE	45,"../../../z88dk/bin/..//include/fcntl.h"
	C_LINE	50,"../../../z88dk/bin/..//include/fcntl.h"
	C_LINE	51,"../../../z88dk/bin/..//include/fcntl.h"
	C_LINE	53,"../../../z88dk/bin/..//include/fcntl.h"
	C_LINE	59,"../../../z88dk/bin/..//include/fcntl.h"
	C_LINE	60,"../../../z88dk/bin/..//include/fcntl.h"
	C_LINE	61,"../../../z88dk/bin/..//include/fcntl.h"
	C_LINE	64,"../../../z88dk/bin/..//include/fcntl.h"
	C_LINE	83,"../../../z88dk/bin/..//include/fcntl.h"
	C_LINE	92,"../../../z88dk/bin/..//include/fcntl.h"
	C_LINE	105,"../../../z88dk/bin/..//include/fcntl.h"
	C_LINE	106,"../../../z88dk/bin/..//include/fcntl.h"
	C_LINE	108,"../../../z88dk/bin/..//include/fcntl.h"
	C_LINE	110,"../../../z88dk/bin/..//include/fcntl.h"
	C_LINE	78,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	91,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	141,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	160,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	165,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	166,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	175,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	178,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	182,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	183,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	184,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	186,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	187,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	191,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	196,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	197,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	199,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	206,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	208,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	210,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	216,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	218,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	228,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	231,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	233,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	235,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	240,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	242,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	246,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	255,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	256,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	260,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	269,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	270,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	273,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	275,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	276,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	277,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	278,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	279,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	280,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	286,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	293,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	294,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	295,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	296,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	297,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	307,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	312,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	317,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	320,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	323,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	326,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	328,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	331,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	333,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	334,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	336,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	338,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	342,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	344,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	348,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	351,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	360,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	362,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	365,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	367,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	369,"../../../z88dk/bin/..//include/stdio.h"
	C_LINE	20,"sl3.c"
	C_LINE	0,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	27,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	29,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	33,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	35,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	39,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	41,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	45,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	47,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	51,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	53,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	57,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	59,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	63,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	65,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	69,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	71,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	79,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	81,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	86,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	88,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	93,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	95,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	100,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	102,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	107,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	109,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	119,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	120,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	122,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	0,"../../../z88dk/bin/..//include/malloc.h"
	C_LINE	69,"../../../z88dk/bin/..//include/malloc.h"
	C_LINE	70,"../../../z88dk/bin/..//include/malloc.h"
	C_LINE	71,"../../../z88dk/bin/..//include/malloc.h"
	C_LINE	72,"../../../z88dk/bin/..//include/malloc.h"
	C_LINE	73,"../../../z88dk/bin/..//include/malloc.h"
	C_LINE	74,"../../../z88dk/bin/..//include/malloc.h"
	C_LINE	75,"../../../z88dk/bin/..//include/malloc.h"
	C_LINE	80,"../../../z88dk/bin/..//include/malloc.h"
	C_LINE	81,"../../../z88dk/bin/..//include/malloc.h"
	C_LINE	82,"../../../z88dk/bin/..//include/malloc.h"
	C_LINE	83,"../../../z88dk/bin/..//include/malloc.h"
	C_LINE	84,"../../../z88dk/bin/..//include/malloc.h"
	C_LINE	85,"../../../z88dk/bin/..//include/malloc.h"
	C_LINE	140,"../../../z88dk/bin/..//include/malloc.h"
	C_LINE	141,"../../../z88dk/bin/..//include/malloc.h"
	C_LINE	142,"../../../z88dk/bin/..//include/malloc.h"
	C_LINE	143,"../../../z88dk/bin/..//include/malloc.h"
	C_LINE	144,"../../../z88dk/bin/..//include/malloc.h"
	C_LINE	145,"../../../z88dk/bin/..//include/malloc.h"
	C_LINE	146,"../../../z88dk/bin/..//include/malloc.h"
	C_LINE	147,"../../../z88dk/bin/..//include/malloc.h"
	C_LINE	148,"../../../z88dk/bin/..//include/malloc.h"
	C_LINE	149,"../../../z88dk/bin/..//include/malloc.h"
	C_LINE	150,"../../../z88dk/bin/..//include/malloc.h"
	C_LINE	151,"../../../z88dk/bin/..//include/malloc.h"
	C_LINE	152,"../../../z88dk/bin/..//include/malloc.h"
	C_LINE	138,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	151,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	152,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	155,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	156,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	164,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	165,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	166,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	167,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	171,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	174,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	175,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	176,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	177,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	178,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	190,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	191,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	192,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	193,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	197,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	198,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	200,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	201,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	226,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	234,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	242,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	250,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	258,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	260,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	265,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	267,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	272,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	274,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	279,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	281,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	291,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	293,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	297,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	299,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	304,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	306,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	323,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	325,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	329,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	331,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	344,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	348,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	349,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	352,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	353,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	357,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	359,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	362,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	363,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	378,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	380,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	382,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	386,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	388,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	406,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	408,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	413,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	416,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	21,"sl3.c"
	C_LINE	0,"../../../z88dk/bin/..//include/stdarg.h"
	C_LINE	22,"sl3.c"
	C_LINE	0,"../../../z88dk/bin/..//include/string.h"
	C_LINE	7,"../../../z88dk/bin/..//include/string.h"
	C_LINE	9,"../../../z88dk/bin/..//include/string.h"
	C_LINE	13,"../../../z88dk/bin/..//include/string.h"
	C_LINE	15,"../../../z88dk/bin/..//include/string.h"
	C_LINE	19,"../../../z88dk/bin/..//include/string.h"
	C_LINE	21,"../../../z88dk/bin/..//include/string.h"
	C_LINE	25,"../../../z88dk/bin/..//include/string.h"
	C_LINE	27,"../../../z88dk/bin/..//include/string.h"
	C_LINE	32,"../../../z88dk/bin/..//include/string.h"
	C_LINE	34,"../../../z88dk/bin/..//include/string.h"
	C_LINE	38,"../../../z88dk/bin/..//include/string.h"
	C_LINE	40,"../../../z88dk/bin/..//include/string.h"
	C_LINE	44,"../../../z88dk/bin/..//include/string.h"
	C_LINE	46,"../../../z88dk/bin/..//include/string.h"
	C_LINE	50,"../../../z88dk/bin/..//include/string.h"
	C_LINE	52,"../../../z88dk/bin/..//include/string.h"
	C_LINE	57,"../../../z88dk/bin/..//include/string.h"
	C_LINE	59,"../../../z88dk/bin/..//include/string.h"
	C_LINE	63,"../../../z88dk/bin/..//include/string.h"
	C_LINE	65,"../../../z88dk/bin/..//include/string.h"
	C_LINE	69,"../../../z88dk/bin/..//include/string.h"
	C_LINE	71,"../../../z88dk/bin/..//include/string.h"
	C_LINE	76,"../../../z88dk/bin/..//include/string.h"
	C_LINE	77,"../../../z88dk/bin/..//include/string.h"
	C_LINE	78,"../../../z88dk/bin/..//include/string.h"
	C_LINE	81,"../../../z88dk/bin/..//include/string.h"
	C_LINE	83,"../../../z88dk/bin/..//include/string.h"
	C_LINE	87,"../../../z88dk/bin/..//include/string.h"
	C_LINE	89,"../../../z88dk/bin/..//include/string.h"
	C_LINE	94,"../../../z88dk/bin/..//include/string.h"
	C_LINE	96,"../../../z88dk/bin/..//include/string.h"
	C_LINE	101,"../../../z88dk/bin/..//include/string.h"
	C_LINE	103,"../../../z88dk/bin/..//include/string.h"
	C_LINE	108,"../../../z88dk/bin/..//include/string.h"
	C_LINE	110,"../../../z88dk/bin/..//include/string.h"
	C_LINE	115,"../../../z88dk/bin/..//include/string.h"
	C_LINE	117,"../../../z88dk/bin/..//include/string.h"
	C_LINE	122,"../../../z88dk/bin/..//include/string.h"
	C_LINE	124,"../../../z88dk/bin/..//include/string.h"
	C_LINE	128,"../../../z88dk/bin/..//include/string.h"
	C_LINE	130,"../../../z88dk/bin/..//include/string.h"
	C_LINE	138,"../../../z88dk/bin/..//include/string.h"
	C_LINE	140,"../../../z88dk/bin/..//include/string.h"
	C_LINE	144,"../../../z88dk/bin/..//include/string.h"
	C_LINE	146,"../../../z88dk/bin/..//include/string.h"
	C_LINE	150,"../../../z88dk/bin/..//include/string.h"
	C_LINE	152,"../../../z88dk/bin/..//include/string.h"
	C_LINE	157,"../../../z88dk/bin/..//include/string.h"
	C_LINE	159,"../../../z88dk/bin/..//include/string.h"
	C_LINE	163,"../../../z88dk/bin/..//include/string.h"
	C_LINE	165,"../../../z88dk/bin/..//include/string.h"
	C_LINE	169,"../../../z88dk/bin/..//include/string.h"
	C_LINE	171,"../../../z88dk/bin/..//include/string.h"
	C_LINE	175,"../../../z88dk/bin/..//include/string.h"
	C_LINE	177,"../../../z88dk/bin/..//include/string.h"
	C_LINE	181,"../../../z88dk/bin/..//include/string.h"
	C_LINE	183,"../../../z88dk/bin/..//include/string.h"
	C_LINE	187,"../../../z88dk/bin/..//include/string.h"
	C_LINE	189,"../../../z88dk/bin/..//include/string.h"
	C_LINE	193,"../../../z88dk/bin/..//include/string.h"
	C_LINE	195,"../../../z88dk/bin/..//include/string.h"
	C_LINE	199,"../../../z88dk/bin/..//include/string.h"
	C_LINE	201,"../../../z88dk/bin/..//include/string.h"
	C_LINE	205,"../../../z88dk/bin/..//include/string.h"
	C_LINE	207,"../../../z88dk/bin/..//include/string.h"
	C_LINE	212,"../../../z88dk/bin/..//include/string.h"
	C_LINE	214,"../../../z88dk/bin/..//include/string.h"
	C_LINE	219,"../../../z88dk/bin/..//include/string.h"
	C_LINE	221,"../../../z88dk/bin/..//include/string.h"
	C_LINE	226,"../../../z88dk/bin/..//include/string.h"
	C_LINE	228,"../../../z88dk/bin/..//include/string.h"
	C_LINE	232,"../../../z88dk/bin/..//include/string.h"
	C_LINE	234,"../../../z88dk/bin/..//include/string.h"
	C_LINE	238,"../../../z88dk/bin/..//include/string.h"
	C_LINE	240,"../../../z88dk/bin/..//include/string.h"
	C_LINE	245,"../../../z88dk/bin/..//include/string.h"
	C_LINE	247,"../../../z88dk/bin/..//include/string.h"
	C_LINE	253,"../../../z88dk/bin/..//include/string.h"
	C_LINE	255,"../../../z88dk/bin/..//include/string.h"
	C_LINE	259,"../../../z88dk/bin/..//include/string.h"
	C_LINE	261,"../../../z88dk/bin/..//include/string.h"
	C_LINE	265,"../../../z88dk/bin/..//include/string.h"
	C_LINE	267,"../../../z88dk/bin/..//include/string.h"
	C_LINE	271,"../../../z88dk/bin/..//include/string.h"
	C_LINE	273,"../../../z88dk/bin/..//include/string.h"
	C_LINE	278,"../../../z88dk/bin/..//include/string.h"
	C_LINE	280,"../../../z88dk/bin/..//include/string.h"
	C_LINE	284,"../../../z88dk/bin/..//include/string.h"
	C_LINE	286,"../../../z88dk/bin/..//include/string.h"
	C_LINE	290,"../../../z88dk/bin/..//include/string.h"
	C_LINE	292,"../../../z88dk/bin/..//include/string.h"
	C_LINE	296,"../../../z88dk/bin/..//include/string.h"
	C_LINE	298,"../../../z88dk/bin/..//include/string.h"
	C_LINE	302,"../../../z88dk/bin/..//include/string.h"
	C_LINE	304,"../../../z88dk/bin/..//include/string.h"
	C_LINE	308,"../../../z88dk/bin/..//include/string.h"
	C_LINE	310,"../../../z88dk/bin/..//include/string.h"
	C_LINE	314,"../../../z88dk/bin/..//include/string.h"
	C_LINE	316,"../../../z88dk/bin/..//include/string.h"
	C_LINE	320,"../../../z88dk/bin/..//include/string.h"
	C_LINE	321,"../../../z88dk/bin/..//include/string.h"
	C_LINE	323,"../../../z88dk/bin/..//include/string.h"
	C_LINE	328,"../../../z88dk/bin/..//include/string.h"
	C_LINE	330,"../../../z88dk/bin/..//include/string.h"
	C_LINE	335,"../../../z88dk/bin/..//include/string.h"
	C_LINE	336,"../../../z88dk/bin/..//include/string.h"
	C_LINE	338,"../../../z88dk/bin/..//include/string.h"
	C_LINE	343,"../../../z88dk/bin/..//include/string.h"
	C_LINE	345,"../../../z88dk/bin/..//include/string.h"
	C_LINE	349,"../../../z88dk/bin/..//include/string.h"
	C_LINE	351,"../../../z88dk/bin/..//include/string.h"
	C_LINE	355,"../../../z88dk/bin/..//include/string.h"
	C_LINE	357,"../../../z88dk/bin/..//include/string.h"
	C_LINE	361,"../../../z88dk/bin/..//include/string.h"
	C_LINE	363,"../../../z88dk/bin/..//include/string.h"
	C_LINE	369,"../../../z88dk/bin/..//include/string.h"
	C_LINE	371,"../../../z88dk/bin/..//include/string.h"
	C_LINE	375,"../../../z88dk/bin/..//include/string.h"
	C_LINE	377,"../../../z88dk/bin/..//include/string.h"
	C_LINE	381,"../../../z88dk/bin/..//include/string.h"
	C_LINE	383,"../../../z88dk/bin/..//include/string.h"
	C_LINE	387,"../../../z88dk/bin/..//include/string.h"
	C_LINE	389,"../../../z88dk/bin/..//include/string.h"
	C_LINE	394,"../../../z88dk/bin/..//include/string.h"
	C_LINE	396,"../../../z88dk/bin/..//include/string.h"
	C_LINE	400,"../../../z88dk/bin/..//include/string.h"
	C_LINE	401,"../../../z88dk/bin/..//include/string.h"
	C_LINE	403,"../../../z88dk/bin/..//include/string.h"
	C_LINE	409,"../../../z88dk/bin/..//include/string.h"
	C_LINE	411,"../../../z88dk/bin/..//include/string.h"
	C_LINE	415,"../../../z88dk/bin/..//include/string.h"
	C_LINE	417,"../../../z88dk/bin/..//include/string.h"
	C_LINE	480,"../../../z88dk/bin/..//include/string.h"
	C_LINE	486,"../../../z88dk/bin/..//include/string.h"
	C_LINE	492,"../../../z88dk/bin/..//include/string.h"
	C_LINE	498,"../../../z88dk/bin/..//include/string.h"
	C_LINE	23,"sl3.c"
	C_LINE	0,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	7,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	9,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	14,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	16,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	21,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	23,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	28,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	30,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	35,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	37,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	42,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	44,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	49,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	51,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	56,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	58,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	63,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	65,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	70,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	72,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	77,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	79,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	84,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	86,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	91,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	93,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	98,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	100,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	105,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	107,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	112,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	114,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	119,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	121,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	126,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	128,"../../../z88dk/bin/..//include/ctype.h"
	C_LINE	24,"sl3.c"
	C_LINE	28,"sl3.c"
	SECTION	data_compiler
._line_num
	defw	1
	SECTION	code_compiler
	C_LINE	29,"sl3.c"
	SECTION	data_compiler
._total_malloc
	defw	0
	SECTION	code_compiler
	C_LINE	32,"sl3.c"
	C_LINE	33,"sl3.c"
	C_LINE	38,"sl3.c"
	C_LINE	39,"sl3.c"
	C_LINE	44,"sl3.c"

; Function car flags 0x00000200 __smallc 
; struct obj obj* car(struct obj obj* X)
; parameter 'struct obj obj* X' at sp+2 size(2)
	C_LINE	44,"sl3.c::car::0::0"
._car
	ld	hl,2	;const
	add	hl,sp
	ld	de,(hl)
	inc	hl
	ld	a,d
	or	e
	jp	nz,i_4	;
	ld	hl,__sgoioblk+20
	push	hl
	ld	hl,i_1+0
	push	hl
	ld	hl,(_line_num)
	push	hl
	ld	a,3
	call	fprintf
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_nil)
	ret


.i_4
	pop	bc
	pop	hl
	push	hl
	push	bc
	ex	de,hl
	ld	hl,(_nil)
	call	l_eq
	jp	nc,i_5	;
	ld	hl,(_nil)
	ret


.i_5
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	hl,(hl)
	ld	de,2
	and	a
	sbc	hl,de
	scf
	jr	nz,ASMPC+3
	ccf
	jp	nc,i_6	;
	ld	hl,__sgoioblk+20
	push	hl
	ld	hl,i_1+39
	push	hl
	call	l_gint6sp	;
	call	l_gint4	;
	push	hl
	call	l_gint8sp	;
	call	l_gint2	;
	push	hl
	ld	a,4
	call	fprintf
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_nil)
	ret


.i_6
	pop	bc
	pop	hl
	push	hl
	push	bc
	call	l_gint4	;
	ret


	C_LINE	58,"sl3.c::car::0::3"

; Function cdr flags 0x00000200 __smallc 
; struct obj obj* cdr(struct obj obj* X)
; parameter 'struct obj obj* X' at sp+2 size(2)
	C_LINE	58,"sl3.c::cdr::0::3"
._cdr
	pop	bc
	pop	hl
	push	hl
	push	bc
	ex	de,hl
	ld	hl,(_nil)
	call	l_eq
	jp	nc,i_7	;
	ld	hl,(_nil)
	ret


.i_7
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	hl,(hl)
	ld	de,2
	and	a
	sbc	hl,de
	scf
	jr	nz,ASMPC+3
	ccf
	jp	nc,i_8	;
	ld	hl,__sgoioblk+20
	push	hl
	ld	hl,i_1+89
	push	hl
	call	l_gint6sp	;
	call	l_gint2	;
	push	hl
	ld	a,3
	call	fprintf
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_nil)
	ret


.i_8
	pop	bc
	pop	hl
	push	hl
	push	bc
	call	l_gint6	;
	ld	de,0	;const
	call	l_eq
	jp	nc,i_9	;
	ld	hl,__sgoioblk+20
	push	hl
	ld	hl,i_1+134
	push	hl
	call	l_gint6sp	;
	call	l_gint2	;
	push	hl
	ld	a,3
	call	fprintf
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_nil)
	ret


.i_9
	pop	bc
	pop	hl
	push	hl
	push	bc
	call	l_gint6	;
	ret


	C_LINE	86,"sl3.c::cdr::0::6"

; Function omake flags 0x00000200 __smallc 
; struct obj obj* omake(const int type, int count, ...)
; parameter '...' at sp+2 size(0)
; parameter 'int count' at sp+2 size(2)
; parameter 'const int type' at sp+4 size(2)
	C_LINE	86,"sl3.c::omake::0::6"
._omake
	push	bc
	push	bc
	push	bc
	call	getarg
	add	hl,hl
	push	hl
	ld	hl,10	;const
	add	hl,sp
	pop	de
	add	hl,de
	ld	bc,-10
	add	hl,bc
	pop	de
	pop	bc
	push	hl
	push	de
	call	l_gint8sp	;
	dec	hl
	add	hl,hl
	ld	bc,6
	add	hl,bc
	ex	de,hl
	ld	hl,(_total_malloc)
	push	de
	ex	de,hl
	add	hl,de
	ld	(_total_malloc),hl
	ld	hl,6	;const
	add	hl,sp
	pop	de
	push	de
	push	hl
	ex	de,hl
	call	malloc_fastcall
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
	ld	hl,6	;const
	add	hl,sp
	ld	de,(hl)
	ld	hl,12	;const
	add	hl,sp
	ldi
	ldi
	call	l_gint6sp	;
	inc	hl
	inc	hl
	ld	de,(_line_num)
	ld	(hl),de
	ex	de,hl
	ld	hl,0	;const
	pop	de
	pop	bc
	push	hl
	push	de
	jp	i_12	;EOS
.i_10
	pop	de
	pop	hl
	inc	hl
	push	hl
	push	de
.i_12
	ld	hl,2	;const
	add	hl,sp
	ld	de,(hl)
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	call	l_lt
	jp	nc,i_11	;
	call	l_gint6sp	;
	ld	bc,4
	add	hl,bc
	push	hl
	call	l_gint4sp	;
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,6	;const
	add	hl,sp
	push	hl
	ld	hl,(hl)
	dec	hl
	dec	hl
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
	call	l_gint6sp	;
	call	l_gint1	;
	pop	de
	ex	de,hl
	ld	(hl),de
	jp	i_10	;EOS
.i_11
	call	l_gint6sp	;
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	102,"sl3.c::omake::0::7"

; Function findsym flags 0x00000200 __smallc 
; struct obj obj* findsym(char * name)
; parameter 'char * name' at sp+2 size(2)
	C_LINE	102,"sl3.c::findsym::0::7"
._findsym
	ld	hl,(_all_symbols)
	push	hl
	jp	i_15	;EOS
.i_13
	pop	hl
	push	hl
	push	hl
	call	_cdr
	pop	bc
	pop	bc
	push	hl
.i_15
	pop	de
	push	de
	ld	hl,(_nil)
	call	l_eq
	call	l_lneg
	jp	nc,i_14	;
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_car
	pop	bc
	call	l_gint4	;
	push	hl
	call	strcmp_callee
	call	l_lneg
	jp	nc,i_16	;
	pop	hl
	ret
.i_14
	ld	hl,(_nil)
	pop	bc
	ret


	C_LINE	110,"sl3.c::findsym::0::8"

; Function intern flags 0x00000200 __smallc 
; struct obj obj* intern(char * name)
; parameter 'char * name' at sp+2 size(2)
	C_LINE	110,"sl3.c::intern::0::8"
._intern
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_findsym
	pop	bc
	push	hl
	ex	de,hl
	ld	hl,(_nil)
	call	l_eq
	call	l_lneg
	jp	nc,i_17	;
	pop	hl
	push	hl
	push	hl
	call	_car
	pop	bc
	pop	bc
	ret


.i_17
	ld	hl,1	;const
	push	hl
	push	hl
	call	l_gint8sp	;
	push	hl
	ld	a,3
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	push	hl
	ld	hl,2	;const
	push	hl
	push	hl
	call	l_gint4sp	;
	push	hl
	ld	hl,(_all_symbols)
	push	hl
	ld	a,4
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	(_all_symbols),hl
	pop	hl
	ret


	C_LINE	121,"sl3.c::intern::0::9"

; Function multiple_extend flags 0x00000200 __smallc 
; struct obj obj* multiple_extend(struct obj obj* env, struct obj obj* syms, struct obj obj* vals)
; parameter 'struct obj obj* vals' at sp+2 size(2)
; parameter 'struct obj obj* syms' at sp+4 size(2)
; parameter 'struct obj obj* env' at sp+6 size(2)
	C_LINE	121,"sl3.c::multiple_extend::0::9"
._multiple_extend
	call	l_gint4sp	;
	ex	de,hl
	ld	hl,(_nil)
	call	l_eq
	jp	nc,i_18	;
	call	l_gint6sp	;
	ret
.i_18
	ld	hl,2	;const
	push	hl
	ld	de,2	;const
	push	de
	push	hl
	ld	hl,2	;const
	push	hl
	ld	l,12
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_car
	pop	bc
	push	hl
	ld	hl,12	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_car
	pop	bc
	push	hl
	ld	a,4
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	push	hl
	ld	hl,12	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	a,4
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_multiple_extend
	pop	bc
	pop	bc
	pop	bc
.i_19
	ret


	C_LINE	128,"sl3.c::multiple_extend::0::10"

; Function extend_top flags 0x00000200 __smallc 
; struct obj obj* extend_top(struct obj obj* sym, struct obj obj* val)
; parameter 'struct obj obj* val' at sp+2 size(2)
; parameter 'struct obj obj* sym' at sp+4 size(2)
	C_LINE	128,"sl3.c::extend_top::0::10"
._extend_top
	ld	hl,(_top_env)
	ld	bc,6
	add	hl,bc
	push	hl
	ld	hl,2	;const
	push	hl
	ld	de,2	;const
	push	de
	push	hl
	ld	hl,2	;const
	push	hl
	ld	l,14
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,14	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	a,4
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	push	hl
	ld	hl,(_top_env)
	push	hl
	call	_cdr
	pop	bc
	push	hl
	ld	a,4
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
	pop	bc
	pop	hl
	push	hl
	push	bc
	ret


	C_LINE	133,"sl3.c::extend_top::0::11"

; Function assoc flags 0x00000200 __smallc 
; struct obj obj* assoc(struct obj obj* key, struct obj obj* alist)
; parameter 'struct obj obj* alist' at sp+2 size(2)
; parameter 'struct obj obj* key' at sp+4 size(2)
	C_LINE	133,"sl3.c::assoc::0::11"
._assoc
	pop	bc
	pop	hl
	push	hl
	push	bc
	ex	de,hl
	ld	hl,(_nil)
	call	l_eq
	jp	nc,i_20	;
	ld	hl,(_nil)
	ret


.i_20
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_car
	pop	bc
	push	hl
	call	_car
	pop	bc
	push	hl
	call	l_gint6sp	;
	pop	de
	call	l_eq
	jp	nc,i_21	;
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_car
	pop	bc
	ret


.i_21
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	l_gint4sp	;
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_assoc
	pop	bc
	pop	bc
	ret


	C_LINE	140,"sl3.c::assoc::0::12"
	C_LINE	141,"sl3.c::assoc::0::12"
	C_LINE	142,"sl3.c::assoc::0::12"
	SECTION	data_compiler
._la_valid
	defw	0
	SECTION	code_compiler
	C_LINE	144,"sl3.c::assoc::0::12"
	C_LINE	145,"sl3.c::assoc::0::12"
	C_LINE	147,"sl3.c::assoc::0::12"

; Function add_to_buf flags 0x00000200 __smallc 
; void add_to_buf(char ch)
; parameter 'char ch' at sp+2 size(1)
	C_LINE	147,"sl3.c::add_to_buf::0::12"
._add_to_buf
	ld	hl,(_bufused)
	ld	a,l
	sub	99
	ld	a,h
	rla
	ccf
	rra
	sbc	128
	ret	nc
	ld	hl,_buf
	push	hl
	ld	hl,(_bufused)
	inc	hl
	ld	(_bufused),hl
	dec	hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,4	;const
	add	hl,sp
	call	l_gchar
	pop	de
	ld	a,l
	ld	(de),a
.i_23
	ret


	C_LINE	148,"sl3.c::add_to_buf::0::13"

; Function buf2str flags 0x00000200 __smallc 
; char * buf2str()
	C_LINE	148,"sl3.c::buf2str::0::13"
._buf2str
	ld	hl,_buf
	push	hl
	ld	hl,(_bufused)
	inc	hl
	ld	(_bufused),hl
	dec	hl
	pop	de
	add	hl,de
	ld	d,h
	ld	e,l
	xor	a
	ld	(de),a
	ld	hl,_buf
	call	strdup_fastcall
	ret


	C_LINE	149,"sl3.c::buf2str::0::14"

; Function setinput flags 0x00000200 __smallc 
; void setinput(struct filestr FILE* fp)
; parameter 'struct filestr FILE* fp' at sp+2 size(2)
	C_LINE	149,"sl3.c::setinput::0::14"
._setinput
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	(_ifp),hl
	ret


	C_LINE	150,"sl3.c::setinput::0::15"

; Function putback_token flags 0x00000200 __smallc 
; void putback_token(char * token)
; parameter 'char * token' at sp+2 size(2)
	C_LINE	150,"sl3.c::putback_token::0::15"
._putback_token
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	(_token_la),hl
	ld	hl,1	;const
	ld	(_la_valid),hl
	ret


	C_LINE	152,"sl3.c::putback_token::0::16"
	C_LINE	154,"sl3.c::putback_token::0::16"

; Function gettoken flags 0x00000200 __smallc 
; char * gettoken()
	C_LINE	154,"sl3.c::gettoken::0::16"
._gettoken
	push	bc
	dec	sp
	pop	hl
	ld	l,0
	push	hl
	ld	hl,0	;const
	ld	(_bufused),hl
	ld	hl,(_la_valid)
	ld	a,h
	or	l
	jp	z,i_24	;
	ld	hl,0	;const
	ld	(_la_valid),hl
	ld	hl,(_token_la)
	inc	sp
	pop	bc
	ret


.i_27
	ld	hl,1	;const
	add	hl,sp
	push	hl
	ld	hl,(_ifp)
	push	hl
	call	fgetc
	pop	bc
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
	ld	de,65535
	and	a
	sbc	hl,de
	jp	nz,i_28	;
	push	hl
	call	_myexit
	pop	bc
.i_28
	call	l_gint1sp	;
	ld	de,59
	and	a
	sbc	hl,de
	jp	nz,i_29	;
	add	hl,sp
	ld	(hl),1
.i_29
	call	l_gint1sp	;
	ld	de,10
	and	a
	sbc	hl,de
	jp	nz,i_30	;
	add	hl,sp
	ld	d,h
	ld	e,l
	xor	a
	ld	(de),a
	ld	hl,(_line_num)
	inc	hl
	ld	(_line_num),hl
.i_25
	call	l_gint1sp	;
	call	_isspace_fastcall
	ld	a,h
	or	l
	jp	nz,i_31	;
	add	hl,sp
	call	l_gchar
	ld	a,h
	or	l
	jr	z,i_32
.i_31
	ld	hl,1	;const
.i_32
	ld	a,h
	or	l
	jp	nz,i_27	;EOS
.i_26
	call	l_gint1sp	;
	ld	a,l
	call	l_sxt
	push	hl
	call	_add_to_buf
	pop	bc
	ld	hl,i_1+181
	push	hl
	call	l_gint3sp	;
	ex	de,hl
	pop	hl
.i_34
	ld	a,(hl)
	cp	e
	jr	z,i_35
	and	a
	inc	hl
	jr	nz,i_34
	ld	h,a
	ld	l,h
.i_35
	ld	a,h
	or	l
	jp	z,i_33	;
	call	_buf2str
	inc	sp
	pop	bc
	ret


.i_36
	ld	hl,1	;const
	add	hl,sp
	push	hl
	ld	hl,(_ifp)
	push	hl
	call	fgetc
	pop	bc
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
	ld	de,65535
	and	a
	sbc	hl,de
	jp	nz,i_39	;
	push	hl
	call	_myexit
	pop	bc
.i_39
	ld	hl,i_1+181
	push	hl
	call	l_gint3sp	;
	ex	de,hl
	pop	hl
.i_41
	ld	a,(hl)
	cp	e
	jr	z,i_42
	and	a
	inc	hl
	jr	nz,i_41
	ld	h,a
	ld	l,h
.i_42
	ld	a,h
	or	l
	jp	nz,i_43	;
	inc	hl
	add	hl,sp
	ld	hl,(hl)
	call	_isspace_fastcall
	ld	a,h
	or	l
	jr	z,i_44
.i_43
	ld	hl,1	;const
.i_44
	ld	a,h
	or	l
	jp	z,i_40	;
	call	l_gint1sp	;
	push	hl
	ld	hl,(_ifp)
	push	hl
	call	ungetc
	pop	bc
	pop	bc
	call	_buf2str
	inc	sp
	pop	bc
	ret


.i_40
	call	l_gint1sp	;
	ld	a,l
	call	l_sxt
	push	hl
	call	_add_to_buf
	pop	bc
	jp	i_36	;EOS
.i_37
	inc	sp
	pop	bc
	ret


	C_LINE	184,"sl3.c::gettoken::0::22"
	C_LINE	185,"sl3.c::gettoken::0::22"

; Function readobj flags 0x00000200 __smallc 
; struct obj obj* readobj()
	C_LINE	185,"sl3.c::readobj::0::22"
._readobj
	push	bc
	call	_gettoken
	pop	bc
	push	hl
	push	hl
	ld	hl,i_1+185
	push	hl
	call	strcmp_callee
	call	l_lneg
	jp	nc,i_45	;
	call	_readlist
	pop	bc
	ret


.i_45
	pop	hl
	push	hl
	push	hl
	ld	hl,i_1+183
	push	hl
	call	strcmp_callee
	call	l_lneg
	jp	nc,i_46	;
	ld	hl,2	;const
	push	hl
	push	hl
	ld	de,(_quote)
	push	de
	push	hl
	ld	hl,2	;const
	push	hl
	call	_readobj
	push	hl
	ld	hl,(_nil)
	push	hl
	ld	a,4
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	push	hl
	ld	a,4
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret


.i_46
	ld	hl,0	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	hl,i_1+187
	push	hl
	call	strspn_callee
	pop	de
	add	hl,de
	ld	a,(hl)
	and	a
	jp	z,i_48	;
	pop	hl
	push	hl
	ld	a,(hl)
	cp	45
	jp	nz,i_49	;
	pop	hl
	push	hl
	call	strlen_fastcall
	ld	de,1
	ex	de,hl
	and	a
	sbc	hl,de
	jp	nc,i_49	;
.i_51_i_49
	ld	hl,0	;const
	push	hl
	inc	hl
	push	hl
	call	l_gint4sp	;
	call	atoi_fastcall
	push	hl
	ld	a,3
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret


.i_47
	pop	hl
	push	hl
	push	hl
	call	_intern
	pop	bc
	pop	bc
	ret


	C_LINE	198,"sl3.c::readobj::0::23"

; Function readlist flags 0x00000200 __smallc 
; struct obj obj* readlist()
	C_LINE	198,"sl3.c::readlist::0::23"
._readlist
	call	_gettoken
	push	hl
	push	bc
	push	hl
	ld	hl,i_1+198
	push	hl
	call	strcmp_callee
	call	l_lneg
	jp	nc,i_52	;
	ld	hl,(_nil)
	pop	bc
	pop	bc
	ret


.i_52
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	hl,i_1+200
	push	hl
	call	strcmp_callee
	call	l_lneg
	jp	nc,i_53	;
	call	_readobj
	pop	bc
	push	hl
	call	_gettoken
	push	hl
	ld	hl,i_1+198
	push	hl
	call	strcmp_callee
	ld	a,h
	or	l
	jp	z,i_54	;
	ld	hl,1	;const
	call	exit_fastcall
.i_54
	pop	hl
	pop	bc
	ret


.i_53
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_putback_token
	pop	bc
	call	_readobj
	pop	bc
	push	hl
	ld	hl,2	;const
	push	hl
	push	hl
	call	l_gint4sp	;
	push	hl
	call	_readlist
	push	hl
	ld	a,4
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	212,"sl3.c::readlist::0::25"

; Function writeobj flags 0x00000200 __smallc 
; void writeobj(struct filestr FILE* ofp, struct obj obj* op)
; parameter 'struct obj obj* op' at sp+2 size(2)
; parameter 'struct filestr FILE* ofp' at sp+4 size(2)
	C_LINE	212,"sl3.c::writeobj::0::25"
._writeobj
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	hl,(hl)
.i_57
	call	l_case
	defw	i_58
	defw	0
	defw	i_63
	defw	2
	defw	i_69
	defw	1
	defw	i_72
	defw	4
	defw	i_73
	defw	3
	defw	0
	jp	i_74	;EOS
.i_58
	call	l_gint4sp	;
	push	hl
	ld	hl,i_1+202
	push	hl
	call	l_gint6sp	;
	ld	hl,(hl)
	ld	a,h
	or	l
	jr	nz,ASMPC+3
	scf
	jp	nc,i_61	;
	call	l_gint6sp	;
	call	l_gint4	;
	jp	i_62	;
.i_61
	ld	hl,0	;const
.i_62
	push	hl
	ld	a,3
	call	fprintf
	pop	bc
	pop	bc
	pop	bc
	ret
.i_63
	call	l_gint4sp	;
	push	hl
	ld	hl,i_1+185
	push	hl
	ld	a,2
	call	fprintf
	pop	bc
	pop	bc
.i_64
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	l_gint4sp	;
	push	hl
	call	_car
	pop	bc
	push	hl
	call	_writeobj
	pop	bc
	pop	bc
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_cdr
	pop	bc
	ex	de,hl
	ld	hl,(_nil)
	call	l_eq
	jp	nc,i_67	;
	call	l_gint4sp	;
	push	hl
	ld	hl,i_1+198
	push	hl
	ld	a,2
	call	fprintf
	pop	bc
	pop	bc
	jp	i_65	;EOS
.i_67
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_cdr
	pop	bc
	pop	de
	pop	bc
	push	hl
	push	de
	ld	hl,(hl)
	ld	de,2
	and	a
	sbc	hl,de
	scf
	jr	nz,ASMPC+3
	ccf
	jp	nc,i_68	;
	call	l_gint4sp	;
	push	hl
	ld	hl,i_1+205
	push	hl
	ld	a,2
	call	fprintf
	pop	bc
	pop	bc
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	l_gint4sp	;
	push	hl
	call	_writeobj
	pop	bc
	pop	bc
	call	l_gint4sp	;
	push	hl
	ld	hl,i_1+198
	push	hl
	ld	a,2
	call	fprintf
	pop	bc
	pop	bc
	jp	i_65	;EOS
.i_68
	call	l_gint4sp	;
	push	hl
	ld	hl,i_1+207
	push	hl
	ld	a,2
	call	fprintf
	pop	bc
	pop	bc
	jp	i_64	;EOS
.i_69
	pop	bc
	pop	hl
	push	hl
	push	bc
	ex	de,hl
	ld	hl,(_nil)
	call	l_eq
	jp	nc,i_70	;
	call	l_gint4sp	;
	push	hl
	ld	hl,i_1+209
	push	hl
	ld	a,2
	call	fprintf
	pop	bc
	pop	bc
	jp	i_71	;EOS
.i_70
	call	l_gint4sp	;
	push	hl
	ld	hl,i_1+212
	push	hl
	call	l_gint6sp	;
	call	l_gint4	;
	push	hl
	ld	a,3
	call	fprintf
	pop	bc
	pop	bc
	pop	bc
	ret
.i_72
	call	l_gint4sp	;
	push	hl
	ld	hl,i_1+215
	push	hl
	ld	a,2
	call	fprintf
	pop	bc
	pop	bc
	ret
.i_73
	call	l_gint4sp	;
	push	hl
	ld	hl,i_1+225
	push	hl
	ld	a,2
	call	fprintf
	pop	bc
	pop	bc
	ret
.i_74
	ld	hl,1	;const
	call	exit_fastcall
.i_56
	ret


	C_LINE	244,"sl3.c::writeobj::0::30"
	C_LINE	246,"sl3.c::writeobj::0::30"

; Function eval flags 0x00000200 __smallc 
; struct obj obj* eval(struct obj obj* exp, struct obj obj* env)
; parameter 'struct obj obj* env' at sp+2 size(2)
; parameter 'struct obj obj* exp' at sp+4 size(2)
	C_LINE	246,"sl3.c::eval::0::30"
._eval
	push	bc
	push	bc
	push	bc
.i_75
	ld	hl,10	;const
	add	hl,sp
	ld	de,(hl)
	inc	hl
	ld	hl,(_nil)
	call	l_eq
	jp	nc,i_76	;
	ld	hl,(_nil)
	pop	bc
	pop	bc
	pop	bc
	ret


.i_76
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	ld	hl,(hl)
.i_79
	call	l_case
	defw	i_80
	defw	0
	defw	i_81
	defw	1
	defw	i_83
	defw	2
	defw	i_99
	defw	4
	defw	i_100
	defw	3
	defw	0
	jp	i_78	;EOS
.i_80
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	pop	bc
	pop	bc
	pop	bc
	ret


.i_81
	ld	hl,4	;const
	add	hl,sp
	push	hl
	ld	hl,12	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,12	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_assoc
	pop	bc
	pop	bc
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
	call	l_gint4sp	;
	ex	de,hl
	ld	hl,(_nil)
	call	l_eq
	jp	nc,i_82	;
	ld	hl,__sgoioblk+20
	push	hl
	ld	hl,i_1+233
	push	hl
	ld	a,2
	call	fprintf
	pop	bc
	pop	bc
	ld	hl,__sgoioblk+20
	push	hl
	ld	hl,12	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_writeobj
	pop	bc
	pop	bc
	ld	hl,__sgoioblk+20
	push	hl
	ld	hl,i_1+37
	push	hl
	ld	a,2
	call	fprintf
	pop	bc
	pop	bc
	ld	hl,(_nil)
	pop	bc
	pop	bc
	pop	bc
	ret


.i_82
	call	l_gint4sp	;
	push	hl
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret


.i_83
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_car
	pop	bc
	ex	de,hl
	ld	hl,(_s_if)
	call	l_eq
	jp	nc,i_84	;
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_car
	pop	bc
	push	hl
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_eval
	pop	bc
	pop	bc
	ex	de,hl
	ld	hl,(_nil)
	call	l_ne
	jp	nc,i_85	;
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_car
	pop	bc
	push	hl
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_eval
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret


.i_85
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_car
	pop	bc
	push	hl
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_eval
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret


.i_84
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_car
	pop	bc
	ex	de,hl
	ld	hl,(_s_lambda)
	call	l_eq
	jp	nc,i_87	;
	ld	hl,3	;const
	push	hl
	push	hl
	ld	hl,14	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_car
	pop	bc
	push	hl
	ld	hl,16	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_cdr
	pop	bc
	push	hl
	ld	hl,16	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	a,5
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret


.i_87
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_car
	pop	bc
	ex	de,hl
	ld	hl,(_quote)
	call	l_eq
	jp	nc,i_88	;
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_car
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret


.i_88
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_car
	pop	bc
	ex	de,hl
	ld	hl,(_s_define)
	call	l_eq
	jp	nc,i_89	;
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_car
	pop	bc
	push	hl
	ld	hl,12	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_car
	pop	bc
	push	hl
	ld	hl,12	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_eval
	pop	bc
	pop	bc
	push	hl
	call	_extend_top
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret


.i_89
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_car
	pop	bc
	ex	de,hl
	ld	hl,(_s_setb)
	call	l_eq
	jp	nc,i_90	;
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_car
	pop	bc
	push	hl
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_assoc
	pop	bc
	pop	bc
	push	hl
	ld	hl,12	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_car
	pop	bc
	push	hl
	ld	hl,12	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_eval
	pop	bc
	pop	bc
	pop	de
	push	de
	push	hl
	ex	de,hl
	ld	bc,6
	add	hl,bc
	pop	de
	push	de
	ld	(hl),de
	ex	de,hl
	pop	hl
	push	hl
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret


.i_90
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_car
	pop	bc
	ex	de,hl
	ld	hl,(_s_begin)
	call	l_eq
	jp	nc,i_91	;
	ld	hl,10	;const
	add	hl,sp
	push	hl
	ld	hl,(hl)
	push	hl
	call	_cdr
	pop	bc
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
	ld	hl,10	;const
	add	hl,sp
	ld	de,(hl)
	inc	hl
	ld	hl,(_nil)
	call	l_eq
	jp	nc,i_92	;
	ld	hl,(_nil)
	pop	bc
	pop	bc
	pop	bc
	ret


.i_93
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_cdr
	pop	bc
	ex	de,hl
	ld	hl,(_nil)
	call	l_eq
	jp	nc,i_96	;
	ld	hl,10	;const
	add	hl,sp
	push	hl
	ld	hl,(hl)
	push	hl
	call	_car
	pop	bc
	pop	de
	ex	de,hl
	ld	(hl),de
	jp	i_75	;EOS
.i_96
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_car
	pop	bc
	push	hl
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_eval
	pop	bc
	pop	bc
	ld	hl,10	;const
	add	hl,sp
	push	hl
	ld	hl,(hl)
	push	hl
	call	_cdr
	pop	bc
	pop	de
	ex	de,hl
	ld	(hl),de
	jp	i_93	;EOS
.i_91
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_car
	pop	bc
	push	hl
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_eval
	pop	bc
	pop	bc
	pop	de
	pop	bc
	push	hl
	push	de
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_cdr
	pop	bc
	push	hl
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_evlis
	pop	bc
	pop	bc
	pop	bc
	pop	de
	push	de
	push	hl
	ex	de,hl
	ld	hl,(hl)
	ld	de,4
	and	a
	sbc	hl,de
	jp	nz,i_97	;
	pop	bc
	pop	hl
	push	hl
	push	bc
	call	l_gint4	;
	pop	de
	push	de
	push	hl
	ex	de,hl
	ex	(sp),hl
	call	l_jphl
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret


.i_97
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	hl,(hl)
	ld	de,3
	and	a
	sbc	hl,de
	jp	nz,i_98	;
	ld	hl,8	;const
	add	hl,sp
	push	hl
	call	l_gint4sp	;
	call	l_gint8	;
	push	hl
	call	l_gint6sp	;
	call	l_gint4	;
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_multiple_extend
	pop	bc
	pop	bc
	pop	bc
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
	ld	hl,10	;const
	add	hl,sp
	push	hl
	ld	hl,2	;const
	push	hl
	push	hl
	ld	hl,(_s_begin)
	push	hl
	ld	hl,10	;const
	add	hl,sp
	ld	bc,(hl)
	inc	hl
	ld	hl,6
	add	hl,bc
	ld	hl,(hl)
	push	hl
	ld	a,4
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	de
	ex	de,hl
	ld	(hl),de
	jp	i_75	;EOS
.i_98
	ld	hl,i_1+249
	push	hl
	ld	a,1
	call	printf
	pop	bc
	ld	hl,(_nil)
	pop	bc
	pop	bc
	pop	bc
	ret


.i_99
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	pop	bc
	pop	bc
	pop	bc
	ret


.i_100
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	pop	bc
	pop	bc
	pop	bc
	ret


.i_78
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	318,"sl3.c::eval::0::39"

; Function evlis flags 0x00000200 __smallc 
; struct obj obj* evlis(struct obj obj* exps, struct obj obj* env)
; parameter 'struct obj obj* env' at sp+2 size(2)
; parameter 'struct obj obj* exps' at sp+4 size(2)
	C_LINE	318,"sl3.c::evlis::0::39"
._evlis
	call	l_gint4sp	;
	ex	de,hl
	ld	hl,(_nil)
	call	l_eq
	jp	nc,i_101	;
	ld	hl,(_nil)
	ret


.i_101
	ld	hl,2	;const
	push	hl
	push	hl
	call	l_gint8sp	;
	push	hl
	call	_car
	pop	bc
	push	hl
	call	l_gint8sp	;
	push	hl
	call	_eval
	pop	bc
	pop	bc
	push	hl
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_cdr
	pop	bc
	push	hl
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_evlis
	pop	bc
	pop	bc
	push	hl
	ld	a,4
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	325,"sl3.c::evlis::0::40"

; Function prim_sum flags 0x00000200 __smallc 
; struct obj obj* prim_sum(struct obj obj* args)
; parameter 'struct obj obj* args' at sp+2 size(2)
	C_LINE	325,"sl3.c::prim_sum::0::40"
._prim_sum
	ld	hl,0	;const
	push	hl
	jp	i_104	;EOS
.i_102
	ld	hl,0	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	ld	hl,(hl)
	ld	a,h
	or	l
	jr	nz,ASMPC+3
	scf
	jp	nc,i_105	;
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	call	l_gint4	;
	jp	i_106	;
.i_105
	ld	hl,0	;const
.i_106
	pop	de
	add	hl,de
	pop	bc
	push	hl
	ld	hl,4	;const
	add	hl,sp
	push	hl
	ld	hl,(hl)
	push	hl
	call	_cdr
	pop	bc
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
.i_104
	call	l_gint4sp	;
	ex	de,hl
	ld	hl,(_nil)
	call	l_eq
	call	l_lneg
	jp	c,i_102	;EOS
.i_103
	ld	hl,0	;const
	push	hl
	inc	hl
	push	hl
	call	l_gint4sp	;
	push	hl
	ld	a,3
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	331,"sl3.c::prim_sum::0::41"

; Function prim_sub flags 0x00000200 __smallc 
; struct obj obj* prim_sub(struct obj obj* args)
; parameter 'struct obj obj* args' at sp+2 size(2)
	C_LINE	331,"sl3.c::prim_sub::0::41"
._prim_sub
	push	bc
	call	l_gint4sp	;
	push	hl
	call	_car
	pop	bc
	ld	hl,(hl)
	ld	a,h
	or	l
	jr	nz,ASMPC+3
	scf
	jp	nc,i_110	;
	call	l_gint4sp	;
	push	hl
	call	_car
	pop	bc
	call	l_gint4	;
	jp	i_111	;
.i_110
	ld	hl,0	;const
.i_111
	pop	bc
	push	hl
	ld	hl,4	;const
	add	hl,sp
	push	hl
	ld	hl,(hl)
	push	hl
	call	_cdr
	pop	bc
	pop	de
	ex	de,hl
	ld	(hl),de
	jp	i_109	;EOS
.i_107
	ld	hl,0	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	ld	hl,(hl)
	ld	a,h
	or	l
	jr	nz,ASMPC+3
	scf
	jp	nc,i_112	;
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	call	l_gint4	;
	jp	i_113	;
.i_112
	ld	hl,0	;const
.i_113
	pop	de
	ex	de,hl
	and	a
	sbc	hl,de
	pop	bc
	push	hl
	ld	hl,4	;const
	add	hl,sp
	push	hl
	ld	hl,(hl)
	push	hl
	call	_cdr
	pop	bc
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
.i_109
	call	l_gint4sp	;
	ex	de,hl
	ld	hl,(_nil)
	call	l_eq
	call	l_lneg
	jp	c,i_107	;EOS
.i_108
	ld	hl,0	;const
	push	hl
	inc	hl
	push	hl
	call	l_gint4sp	;
	push	hl
	ld	a,3
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	339,"sl3.c::prim_sub::0::42"

; Function prim_prod flags 0x00000200 __smallc 
; struct obj obj* prim_prod(struct obj obj* args)
; parameter 'struct obj obj* args' at sp+2 size(2)
	C_LINE	339,"sl3.c::prim_prod::0::42"
._prim_prod
	ld	hl,1	;const
	push	hl
	jp	i_116	;EOS
.i_114
	ld	hl,0	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	ld	hl,(hl)
	ld	a,h
	or	l
	jr	nz,ASMPC+3
	scf
	jp	nc,i_117	;
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	call	l_gint4	;
	jp	i_118	;
.i_117
	ld	hl,0	;const
.i_118
	pop	de
	call	l_mult
	pop	bc
	push	hl
	ld	hl,4	;const
	add	hl,sp
	push	hl
	ld	hl,(hl)
	push	hl
	call	_cdr
	pop	bc
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
.i_116
	call	l_gint4sp	;
	ex	de,hl
	ld	hl,(_nil)
	call	l_eq
	call	l_lneg
	jp	c,i_114	;EOS
.i_115
	ld	hl,0	;const
	push	hl
	inc	hl
	push	hl
	call	l_gint4sp	;
	push	hl
	ld	a,3
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	344,"sl3.c::prim_prod::0::43"

; Function prim_divide flags 0x00000200 __smallc 
; struct obj obj* prim_divide(struct obj obj* args)
; parameter 'struct obj obj* args' at sp+2 size(2)
	C_LINE	344,"sl3.c::prim_divide::0::43"
._prim_divide
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_car
	pop	bc
	ld	hl,(hl)
	ld	a,h
	or	l
	jr	nz,ASMPC+3
	scf
	jp	nc,i_119	;
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_car
	pop	bc
	call	l_gint4	;
	jp	i_120	;
.i_119
	ld	hl,0	;const
.i_120
	push	hl
	ld	hl,4	;const
	add	hl,sp
	push	hl
	ld	hl,(hl)
	push	hl
	call	_cdr
	pop	bc
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
.i_121
	call	l_gint4sp	;
	ex	de,hl
	ld	hl,(_nil)
	call	l_eq
	call	l_lneg
	jp	nc,i_122	;
	ld	hl,0	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	ld	hl,(hl)
	ld	a,h
	or	l
	jr	nz,ASMPC+3
	scf
	jp	nc,i_123	;
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	call	l_gint4	;
	jp	i_124	;
.i_123
	ld	hl,0	;const
.i_124
	pop	de
	call	l_div
	pop	bc
	push	hl
	ld	hl,4	;const
	add	hl,sp
	push	hl
	ld	hl,(hl)
	push	hl
	call	_cdr
	pop	bc
	pop	de
	ex	de,hl
	ld	(hl),de
	jp	i_121	;EOS
.i_122
	ld	hl,0	;const
	push	hl
	inc	hl
	push	hl
	call	l_gint4sp	;
	push	hl
	ld	a,3
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	355,"sl3.c::prim_divide::0::45"

; Function prim_gt flags 0x00000200 __smallc 
; struct obj obj* prim_gt(struct obj obj* args)
; parameter 'struct obj obj* args' at sp+2 size(2)
	C_LINE	355,"sl3.c::prim_gt::0::45"
._prim_gt
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_car
	pop	bc
	ld	hl,(hl)
	ld	a,h
	or	l
	jr	nz,ASMPC+3
	scf
	jp	nc,i_125	;
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_car
	pop	bc
	call	l_gint4	;
	jp	i_126	;
.i_125
	ld	hl,0	;const
.i_126
	push	hl
	call	l_gint4sp	;
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_car
	pop	bc
	ld	hl,(hl)
	ld	a,h
	or	l
	jr	nz,ASMPC+3
	scf
	jp	nc,i_127	;
	call	l_gint4sp	;
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_car
	pop	bc
	call	l_gint4	;
	jp	i_128	;
.i_127
	ld	hl,0	;const
.i_128
	pop	de
	call	l_gt
	jp	nc,i_129	;
	ld	hl,(_tee)
	ret
.i_129
	ld	hl,(_nil)
.i_130
	ret


	C_LINE	359,"sl3.c::prim_gt::0::46"

; Function prim_lt flags 0x00000200 __smallc 
; struct obj obj* prim_lt(struct obj obj* args)
; parameter 'struct obj obj* args' at sp+2 size(2)
	C_LINE	359,"sl3.c::prim_lt::0::46"
._prim_lt
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_car
	pop	bc
	ld	hl,(hl)
	ld	a,h
	or	l
	jr	nz,ASMPC+3
	scf
	jp	nc,i_131	;
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_car
	pop	bc
	call	l_gint4	;
	jp	i_132	;
.i_131
	ld	hl,0	;const
.i_132
	push	hl
	call	l_gint4sp	;
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_car
	pop	bc
	ld	hl,(hl)
	ld	a,h
	or	l
	jr	nz,ASMPC+3
	scf
	jp	nc,i_133	;
	call	l_gint4sp	;
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_car
	pop	bc
	call	l_gint4	;
	jp	i_134	;
.i_133
	ld	hl,0	;const
.i_134
	pop	de
	call	l_lt
	jp	nc,i_135	;
	ld	hl,(_tee)
	ret
.i_135
	ld	hl,(_nil)
.i_136
	ret


	C_LINE	362,"sl3.c::prim_lt::0::47"

; Function prim_ge flags 0x00000200 __smallc 
; struct obj obj* prim_ge(struct obj obj* args)
; parameter 'struct obj obj* args' at sp+2 size(2)
	C_LINE	362,"sl3.c::prim_ge::0::47"
._prim_ge
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_car
	pop	bc
	ld	hl,(hl)
	ld	a,h
	or	l
	jr	nz,ASMPC+3
	scf
	jp	nc,i_137	;
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_car
	pop	bc
	call	l_gint4	;
	jp	i_138	;
.i_137
	ld	hl,0	;const
.i_138
	push	hl
	call	l_gint4sp	;
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_car
	pop	bc
	ld	hl,(hl)
	ld	a,h
	or	l
	jr	nz,ASMPC+3
	scf
	jp	nc,i_139	;
	call	l_gint4sp	;
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_car
	pop	bc
	call	l_gint4	;
	jp	i_140	;
.i_139
	ld	hl,0	;const
.i_140
	pop	de
	call	l_ge
	jp	nc,i_141	;
	ld	hl,(_tee)
	ret
.i_141
	ld	hl,(_nil)
.i_142
	ret


	C_LINE	365,"sl3.c::prim_ge::0::48"

; Function prim_le flags 0x00000200 __smallc 
; struct obj obj* prim_le(struct obj obj* args)
; parameter 'struct obj obj* args' at sp+2 size(2)
	C_LINE	365,"sl3.c::prim_le::0::48"
._prim_le
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_car
	pop	bc
	ld	hl,(hl)
	ld	a,h
	or	l
	jr	nz,ASMPC+3
	scf
	jp	nc,i_143	;
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_car
	pop	bc
	call	l_gint4	;
	jp	i_144	;
.i_143
	ld	hl,0	;const
.i_144
	push	hl
	call	l_gint4sp	;
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_car
	pop	bc
	ld	hl,(hl)
	ld	a,h
	or	l
	jr	nz,ASMPC+3
	scf
	jp	nc,i_145	;
	call	l_gint4sp	;
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_car
	pop	bc
	call	l_gint4	;
	jp	i_146	;
.i_145
	ld	hl,0	;const
.i_146
	pop	de
	call	l_le
	jp	nc,i_147	;
	ld	hl,(_tee)
	ret
.i_147
	ld	hl,(_nil)
.i_148
	ret


	C_LINE	368,"sl3.c::prim_le::0::49"

; Function prim_numeq flags 0x00000200 __smallc 
; struct obj obj* prim_numeq(struct obj obj* args)
; parameter 'struct obj obj* args' at sp+2 size(2)
	C_LINE	368,"sl3.c::prim_numeq::0::49"
._prim_numeq
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_car
	pop	bc
	ld	hl,(hl)
	ld	a,h
	or	l
	jr	nz,ASMPC+3
	scf
	jp	nc,i_149	;
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_car
	pop	bc
	call	l_gint4	;
	jp	i_150	;
.i_149
	ld	hl,0	;const
.i_150
	push	hl
	call	l_gint4sp	;
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_car
	pop	bc
	ld	hl,(hl)
	ld	a,h
	or	l
	jr	nz,ASMPC+3
	scf
	jp	nc,i_151	;
	call	l_gint4sp	;
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_car
	pop	bc
	call	l_gint4	;
	jp	i_152	;
.i_151
	ld	hl,0	;const
.i_152
	pop	de
	call	l_eq
	jp	nc,i_153	;
	ld	hl,(_tee)
	ret
.i_153
	ld	hl,(_nil)
.i_154
	ret


	C_LINE	372,"sl3.c::prim_numeq::0::50"

; Function prim_cons flags 0x00000200 __smallc 
; struct obj obj* prim_cons(struct obj obj* args)
; parameter 'struct obj obj* args' at sp+2 size(2)
	C_LINE	372,"sl3.c::prim_cons::0::50"
._prim_cons
	ld	hl,2	;const
	push	hl
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	push	hl
	call	l_gint8sp	;
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_car
	pop	bc
	push	hl
	ld	a,4
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	373,"sl3.c::prim_cons::0::51"

; Function prim_car flags 0x00000200 __smallc 
; struct obj obj* prim_car(struct obj obj* args)
; parameter 'struct obj obj* args' at sp+2 size(2)
	C_LINE	373,"sl3.c::prim_car::0::51"
._prim_car
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_car
	pop	bc
	push	hl
	call	_car
	pop	bc
	ret


	C_LINE	374,"sl3.c::prim_car::0::52"

; Function prim_cdr flags 0x00000200 __smallc 
; struct obj obj* prim_cdr(struct obj obj* args)
; parameter 'struct obj obj* args' at sp+2 size(2)
	C_LINE	374,"sl3.c::prim_cdr::0::52"
._prim_cdr
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_car
	pop	bc
	push	hl
	call	_cdr
	pop	bc
	ret


	C_LINE	379,"sl3.c::prim_cdr::0::53"

; Function prim_print flags 0x00000200 __smallc 
; struct obj obj* prim_print(struct obj obj* args)
; parameter 'struct obj obj* args' at sp+2 size(2)
	C_LINE	379,"sl3.c::prim_print::0::53"
._prim_print
.i_155
	pop	bc
	pop	hl
	push	hl
	push	bc
	ex	de,hl
	ld	hl,(_nil)
	call	l_eq
	call	l_lneg
	jp	nc,i_156	;
	ld	hl,__sgoioblk+10
	push	hl
	call	l_gint4sp	;
	push	hl
	call	_car
	pop	bc
	push	hl
	call	_writeobj
	pop	bc
	pop	bc
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_cdr
	pop	bc
	pop	de
	pop	bc
	push	hl
	push	de
	ld	hl,i_1+207
	push	hl
	ld	a,1
	call	printf
	pop	bc
	jp	i_155	;EOS
.i_156
	ld	hl,i_1+37
	push	hl
	ld	a,1
	call	printf
	pop	bc
	ld	hl,(_nil)
	ret


	C_LINE	390,"sl3.c::prim_print::0::55"

; Function init_sl3 flags 0x00000200 __smallc 
; void init_sl3()
	C_LINE	390,"sl3.c::init_sl3::0::55"
._init_sl3
	ld	hl,1	;const
	push	hl
	push	hl
	ld	hl,i_1+264
	push	hl
	ld	a,3
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	ld	(_nil),hl
	ld	hl,2	;const
	push	hl
	push	hl
	ld	hl,(_nil)
	push	hl
	push	hl
	ld	a,4
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	(_all_symbols),hl
	ld	hl,2	;const
	push	hl
	ld	de,2	;const
	push	de
	push	hl
	ld	hl,2	;const
	push	hl
	ld	hl,(_nil)
	push	hl
	push	hl
	ld	a,4
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	push	hl
	ld	hl,(_nil)
	push	hl
	ld	a,4
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	(_top_env),hl
	ld	hl,i_1+268
	push	hl
	call	_intern
	pop	bc
	ld	(_tee),hl
	push	hl
	ld	hl,(_tee)
	push	hl
	call	_extend_top
	pop	bc
	ld	hl,i_1+270
	ex	(sp),hl
	call	_intern
	pop	bc
	ld	(_quote),hl
	ld	hl,i_1+276
	push	hl
	call	_intern
	pop	bc
	ld	(_s_if),hl
	ld	hl,i_1+279
	push	hl
	call	_intern
	pop	bc
	ld	(_s_lambda),hl
	ld	hl,i_1+286
	push	hl
	call	_intern
	pop	bc
	ld	(_s_define),hl
	ld	hl,i_1+293
	push	hl
	call	_intern
	pop	bc
	ld	(_s_setb),hl
	ld	hl,i_1+298
	push	hl
	call	_intern
	pop	bc
	ld	(_s_begin),hl
	ld	hl,i_1+304
	push	hl
	call	_intern
	pop	bc
	push	hl
	ld	hl,4	;const
	push	hl
	ld	l,1
	push	hl
	ld	hl,_prim_sum
	push	hl
	ld	a,3
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	push	hl
	call	_extend_top
	pop	bc
	ld	hl,i_1+306
	ex	(sp),hl
	call	_intern
	pop	bc
	push	hl
	ld	hl,4	;const
	push	hl
	ld	l,1
	push	hl
	ld	hl,_prim_sub
	push	hl
	ld	a,3
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	push	hl
	call	_extend_top
	pop	bc
	ld	hl,i_1+308
	ex	(sp),hl
	call	_intern
	pop	bc
	push	hl
	ld	hl,4	;const
	push	hl
	ld	l,1
	push	hl
	ld	hl,_prim_prod
	push	hl
	ld	a,3
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	push	hl
	call	_extend_top
	pop	bc
	ld	hl,i_1+310
	ex	(sp),hl
	call	_intern
	pop	bc
	push	hl
	ld	hl,4	;const
	push	hl
	ld	l,1
	push	hl
	ld	hl,_prim_divide
	push	hl
	ld	a,3
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	push	hl
	call	_extend_top
	pop	bc
	ld	hl,i_1+312
	ex	(sp),hl
	call	_intern
	pop	bc
	push	hl
	ld	hl,4	;const
	push	hl
	ld	l,1
	push	hl
	ld	hl,_prim_numeq
	push	hl
	ld	a,3
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	push	hl
	call	_extend_top
	pop	bc
	ld	hl,i_1+223
	ex	(sp),hl
	call	_intern
	pop	bc
	push	hl
	ld	hl,4	;const
	push	hl
	ld	l,1
	push	hl
	ld	hl,_prim_gt
	push	hl
	ld	a,3
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	push	hl
	call	_extend_top
	pop	bc
	ld	hl,i_1+314
	ex	(sp),hl
	call	_intern
	pop	bc
	push	hl
	ld	hl,4	;const
	push	hl
	ld	l,1
	push	hl
	ld	hl,_prim_ge
	push	hl
	ld	a,3
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	push	hl
	call	_extend_top
	pop	bc
	ld	hl,i_1+317
	ex	(sp),hl
	call	_intern
	pop	bc
	push	hl
	ld	hl,4	;const
	push	hl
	ld	l,1
	push	hl
	ld	hl,_prim_lt
	push	hl
	ld	a,3
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	push	hl
	call	_extend_top
	pop	bc
	ld	hl,i_1+319
	ex	(sp),hl
	call	_intern
	pop	bc
	push	hl
	ld	hl,4	;const
	push	hl
	ld	l,1
	push	hl
	ld	hl,_prim_le
	push	hl
	ld	a,3
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	push	hl
	call	_extend_top
	pop	bc
	ld	hl,i_1+322
	ex	(sp),hl
	call	_intern
	pop	bc
	push	hl
	ld	hl,4	;const
	push	hl
	ld	l,1
	push	hl
	ld	hl,_prim_cons
	push	hl
	ld	a,3
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	push	hl
	call	_extend_top
	pop	bc
	ld	hl,i_1+327
	ex	(sp),hl
	call	_intern
	pop	bc
	push	hl
	ld	hl,4	;const
	push	hl
	ld	l,1
	push	hl
	ld	hl,_prim_car
	push	hl
	ld	a,3
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	push	hl
	call	_extend_top
	pop	bc
	ld	hl,i_1+331
	ex	(sp),hl
	call	_intern
	pop	bc
	push	hl
	ld	hl,4	;const
	push	hl
	ld	l,1
	push	hl
	ld	hl,_prim_cdr
	push	hl
	ld	a,3
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	push	hl
	call	_extend_top
	pop	bc
	ld	hl,i_1+335
	ex	(sp),hl
	call	_intern
	pop	bc
	push	hl
	ld	hl,4	;const
	push	hl
	ld	l,1
	push	hl
	ld	hl,_prim_print
	push	hl
	ld	a,3
	call	_omake
	pop	bc
	pop	bc
	pop	bc
	push	hl
	call	_extend_top
	pop	bc
	pop	bc
	ret


	C_LINE	422,"sl3.c::init_sl3::0::56"

; Function main flags 0x00000000 __stdc 
; int main()
	C_LINE	422,"sl3.c::main::0::57"
._main
	call	_init_sl3
	ld	hl,__sgoioblk
	push	hl
	call	_setinput
	pop	bc
.i_157
	ld	hl,__sgoioblk+10
	push	hl
	call	_readobj
	push	hl
	ld	hl,(_top_env)
	push	hl
	call	_eval
	pop	bc
	pop	bc
	push	hl
	call	_writeobj
	pop	bc
	pop	bc
	ld	hl,i_1+37
	push	hl
	ld	a,1
	call	printf
	pop	bc
	jp	i_157	;EOS
.i_158
	ld	hl,0	;const
	ret


	C_LINE	432,"sl3.c::main::0::59"

; Function myexit flags 0x00000200 __smallc 
; void myexit(int code)
; parameter 'int code' at sp+2 size(2)
	C_LINE	432,"sl3.c::myexit::0::59"
._myexit
	ld	hl,__sgoioblk+20
	push	hl
	ld	hl,i_1+341
	push	hl
	ld	hl,(_total_malloc)
	push	hl
	ld	a,3
	call	fprintf
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	hl
	push	hl
	push	bc
	call	exit_fastcall
	ret


	SECTION	bss_compiler
	SECTION	code_compiler
; --- Start of Optimiser additions ---
	defc	i_24 = i_27
	defc	i_30 = i_25
	defc	i_33 = i_36
	defc	i_48 = i_51_i_49
	defc	i_86 = i_84
	defc	i_92 = i_93
	defc	i_94 = i_91
	defc	i_16 = i_13
	defc	i_49 = i_47
	defc	i_65 = i_56
	defc	i_71 = i_56

	SECTION	rodata_compiler
.i_1
	defm	"warning: car argument null on "
	defm	"line %d"
	defb	10

	defm	""
	defb	0

	defm	"warning: car argument not a li"
	defm	"st (%d) on line %d"
	defb	10

	defm	""
	defb	0

	defm	"warning: cdr argument not a li"
	defm	"st on line %d"
	defb	10

	defm	""
	defb	0

	defm	"error: cdr list element is zer"
	defm	"o-pointer at %d"
	defb	10

	defm	""
	defb	0

	defm	"()'"
	defb	0

	defm	"("
	defb	0

	defm	"0123456789"
	defb	0

	defm	")"
	defb	0

	defm	"."
	defb	0

	defm	"%d"
	defb	0

	defm	" . "
	defb	0

	defm	"()"
	defb	0

	defm	"%s"
	defb	0

	defm	"#<PRIMOP>"
	defb	0

	defm	"#<PROC>"
	defb	0

	defm	"Unbound symbol "
	defb	0

	defm	"Bad PROC type"
	defb	10

	defm	""
	defb	0

	defm	"nil"
	defb	0

	defm	"t"
	defb	0

	defm	"quote"
	defb	0

	defm	"if"
	defb	0

	defm	"lambda"
	defb	0

	defm	"define"
	defb	0

	defm	"set!"
	defb	0

	defm	"begin"
	defb	0

	defm	"+"
	defb	0

	defm	"-"
	defb	0

	defm	"*"
	defb	0

	defm	"/"
	defb	0

	defm	"="
	defb	0

	defm	">="
	defb	0

	defm	"<"
	defb	0

	defm	"<="
	defb	0

	defm	"cons"
	defb	0

	defm	"car"
	defb	0

	defm	"cdr"
	defb	0

	defm	"print"
	defb	0

	defm	"%d bytes left hanging"
	defb	10

	defm	""
	defb	0


; --- Start of Static Variables ---

	SECTION	bss_compiler
._all_symbols	defs	2
._top_env	defs	2
._nil	defs	2
._tee	defs	2
._quote	defs	2
._s_if	defs	2
._s_lambda	defs	2
._s_define	defs	2
._s_setb	defs	2
._s_begin	defs	2
._ifp	defs	2
._token_la	defs	2
._buf	defs	100
._bufused	defs	2
	SECTION	code_compiler


; --- Start of Scope Defns ---

	GLOBAL	open
	GLOBAL	creat
	GLOBAL	close
	GLOBAL	read
	GLOBAL	write
	GLOBAL	lseek
	GLOBAL	readbyte
	GLOBAL	writebyte
	GLOBAL	fsync
	GLOBAL	getcwd
	GLOBAL	chdir
	GLOBAL	getwd
	GLOBAL	rmdir
	GLOBAL	__RND_BLOCKSIZE
	GLOBAL	rnd_loadblock
	GLOBAL	rnd_saveblock
	GLOBAL	rnd_erase
	GLOBAL	rnd_erase_fastcall
	GLOBAL	__FOPEN_MAX
	GLOBAL	__sgoioblk
	GLOBAL	__sgoioblk_end
	GLOBAL	fopen_zsock
	GLOBAL	fileno
	GLOBAL	fopen
	GLOBAL	freopen
	GLOBAL	fdopen
	GLOBAL	_freopen1
	GLOBAL	fmemopen
	GLOBAL	funopen
	GLOBAL	fclose
	GLOBAL	fflush
	GLOBAL	closeall
	GLOBAL	fgets
	GLOBAL	fputs
	GLOBAL	fputs_callee
	GLOBAL	fputc
	GLOBAL	fputc_callee
	GLOBAL	fgetc
	GLOBAL	ungetc
	GLOBAL	feof
	GLOBAL	feof_fastcall
	GLOBAL	ferror
	GLOBAL	ferror_fastcall
	GLOBAL	puts
	GLOBAL	ftell
	GLOBAL	fgetpos
	GLOBAL	fseek
	GLOBAL	fread
	GLOBAL	fwrite
	GLOBAL	gets
	GLOBAL	printf
	GLOBAL	fprintf
	GLOBAL	sprintf
	GLOBAL	snprintf
	GLOBAL	vfprintf
	GLOBAL	vsnprintf
	GLOBAL	printn
	GLOBAL	scanf
	GLOBAL	fscanf
	GLOBAL	sscanf
	GLOBAL	vfscanf
	GLOBAL	vsscanf
	GLOBAL	getarg
	GLOBAL	fchkstd
	GLOBAL	fgetc_cons
	GLOBAL	fgetc_cons_inkey
	GLOBAL	fputc_cons
	GLOBAL	fgets_cons
	GLOBAL	puts_cons
	GLOBAL	fabandon
	GLOBAL	fdtell
	GLOBAL	fdgetpos
	GLOBAL	rename
	GLOBAL	remove
	GLOBAL	getk
	GLOBAL	getk_inkey
	GLOBAL	printk
	GLOBAL	perror
	GLOBAL	set_fputc_cons
	GLOBAL	fputc_cons_native
	GLOBAL	fputc_cons_generic
	GLOBAL	fputc_cons_ansi
	GLOBAL	atoi
	GLOBAL	atoi_fastcall
	GLOBAL	atol
	GLOBAL	atol_fastcall
	GLOBAL	itoa
	GLOBAL	itoa_callee
	GLOBAL	ltoa
	GLOBAL	ltoa_callee
	GLOBAL	strtol
	GLOBAL	strtol_callee
	GLOBAL	strtoul
	GLOBAL	strtoul_callee
	GLOBAL	ultoa
	GLOBAL	ultoa_callee
	GLOBAL	utoa
	GLOBAL	utoa_callee
	GLOBAL	_atoll
	GLOBAL	_atoll_callee
	GLOBAL	_lltoa
	GLOBAL	_lltoa_callee
	GLOBAL	_strtoll
	GLOBAL	_strtoll_callee
	GLOBAL	_strtoull
	GLOBAL	_strtoull_callee
	GLOBAL	_ulltoa
	GLOBAL	_ulltoa_callee
	GLOBAL	rand
	GLOBAL	srand
	GLOBAL	srand_fastcall
	GLOBAL	mallinit
	GLOBAL	sbrk
	GLOBAL	calloc
	GLOBAL	free
	GLOBAL	malloc
	GLOBAL	realloc
	GLOBAL	mallinfo
	GLOBAL	malloc_fastcall
	GLOBAL	free_fastcall
	GLOBAL	sbrk_callee
	GLOBAL	calloc_callee
	GLOBAL	realloc_callee
	GLOBAL	mallinfo_callee
	GLOBAL	HeapCreate
	GLOBAL	HeapSbrk
	GLOBAL	HeapSbrk_callee
	GLOBAL	HeapCalloc
	GLOBAL	HeapCalloc_callee
	GLOBAL	HeapFree
	GLOBAL	HeapFree_callee
	GLOBAL	HeapAlloc
	GLOBAL	HeapAlloc_callee
	GLOBAL	HeapRealloc
	GLOBAL	HeapRealloc_callee
	GLOBAL	HeapInfo
	GLOBAL	HeapInfo_callee
	GLOBAL	exit
	GLOBAL	atexit
	GLOBAL	exit_fastcall
	GLOBAL	atexit_fastcall
	GLOBAL	getenv
	GLOBAL	getenv_r
	GLOBAL	setenv
	GLOBAL	unsetenv
	GLOBAL	getopt
	GLOBAL	_optarg
	GLOBAL	_opterr
	GLOBAL	_optind
	GLOBAL	_optopt
	GLOBAL	_optreset
	GLOBAL	l_bsearch
	GLOBAL	l_bsearch_callee
	GLOBAL	l_qsort
	GLOBAL	l_qsort_callee
	GLOBAL	qsort_sccz80
	GLOBAL	qsort_sccz80_callee
	GLOBAL	qsort_sdcc
	GLOBAL	qsort_sdcc_callee
	GLOBAL	_div_
	GLOBAL	_div__callee
	GLOBAL	_divu_
	GLOBAL	_divu__callee
	GLOBAL	_ldiv_
	GLOBAL	_ldiv__callee
	GLOBAL	_ldivu_
	GLOBAL	_ldivu__callee
	GLOBAL	abs
	GLOBAL	abs_fastcall
	GLOBAL	labs
	GLOBAL	labs_fastcall
	GLOBAL	isqrt
	GLOBAL	isqrt_fastcall
	GLOBAL	inp
	GLOBAL	inp_fastcall
	GLOBAL	outp
	GLOBAL	outp_callee
	GLOBAL	swapendian
	GLOBAL	bpoke
	GLOBAL	wpoke
	GLOBAL	bpeek
	GLOBAL	wpeek
	GLOBAL	bpeek_fastcall
	GLOBAL	wpeek_fastcall
	GLOBAL	bpoke_callee
	GLOBAL	wpoke_callee
	GLOBAL	t_delay
	GLOBAL	sleep
	GLOBAL	sleep_fastcall
	GLOBAL	msleep
	GLOBAL	msleep_fastcall
	GLOBAL	extract_bits
	GLOBAL	extract_bits_callee
	GLOBAL	wcmatch
	GLOBAL	unbcd
	GLOBAL	bcmp
	GLOBAL	bcmp_callee
	GLOBAL	bcopy
	GLOBAL	bcopy_callee
	GLOBAL	bzero
	GLOBAL	bzero_callee
	GLOBAL	index
	GLOBAL	index_callee
	GLOBAL	rindex
	GLOBAL	rindex_callee
	GLOBAL	strset
	GLOBAL	strset_callee
	GLOBAL	strnset
	GLOBAL	strnset_callee
	GLOBAL	rawmemchr
	GLOBAL	rawmemchr_callee
	GLOBAL	_memlwr_
	GLOBAL	_memlwr__callee
	GLOBAL	_memstrcpy_
	GLOBAL	_memstrcpy__callee
	GLOBAL	_memupr_
	GLOBAL	_memupr__callee
	GLOBAL	_strrstrip_
	GLOBAL	ffs
	GLOBAL	ffsl
	GLOBAL	memccpy
	GLOBAL	memccpy_callee
	GLOBAL	memchr
	GLOBAL	memchr_callee
	GLOBAL	memcmp
	GLOBAL	memcmp_callee
	GLOBAL	memcpy
	GLOBAL	memcpy_callee
	GLOBAL	memmem
	GLOBAL	memmem_callee
	GLOBAL	memmove
	GLOBAL	memmove_callee
	GLOBAL	memrchr
	GLOBAL	memrchr_callee
	GLOBAL	memset
	GLOBAL	memset_callee
	GLOBAL	memset_wr
	GLOBAL	memset_wr_callee
	GLOBAL	memswap
	GLOBAL	memswap_callee
	GLOBAL	stpcpy
	GLOBAL	stpcpy_callee
	GLOBAL	stpncpy
	GLOBAL	stpncpy_callee
	GLOBAL	strcasecmp
	GLOBAL	strcasecmp_callee
	GLOBAL	strcat
	GLOBAL	strcat_callee
	GLOBAL	strchr
	GLOBAL	strchr_callee
	GLOBAL	strchrnul
	GLOBAL	strchrnul_callee
	GLOBAL	strcmp
	GLOBAL	strcmp_callee
	GLOBAL	strcoll
	GLOBAL	strcoll_callee
	GLOBAL	strcpy
	GLOBAL	strcpy_callee
	GLOBAL	strcspn
	GLOBAL	strcspn_callee
	GLOBAL	strdup
	GLOBAL	strdup_fastcall
	GLOBAL	strerror
	GLOBAL	strerror_fastcall
	GLOBAL	stricmp
	GLOBAL	stricmp_callee
	GLOBAL	strlcat
	GLOBAL	strlcat_callee
	GLOBAL	strlcpy
	GLOBAL	strlcpy_callee
	GLOBAL	strlen
	GLOBAL	strlen_fastcall
	GLOBAL	strlwr
	GLOBAL	strlwr_fastcall
	GLOBAL	strncasecmp
	GLOBAL	strncasecmp_callee
	GLOBAL	strncat
	GLOBAL	strncat_callee
	GLOBAL	strnchar
	GLOBAL	strnchr_callee
	GLOBAL	strncmp
	GLOBAL	strncmp_callee
	GLOBAL	strncpy
	GLOBAL	strncpy_callee
	GLOBAL	strndup
	GLOBAL	strndup_callee
	GLOBAL	strnicmp
	GLOBAL	strnicmp_callee
	GLOBAL	strnlen
	GLOBAL	strnlen_callee
	GLOBAL	strpkbrk
	GLOBAL	strpbrk_callee
	GLOBAL	strrchr
	GLOBAL	strrchr_callee
	GLOBAL	strrcspn
	GLOBAL	strrcspn_callee
	GLOBAL	strrev
	GLOBAL	strrev_fastcall
	GLOBAL	strrspn
	GLOBAL	strrspn_callee
	GLOBAL	strrstrip
	GLOBAL	strrstrip_fastcall
	GLOBAL	strsep
	GLOBAL	strsep_callee
	GLOBAL	strspn
	GLOBAL	strspn_callee
	GLOBAL	strstr
	GLOBAL	strstr_callee
	GLOBAL	strstrip
	GLOBAL	strstrip_fastcall
	GLOBAL	strtok
	GLOBAL	strtok_callee
	GLOBAL	strtok_r
	GLOBAL	strtok_r_callee
	GLOBAL	strupr
	GLOBAL	strupr_fastcall
	GLOBAL	strxfrm
	GLOBAL	strxfrm_callee
	GLOBAL	strrstr
	GLOBAL	strrstr_callee
	GLOBAL	memopi
	GLOBAL	memopi_callee
	GLOBAL	memopd
	GLOBAL	memopd_callee
	GLOBAL	__builtin_memset
	GLOBAL	__builtin_memcpy
	GLOBAL	__builtin_strcpy
	GLOBAL	__builtin_strchr
	GLOBAL	isalnum
	GLOBAL	_isalnum_fastcall
	GLOBAL	isalpha
	GLOBAL	_isalpha_fastcall
	GLOBAL	isascii
	GLOBAL	_isascii_fastcall
	GLOBAL	isbdigit
	GLOBAL	_isbdigit_fastcall
	GLOBAL	isblank
	GLOBAL	_isblank_fastcall
	GLOBAL	iscntrl
	GLOBAL	_iscntrl_fastcall
	GLOBAL	isdigit
	GLOBAL	_isdigit_fastcall
	GLOBAL	isgraph
	GLOBAL	_isgraph_fastcall
	GLOBAL	islower
	GLOBAL	_islower_fastcall
	GLOBAL	isodigit
	GLOBAL	_isodigit_fastcall
	GLOBAL	isprint
	GLOBAL	_isprint_fastcall
	GLOBAL	ispunct
	GLOBAL	_ispunct_fastcall
	GLOBAL	isspace
	GLOBAL	_isspace_fastcall
	GLOBAL	isupper
	GLOBAL	_isupper_fastcall
	GLOBAL	isxdigit
	GLOBAL	_isxdigit_fastcall
	GLOBAL	toascii
	GLOBAL	_toascii_fastcall
	GLOBAL	tolower
	GLOBAL	_tolower_fastcall
	GLOBAL	toupper
	GLOBAL	_toupper_fastcall
	GLOBAL	_line_num
	GLOBAL	_total_malloc
	GLOBAL	_all_symbols
	GLOBAL	_top_env
	GLOBAL	_nil
	GLOBAL	_tee
	GLOBAL	_quote
	GLOBAL	_s_if
	GLOBAL	_s_lambda
	GLOBAL	_s_define
	GLOBAL	_s_setb
	GLOBAL	_s_begin
	GLOBAL	_car
	GLOBAL	_cdr
	GLOBAL	_omake
	GLOBAL	_findsym
	GLOBAL	_intern
	GLOBAL	_multiple_extend
	GLOBAL	_extend_top
	GLOBAL	_assoc
	GLOBAL	_ifp
	GLOBAL	_token_la
	GLOBAL	_la_valid
	GLOBAL	_buf
	GLOBAL	_bufused
	GLOBAL	_add_to_buf
	GLOBAL	_buf2str
	GLOBAL	_setinput
	GLOBAL	_putback_token
	GLOBAL	_myexit
	GLOBAL	_gettoken
	GLOBAL	_readlist
	GLOBAL	_readobj
	GLOBAL	_writeobj
	GLOBAL	_evlis
	GLOBAL	_eval
	GLOBAL	_prim_sum
	GLOBAL	_prim_sub
	GLOBAL	_prim_prod
	GLOBAL	_prim_divide
	GLOBAL	_prim_gt
	GLOBAL	_prim_lt
	GLOBAL	_prim_ge
	GLOBAL	_prim_le
	GLOBAL	_prim_numeq
	GLOBAL	_prim_cons
	GLOBAL	_prim_car
	GLOBAL	_prim_cdr
	GLOBAL	_prim_print
	GLOBAL	_init_sl3
	GLOBAL	_main


; --- End of Scope Defns ---


; --- End of Compilation ---
