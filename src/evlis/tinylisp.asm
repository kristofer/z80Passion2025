;* * * * *  Small-C/Plus z88dk * * * * *
;  Version: 22110-51889e5300-20231220
;
;	Reconstructed for z80 Module Assembler
;
;	Module compile time: Wed Apr 16 17:56:19 2025


	C_LINE	0,"tinylisp.c"

	MODULE	tinylisp_c


	INCLUDE "z80_crt0.hdr"


	C_LINE	0,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	0,"../../../z88dk/bin/..//include/sys/compiler.h"
	C_LINE	0,"../../../z88dk/bin/..//include/sys/proto.h"
	C_LINE	6,"../../../z88dk/bin/..//include/sys/compiler.h"
	C_LINE	11,"../../../z88dk/bin/..//include/stdlib.h"
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
	C_LINE	12,"../../../z88dk/bin/..//include/stdlib.h"
	C_LINE	0,"../../../z88dk/bin/..//include/stdint.h"
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
	C_LINE	13,"../../../z88dk/bin/..//include/stdlib.h"
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
	C_LINE	4,"tinylisp.c"
	C_LINE	0,"../../../z88dk/bin/..//include/stdio.h"
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
	C_LINE	5,"tinylisp.c"
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
	C_LINE	6,"tinylisp.c"
	C_LINE	37,"tinylisp.c"
	SECTION	data_compiler
._hp
	defw	0
	SECTION	code_compiler
	SECTION	data_compiler
._sp
	defw	1024
	SECTION	code_compiler
	C_LINE	40,"tinylisp.c"
	SECTION	data_compiler
._ATOM
	defw	32760
	SECTION	code_compiler
	SECTION	data_compiler
._PRIM
	defw	32761
	SECTION	code_compiler
	SECTION	data_compiler
._CONS
	defw	32762
	SECTION	code_compiler
	SECTION	data_compiler
._CLOS
	defw	32763
	SECTION	code_compiler
	SECTION	data_compiler
._NIL
	defw	32764
	SECTION	code_compiler
	C_LINE	43,"tinylisp.c"
	C_LINE	46,"tinylisp.c"
	C_LINE	53,"tinylisp.c"

; Function box flags 0x00000200 __smallc 
; double box(unsigned int t, unsigned int i)
; parameter 'unsigned int i' at sp+2 size(2)
; parameter 'unsigned int t' at sp+4 size(2)
	C_LINE	53,"tinylisp.c::box::0::0"
._box
	push	bc
	push	bc
	push	bc
	ld	hl,0	;const
	add	hl,sp
	push	hl
	ld	hl,12	;const
	add	hl,sp
	ld	hl,(hl)
	call	l_i64_uint2i64
	call	l_i64_push
	ld	a,48
	call	l_i64_aslo
	call	l_i64_push
	ld	hl,18	;const
	add	hl,sp
	ld	hl,(hl)
	call	l_i64_uint2i64
	call	l_i64_or
	pop	bc
	call	l_i64_store
	ld	hl,0	;const
	add	hl,sp
	call	dload
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	59,"tinylisp.c::box::0::1"

; Function ord flags 0x00000200 __smallc 
; unsigned int ord(double x)
; parameter 'double x' at sp+2 size(6)
	C_LINE	59,"tinylisp.c::ord::0::1"
._ord
	ld	hl,2	;const
	add	hl,sp
	call	l_i64_load
	call	l_i64_u64_toi32
	ret


	C_LINE	63,"tinylisp.c::ord::0::2"

; Function num flags 0x00000200 __smallc 
; double num(double n)
; parameter 'double n' at sp+2 size(6)
	C_LINE	63,"tinylisp.c::num::0::2"
._num
	ld	hl,2	;const
	add	hl,sp
	call	dload
	ret


	C_LINE	67,"tinylisp.c::num::0::3"

; Function equ flags 0x00000200 __smallc 
; unsigned int equ(double x, double y)
; parameter 'double y' at sp+2 size(6)
; parameter 'double x' at sp+8 size(6)
	C_LINE	67,"tinylisp.c::equ::0::3"
._equ
	ld	hl,8	;const
	add	hl,sp
	call	l_i64_load
	call	l_i64_push
	ld	hl,10	;const
	add	hl,sp
	call	l_i64_load
	call	l_i64_eq
	ret


	C_LINE	72,"tinylisp.c::equ::0::4"

; Function atom flags 0x00000200 __smallc 
; double atom(const char * s)
; parameter 'const char * s' at sp+2 size(2)
	C_LINE	72,"tinylisp.c::atom::0::4"
._atom
	ld	hl,0	;const
	push	hl
.i_10
	pop	de
	push	de
	ld	hl,(_hp)
	ex	de,hl
	and	a
	sbc	hl,de
	jp	nc,i_12	;
	pop	hl
	push	hl
	ld	bc,_cell
	push	bc
	pop	de
	add	hl,de
	push	hl
	call	l_gint6sp	;
	push	hl
	call	strcmp_callee
	ld	a,h
	or	l
	jp	z,i_12	;
.i_13_i_12
	pop	hl
	push	hl
	push	hl
	ld	hl,_cell
	push	hl
	call	l_gint4sp	;
	pop	de
	add	hl,de
	call	strlen_fastcall
	inc	hl
	pop	de
	add	hl,de
	pop	bc
	push	hl
	jp	i_10	;EOS
.i_11
	pop	de
	push	de
	ld	hl,(_hp)
	call	l_eq
	jp	nc,i_14	;
	ld	hl,(_hp)
	push	hl
	ld	hl,_cell
	push	hl
	call	l_gint4sp	;
	pop	de
	add	hl,de
	push	hl
	call	l_gint8sp	;
	pop	de
	push	de
	xor	a
.i_16
	cp	(hl)
	ldi
	jr	nz,i_16
	pop	hl
	call	strlen_fastcall
	inc	hl
	pop	de
	add	hl,de
	ld	(_hp),hl
	push	hl
	ld	hl,(_sp)
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	and	a
	sbc	hl,de
	jp	nc,i_17	;
	ld	hl,15	;const
	call	exit_fastcall
.i_14
	pop	hl
	push	hl
	ld	de,(_ATOM)
	push	de
	push	hl
	call	_box
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	85,"tinylisp.c::atom::0::6"

; Function cons flags 0x00000200 __smallc 
; double cons(double x, double y)
; parameter 'double y' at sp+2 size(6)
; parameter 'double x' at sp+8 size(6)
	C_LINE	85,"tinylisp.c::cons::0::6"
._cons
	ld	hl,_cell
	push	hl
	ld	hl,(_sp)
	dec	hl
	ld	(_sp),hl
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,10	;const
	add	hl,sp
	call	dload
	pop	hl
	call	dstore
	ld	hl,_cell
	push	hl
	ld	hl,(_sp)
	dec	hl
	ld	(_sp),hl
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,4	;const
	add	hl,sp
	call	dload
	pop	hl
	call	dstore
	ld	hl,(_hp)
	push	hl
	ld	hl,(_sp)
	add	hl,hl
	add	hl,hl
	add	hl,hl
	pop	de
	and	a
	sbc	hl,de
	jp	nc,i_18	;
	ld	hl,15	;const
	call	exit_fastcall
.i_18
	ld	hl,(_CONS)
	push	hl
	ld	hl,(_sp)
	push	hl
	call	_box
	pop	bc
	pop	bc
	ret


	C_LINE	94,"tinylisp.c::cons::0::7"

; Function car flags 0x00000200 __smallc 
; double car(double p)
; parameter 'double p' at sp+2 size(6)
	C_LINE	94,"tinylisp.c::car::0::7"
._car
	ld	hl,2	;const
	add	hl,sp
	call	l_i64_load
	call	l_i64_push
	ld	a,48
	call	l_i64_asr_uo
	call	l_i64_push
	ld	de,(_CONS)
	ld	hl,(_CLOS)
	call	l_xor
	call	l_com
	call	l_i64_uint2i64
	call	l_i64_and
	call	l_i64_push
	ld	hl,(_CONS)
	call	l_i64_uint2i64
	call	l_i64_eq
	jp	nc,i_19	;
	ld	hl,_cell
	push	hl
	ld	hl,4	;const
	add	hl,sp
	call	dldpsh
	call	_ord
	pop	bc
	pop	bc
	pop	bc
	inc	hl
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	add	hl,hl
	pop	de
	add	hl,de
	call	dload
	ret
.i_19
	ld	hl,_err
	call	dload
.i_20
	ret


	C_LINE	99,"tinylisp.c::car::0::8"

; Function cdr flags 0x00000200 __smallc 
; double cdr(double p)
; parameter 'double p' at sp+2 size(6)
	C_LINE	99,"tinylisp.c::cdr::0::8"
._cdr
	ld	hl,2	;const
	add	hl,sp
	call	l_i64_load
	call	l_i64_push
	ld	a,48
	call	l_i64_asr_uo
	call	l_i64_push
	ld	de,(_CONS)
	ld	hl,(_CLOS)
	call	l_xor
	call	l_com
	call	l_i64_uint2i64
	call	l_i64_and
	call	l_i64_push
	ld	hl,(_CONS)
	call	l_i64_uint2i64
	call	l_i64_eq
	jp	nc,i_21	;
	ld	hl,_cell
	push	hl
	ld	hl,4	;const
	add	hl,sp
	call	dldpsh
	call	_ord
	pop	bc
	pop	bc
	pop	bc
	ld	b,h
	ld	c,l
	add	hl,bc
	add	hl,bc
	add	hl,hl
	pop	de
	add	hl,de
	call	dload
	ret
.i_21
	ld	hl,_err
	call	dload
.i_22
	ret


	C_LINE	104,"tinylisp.c::cdr::0::9"

; Function pair flags 0x00000200 __smallc 
; double pair(double v, double x, double e)
; parameter 'double e' at sp+2 size(6)
; parameter 'double x' at sp+8 size(6)
; parameter 'double v' at sp+14 size(6)
	C_LINE	104,"tinylisp.c::pair::0::9"
._pair
	ld	hl,14	;const
	add	hl,sp
	call	dldpsh
	ld	hl,14	;const
	add	hl,sp
	call	dldpsh
	call	_cons
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	call	dpush
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_cons
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	ret


	C_LINE	109,"tinylisp.c::pair::0::10"

; Function closure flags 0x00000200 __smallc 
; double closure(double v, double x, double e)
; parameter 'double e' at sp+2 size(6)
; parameter 'double x' at sp+8 size(6)
; parameter 'double v' at sp+14 size(6)
	C_LINE	109,"tinylisp.c::closure::0::10"
._closure
	ld	hl,(_CLOS)
	push	hl
	ld	hl,16	;const
	add	hl,sp
	call	dldpsh
	ld	hl,16	;const
	add	hl,sp
	call	dldpsh
	ld	hl,16	;const
	add	hl,sp
	call	dldpsh
	ld	hl,_env
	call	dldpsh
	call	_equ
	exx
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	exx
	ld	a,h
	or	l
	jp	z,i_37	;
	ld	hl,_nil
	call	dload
	jp	i_38	;
.i_37
	ld	hl,16	;const
	add	hl,sp
	call	dload
.i_38
	call	dpush
	call	_pair
	ld	hl,18	;const
	add	hl,sp
	ld	sp,hl
	call	dpush
	call	_ord
	pop	bc
	pop	bc
	pop	bc
	push	hl
	call	_box
	pop	bc
	pop	bc
	ret


	C_LINE	114,"tinylisp.c::closure::0::11"

; Function assoc flags 0x00000200 __smallc 
; double assoc(double v, double e)
; parameter 'double e' at sp+2 size(6)
; parameter 'double v' at sp+8 size(6)
	C_LINE	114,"tinylisp.c::assoc::0::11"
._assoc
.i_39
	ld	hl,2	;const
	add	hl,sp
	call	l_i64_load
	call	l_i64_push
	ld	a,48
	call	l_i64_asr_uo
	call	l_i64_push
	ld	hl,(_CONS)
	call	l_i64_uint2i64
	call	l_i64_eq
	jp	nc,i_41	;
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	call	_equ
	exx
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	exx
	call	l_lneg
	jp	nc,i_41	;
.i_42_i_41
	ld	hl,2	;const
	add	hl,sp
	push	hl
	call	dldpsh
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
	pop	hl
	call	dstore
	jp	i_39	;EOS
.i_40
	ld	hl,2	;const
	add	hl,sp
	call	l_i64_load
	call	l_i64_push
	ld	a,48
	call	l_i64_asr_uo
	call	l_i64_push
	ld	hl,(_CONS)
	call	l_i64_uint2i64
	call	l_i64_eq
	jp	nc,i_43	;
	ld	hl,2	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
	ret
.i_43
	ld	hl,_err
	call	dload
.i_44
	ret


	C_LINE	121,"tinylisp.c::assoc::0::12"

; Function not flags 0x00000200 __smallc 
; unsigned int not(double x)
; parameter 'double x' at sp+2 size(6)
	C_LINE	121,"tinylisp.c::not::0::12"
._not
	ld	hl,2	;const
	add	hl,sp
	call	l_i64_load
	call	l_i64_push
	ld	a,48
	call	l_i64_asr_uo
	call	l_i64_push
	ld	hl,(_NIL)
	call	l_i64_uint2i64
	call	l_i64_eq
	ret


	C_LINE	126,"tinylisp.c::not::0::13"

; Function let flags 0x00000200 __smallc 
; unsigned int let(double x)
; parameter 'double x' at sp+2 size(6)
	C_LINE	126,"tinylisp.c::let::0::13"
._let
	ld	hl,2	;const
	add	hl,sp
	call	l_i64_load
	call	l_i64_push
	ld	a,48
	call	l_i64_asr_uo
	call	l_i64_push
	ld	hl,(_NIL)
	call	l_i64_uint2i64
	call	l_i64_ne
	jp	nc,i_45	;
	ld	hl,2	;const
	add	hl,sp
	call	dldpsh
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	call	_not
	pop	bc
	pop	bc
	pop	bc
	call	l_lneg
	jp	nc,i_45	;
	ld	hl,1	;const
	jr	i_46
.i_45
	ld	hl,0	;const
.i_46
	ret


	C_LINE	131,"tinylisp.c::let::0::14"
	C_LINE	132,"tinylisp.c::let::0::14"

; Function evlis flags 0x00000200 __smallc 
; double evlis(double t, double e)
; parameter 'double e' at sp+2 size(6)
; parameter 'double t' at sp+8 size(6)
	C_LINE	132,"tinylisp.c::evlis::0::14"
._evlis
	ld	hl,8	;const
	add	hl,sp
	call	l_i64_load
	call	l_i64_push
	ld	a,48
	call	l_i64_asr_uo
	call	l_i64_push
	ld	hl,(_CONS)
	call	l_i64_uint2i64
	call	l_i64_eq
	jp	nc,i_47	;
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_eval
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	call	dpush
	ld	hl,14	;const
	add	hl,sp
	call	dldpsh
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	ld	hl,14	;const
	add	hl,sp
	call	dldpsh
	call	_evlis
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	call	dpush
	call	_cons
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	ret
.i_47
	ld	hl,8	;const
	add	hl,sp
	call	l_i64_load
	call	l_i64_push
	ld	a,48
	call	l_i64_asr_uo
	call	l_i64_push
	ld	hl,(_ATOM)
	call	l_i64_uint2i64
	call	l_i64_eq
	jp	nc,i_49	;
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_assoc
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	jp	i_50	;
.i_49
	ld	hl,_nil
	call	dload
.i_48
	ret


	C_LINE	163,"tinylisp.c::evlis::0::15"

; Function f_eval flags 0x00000200 __smallc 
; double f_eval(double t, double e)
; parameter 'double e' at sp+2 size(6)
; parameter 'double t' at sp+8 size(6)
	C_LINE	163,"tinylisp.c::f_eval::0::15"
._f_eval
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_evlis
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	call	dpush
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_eval
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	ret


	C_LINE	167,"tinylisp.c::f_eval::0::16"

; Function f_quote flags 0x00000200 __smallc 
; double f_quote(double t, double _)
; parameter 'double _' at sp+2 size(6)
; parameter 'double t' at sp+8 size(6)
	C_LINE	167,"tinylisp.c::f_quote::0::16"
._f_quote
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	171,"tinylisp.c::f_quote::0::17"

; Function f_cons flags 0x00000200 __smallc 
; double f_cons(double t, double e)
; parameter 'double e' at sp+2 size(6)
; parameter 'double t' at sp+8 size(6)
	C_LINE	171,"tinylisp.c::f_cons::0::17"
._f_cons
	ld	hl,8	;const
	add	hl,sp
	push	hl
	call	dldpsh
	ld	hl,10	;const
	add	hl,sp
	call	dldpsh
	call	_evlis
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	pop	hl
	call	dstore
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	ld	hl,14	;const
	add	hl,sp
	call	dldpsh
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	call	_cons
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	ret


	C_LINE	176,"tinylisp.c::f_cons::0::18"

; Function f_car flags 0x00000200 __smallc 
; double f_car(double t, double e)
; parameter 'double e' at sp+2 size(6)
; parameter 'double t' at sp+8 size(6)
	C_LINE	176,"tinylisp.c::f_car::0::18"
._f_car
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_evlis
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	call	dpush
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	call	_car
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	180,"tinylisp.c::f_car::0::19"

; Function f_cdr flags 0x00000200 __smallc 
; double f_cdr(double t, double e)
; parameter 'double e' at sp+2 size(6)
; parameter 'double t' at sp+8 size(6)
	C_LINE	180,"tinylisp.c::f_cdr::0::19"
._f_cdr
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_evlis
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	call	dpush
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	184,"tinylisp.c::f_cdr::0::20"

; Function f_add flags 0x00000200 __smallc 
; double f_add(double t, double e)
; parameter 'double e' at sp+2 size(6)
; parameter 'double t' at sp+8 size(6)
	C_LINE	184,"tinylisp.c::f_add::0::20"
._f_add
	push	bc
	push	bc
	push	bc
	ld	hl,14	;const
	add	hl,sp
	push	hl
	call	dldpsh
	ld	hl,16	;const
	add	hl,sp
	call	dldpsh
	call	_evlis
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	pop	hl
	call	dstore
	ld	hl,0	;const
	add	hl,sp
	push	hl
	ld	hl,16	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	pop	hl
	call	dstore
.i_51
	ld	hl,14	;const
	add	hl,sp
	push	hl
	call	dldpsh
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
	pop	hl
	call	dstore
	call	dpush
	call	_not
	pop	bc
	pop	bc
	pop	bc
	call	l_lneg
	jp	nc,i_52	;
	ld	hl,0	;const
	add	hl,sp
	push	hl
	call	dldpsh
	ld	hl,22	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dadd
	pop	hl
	call	dstore
	jp	i_51	;EOS
.i_52
	ld	hl,0	;const
	add	hl,sp
	call	dldpsh
	call	_num
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	193,"tinylisp.c::f_add::0::21"

; Function f_sub flags 0x00000200 __smallc 
; double f_sub(double t, double e)
; parameter 'double e' at sp+2 size(6)
; parameter 'double t' at sp+8 size(6)
	C_LINE	193,"tinylisp.c::f_sub::0::21"
._f_sub
	push	bc
	push	bc
	push	bc
	ld	hl,14	;const
	add	hl,sp
	push	hl
	call	dldpsh
	ld	hl,16	;const
	add	hl,sp
	call	dldpsh
	call	_evlis
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	pop	hl
	call	dstore
	ld	hl,0	;const
	add	hl,sp
	push	hl
	ld	hl,16	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	pop	hl
	call	dstore
.i_53
	ld	hl,14	;const
	add	hl,sp
	push	hl
	call	dldpsh
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
	pop	hl
	call	dstore
	call	dpush
	call	_not
	pop	bc
	pop	bc
	pop	bc
	call	l_lneg
	jp	nc,i_54	;
	ld	hl,0	;const
	add	hl,sp
	push	hl
	call	dldpsh
	ld	hl,22	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dsub
	pop	hl
	call	dstore
	jp	i_53	;EOS
.i_54
	ld	hl,0	;const
	add	hl,sp
	call	dldpsh
	call	_num
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	202,"tinylisp.c::f_sub::0::22"

; Function f_mul flags 0x00000200 __smallc 
; double f_mul(double t, double e)
; parameter 'double e' at sp+2 size(6)
; parameter 'double t' at sp+8 size(6)
	C_LINE	202,"tinylisp.c::f_mul::0::22"
._f_mul
	push	bc
	push	bc
	push	bc
	ld	hl,14	;const
	add	hl,sp
	push	hl
	call	dldpsh
	ld	hl,16	;const
	add	hl,sp
	call	dldpsh
	call	_evlis
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	pop	hl
	call	dstore
	ld	hl,0	;const
	add	hl,sp
	push	hl
	ld	hl,16	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	pop	hl
	call	dstore
.i_55
	ld	hl,14	;const
	add	hl,sp
	push	hl
	call	dldpsh
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
	pop	hl
	call	dstore
	call	dpush
	call	_not
	pop	bc
	pop	bc
	pop	bc
	call	l_lneg
	jp	nc,i_56	;
	ld	hl,0	;const
	add	hl,sp
	push	hl
	call	dldpsh
	ld	hl,22	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dmul
	pop	hl
	call	dstore
	jp	i_55	;EOS
.i_56
	ld	hl,0	;const
	add	hl,sp
	call	dldpsh
	call	_num
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	211,"tinylisp.c::f_mul::0::23"

; Function f_div flags 0x00000200 __smallc 
; double f_div(double t, double e)
; parameter 'double e' at sp+2 size(6)
; parameter 'double t' at sp+8 size(6)
	C_LINE	211,"tinylisp.c::f_div::0::23"
._f_div
	push	bc
	push	bc
	push	bc
	ld	hl,14	;const
	add	hl,sp
	push	hl
	call	dldpsh
	ld	hl,16	;const
	add	hl,sp
	call	dldpsh
	call	_evlis
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	pop	hl
	call	dstore
	ld	hl,0	;const
	add	hl,sp
	push	hl
	ld	hl,16	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	pop	hl
	call	dstore
.i_57
	ld	hl,14	;const
	add	hl,sp
	push	hl
	call	dldpsh
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
	pop	hl
	call	dstore
	call	dpush
	call	_not
	pop	bc
	pop	bc
	pop	bc
	call	l_lneg
	jp	nc,i_58	;
	ld	hl,0	;const
	add	hl,sp
	push	hl
	call	dldpsh
	ld	hl,22	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	ddiv
	pop	hl
	call	dstore
	jp	i_57	;EOS
.i_58
	ld	hl,0	;const
	add	hl,sp
	call	dldpsh
	call	_num
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	220,"tinylisp.c::f_div::0::24"

; Function f_int flags 0x00000200 __smallc 
; double f_int(double t, double e)
; parameter 'double e' at sp+2 size(6)
; parameter 'double t' at sp+8 size(6)
	C_LINE	220,"tinylisp.c::f_int::0::24"
._f_int
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_evlis
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	call	dpush
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	ld	hl,0	;const
	add	hl,sp
	call	dldpsh
	ld	hl,i_59+0
	call	dload
	call	dlt
	ld	a,h
	or	l
	jp	z,i_60	;
	ld	hl,0	;const
	add	hl,sp
	call	dldpsh
	ld	hl,i_61+0
	call	dload
	call	dgt
	ld	a,h
	or	l
	jp	z,i_60	;
	ld	hl,1	;const
	jr	i_62
.i_60
	ld	hl,0	;const
.i_62
	jp	nc,i_63	;
	ld	hl,0	;const
	add	hl,sp
	call	dload
	call	f2sllong
	jp	i_64	;
.i_63
	ld	hl,0	;const
	add	hl,sp
	call	dload
	jp	i_65	;
.i_64
	call	l_f48_sllong2f
.i_65
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	225,"tinylisp.c::f_int::0::25"

; Function f_lt flags 0x00000200 __smallc 
; double f_lt(double t, double e)
; parameter 'double e' at sp+2 size(6)
; parameter 'double t' at sp+8 size(6)
	C_LINE	225,"tinylisp.c::f_lt::0::25"
._f_lt
	ld	hl,8	;const
	add	hl,sp
	push	hl
	call	dldpsh
	ld	hl,10	;const
	add	hl,sp
	call	dldpsh
	call	_evlis
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	pop	hl
	call	dstore
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	ld	hl,14	;const
	add	hl,sp
	call	dldpsh
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dsub
	call	dpush
	ld	hl,0	;const
	call	l_int2long_u_float
	call	dlt
	ld	a,h
	or	l
	jp	z,i_66	;
	ld	hl,_tru
	call	dload
	ret
.i_66
	ld	hl,_nil
	call	dload
.i_67
	ret


	C_LINE	229,"tinylisp.c::f_lt::0::26"

; Function f_eq flags 0x00000200 __smallc 
; double f_eq(double t, double e)
; parameter 'double e' at sp+2 size(6)
; parameter 'double t' at sp+8 size(6)
	C_LINE	229,"tinylisp.c::f_eq::0::26"
._f_eq
	ld	hl,8	;const
	add	hl,sp
	push	hl
	call	dldpsh
	ld	hl,10	;const
	add	hl,sp
	call	dldpsh
	call	_evlis
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	pop	hl
	call	dstore
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	ld	hl,14	;const
	add	hl,sp
	call	dldpsh
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	call	_equ
	exx
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	exx
	ld	a,h
	or	l
	jp	z,i_68	;
	ld	hl,_tru
	call	dload
	ret
.i_68
	ld	hl,_nil
	call	dload
.i_69
	ret


	C_LINE	233,"tinylisp.c::f_eq::0::27"

; Function f_not flags 0x00000200 __smallc 
; double f_not(double t, double e)
; parameter 'double e' at sp+2 size(6)
; parameter 'double t' at sp+8 size(6)
	C_LINE	233,"tinylisp.c::f_not::0::27"
._f_not
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_evlis
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	call	dpush
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	call	_not
	pop	bc
	pop	bc
	pop	bc
	ld	a,h
	or	l
	jp	z,i_70	;
	ld	hl,_tru
	call	dload
	ret
.i_70
	ld	hl,_nil
	call	dload
.i_71
	ret


	C_LINE	237,"tinylisp.c::f_not::0::28"

; Function f_or flags 0x00000200 __smallc 
; double f_or(double t, double e)
; parameter 'double e' at sp+2 size(6)
; parameter 'double t' at sp+8 size(6)
	C_LINE	237,"tinylisp.c::f_or::0::28"
._f_or
	ld	hl,_nil
	call	dldpsh
.i_72
	ld	hl,14	;const
	add	hl,sp
	call	l_i64_load
	call	l_i64_push
	ld	a,48
	call	l_i64_asr_uo
	call	l_i64_push
	ld	hl,(_NIL)
	call	l_i64_uint2i64
	call	l_i64_ne
	jp	nc,i_74	;
	ld	hl,0	;const
	add	hl,sp
	push	hl
	ld	hl,16	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	ld	hl,16	;const
	add	hl,sp
	call	dldpsh
	call	_eval
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	pop	hl
	call	dstore
	call	dpush
	call	_not
	pop	bc
	pop	bc
	pop	bc
	ld	a,h
	or	l
	jp	z,i_74	;
.i_75_i_74
	ld	hl,14	;const
	add	hl,sp
	push	hl
	call	dldpsh
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
	pop	hl
	call	dstore
	jp	i_72	;EOS
.i_73
	ld	hl,0	;const
	add	hl,sp
	call	dload
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	244,"tinylisp.c::f_or::0::29"

; Function f_and flags 0x00000200 __smallc 
; double f_and(double t, double e)
; parameter 'double e' at sp+2 size(6)
; parameter 'double t' at sp+8 size(6)
	C_LINE	244,"tinylisp.c::f_and::0::29"
._f_and
	ld	hl,_nil
	call	dldpsh
.i_76
	ld	hl,14	;const
	add	hl,sp
	call	l_i64_load
	call	l_i64_push
	ld	a,48
	call	l_i64_asr_uo
	call	l_i64_push
	ld	hl,(_NIL)
	call	l_i64_uint2i64
	call	l_i64_ne
	jp	nc,i_78	;
	ld	hl,0	;const
	add	hl,sp
	push	hl
	ld	hl,16	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	ld	hl,16	;const
	add	hl,sp
	call	dldpsh
	call	_eval
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	pop	hl
	call	dstore
	call	dpush
	call	_not
	pop	bc
	pop	bc
	pop	bc
	call	l_lneg
	jp	nc,i_78	;
.i_79_i_78
	ld	hl,14	;const
	add	hl,sp
	push	hl
	call	dldpsh
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
	pop	hl
	call	dstore
	jp	i_76	;EOS
.i_77
	ld	hl,0	;const
	add	hl,sp
	call	dload
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	251,"tinylisp.c::f_and::0::30"

; Function f_cond flags 0x00000200 __smallc 
; double f_cond(double t, double e)
; parameter 'double e' at sp+2 size(6)
; parameter 'double t' at sp+8 size(6)
	C_LINE	251,"tinylisp.c::f_cond::0::30"
._f_cond
.i_80
	ld	hl,8	;const
	add	hl,sp
	call	l_i64_load
	call	l_i64_push
	ld	a,48
	call	l_i64_asr_uo
	call	l_i64_push
	ld	hl,(_NIL)
	call	l_i64_uint2i64
	call	l_i64_ne
	jp	nc,i_82	;
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_eval
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	call	dpush
	call	_not
	pop	bc
	pop	bc
	pop	bc
	ld	a,h
	or	l
	jp	z,i_82	;
.i_83_i_82
	ld	hl,8	;const
	add	hl,sp
	push	hl
	call	dldpsh
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
	pop	hl
	call	dstore
	jp	i_80	;EOS
.i_81
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_eval
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	ret


	C_LINE	257,"tinylisp.c::f_cond::0::31"

; Function f_if flags 0x00000200 __smallc 
; double f_if(double t, double e)
; parameter 'double e' at sp+2 size(6)
; parameter 'double t' at sp+8 size(6)
	C_LINE	257,"tinylisp.c::f_if::0::31"
._f_if
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_eval
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	call	dpush
	call	_not
	pop	bc
	pop	bc
	pop	bc
	ld	a,h
	or	l
	jp	z,i_98	;
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
	jp	i_99	;
.i_98
	ld	hl,8	;const
	add	hl,sp
	call	dload
.i_99
	call	dpush
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_eval
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	ret


	C_LINE	261,"tinylisp.c::f_if::0::32"

; Function f_leta flags 0x00000200 __smallc 
; double f_leta(double t, double e)
; parameter 'double e' at sp+2 size(6)
; parameter 'double t' at sp+8 size(6)
	C_LINE	261,"tinylisp.c::f_leta::0::32"
._f_leta
	jp	i_102	;EOS
.i_100
	ld	hl,8	;const
	add	hl,sp
	push	hl
	call	dldpsh
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
	pop	hl
	call	dstore
.i_102
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_let
	pop	bc
	pop	bc
	pop	bc
	ld	a,h
	or	l
	jp	z,i_101	;
	ld	hl,2	;const
	add	hl,sp
	push	hl
	ld	hl,10	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	ld	hl,16	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	ld	hl,16	;const
	add	hl,sp
	call	dldpsh
	call	_eval
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	call	dpush
	ld	hl,16	;const
	add	hl,sp
	call	dldpsh
	call	_pair
	ld	hl,18	;const
	add	hl,sp
	ld	sp,hl
	pop	hl
	call	dstore
	jp	i_100	;EOS
.i_101
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_eval
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	ret


	C_LINE	267,"tinylisp.c::f_leta::0::33"

; Function f_lambda flags 0x00000200 __smallc 
; double f_lambda(double t, double e)
; parameter 'double e' at sp+2 size(6)
; parameter 'double t' at sp+8 size(6)
	C_LINE	267,"tinylisp.c::f_lambda::0::33"
._f_lambda
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	ld	hl,14	;const
	add	hl,sp
	call	dldpsh
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	ld	hl,14	;const
	add	hl,sp
	call	dldpsh
	call	_closure
	ld	hl,18	;const
	add	hl,sp
	ld	sp,hl
	ret


	C_LINE	271,"tinylisp.c::f_lambda::0::34"

; Function f_define flags 0x00000200 __smallc 
; double f_define(double t, double e)
; parameter 'double e' at sp+2 size(6)
; parameter 'double t' at sp+8 size(6)
	C_LINE	271,"tinylisp.c::f_define::0::34"
._f_define
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	ld	hl,14	;const
	add	hl,sp
	call	dldpsh
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	ld	hl,14	;const
	add	hl,sp
	call	dldpsh
	call	_eval
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	call	dpush
	ld	hl,_env
	call	dldpsh
	call	_pair
	ld	hl,18	;const
	add	hl,sp
	ld	sp,hl
	ld	hl,_env
	call	dstore
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	277,"tinylisp.c::f_define::0::35"
	SECTION	data_compiler
._prim
	defw	i_1+0
	defw	_f_eval + 0
	defw	i_1+5
	defw	_f_quote + 0
	defw	i_1+11
	defw	_f_cons + 0
	defw	i_1+16
	defw	_f_car + 0
	defw	i_1+20
	defw	_f_cdr + 0
	defw	i_1+24
	defw	_f_add + 0
	defw	i_1+26
	defw	_f_sub + 0
	defw	i_1+28
	defw	_f_mul + 0
	defw	i_1+30
	defw	_f_div + 0
	defw	i_1+32
	defw	_f_int + 0
	defw	i_1+36
	defw	_f_lt + 0
	defw	i_1+38
	defw	_f_eq + 0
	defw	i_1+42
	defw	_f_or + 0
	defw	i_1+45
	defw	_f_and + 0
	defw	i_1+49
	defw	_f_not + 0
	defw	i_1+53
	defw	_f_cond + 0
	defw	i_1+58
	defw	_f_if + 0
	defw	i_1+61
	defw	_f_leta + 0
	defw	i_1+66
	defw	_f_lambda + 0
	defw	i_1+73
	defw	_f_define + 0
	defw	0
	defs	2
	SECTION	code_compiler
	C_LINE	304,"tinylisp.c::f_define::0::35"

; Function bind flags 0x00000200 __smallc 
; double bind(double v, double t, double e)
; parameter 'double e' at sp+2 size(6)
; parameter 'double t' at sp+8 size(6)
; parameter 'double v' at sp+14 size(6)
	C_LINE	304,"tinylisp.c::bind::0::35"
._bind
	ld	hl,14	;const
	add	hl,sp
	call	l_i64_load
	call	l_i64_push
	ld	a,48
	call	l_i64_asr_uo
	call	l_i64_push
	ld	hl,(_NIL)
	call	l_i64_uint2i64
	call	l_i64_eq
	jp	nc,i_104	;
	ld	hl,2	;const
	add	hl,sp
	call	dload
	ret
.i_104
	ld	hl,14	;const
	add	hl,sp
	call	l_i64_load
	call	l_i64_push
	ld	a,48
	call	l_i64_asr_uo
	call	l_i64_push
	ld	hl,(_CONS)
	call	l_i64_uint2i64
	call	l_i64_eq
	jp	nc,i_106	;
	ld	hl,14	;const
	add	hl,sp
	call	dldpsh
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	ld	hl,14	;const
	add	hl,sp
	call	dldpsh
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	ld	hl,26	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	ld	hl,26	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	ld	hl,26	;const
	add	hl,sp
	call	dldpsh
	call	_pair
	ld	hl,18	;const
	add	hl,sp
	ld	sp,hl
	call	dpush
	call	_bind
	ld	hl,18	;const
	add	hl,sp
	ld	sp,hl
	jp	i_107	;
.i_106
	ld	hl,14	;const
	add	hl,sp
	call	dldpsh
	ld	hl,14	;const
	add	hl,sp
	call	dldpsh
	ld	hl,14	;const
	add	hl,sp
	call	dldpsh
	call	_pair
	ld	hl,18	;const
	add	hl,sp
	ld	sp,hl
.i_105
	ret


	C_LINE	311,"tinylisp.c::bind::0::36"

; Function reduce flags 0x00000200 __smallc 
; double reduce(double f, double t, double e)
; parameter 'double e' at sp+2 size(6)
; parameter 'double t' at sp+8 size(6)
; parameter 'double f' at sp+14 size(6)
	C_LINE	311,"tinylisp.c::reduce::0::36"
._reduce
	ld	hl,14	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	ld	hl,20	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	ld	hl,20	;const
	add	hl,sp
	call	dldpsh
	ld	hl,20	;const
	add	hl,sp
	call	dldpsh
	call	_evlis
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	call	dpush
	ld	hl,32	;const
	add	hl,sp
	call	dldpsh
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	call	_not
	pop	bc
	pop	bc
	pop	bc
	ld	a,h
	or	l
	jp	z,i_114	;
	ld	hl,_env
	call	dload
	jp	i_115	;
.i_114
	ld	hl,32	;const
	add	hl,sp
	call	dldpsh
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
.i_115
	call	dpush
	call	_bind
	ld	hl,18	;const
	add	hl,sp
	ld	sp,hl
	call	dpush
	call	_eval
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	ret


	C_LINE	316,"tinylisp.c::reduce::0::37"

; Function apply flags 0x00000200 __smallc 
; double apply(double f, double t, double e)
; parameter 'double e' at sp+2 size(6)
; parameter 'double t' at sp+8 size(6)
; parameter 'double f' at sp+14 size(6)
	C_LINE	316,"tinylisp.c::apply::0::37"
._apply
	ld	hl,14	;const
	add	hl,sp
	call	l_i64_load
	call	l_i64_push
	ld	a,48
	call	l_i64_asr_uo
	call	l_i64_push
	ld	hl,(_PRIM)
	call	l_i64_uint2i64
	call	l_i64_eq
	jp	nc,i_116	;
	ld	hl,_prim
	push	hl
	ld	hl,16	;const
	add	hl,sp
	call	dldpsh
	call	_ord
	pop	bc
	pop	bc
	pop	bc
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	call	l_gint2	;
	push	hl
	ld	hl,10	;const
	add	hl,sp
	call	dload
	call	dpush2
	pop	hl
	push	hl
	ld	hl,10	;const
	add	hl,sp
	call	dload
	call	dpush2
	pop	hl
	call	l_jphl
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	ret
.i_116
	ld	hl,14	;const
	add	hl,sp
	call	l_i64_load
	call	l_i64_push
	ld	a,48
	call	l_i64_asr_uo
	call	l_i64_push
	ld	hl,(_CLOS)
	call	l_i64_uint2i64
	call	l_i64_eq
	jp	nc,i_118	;
	ld	hl,14	;const
	add	hl,sp
	call	dldpsh
	ld	hl,14	;const
	add	hl,sp
	call	dldpsh
	ld	hl,14	;const
	add	hl,sp
	call	dldpsh
	call	_reduce
	ld	hl,18	;const
	add	hl,sp
	ld	sp,hl
	jp	i_119	;
.i_118
	ld	hl,_err
	call	dload
.i_117
	ret


	C_LINE	323,"tinylisp.c::apply::0::38"

; Function eval flags 0x00000200 __smallc 
; double eval(double x, double e)
; parameter 'double e' at sp+2 size(6)
; parameter 'double x' at sp+8 size(6)
	C_LINE	323,"tinylisp.c::eval::0::38"
._eval
	ld	hl,8	;const
	add	hl,sp
	call	l_i64_load
	call	l_i64_push
	ld	a,48
	call	l_i64_asr_uo
	call	l_i64_push
	ld	hl,(_ATOM)
	call	l_i64_uint2i64
	call	l_i64_eq
	jp	nc,i_120	;
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_assoc
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	ret
.i_120
	ld	hl,8	;const
	add	hl,sp
	call	l_i64_load
	call	l_i64_push
	ld	a,48
	call	l_i64_asr_uo
	call	l_i64_push
	ld	hl,(_CONS)
	call	l_i64_uint2i64
	call	l_i64_eq
	jp	nc,i_122	;
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	ld	hl,8	;const
	add	hl,sp
	call	dldpsh
	call	_eval
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	call	dpush
	ld	hl,14	;const
	add	hl,sp
	call	dldpsh
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	ld	hl,14	;const
	add	hl,sp
	call	dldpsh
	call	_apply
	ld	hl,18	;const
	add	hl,sp
	ld	sp,hl
	jp	i_123	;
.i_122
	ld	hl,8	;const
	add	hl,sp
	call	dload
.i_121
	ret


	C_LINE	330,"tinylisp.c::eval::0::39"
	SECTION	data_compiler
._see
	defb	32
	SECTION	code_compiler
	C_LINE	333,"tinylisp.c::eval::0::39"

; Function look flags 0x00000200 __smallc 
; void look()
	C_LINE	333,"tinylisp.c::look::0::39"
._look
	ld	hl,__sgoioblk
	push	hl
	call	fgetc
	pop	bc
	push	hl
	ld	a,l
	call	l_sxt
	ld	a,l
	ld	(_see),a
	pop	hl
	push	hl
	ld	de,65535
	and	a
	sbc	hl,de
	call	z,exit_fastcall
.i_125
	pop	bc
	ret


	C_LINE	341,"tinylisp.c::look::0::40"

; Function seeing flags 0x00000200 __smallc 
; unsigned int seeing(char c)
; parameter 'char c' at sp+2 size(1)
	C_LINE	341,"tinylisp.c::seeing::0::40"
._seeing
	ld	hl,2	;const
	add	hl,sp
	ld	a,(hl)
	cp	32
	jp	nz,i_126	;
	ld	hl,_see
	call	l_gchar
	ld	de,0
	ex	de,hl
	call	l_gt
	jp	nc,i_127	;
	ld	hl,_see
	call	l_gchar
	push	hl
	ld	hl,4	;const
	add	hl,sp
	call	l_gchar
	pop	de
	call	l_le
	jp	nc,i_127	;
	ld	hl,1	;const
	jr	i_128
.i_127
	ld	hl,0	;const
	ret
.i_126
	ld	hl,_see
	call	l_gchar
	push	hl
	ld	hl,4	;const
	add	hl,sp
	call	l_gchar
	pop	de
	call	l_eq
.i_129
	ret


	C_LINE	346,"tinylisp.c::seeing::0::41"

; Function get flags 0x00000200 __smallc 
; char get()
	C_LINE	346,"tinylisp.c::get::0::41"
._get
	ld	hl,_see
	call	l_gchar
	dec	sp
	ld	a,l
	pop	hl
	ld	l,a
	push	hl
	call	_look
	ld	hl,0	;const
	add	hl,sp
	call	l_gchar
	inc	sp
	ret


	C_LINE	353,"tinylisp.c::get::0::42"

; Function scan flags 0x00000200 __smallc 
; char scan()
	C_LINE	353,"tinylisp.c::scan::0::42"
._scan
	ld	hl,0	;const
	push	hl
.i_130
	ld	hl,32	;const
	push	hl
	call	_seeing
	pop	bc
	ld	a,h
	or	l
	jp	z,i_131	;
	call	_look
	jp	i_130	;EOS
.i_131
	ld	hl,40	;const
	push	hl
	call	_seeing
	pop	bc
	ld	a,h
	or	l
	jp	nz,i_133	;
	ld	hl,41	;const
	push	hl
	call	_seeing
	pop	bc
	ld	a,h
	or	l
	jp	nz,i_133	;
	ld	hl,39	;const
	push	hl
	call	_seeing
	pop	bc
	ld	a,h
	or	l
	jr	z,i_134
.i_133
	ld	hl,1	;const
.i_134
	ld	a,h
	or	l
	jp	z,i_132	;
	ld	hl,_buf
	ld	d,h
	ld	e,l
	pop	hl
	inc	hl
	push	hl
	push	de
	dec	hl
	pop	de
	add	hl,de
	push	hl
	call	_get
	ld	a,l
	pop	de
	ld	(de),a
	jp	i_135	;EOS
.i_138
	ld	hl,_buf
	ld	d,h
	ld	e,l
	pop	hl
	inc	hl
	push	hl
	push	de
	dec	hl
	pop	de
	add	hl,de
	push	hl
	call	_get
	ld	a,l
	call	l_sxt
	pop	de
	ld	a,l
	ld	(de),a
.i_136
	pop	hl
	push	hl
	ld	de,39
	and	a
	sbc	hl,de
	jp	nc,i_139	;
	ld	hl,40	;const
	push	hl
	call	_seeing
	pop	bc
	call	l_lneg
	jp	nc,i_139	;
	ld	hl,41	;const
	push	hl
	call	_seeing
	pop	bc
	call	l_lneg
	jp	nc,i_139	;
	ld	hl,32	;const
	push	hl
	call	_seeing
	pop	bc
	call	l_lneg
	jp	nc,i_139	;
	jp	i_138	;EOS
.i_135
	pop	hl
	push	hl
	ld	bc,_buf
	push	bc
	pop	de
	add	hl,de
	ld	d,h
	ld	e,l
	xor	a
	ld	(de),a
	ld	hl,_buf
	call	l_gchar
	pop	bc
	ret


	C_LINE	368,"tinylisp.c::scan::0::43"
	C_LINE	369,"tinylisp.c::scan::0::43"

; Function Read flags 0x00000200 __smallc 
; double Read()
	C_LINE	369,"tinylisp.c::Read::0::43"
._Read
	call	_scan
	call	_parse
	ret


	C_LINE	375,"tinylisp.c::Read::0::44"

; Function list flags 0x00000200 __smallc 
; double list()
	C_LINE	375,"tinylisp.c::list::0::44"
._list
	push	bc
	push	bc
	push	bc
	call	_scan
	ld	de,41
	and	a
	sbc	hl,de
	jp	nz,i_141	;
	ld	hl,_nil
	call	dload
	pop	bc
	pop	bc
	pop	bc
	ret


.i_141
	ld	hl,_buf
	push	hl
	ld	hl,i_1+80
	push	hl
	call	strcmp_callee
	call	l_lneg
	jp	nc,i_142	;
	ld	hl,0	;const
	add	hl,sp
	push	hl
	call	_Read
	pop	hl
	call	dstore
	call	_scan
	ld	hl,0	;const
	add	hl,sp
	call	dload
	pop	bc
	pop	bc
	pop	bc
	ret


.i_142
	ld	hl,0	;const
	add	hl,sp
	push	hl
	call	_parse
	pop	hl
	call	dstore
	ld	hl,0	;const
	add	hl,sp
	call	dldpsh
	call	_list
	call	dpush
	call	_cons
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	389,"tinylisp.c::list::0::46"

; Function quote flags 0x00000200 __smallc 
; double quote()
	C_LINE	389,"tinylisp.c::quote::0::46"
._quote
	ld	hl,i_1+5
	push	hl
	call	_atom
	pop	bc
	call	dpush
	call	_Read
	call	dpush
	ld	hl,_nil
	call	dldpsh
	call	_cons
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	call	dpush
	call	_cons
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	ret


	C_LINE	394,"tinylisp.c::quote::0::47"

; Function atomic flags 0x00000200 __smallc 
; double atomic()
	C_LINE	394,"tinylisp.c::atomic::0::47"
._atomic
	push	bc
	push	bc
	push	bc
	push	bc
	ld	hl,_buf
	push	hl
	ld	hl,i_1+82
	push	hl
	ld	hl,6	;const
	add	hl,sp
	push	hl
	dec	hl
	dec	hl
	push	hl
	ld	a,4
	call	sscanf
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ld	de,0
	ex	de,hl
	call	l_gt
	jp	nc,i_143	;
	pop	hl
	push	hl
	ld	bc,_buf
	push	bc
	pop	de
	add	hl,de
	call	l_gchar
	call	l_lneg
	jp	nc,i_143	;
	ld	hl,1	;const
	jr	i_144
.i_143
	ld	hl,0	;const
.i_144
	jp	nc,i_145	;
	ld	hl,2	;const
	add	hl,sp
	call	dload
	jp	i_146	;
.i_145
	ld	hl,_buf
	push	hl
	call	_atom
	pop	bc
.i_146
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	401,"tinylisp.c::atomic::0::48"

; Function parse flags 0x00000200 __smallc 
; double parse()
	C_LINE	401,"tinylisp.c::parse::0::48"
._parse
	ld	hl,_buf
	call	l_gchar
	ld	de,40
	and	a
	sbc	hl,de
	jp	nz,i_147	;
	call	_list
	ret
.i_147
	ld	hl,_buf
	call	l_gchar
	ld	de,39
	and	a
	sbc	hl,de
	jp	nz,i_149	;
	call	_quote
	jp	i_150	;
.i_149
	call	_atomic
.i_148
	ret


	C_LINE	408,"tinylisp.c::parse::0::49"
	C_LINE	409,"tinylisp.c::parse::0::49"

; Function printlist flags 0x00000200 __smallc 
; void printlist(double t)
; parameter 'double t' at sp+2 size(6)
	C_LINE	409,"tinylisp.c::printlist::0::49"
._printlist
	ld	hl,40	;const
	push	hl
	ld	hl,__sgoioblk+10
	push	hl
	call	fputc_callee
.i_151
	ld	hl,32	;const
	push	hl
	ld	hl,__sgoioblk+10
	push	hl
	call	fputc_callee
	ld	hl,2	;const
	add	hl,sp
	call	dldpsh
	call	_car
	pop	bc
	pop	bc
	pop	bc
	call	dpush
	call	_print
	pop	bc
	pop	bc
	pop	bc
	ld	hl,2	;const
	add	hl,sp
	push	hl
	call	dldpsh
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
	pop	hl
	call	dstore
	ld	hl,2	;const
	add	hl,sp
	call	l_i64_load
	call	l_i64_push
	ld	a,48
	call	l_i64_asr_uo
	call	l_i64_push
	ld	hl,(_NIL)
	call	l_i64_uint2i64
	call	l_i64_eq
	jp	c,i_152	;EOS
.i_154
	ld	hl,2	;const
	add	hl,sp
	call	l_i64_load
	call	l_i64_push
	ld	a,48
	call	l_i64_asr_uo
	call	l_i64_push
	ld	hl,(_CONS)
	call	l_i64_uint2i64
	call	l_i64_ne
	jp	nc,i_155	;
	ld	hl,i_1+88
	push	hl
	ld	a,1
	call	printf
	pop	bc
	ld	hl,2	;const
	add	hl,sp
	call	dldpsh
	call	_print
	pop	bc
	pop	bc
	pop	bc
.i_152
	ld	hl,41	;const
	push	hl
	ld	hl,__sgoioblk+10
	push	hl
	call	fputc_callee
	ret


	C_LINE	425,"tinylisp.c::printlist::0::52"

; Function print flags 0x00000200 __smallc 
; void print(double x)
; parameter 'double x' at sp+2 size(6)
	C_LINE	425,"tinylisp.c::print::0::52"
._print
	ld	hl,2	;const
	add	hl,sp
	call	l_i64_load
	call	l_i64_push
	ld	a,48
	call	l_i64_asr_uo
	call	l_i64_push
	ld	hl,(_NIL)
	call	l_i64_uint2i64
	call	l_i64_eq
	jp	nc,i_156	;
	ld	hl,i_1+92
	push	hl
	ld	a,1
	call	printf
	pop	bc
	ret
.i_156
	ld	hl,2	;const
	add	hl,sp
	call	l_i64_load
	call	l_i64_push
	ld	a,48
	call	l_i64_asr_uo
	call	l_i64_push
	ld	hl,(_ATOM)
	call	l_i64_uint2i64
	call	l_i64_eq
	jp	nc,i_158	;
	ld	hl,i_1+95
	push	hl
	ld	hl,_cell
	push	hl
	ld	hl,6	;const
	add	hl,sp
	call	dldpsh
	call	_ord
	pop	bc
	pop	bc
	pop	bc
	pop	de
	add	hl,de
	push	hl
	ld	a,2
	call	printf
	pop	bc
	pop	bc
	jp	i_159	;EOS
.i_158
	ld	hl,2	;const
	add	hl,sp
	call	l_i64_load
	call	l_i64_push
	ld	a,48
	call	l_i64_asr_uo
	call	l_i64_push
	ld	hl,(_PRIM)
	call	l_i64_uint2i64
	call	l_i64_eq
	jp	nc,i_160	;
	ld	hl,i_1+98
	push	hl
	ld	hl,_prim
	push	hl
	ld	hl,6	;const
	add	hl,sp
	call	dldpsh
	call	_ord
	pop	bc
	pop	bc
	pop	bc
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	push	hl
	ld	a,2
	call	printf
	pop	bc
	pop	bc
	jp	i_161	;EOS
.i_160
	ld	hl,2	;const
	add	hl,sp
	call	l_i64_load
	call	l_i64_push
	ld	a,48
	call	l_i64_asr_uo
	call	l_i64_push
	ld	hl,(_CONS)
	call	l_i64_uint2i64
	call	l_i64_eq
	jp	nc,i_162	;
	ld	hl,2	;const
	add	hl,sp
	call	dldpsh
	call	_printlist
	pop	bc
	pop	bc
	pop	bc
	jp	i_163	;EOS
.i_162
	ld	hl,2	;const
	add	hl,sp
	call	l_i64_load
	call	l_i64_push
	ld	a,48
	call	l_i64_asr_uo
	call	l_i64_push
	ld	hl,(_CLOS)
	call	l_i64_uint2i64
	call	l_i64_eq
	jp	nc,i_164	;
	ld	hl,i_1+103
	push	hl
	ld	hl,4	;const
	add	hl,sp
	call	dldpsh
	call	_ord
	pop	bc
	pop	bc
	pop	bc
	push	hl
	ld	a,2
	call	printf
	pop	bc
	pop	bc
	jp	i_165	;EOS
.i_164
	ld	hl,i_1+108
	push	hl
	ld	hl,4	;const
	add	hl,sp
	call	dldpsh
	ld	a,4
	call	printf
	pop	bc
	pop	bc
	pop	bc
	pop	bc
.i_157
	ret


	C_LINE	441,"tinylisp.c::print::0::53"

; Function gc flags 0x00000200 __smallc 
; void gc()
	C_LINE	441,"tinylisp.c::gc::0::53"
._gc
	ld	hl,_env
	call	dldpsh
	call	_ord
	pop	bc
	pop	bc
	pop	bc
	ld	(_sp),hl
	ret


	C_LINE	446,"tinylisp.c::gc::0::54"

; Function main flags 0x00000000 __stdc 
; int main()
	C_LINE	446,"tinylisp.c::main::0::55"
._main
	push	bc
	ld	hl,i_1+115
	push	hl
	ld	a,1
	call	printf
	pop	bc
	ld	hl,(_NIL)
	push	hl
	ld	hl,0	;const
	push	hl
	call	_box
	pop	bc
	pop	bc
	ld	hl,_nil
	call	dstore
	ld	hl,i_1+124
	push	hl
	call	_atom
	pop	bc
	ld	hl,_err
	call	dstore
	ld	hl,i_1+128
	push	hl
	call	_atom
	pop	bc
	ld	hl,_tru
	call	dstore
	ld	hl,_tru
	call	dldpsh
	ld	hl,_tru
	call	dldpsh
	ld	hl,_nil
	call	dldpsh
	call	_pair
	ld	hl,18	;const
	add	hl,sp
	ld	sp,hl
	ld	hl,_env
	call	dstore
	ld	hl,0	;const
	pop	bc
	push	hl
	jp	i_168	;EOS
.i_166
	pop	hl
	inc	hl
	push	hl
.i_168
	pop	hl
	push	hl
	ld	bc,_prim
	push	bc
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	a,(hl)
	inc	hl
	or	(hl)
	jp	z,i_167	;
	pop	hl
	push	hl
	ld	bc,_prim
	push	bc
	add	hl,hl
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	push	hl
	call	_atom
	pop	bc
	call	dpush
	ld	hl,(_PRIM)
	push	hl
	call	l_gint8sp	;
	push	hl
	call	_box
	pop	bc
	pop	bc
	call	dpush
	ld	hl,_env
	call	dldpsh
	call	_pair
	ld	hl,18	;const
	add	hl,sp
	ld	sp,hl
	ld	hl,_env
	call	dstore
	jp	i_166	;EOS
.i_169
	ld	hl,i_1+131
	push	hl
	ld	hl,(_sp)
	push	hl
	ld	hl,(_hp)
	ld	de,3
	call	l_asr_u_hl_by_e
	pop	de
	ex	de,hl
	and	a
	sbc	hl,de
	push	hl
	ld	a,2
	call	printf
	pop	bc
	pop	bc
	call	_Read
	call	dpush
	ld	hl,_env
	call	dldpsh
	call	_eval
	ld	hl,12	;const
	add	hl,sp
	ld	sp,hl
	call	dpush
	call	_print
	pop	bc
	pop	bc
	pop	bc
	call	_gc
	jp	i_169	;EOS
.i_170
	pop	bc
	ret


	SECTION	bss_compiler
	SECTION	code_compiler
; --- Start of Optimiser additions ---
	defc	i_17 = i_14
	defc	i_50 = i_48
	defc	i_107 = i_105
	defc	i_119 = i_117
	defc	i_123 = i_121
	defc	i_132 = i_138
	defc	i_137 = i_135
	defc	i_150 = i_148
	defc	i_165 = i_163
	defc	i_163 = i_161
	defc	i_161 = i_159
	defc	i_159 = i_157
	defc	i_167 = i_169
	defc	i_12 = i_11
	defc	i_41 = i_40
	defc	i_74 = i_73
	defc	i_78 = i_77
	defc	i_82 = i_81
	defc	i_128 = i_129
	defc	i_139 = i_137
	defc	i_140_i_139 = i_138
	defc	i_155 = i_151

	SECTION	rodata_compiler
.i_1
	defm	"eval"
	defb	0

	defm	"quote"
	defb	0

	defm	"cons"
	defb	0

	defm	"car"
	defb	0

	defm	"cdr"
	defb	0

	defm	"+"
	defb	0

	defm	"-"
	defb	0

	defm	"*"
	defb	0

	defm	"/"
	defb	0

	defm	"int"
	defb	0

	defm	"<"
	defb	0

	defm	"eq?"
	defb	0

	defm	"or"
	defb	0

	defm	"and"
	defb	0

	defm	"not"
	defb	0

	defm	"cond"
	defb	0

	defm	"if"
	defb	0

	defm	"let*"
	defb	0

	defm	"lambda"
	defb	0

	defm	"define"
	defb	0

	defm	"."
	defb	0

	defm	"%lg%n"
	defb	0

	defm	" . "
	defb	0

	defm	"()"
	defb	0

	defm	"%s"
	defb	0

	defm	"<%s>"
	defb	0

	defm	"{%u}"
	defb	0

	defm	"%.10lg"
	defb	0

	defm	"tinylisp"
	defb	0

	defm	"ERR"
	defb	0

	defm	"#t"
	defb	0

	defm	""
	defb	10

	defm	"%u>"
	defb	0

.i_59
	;10000000000000000.000000
	defb	0x04,0xbf,0xc9,0x1b,0x0e,0xb6
.i_61
	;-10000000000000000.000000
	defb	0x04,0xbf,0xc9,0x1b,0x8e,0xb6

; --- Start of Static Variables ---

	SECTION	bss_compiler
._cell	defs	6144
._nil	defs	6
._tru	defs	6
._err	defs	6
._env	defs	6
._buf	defs	40
	SECTION	code_compiler


; --- Start of Scope Defns ---

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
	GLOBAL	_hp
	GLOBAL	_sp
	GLOBAL	_ATOM
	GLOBAL	_PRIM
	GLOBAL	_CONS
	GLOBAL	_CLOS
	GLOBAL	_NIL
	GLOBAL	_cell
	GLOBAL	_nil
	GLOBAL	_tru
	GLOBAL	_err
	GLOBAL	_env
	GLOBAL	_box
	GLOBAL	_ord
	GLOBAL	_num
	GLOBAL	_equ
	GLOBAL	_atom
	GLOBAL	_cons
	GLOBAL	_car
	GLOBAL	_cdr
	GLOBAL	_pair
	GLOBAL	_closure
	GLOBAL	_assoc
	GLOBAL	_not
	GLOBAL	_let
	GLOBAL	_eval
	GLOBAL	_evlis
	GLOBAL	_f_eval
	GLOBAL	_f_quote
	GLOBAL	_f_cons
	GLOBAL	_f_car
	GLOBAL	_f_cdr
	GLOBAL	_f_add
	GLOBAL	_f_sub
	GLOBAL	_f_mul
	GLOBAL	_f_div
	GLOBAL	_f_int
	GLOBAL	_f_lt
	GLOBAL	_f_eq
	GLOBAL	_f_not
	GLOBAL	_f_or
	GLOBAL	_f_and
	GLOBAL	_f_cond
	GLOBAL	_f_if
	GLOBAL	_f_leta
	GLOBAL	_f_lambda
	GLOBAL	_f_define
	GLOBAL	_prim
	GLOBAL	_bind
	GLOBAL	_reduce
	GLOBAL	_apply
	GLOBAL	_buf
	GLOBAL	_see
	GLOBAL	_look
	GLOBAL	_seeing
	GLOBAL	_get
	GLOBAL	_scan
	GLOBAL	_parse
	GLOBAL	_Read
	GLOBAL	_list
	GLOBAL	_quote
	GLOBAL	_atomic
	GLOBAL	_print
	GLOBAL	_printlist
	GLOBAL	_gc
	GLOBAL	_main


; --- End of Scope Defns ---


; --- End of Compilation ---
