;* * * * *  Small-C/Plus z88dk * * * * *
;  Version: 22110-51889e5300-20231220
;
;	Reconstructed for z80 Module Assembler
;
;	Module compile time: Thu Apr 17 10:20:43 2025


	C_LINE	0,"kl.c"

	MODULE	kl_c


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
	C_LINE	9,"kl.c"
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
	C_LINE	10,"kl.c"
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
	C_LINE	11,"kl.c"
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
	C_LINE	12,"kl.c"
	C_LINE	0,"../../../z88dk/bin/..//include/setjmp.h"
	C_LINE	20,"../../../z88dk/bin/..//include/setjmp.h"
	C_LINE	30,"../../../z88dk/bin/..//include/setjmp.h"
	C_LINE	31,"../../../z88dk/bin/..//include/setjmp.h"
	C_LINE	13,"kl.c"
	C_LINE	0,"../../../z88dk/bin/..//include/unistd.h"
	C_LINE	11,"../../../z88dk/bin/..//include/unistd.h"
	C_LINE	18,"../../../z88dk/bin/..//include/unistd.h"
	C_LINE	21,"../../../z88dk/bin/..//include/unistd.h"
	C_LINE	26,"kl.c"
	C_LINE	68,"kl.c"
	C_LINE	70,"kl.c"
	C_LINE	73,"kl.c"
	C_LINE	75,"kl.c"
	C_LINE	77,"kl.c"
	C_LINE	79,"kl.c"
	C_LINE	81,"kl.c"
	C_LINE	82,"kl.c"
	C_LINE	83,"kl.c"
	C_LINE	85,"kl.c"
	C_LINE	86,"kl.c"
	C_LINE	88,"kl.c"
	C_LINE	89,"kl.c"
	C_LINE	91,"kl.c"
	C_LINE	92,"kl.c"
	C_LINE	94,"kl.c"
	C_LINE	95,"kl.c"
	C_LINE	97,"kl.c"
	C_LINE	99,"kl.c"
	C_LINE	101,"kl.c"
	C_LINE	105,"kl.c"
	SECTION	code_compiler

; Function car flags 0x00000200 __smallc 
; int car(int x)
; parameter 'int x' at sp+2 size(2)
	C_LINE	105,"kl.c::car::0::0"
._car
	ld	hl,_Car
	push	hl
	call	l_gint4sp	;
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	ret


	C_LINE	106,"kl.c::car::0::1"

; Function cdr flags 0x00000200 __smallc 
; int cdr(int x)
; parameter 'int x' at sp+2 size(2)
	C_LINE	106,"kl.c::cdr::0::1"
._cdr
	ld	hl,_Cdr
	push	hl
	call	l_gint4sp	;
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	ret


	C_LINE	108,"kl.c::cdr::0::2"

; Function setcar flags 0x00000200 __smallc 
; void setcar(int x, int v)
; parameter 'int v' at sp+2 size(2)
; parameter 'int x' at sp+4 size(2)
	C_LINE	108,"kl.c::setcar::0::2"
._setcar
	ld	hl,_Car
	push	hl
	call	l_gint6sp	;
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	call	l_gint4sp	;
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
	ret


	C_LINE	109,"kl.c::setcar::0::3"

; Function setcdr flags 0x00000200 __smallc 
; void setcdr(int x, int v)
; parameter 'int v' at sp+2 size(2)
; parameter 'int x' at sp+4 size(2)
	C_LINE	109,"kl.c::setcdr::0::3"
._setcdr
	ld	hl,_Cdr
	push	hl
	call	l_gint6sp	;
	add	hl,hl
	pop	de
	add	hl,de
	push	hl
	call	l_gint4sp	;
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
	ret


	C_LINE	111,"kl.c::setcdr::0::4"

; Function atomp flags 0x00000200 __smallc 
; int atomp(int n)
; parameter 'int n' at sp+2 size(2)
	C_LINE	111,"kl.c::atomp::0::4"
._atomp
	pop	bc
	pop	de
	push	de
	push	bc
	ld	hl,8192
	call	l_ge
	jp	c,i_2	;
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_car
	pop	bc
	ld	a,l
	sub	0
	ld	a,h
	rla
	ccf
	rra
	sbc	160
	jp	nc,i_3	;
	ld	hl,_Tag
	push	hl
	call	l_gint4sp	;
	push	hl
	call	_car
	pop	bc
	pop	de
	add	hl,de
	ld	a,1
	and	(hl)
	jp	z,i_3	;
	ld	hl,1	;const
	jr	i_4
.i_3
	ld	hl,0	;const
.i_4
	ld	a,h
	or	l
	jp	nz,i_2	;
	jr	i_5
.i_2
	ld	hl,1	;const
.i_5
	ret


	C_LINE	115,"kl.c::atomp::0::5"

; Function symbolp flags 0x00000200 __smallc 
; int symbolp(int n)
; parameter 'int n' at sp+2 size(2)
	C_LINE	115,"kl.c::symbolp::0::5"
._symbolp
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	a,l
	sub	0
	ld	a,h
	rla
	ccf
	rra
	sbc	160
	jp	nc,i_6	;
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_car
	pop	bc
	ld	a,l
	sub	0
	ld	a,h
	rla
	ccf
	rra
	sbc	160
	jp	nc,i_6	;
	ld	hl,_Tag
	push	hl
	call	l_gint4sp	;
	push	hl
	call	_car
	pop	bc
	pop	de
	add	hl,de
	ld	a,1
	and	(hl)
	jp	z,i_6	;
	ld	hl,1	;const
	jr	i_7
.i_6
	ld	hl,0	;const
.i_7
	ret


	C_LINE	119,"kl.c::symbolp::0::6"

; Function caar flags 0x00000200 __smallc 
; int caar(int x)
; parameter 'int x' at sp+2 size(2)
	C_LINE	119,"kl.c::caar::0::6"
._caar
	ld	hl,_Car
	push	hl
	push	hl
	call	l_gint6sp	;
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	ret


	C_LINE	120,"kl.c::caar::0::7"

; Function cadr flags 0x00000200 __smallc 
; int cadr(int x)
; parameter 'int x' at sp+2 size(2)
	C_LINE	120,"kl.c::cadr::0::7"
._cadr
	ld	hl,_Car
	push	hl
	ld	hl,_Cdr
	push	hl
	call	l_gint6sp	;
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	ret


	C_LINE	121,"kl.c::cadr::0::8"

; Function cdar flags 0x00000200 __smallc 
; int cdar(int x)
; parameter 'int x' at sp+2 size(2)
	C_LINE	121,"kl.c::cdar::0::8"
._cdar
	ld	hl,_Cdr
	push	hl
	ld	hl,_Car
	push	hl
	call	l_gint6sp	;
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	ret


	C_LINE	122,"kl.c::cdar::0::9"

; Function cddr flags 0x00000200 __smallc 
; int cddr(int x)
; parameter 'int x' at sp+2 size(2)
	C_LINE	122,"kl.c::cddr::0::9"
._cddr
	ld	hl,_Cdr
	push	hl
	push	hl
	call	l_gint6sp	;
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	ret


	C_LINE	124,"kl.c::cddr::0::10"

; Function caadr flags 0x00000200 __smallc 
; int caadr(int x)
; parameter 'int x' at sp+2 size(2)
	C_LINE	124,"kl.c::caadr::0::10"
._caadr
	ld	hl,_Car
	push	hl
	push	hl
	ld	hl,_Cdr
	push	hl
	call	l_gint8sp	;
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	ret


	C_LINE	125,"kl.c::caadr::0::11"

; Function cadar flags 0x00000200 __smallc 
; int cadar(int x)
; parameter 'int x' at sp+2 size(2)
	C_LINE	125,"kl.c::cadar::0::11"
._cadar
	ld	hl,_Car
	push	hl
	ld	de,_Cdr
	push	de
	push	hl
	call	l_gint8sp	;
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	ret


	C_LINE	126,"kl.c::cadar::0::12"

; Function caddr flags 0x00000200 __smallc 
; int caddr(int x)
; parameter 'int x' at sp+2 size(2)
	C_LINE	126,"kl.c::caddr::0::12"
._caddr
	ld	hl,_Car
	push	hl
	ld	hl,_Cdr
	push	hl
	push	hl
	call	l_gint8sp	;
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	ret


	C_LINE	127,"kl.c::caddr::0::13"

; Function cdadr flags 0x00000200 __smallc 
; int cdadr(int x)
; parameter 'int x' at sp+2 size(2)
	C_LINE	127,"kl.c::cdadr::0::13"
._cdadr
	ld	hl,_Cdr
	push	hl
	ld	de,_Car
	push	de
	push	hl
	call	l_gint8sp	;
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	ret


	C_LINE	128,"kl.c::cdadr::0::14"

; Function cddar flags 0x00000200 __smallc 
; int cddar(int x)
; parameter 'int x' at sp+2 size(2)
	C_LINE	128,"kl.c::cddar::0::14"
._cddar
	ld	hl,_Cdr
	push	hl
	push	hl
	ld	hl,_Car
	push	hl
	call	l_gint8sp	;
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	ret


	C_LINE	130,"kl.c::cddar::0::15"

; Function caddar flags 0x00000200 __smallc 
; int caddar(int x)
; parameter 'int x' at sp+2 size(2)
	C_LINE	130,"kl.c::caddar::0::15"
._caddar
	ld	hl,_Car
	push	hl
	ld	hl,_Cdr
	push	hl
	push	hl
	ld	hl,_Car
	push	hl
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	ret


	C_LINE	131,"kl.c::caddar::0::16"

; Function cdddar flags 0x00000200 __smallc 
; int cdddar(int x)
; parameter 'int x' at sp+2 size(2)
	C_LINE	131,"kl.c::cdddar::0::16"
._cdddar
	ld	hl,_Cdr
	push	hl
	ld	de,_Cdr
	push	de
	push	hl
	ld	hl,_Car
	push	hl
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	add	hl,hl
	pop	de
	add	hl,de
	ld	hl,(hl)
	ret


	C_LINE	133,"kl.c::cdddar::0::17"

; Function pr flags 0x00000200 __smallc 
; void pr(char * s)
; parameter 'char * s' at sp+2 size(2)
	C_LINE	133,"kl.c::pr::0::17"
._pr
	push	bc
	push	bc
	call	l_gint6sp	;
	call	strlen_fastcall
	pop	de
	pop	bc
	push	hl
	push	de
.i_8
	ld	hl,(_Outp)
	push	hl
	call	l_gint4sp	;
	pop	de
	add	hl,de
	ld	de,128
	ex	de,hl
	call	l_ge
	jp	nc,i_9	;
	ld	hl,(_Outp)
	ld	de,0
	ex	de,hl
	call	l_gt
	jp	nc,i_10	;
	ld	hl,(_Outp)
	ld	de,128
	ex	de,hl
	and	a
	sbc	hl,de
	pop	bc
	push	hl
	ld	de,_Outbuf
	ld	hl,(_Outp)
	add	hl,de
	push	hl
	ld	hl,8	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	l_gint4sp	;
	push	hl
	call	memcpy_callee
	ld	hl,(_Output)
	push	hl
	ld	hl,_Outbuf
	push	hl
	ld	hl,128	;const
	push	hl
	call	write
	pop	bc
	pop	bc
	pop	bc
	ld	hl,2	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	pop	bc
	pop	hl
	push	hl
	push	bc
	pop	de
	ex	de,hl
	and	a
	sbc	hl,de
	pop	de
	pop	bc
	push	hl
	push	de
	ld	hl,6	;const
	add	hl,sp
	push	hl
	ld	de,(hl)
	inc	hl
	push	de
	call	l_gint4sp	;
	pop	de
	add	hl,de
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
	ld	hl,0	;const
	ld	(_Outp),hl
	jp	i_11	;EOS
.i_10
	ld	hl,(_Output)
	push	hl
	ld	hl,8	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,128	;const
	push	hl
	call	write
	pop	bc
	pop	bc
	pop	bc
	pop	de
	pop	hl
	ld	bc,-128
	add	hl,bc
	push	hl
	push	de
	ld	hl,6	;const
	add	hl,sp
	push	hl
	ld	bc,(hl)
	inc	hl
	ld	hl,128
	add	hl,bc
	pop	de
	ex	de,hl
	ld	(hl),de
	jp	i_8	;EOS
.i_9
	ld	de,_Outbuf
	ld	hl,(_Outp)
	add	hl,de
	push	hl
	ld	hl,8	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	memcpy_callee
	ld	hl,(_Outp)
	push	hl
	call	l_gint4sp	;
	pop	de
	add	hl,de
	ld	(_Outp),hl
	pop	bc
	pop	bc
	ret


	C_LINE	156,"kl.c::pr::0::21"

; Function flush flags 0x00000200 __smallc 
; void flush()
	C_LINE	156,"kl.c::flush::0::21"
._flush
	ld	hl,(_Output)
	push	hl
	ld	hl,_Outbuf
	push	hl
	ld	hl,(_Outp)
	push	hl
	call	write
	pop	bc
	pop	bc
	pop	bc
	ld	hl,0	;const
	ld	(_Outp),hl
	ret


	C_LINE	161,"kl.c::flush::0::22"

; Function nl flags 0x00000200 __smallc 
; void nl()
	C_LINE	161,"kl.c::nl::0::22"
._nl
	ld	hl,i_1+0
	push	hl
	call	_pr
	pop	bc
	call	_flush
	ret


	C_LINE	163,"kl.c::nl::0::23"

; Function ntoa flags 0x00000200 __smallc 
; char * ntoa(int n)
; parameter 'int n' at sp+2 size(2)
	C_LINE	163,"kl.c::ntoa::0::23"
._ntoa
	ld	hl,_st_ntoa_buf+19
	push	hl
	push	hl
	ld	(hl),0
.i_12
	call	l_gint6sp	;
	ld	a,h
	or	l
	jp	nz,i_14	;
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	l_gint4sp	;
	pop	de
	call	l_eq
	jp	nc,i_13	;
.i_14
	pop	hl
	dec	hl
	push	hl
	push	hl
	call	l_gint8sp	;
	ld	de,10
	ex	de,hl
	call	l_div
	ex	de,hl
	ld	bc,48
	add	hl,bc
	ld	a,l
	pop	de
	ld	(de),a
	ld	hl,6	;const
	add	hl,sp
	push	hl
	ld	de,(hl)
	inc	hl
	ld	hl,10
	call	l_div
	pop	de
	ex	de,hl
	ld	(hl),de
	jp	i_12	;EOS
.i_13
	pop	hl
	pop	bc
	ret


	C_LINE	177,"kl.c::ntoa::0::25"

; Function prnum flags 0x00000200 __smallc 
; void prnum(int n)
; parameter 'int n' at sp+2 size(2)
	C_LINE	177,"kl.c::prnum::0::25"
._prnum
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_ntoa
	pop	bc
	push	hl
	call	_pr
	pop	bc
	ret


	C_LINE	179,"kl.c::prnum::0::26"
	C_LINE	181,"kl.c::prnum::0::26"

; Function error flags 0x00000200 __smallc 
; void error(char * m, int n)
; parameter 'int n' at sp+2 size(2)
; parameter 'char * m' at sp+4 size(2)
	C_LINE	181,"kl.c::error::0::26"
._error
	ld	hl,i_1+2
	push	hl
	call	_pr
	pop	bc
	call	l_gint4sp	;
	push	hl
	call	_pr
	pop	bc
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	de,8193
	and	a
	sbc	hl,de
	scf
	jr	nz,ASMPC+3
	ccf
	jp	nc,i_16	;
	ld	hl,i_1+5
	push	hl
	call	_pr
	pop	bc
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_print
	pop	bc
.i_16
	call	_nl
	ld	hl,0	;const
	ld	(_Input),hl
	ld	hl,_Buffer
	ld	(_Inbuf),hl
	ld	hl,0	;const
	ld	(_Ink),hl
	ld	(_Inp),hl
	ld	hl,8196	;const
	ld	(_Rejected),hl
	ld	hl,_Restart
	push	hl
	ld	hl,1	;const
	push	hl
	call	l_longjmp
	pop	bc
	pop	bc
	ret


	C_LINE	196,"kl.c::error::0::28"

; Function fatal flags 0x00000200 __smallc 
; void fatal(char * m)
; parameter 'char * m' at sp+2 size(2)
	C_LINE	196,"kl.c::fatal::0::28"
._fatal
	ld	hl,2	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_error
	pop	bc
	ld	hl,i_1+8
	ex	(sp),hl
	call	_pr
	pop	bc
	call	_nl
	ld	hl,1	;const
	call	exit_fastcall
	ret


	C_LINE	205,"kl.c::fatal::0::29"

; Function mark flags 0x00000200 __smallc 
; void mark(int n)
; parameter 'int n' at sp+2 size(2)
	C_LINE	205,"kl.c::mark::0::29"
._mark
	ld	hl,8197	;const
	push	hl
	push	bc
.i_17
	call	l_gint6sp	;
	ld	de,8192
	ex	de,hl
	call	l_ge
	jp	c,i_21	;
	ld	hl,_Tag
	push	hl
	call	l_gint8sp	;
	pop	de
	add	hl,de
	ld	a,2
	and	(hl)
	jp	z,i_20	;
.i_21
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	de,8197
	call	l_eq
	jp	c,i_18	;EOS
.i_23
	ld	hl,_Tag
	push	hl
	call	l_gint4sp	;
	pop	de
	add	hl,de
	ld	a,4
	and	(hl)
	jp	z,i_24	;
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_cdr
	pop	bc
	pop	bc
	pop	de
	push	de
	push	hl
	ex	de,hl
	push	hl
	push	hl
	call	_car
	pop	bc
	push	hl
	call	_setcdr
	pop	bc
	pop	bc
	ld	hl,2	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	l_gint8sp	;
	push	hl
	call	_setcar
	pop	bc
	pop	bc
	ld	hl,_Tag
	push	hl
	call	l_gint4sp	;
	pop	de
	add	hl,de
	push	hl
	ld	a,(hl)
	and	251
	ld	l,a
	pop	de
	ld	(de),a
	ld	hl,6	;const
	add	hl,sp
	pop	de
	push	de
	ld	(hl),de
	jp	i_25	;EOS
.i_24
	pop	bc
	pop	hl
	push	hl
	push	hl
	push	hl
	call	_cdr
	pop	bc
	pop	de
	pop	bc
	push	hl
	push	de
	ld	hl,0	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	l_gint8sp	;
	push	hl
	call	_setcdr
	pop	bc
	pop	bc
	ld	hl,6	;const
	add	hl,sp
	pop	de
	push	de
	ld	(hl),de
	jp	i_26	;EOS
.i_20
	ld	hl,_Tag
	push	hl
	call	l_gint8sp	;
	pop	de
	add	hl,de
	ld	a,1
	and	(hl)
	jp	z,i_27	;
	call	l_gint6sp	;
	push	hl
	call	_cdr
	pop	bc
	pop	bc
	push	hl
	ld	hl,6	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	l_gint4sp	;
	push	hl
	call	_setcdr
	pop	bc
	pop	bc
	call	l_gint6sp	;
	pop	de
	pop	bc
	push	hl
	push	de
	ld	hl,6	;const
	add	hl,sp
	pop	de
	push	de
	ld	(hl),de
	ex	de,hl
	ld	hl,_Tag
	push	hl
	call	l_gint4sp	;
	pop	de
	add	hl,de
	ld	a,(hl)
	or	2
	ld	(hl),a
	jp	i_28	;EOS
.i_27
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	pop	bc
	push	hl
	ld	hl,6	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	l_gint4sp	;
	push	hl
	call	_setcar
	pop	bc
	pop	bc
	ld	hl,_Tag
	push	hl
	call	l_gint8sp	;
	pop	de
	add	hl,de
	ld	a,(hl)
	or	2
	ld	(hl),a
	call	l_gint6sp	;
	pop	de
	pop	bc
	push	hl
	push	de
	ld	hl,6	;const
	add	hl,sp
	pop	de
	push	de
	ld	(hl),de
	ex	de,hl
	ld	hl,_Tag
	push	hl
	call	l_gint4sp	;
	pop	de
	add	hl,de
	ld	a,(hl)
	or	4
	ld	(hl),a
	jp	i_17	;EOS
.i_18
	pop	bc
	pop	bc
	ret


	C_LINE	244,"kl.c::mark::0::36"

; Function gc flags 0x00000200 __smallc 
; int gc(int v)
; parameter 'int v' at sp+2 size(2)
	C_LINE	244,"kl.c::gc::0::36"
._gc
	push	bc
	ld	hl,0	;const
	push	hl
	ld	hl,(_Acc)
	push	hl
	call	_mark
	ld	hl,(_Env)
	ex	(sp),hl
	call	_mark
	ld	hl,(_Symbols)
	ex	(sp),hl
	call	_mark
	ld	hl,(_Stack)
	ex	(sp),hl
	call	_mark
	ld	hl,(_Mstack)
	ex	(sp),hl
	call	_mark
	ld	hl,(_Tmpcar)
	ex	(sp),hl
	call	_mark
	ld	hl,(_Tmpcdr)
	ex	(sp),hl
	call	_mark
	ld	hl,(_Tmp)
	ex	(sp),hl
	call	_mark
	pop	bc
	ld	hl,8197	;const
	ld	(_Freelist),hl
	ld	hl,0	;const
	pop	de
	pop	bc
	push	hl
	push	de
	jp	i_31	;EOS
.i_29
	pop	de
	pop	hl
	inc	hl
	push	hl
	push	de
.i_31
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	a,l
	sub	0
	ld	a,h
	rla
	ccf
	rra
	sbc	160
	jp	nc,i_30	;
	ld	hl,_Tag
	push	hl
	call	l_gint4sp	;
	pop	de
	add	hl,de
	ld	a,(hl)
	and	2
	ld	l,a
	ld	h,0
	ld	de,0
	call	l_eq
	jp	nc,i_32	;
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	hl,(_Freelist)
	push	hl
	call	_setcdr
	pop	bc
	pop	bc
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	(_Freelist),hl
	pop	hl
	inc	hl
	push	hl
	jp	i_33	;EOS
.i_32
	ld	hl,_Tag
	push	hl
	call	l_gint4sp	;
	pop	de
	add	hl,de
	push	hl
	ld	a,(hl)
	and	253
	ld	l,a
	ld	h,0
	pop	de
	ld	a,l
	ld	(de),a
	jp	i_29	;EOS
.i_30
	call	l_gint6sp	;
	ld	a,h
	or	l
	jp	nz,i_35	;
	ld	hl,(_Verbose_GC)
	ld	a,h
	or	l
	jr	z,i_36
.i_35
	ld	hl,1	;const
.i_36
	ld	a,h
	or	l
	jp	z,i_34	;
	pop	hl
	push	hl
	push	hl
	call	_prnum
	ld	hl,i_1+19
	ex	(sp),hl
	call	_pr
	pop	bc
	call	_nl
.i_34
	pop	hl
	pop	bc
	ret


	C_LINE	275,"kl.c::gc::0::41"

; Function cons3 flags 0x00000200 __smallc 
; int cons3(int a, int d, int t)
; parameter 'int t' at sp+2 size(2)
; parameter 'int d' at sp+4 size(2)
; parameter 'int a' at sp+6 size(2)
	C_LINE	275,"kl.c::cons3::0::41"
._cons3
	push	bc
	ld	hl,(_Freelist)
	ld	de,8197
	call	l_eq
	jp	nc,i_37	;
	call	l_gint6sp	;
	ld	(_Tmpcdr),hl
	call	l_gint4sp	;
	ld	de,0
	call	l_eq
	jp	nc,i_38	;
	call	l_gint8sp	;
	ld	(_Tmpcar),hl
.i_38
	ld	hl,0	;const
	push	hl
	call	_gc
	pop	bc
	ld	hl,8197	;const
	ld	(_Tmpcdr),hl
	ld	(_Tmpcar),hl
	ld	hl,(_Freelist)
	ld	de,8197
	call	l_eq
	jp	nc,i_39	;
	ld	hl,i_1+36
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_error
	pop	bc
	pop	bc
.i_37
	ld	hl,(_Freelist)
	pop	bc
	push	hl
	ld	hl,(_Freelist)
	push	hl
	call	_cdr
	pop	bc
	ld	(_Freelist),hl
	ld	hl,0	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_setcar
	pop	bc
	pop	bc
	ld	hl,0	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	l_gint8sp	;
	push	hl
	call	_setcdr
	pop	bc
	pop	bc
	pop	hl
	push	hl
	ld	bc,_Tag
	push	bc
	pop	de
	add	hl,de
	push	hl
	call	l_gint6sp	;
	pop	de
	ld	a,l
	ld	(de),a
	pop	hl
	ret


	C_LINE	293,"kl.c::cons3::0::43"

; Function cons flags 0x00000200 __smallc 
; int cons(int a, int d)
; parameter 'int d' at sp+2 size(2)
; parameter 'int a' at sp+4 size(2)
	C_LINE	293,"kl.c::cons::0::43"
._cons
	ld	hl,4	;const
	call	l_g2intspsp	;
	ld	hl,0	;const
	push	hl
	call	_cons3
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	295,"kl.c::cons::0::44"

; Function nrev flags 0x00000200 __smallc 
; int nrev(int n)
; parameter 'int n' at sp+2 size(2)
	C_LINE	295,"kl.c::nrev::0::44"
._nrev
	ld	hl,8197	;const
	push	hl
	push	bc
.i_40
	call	l_gint6sp	;
	ld	de,8197
	and	a
	sbc	hl,de
	scf
	jr	nz,ASMPC+3
	ccf
	jp	nc,i_41	;
	call	l_gint6sp	;
	push	hl
	call	_cdr
	pop	bc
	pop	bc
	push	hl
	ld	hl,6	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	l_gint4sp	;
	push	hl
	call	_setcdr
	pop	bc
	pop	bc
	call	l_gint6sp	;
	pop	de
	pop	bc
	push	hl
	push	de
	ld	hl,6	;const
	add	hl,sp
	pop	de
	push	de
	ld	(hl),de
	jp	i_40	;EOS
.i_41
	pop	bc
	pop	hl
	ret


	C_LINE	308,"kl.c::nrev::0::46"

; Function save flags 0x00000200 __smallc 
; void save(int n)
; parameter 'int n' at sp+2 size(2)
	C_LINE	308,"kl.c::save::0::46"
._save
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	hl,(_Stack)
	push	hl
	call	_cons
	pop	bc
	pop	bc
	ld	(_Stack),hl
	ret


	C_LINE	310,"kl.c::save::0::47"

; Function unsave flags 0x00000200 __smallc 
; int unsave(int k)
; parameter 'int k' at sp+2 size(2)
	C_LINE	310,"kl.c::unsave::0::47"
._unsave
	push	bc
.i_42
	call	l_gint4sp	;
	ld	a,h
	or	l
	jp	z,i_43	;
	ld	hl,(_Stack)
	ld	de,8197
	call	l_eq
	jp	nc,i_44	;
	ld	hl,i_1+49
	push	hl
	call	_fatal
	pop	bc
.i_44
	ld	hl,(_Stack)
	push	hl
	call	_car
	pop	bc
	pop	bc
	push	hl
	ld	hl,(_Stack)
	push	hl
	call	_cdr
	pop	bc
	ld	(_Stack),hl
	ld	hl,4	;const
	add	hl,sp
	dec	(hl)
	ld	a,(hl)
	inc	hl
	cp	255
	jr	nz,ASMPC+3
	dec	(hl)
	jp	i_42	;EOS
.i_43
	pop	hl
	ret


	C_LINE	322,"kl.c::unsave::0::49"

; Function msave flags 0x00000200 __smallc 
; void msave(int n)
; parameter 'int n' at sp+2 size(2)
	C_LINE	322,"kl.c::msave::0::49"
._msave
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	hl,(_Mstack)
	push	hl
	ld	hl,1	;const
	push	hl
	call	_cons3
	pop	bc
	pop	bc
	pop	bc
	ld	(_Mstack),hl
	ret


	C_LINE	324,"kl.c::msave::0::50"

; Function munsave flags 0x00000200 __smallc 
; int munsave()
	C_LINE	324,"kl.c::munsave::0::50"
._munsave
	push	bc
	ld	hl,(_Mstack)
	ld	de,8197
	call	l_eq
	jp	nc,i_45	;
	ld	hl,i_1+61
	push	hl
	call	_fatal
	pop	bc
.i_45
	ld	hl,(_Mstack)
	push	hl
	call	_car
	pop	bc
	pop	bc
	push	hl
	ld	hl,(_Mstack)
	push	hl
	call	_cdr
	pop	bc
	ld	(_Mstack),hl
	pop	hl
	ret


	C_LINE	333,"kl.c::munsave::0::51"

; Function strsym flags 0x00000200 __smallc 
; int strsym(char * s)
; parameter 'char * s' at sp+2 size(2)
	C_LINE	333,"kl.c::strsym::0::51"
._strsym
	ld	hl,0	;const
	push	hl
	push	bc
	ld	hl,6	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	l_gint4sp	;
	pop	de
	add	hl,de
	call	l_gchar
	ld	de,0
	call	l_eq
	jp	nc,i_46	;
	ld	hl,8197	;const
	pop	bc
	pop	bc
	ret


.i_46
	ld	hl,8197	;const
	push	hl
	push	hl
	ld	hl,1	;const
	push	hl
	call	_cons3
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	push	hl
	push	hl
	call	_save
	pop	bc
.i_47
	ld	hl,0	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,8	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	l_gint6sp	;
	pop	de
	add	hl,de
	call	l_gchar
	ld	h,l
	ld	l,0
	push	hl
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	l_gint8sp	;
	inc	hl
	pop	de
	add	hl,de
	call	l_gchar
	pop	de
	call	l_or
	push	hl
	call	_setcar
	pop	bc
	pop	bc
	ld	hl,6	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	l_gint4sp	;
	inc	hl
	pop	de
	add	hl,de
	call	l_gchar
	ld	de,0
	call	l_eq
	jp	c,i_51	;
	ld	hl,6	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	l_gint4sp	;
	inc	hl
	inc	hl
	pop	de
	add	hl,de
	call	l_gchar
	ld	de,0
	call	l_eq
	jp	c,i_48	;EOS
.i_50
	ld	hl,0	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,8197	;const
	push	hl
	push	hl
	ld	hl,1	;const
	push	hl
	call	_cons3
	pop	bc
	pop	bc
	pop	bc
	push	hl
	call	_setcdr
	pop	bc
	pop	bc
	pop	hl
	push	hl
	push	hl
	call	_cdr
	pop	bc
	pop	bc
	pop	de
	push	de
	push	hl
	ex	de,hl
	inc	hl
	inc	hl
	pop	de
	pop	bc
	push	hl
	push	de
	jp	i_47	;EOS
.i_48
	ld	hl,1	;const
	push	hl
	call	_unsave
	pop	bc
	pop	bc
	push	hl
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_cons
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	350,"kl.c::strsym::0::53"

; Function symstr flags 0x00000200 __smallc 
; char * symstr(int n)
; parameter 'int n' at sp+2 size(2)
	C_LINE	350,"kl.c::symstr::0::53"
._symstr
	ld	hl,0	;const
	push	hl
	ld	l,4
	add	hl,sp
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
.i_53
	call	l_gint4sp	;
	ld	de,8197
	and	a
	sbc	hl,de
	scf
	jr	nz,ASMPC+3
	ccf
	jp	nc,i_54	;
	pop	hl
	push	hl
	ld	bc,_st_symstr_b
	push	bc
	pop	de
	add	hl,de
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	ld	l,h
	ld	a,h
	rlca
	sbc	a
	ld	h,a
	ld	a,l
	pop	de
	ld	(de),a
	pop	hl
	push	hl
	ld	bc,_st_symstr_b
	push	bc
	inc	hl
	pop	de
	add	hl,de
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	ld	h,0
	ld	a,l
	pop	de
	ld	(de),a
	pop	hl
	push	hl
	inc	hl
	inc	hl
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
	jp	i_53	;EOS
.i_54
	pop	hl
	push	hl
	ld	bc,_st_symstr_b
	push	bc
	pop	de
	add	hl,de
	ld	d,h
	ld	e,l
	xor	a
	ld	(de),a
	ld	hl,_st_symstr_b
	pop	bc
	ret


	C_LINE	366,"kl.c::symstr::0::55"

; Function findsym flags 0x00000200 __smallc 
; int findsym(char * s)
; parameter 'char * s' at sp+2 size(2)
	C_LINE	366,"kl.c::findsym::0::55"
._findsym
	ld	hl,(_Symbols)
	push	hl
.i_55
	pop	hl
	push	hl
	ld	de,8197
	and	a
	sbc	hl,de
	scf
	jr	nz,ASMPC+3
	ccf
	jp	nc,i_56	;
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
	push	hl
	call	_symstr
	pop	bc
	push	hl
	call	strcmp_callee
	ld	a,h
	or	l
	jr	nz,ASMPC+3
	scf
	jp	nc,i_57	;
	pop	hl
	push	hl
	push	hl
	call	_car
	pop	bc
	pop	bc
	ret


.i_57
	pop	hl
	push	hl
	push	hl
	call	_cdr
	pop	bc
	pop	bc
	push	hl
	jp	i_55	;EOS
.i_56
	ld	hl,8197	;const
	pop	bc
	ret


	C_LINE	378,"kl.c::findsym::0::57"

; Function addsym flags 0x00000200 __smallc 
; int addsym(char * s, int v)
; parameter 'int v' at sp+2 size(2)
; parameter 'char * s' at sp+4 size(2)
	C_LINE	378,"kl.c::addsym::0::57"
._addsym
	push	bc
	call	l_gint6sp	;
	push	hl
	call	_findsym
	pop	bc
	pop	bc
	push	hl
	ld	de,8197
	and	a
	sbc	hl,de
	scf
	jr	nz,ASMPC+3
	ccf
	jp	nc,i_58	;
	pop	hl
	ret


.i_58
	call	l_gint6sp	;
	push	hl
	call	_strsym
	pop	bc
	pop	bc
	push	hl
	push	hl
	call	_save
	pop	bc
	call	l_gint4sp	;
	ld	de,8192
	call	l_eq
	jp	nc,i_59	;
	ld	hl,0	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,2	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,8197	;const
	push	hl
	call	_cons
	pop	bc
	pop	bc
	push	hl
	call	_setcdr
	pop	bc
	pop	bc
	jp	i_60	;EOS
.i_59
	ld	hl,0	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,6	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,8197	;const
	push	hl
	call	_cons
	pop	bc
	pop	bc
	push	hl
	call	_setcdr
	pop	bc
	pop	bc
.i_60
	pop	hl
	push	hl
	push	hl
	ld	hl,(_Symbols)
	push	hl
	call	_cons
	pop	bc
	pop	bc
	ld	(_Symbols),hl
	ld	hl,1	;const
	push	hl
	call	_unsave
	pop	bc
	pop	hl
	ret


	C_LINE	394,"kl.c::addsym::0::58"

; Function rdch flags 0x00000200 __smallc 
; int rdch()
	C_LINE	394,"kl.c::rdch::0::58"
._rdch
	push	bc
	ld	hl,(_Rejected)
	ld	de,8196
	and	a
	sbc	hl,de
	scf
	jr	nz,ASMPC+3
	ccf
	jp	nc,i_61	;
	ld	hl,(_Rejected)
	pop	bc
	push	hl
	ld	hl,8196	;const
	ld	(_Rejected),hl
	pop	hl
	ret


.i_61
	ld	de,(_Inp)
	ld	hl,(_Ink)
	call	l_ge
	jp	nc,i_62	;
	ld	hl,(_Input)
	push	hl
	ld	hl,(_Inbuf)
	push	hl
	ld	hl,128	;const
	push	hl
	call	read
	pop	bc
	pop	bc
	pop	bc
	ld	(_Ink),hl
	ld	a,l
	sub	1
	ld	a,h
	rla
	ccf
	rra
	sbc	128
	jp	nc,i_63	;
	ld	hl,8196	;const
	pop	bc
	ret


.i_63
	ld	hl,0	;const
	ld	(_Inp),hl
.i_62
	ld	hl,(_Inbuf)
	push	hl
	ld	hl,(_Inp)
	inc	hl
	ld	(_Inp),hl
	dec	hl
	pop	de
	add	hl,de
	call	l_gchar
	pop	bc
	ret


	C_LINE	410,"kl.c::rdch::0::61"

; Function rdchci flags 0x00000200 __smallc 
; int rdchci()
	C_LINE	410,"kl.c::rdchci::0::61"
._rdchci
	push	bc
	call	_rdch
	pop	bc
	push	hl
	ld	de,8192
	ex	de,hl
	call	l_ge
	jp	nc,i_64	;
	pop	hl
	ret


.i_64
	pop	hl
	push	hl
	call	_tolower_fastcall
	pop	bc
	ret


	C_LINE	418,"kl.c::rdchci::0::62"
	C_LINE	420,"kl.c::rdchci::0::62"

; Function rdlist flags 0x00000200 __smallc 
; int rdlist()
	C_LINE	420,"kl.c::rdlist::0::62"
._rdlist
	push	bc
	push	bc
	push	bc
	push	bc
	ld	hl,i_1+74
	push	hl
	ld	hl,(_Parens)
	inc	hl
	ld	(_Parens),hl
	ld	hl,6	;const
	add	hl,sp
	push	hl
	ld	hl,8197	;const
	push	hl
	push	hl
	call	_cons
	pop	bc
	pop	bc
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
	call	l_gint6sp	;
	push	hl
	call	_save
	pop	bc
	ld	hl,4	;const
	add	hl,sp
	ld	(hl),5
	inc	hl
	ld	(hl),32
	ld	hl,0	;const
	pop	de
	pop	bc
	push	hl
	push	de
.i_65
	ld	hl,(_Error)
	ld	a,h
	or	l
	jp	z,i_68	;
	ld	hl,8197	;const
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret


.i_68
	ld	hl,8	;const
	add	hl,sp
	push	hl
	call	_xread
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
	call	l_gint8sp	;
	ld	de,8196
	call	l_eq
	jp	nc,i_69	;
	ld	hl,i_1+83
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_error
	pop	bc
	pop	bc
.i_69
	call	l_gint8sp	;
	ld	de,8195
	call	l_eq
	jp	nc,i_70	;
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	a,l
	sub	1
	ld	a,h
	rla
	ccf
	rra
	sbc	128
	jp	nc,i_71	;
	ld	hl,0	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_error
	pop	bc
	pop	bc
.i_71
	ld	hl,8	;const
	add	hl,sp
	push	hl
	call	_xread
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_setcdr
	pop	bc
	pop	bc
	call	l_gint8sp	;
	ld	de,8194
	call	l_eq
	jp	c,i_73	;
	call	_xread
	ld	de,8194
	and	a
	sbc	hl,de
	scf
	jr	nz,ASMPC+3
	ccf
	jp	nc,i_72	;
.i_73
	ld	hl,0	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_error
	pop	bc
	pop	bc
.i_72
	ld	hl,1	;const
	push	hl
	call	_unsave
	pop	bc
	ld	hl,(_Parens)
	dec	hl
	ld	(_Parens),hl
	call	l_gint6sp	;
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret


.i_70
	call	l_gint8sp	;
	ld	de,8194
	call	l_eq
	jp	c,i_66	;EOS
.i_75
	call	l_gint4sp	;
	ld	de,8197
	call	l_eq
	jp	nc,i_76	;
	ld	hl,4	;const
	add	hl,sp
	push	hl
	call	l_gint8sp	;
	pop	de
	ex	de,hl
	ld	(hl),de
	jp	i_77	;EOS
.i_76
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
.i_77
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_setcar
	pop	bc
	pop	bc
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,8197	;const
	push	hl
	push	hl
	call	_cons
	pop	bc
	pop	bc
	push	hl
	call	_setcdr
	pop	bc
	pop	bc
	pop	de
	pop	hl
	inc	hl
	push	hl
	push	de
	jp	i_65	;EOS
.i_66
	ld	hl,(_Parens)
	dec	hl
	ld	(_Parens),hl
	call	l_gint4sp	;
	ld	de,8197
	and	a
	sbc	hl,de
	scf
	jr	nz,ASMPC+3
	ccf
	jp	nc,i_78	;
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,8197	;const
	push	hl
	call	_setcdr
	pop	bc
	pop	bc
.i_78
	ld	hl,1	;const
	push	hl
	call	_unsave
	pop	bc
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	a,h
	or	l
	jp	z,i_79	;
	call	l_gint6sp	;
	jp	i_80	;
.i_79
	ld	hl,8197	;const
.i_80
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	459,"kl.c::rdlist::0::65"

; Function symbolic flags 0x00000200 __smallc 
; int symbolic(int c)
; parameter 'int c' at sp+2 size(2)
	C_LINE	459,"kl.c::symbolic::0::65"
._symbolic
	pop	bc
	pop	hl
	push	hl
	push	bc
	call	_isalpha_fastcall
	ld	a,h
	or	l
	jp	nz,i_81	;
	pop	bc
	pop	hl
	push	hl
	push	bc
	call	_isdigit_fastcall
	ld	a,h
	or	l
	jp	nz,i_81	;
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	de,45
	call	l_eq
	jp	c,i_81	;
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	de,47
	call	l_eq
	jp	c,i_81	;
	ld	hl,0	;const
	jr	i_82
.i_81
	ld	hl,1	;const
.i_82
	ret


	C_LINE	463,"kl.c::symbolic::0::66"

; Function rdsym flags 0x00000200 __smallc 
; int rdsym(int c)
; parameter 'int c' at sp+2 size(2)
	C_LINE	463,"kl.c::rdsym::0::66"
._rdsym
	ld	hl,65469	;const
	add	hl,sp
	ld	sp,hl
	ld	hl,0	;const
	pop	bc
	push	hl
.i_83
	ld	hl,69	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_symbolic
	pop	bc
	ld	a,h
	or	l
	jp	z,i_84	;
	ld	hl,69	;const
	add	hl,sp
	ld	hl,(hl)
	ld	de,47
	call	l_eq
	jp	nc,i_85	;
	ld	hl,69	;const
	add	hl,sp
	push	hl
	call	_rdchci
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
.i_85
	pop	hl
	push	hl
	ld	de,64
	call	l_eq
	jp	nc,i_86	;
	ld	hl,i_1+95
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_error
	pop	bc
	pop	bc
	jp	i_87	;EOS
.i_86
	pop	hl
	push	hl
	ld	a,l
	sub	64
	ld	a,h
	rla
	ccf
	rra
	sbc	128
	jp	nc,i_88	;
	ld	hl,2	;const
	add	hl,sp
	push	hl
	dec	hl
	dec	hl
	ld	hl,(hl)
	pop	de
	add	hl,de
	push	hl
	ld	hl,71	;const
	add	hl,sp
	ld	hl,(hl)
	ld	a,l
	pop	de
	ld	(de),a
	pop	hl
	inc	hl
	push	hl
.i_87
	ld	hl,69	;const
	add	hl,sp
	push	hl
	call	_rdchci
	pop	de
	ex	de,hl
	ld	(hl),de
	jp	i_83	;EOS
.i_84
	ld	hl,2	;const
	add	hl,sp
	push	hl
	dec	hl
	dec	hl
	ld	hl,(hl)
	pop	de
	add	hl,de
	ld	d,h
	ld	e,l
	xor	a
	ld	(de),a
	ld	hl,69	;const
	add	hl,sp
	ld	hl,(hl)
	ld	(_Rejected),hl
	ld	hl,2	;const
	add	hl,sp
	push	hl
	ld	hl,i_1+107
	push	hl
	call	strcmp_callee
	call	l_lneg
	jp	nc,i_89	;
	ld	hl,67	;const
	add	hl,sp
	ld	sp,hl
	ld	hl,8197	;const
	ret


.i_89
	ld	hl,2	;const
	add	hl,sp
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	exx
	ld	hl,67	;const
	add	hl,sp
	ld	sp,hl
	exx
	ret


	C_LINE	484,"kl.c::rdsym::0::69"

; Function syntax flags 0x00000200 __smallc 
; void syntax(int x)
; parameter 'int x' at sp+2 size(2)
	C_LINE	484,"kl.c::syntax::0::69"
._syntax
	ld	hl,i_1+111
	push	hl
	call	l_gint4sp	;
	push	hl
	call	_error
	pop	bc
	pop	bc
	ret


	C_LINE	486,"kl.c::syntax::0::70"

; Function quote flags 0x00000200 __smallc 
; int quote(int q, int n)
; parameter 'int n' at sp+2 size(2)
; parameter 'int q' at sp+4 size(2)
	C_LINE	486,"kl.c::quote::0::70"
._quote
	ld	hl,4	;const
	call	l_g2intspsp	;
	ld	hl,8197	;const
	push	hl
	call	_cons
	pop	bc
	pop	bc
	push	hl
	call	_cons
	pop	bc
	pop	bc
	ret


	C_LINE	488,"kl.c::quote::0::71"

; Function rdword flags 0x00000200 __smallc 
; int rdword()
	C_LINE	488,"kl.c::rdword::0::71"
._rdword
	push	bc
	push	bc
	push	bc
	ld	hl,5	;const
	add	hl,sp
	ld	(hl),0
	ld	l,(hl)
	ld	h,0
	call	_rdchci
	pop	bc
	push	hl
	push	hl
	call	_symbolic
	pop	bc
	call	l_lneg
	jp	nc,i_90	;
	ld	hl,8193	;const
	push	hl
	call	_syntax
	pop	bc
.i_90
	ld	hl,8197	;const
	push	hl
	push	hl
	call	_cons
	pop	bc
	pop	bc
	pop	de
	pop	bc
	push	hl
	push	de
	push	hl
	call	_save
	pop	bc
.i_91
	pop	hl
	push	hl
	ld	de,47
	call	l_eq
	jp	nc,i_94	;
	call	_rdchci
	pop	bc
	push	hl
.i_94
	ld	hl,4	;const
	add	hl,sp
	pop	de
	push	de
	push	hl
	ex	de,hl
	ld	a,l
	pop	de
	ld	(de),a
	ld	hl,2	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,6	;const
	add	hl,sp
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	push	hl
	call	_setcar
	pop	bc
	pop	bc
	call	_rdchci
	pop	bc
	push	hl
	push	hl
	call	_symbolic
	pop	bc
	ld	a,h
	or	l
	jp	z,i_95	;
	ld	hl,2	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,8197	;const
	push	hl
	push	hl
	call	_cons
	pop	bc
	pop	bc
	push	hl
	call	_setcdr
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
	jp	i_91	;EOS
.i_92
	pop	hl
	push	hl
	ld	(_Rejected),hl
	ld	hl,1	;const
	push	hl
	call	_unsave
	pop	bc
	pop	de
	pop	bc
	push	hl
	push	de
	ld	hl,(_S_quote)
	push	hl
	call	l_gint4sp	;
	push	hl
	call	_quote
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	514,"kl.c::rdword::0::75"

; Function type flags 0x00000200 __smallc 
; void type(int x)
; parameter 'int x' at sp+2 size(2)
	C_LINE	514,"kl.c::type::0::75"
._type
	ld	hl,i_1+118
	push	hl
	call	l_gint4sp	;
	push	hl
	call	_error
	pop	bc
	pop	bc
	ret


	C_LINE	516,"kl.c::type::0::76"

; Function xread flags 0x00000200 __smallc 
; int xread()
	C_LINE	516,"kl.c::xread::0::76"
._xread
	push	bc
	call	_rdchci
	pop	bc
	push	hl
.i_100
	pop	hl
	push	hl
	ld	de,32
	call	l_eq
	jp	c,i_102	;
	pop	hl
	push	hl
	ld	de,9
	call	l_eq
	jp	c,i_102	;
	pop	hl
	push	hl
	ld	de,10
	call	l_eq
	jp	c,i_102	;
	pop	hl
	push	hl
	ld	de,13
	call	l_eq
	jp	nc,i_101	;
.i_102
	ld	hl,(_Error)
	ld	a,h
	or	l
	jp	z,i_104	;
	ld	hl,8197	;const
	pop	bc
	ret


.i_104
	call	_rdchci
	pop	bc
	push	hl
	jp	i_100	;EOS
.i_101
	pop	hl
	push	hl
	ld	de,59
	and	a
	sbc	hl,de
	scf
	jr	nz,ASMPC+3
	ccf
	jp	c,i_98	;EOS
.i_106
	pop	hl
	push	hl
	ld	de,10
	and	a
	sbc	hl,de
	scf
	jr	nz,ASMPC+3
	ccf
	jp	nc,i_107	;
	call	_rdchci
	pop	bc
	push	hl
	jp	i_106	;EOS
.i_98
	pop	hl
	push	hl
	ld	de,8196
	call	l_eq
	jp	c,i_109	;
	pop	hl
	push	hl
	ld	de,37
	call	l_eq
	jp	nc,i_108	;
.i_109
	ld	hl,8196	;const
	pop	bc
	ret


.i_108
	pop	hl
	push	hl
	ld	de,40
	call	l_eq
	jp	nc,i_111	;
	call	_rdlist
	pop	bc
	ret


.i_111
	pop	hl
	push	hl
	ld	de,39
	call	l_eq
	jp	nc,i_113	;
	ld	hl,(_S_quote)
	push	hl
	call	_xread
	push	hl
	call	_quote
	pop	bc
	pop	bc
	pop	bc
	ret


.i_113
	pop	hl
	push	hl
	ld	de,64
	call	l_eq
	jp	nc,i_115	;
	ld	hl,(_S_qquote)
	push	hl
	call	_xread
	push	hl
	call	_quote
	pop	bc
	pop	bc
	pop	bc
	ret


.i_115
	pop	hl
	push	hl
	ld	de,44
	call	l_eq
	jp	nc,i_117	;
	call	_rdchci
	pop	bc
	push	hl
	ld	de,64
	call	l_eq
	jp	nc,i_118	;
	ld	hl,(_S_splice)
	push	hl
	call	_xread
	push	hl
	call	_quote
	pop	bc
	pop	bc
	pop	bc
	ret


.i_118
	pop	hl
	push	hl
	ld	(_Rejected),hl
	ld	hl,(_S_unquote)
	push	hl
	call	_xread
	push	hl
	call	_quote
	pop	bc
	pop	bc
	pop	bc
	ret


.i_117
	pop	hl
	push	hl
	ld	de,41
	call	l_eq
	jp	nc,i_120	;
	ld	hl,(_Parens)
	call	l_lneg
	jp	nc,i_121	;
	ld	hl,i_1+123
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_error
	pop	bc
	pop	bc
.i_121
	ld	hl,8194	;const
	pop	bc
	ret


.i_120
	pop	hl
	push	hl
	ld	de,46
	call	l_eq
	jp	nc,i_123	;
	ld	hl,(_Parens)
	call	l_lneg
	jp	nc,i_124	;
	ld	hl,i_1+135
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_error
	pop	bc
	pop	bc
.i_124
	ld	hl,8195	;const
	pop	bc
	ret


.i_123
	pop	hl
	push	hl
	push	hl
	call	_symbolic
	pop	bc
	ld	a,h
	or	l
	jp	z,i_126	;
	pop	hl
	push	hl
	push	hl
	call	_rdsym
	pop	bc
	pop	bc
	ret


.i_126
	pop	hl
	push	hl
	ld	de,35
	call	l_eq
	jp	nc,i_128	;
	call	_rdword
	pop	bc
	ret


.i_128
	ld	hl,8193	;const
	push	hl
	call	_syntax
	pop	bc
	ld	hl,8193	;const
	pop	bc
	ret


.i_112
	pop	bc
	ret


	C_LINE	564,"kl.c::xread::0::88"

; Function print2 flags 0x00000200 __smallc 
; void print2(int n, int d)
; parameter 'int d' at sp+2 size(2)
; parameter 'int n' at sp+4 size(2)
	C_LINE	564,"kl.c::print2::0::88"
._print2
	pop	bc
	pop	de
	push	de
	push	bc
	ld	hl,128
	call	l_gt
	jp	nc,i_130	;
	ld	hl,i_1+144
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_error
	pop	bc
	pop	bc
.i_130
	ld	hl,(_Error)
	ld	a,h
	or	l
	jp	z,i_131	;
	ld	hl,i_1+156
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_error
	pop	bc
	pop	bc
.i_131
	call	l_gint4sp	;
	ld	de,8197
	call	l_eq
	jp	nc,i_132	;
	ld	hl,i_1+107
	push	hl
	call	_pr
	pop	bc
	ret
.i_132
	call	l_gint4sp	;
	ld	de,8196
	call	l_eq
	jp	nc,i_134	;
	ld	hl,i_1+161
	push	hl
	call	_pr
	pop	bc
	jp	i_135	;EOS
.i_134
	call	l_gint4sp	;
	ld	de,8192
	ex	de,hl
	call	l_ge
	jp	c,i_137	;
	ld	hl,_Tag
	push	hl
	call	l_gint6sp	;
	pop	de
	add	hl,de
	ld	a,1
	and	(hl)
	jp	z,i_136	;
.i_137
	ld	hl,i_1+167
	push	hl
	call	_pr
	pop	bc
	jp	i_139	;EOS
.i_136
	call	l_gint4sp	;
	push	hl
	call	_symbolp
	pop	bc
	ld	a,h
	or	l
	jp	z,i_140	;
	call	l_gint4sp	;
	push	hl
	call	_symstr
	pop	bc
	push	hl
	call	_pr
	pop	bc
	jp	i_141	;EOS
.i_140
	call	l_gint4sp	;
	push	hl
	call	_atomp
	pop	bc
	call	l_lneg
	jp	nc,i_143	;
	ld	hl,(_S_lamstar)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	pop	de
	call	l_eq
	jp	nc,i_143	;
.i_144_i_143
	ld	hl,i_1+181
	push	hl
	call	_pr
	pop	bc
	ret


.i_142
	ld	hl,i_1+191
	push	hl
	call	_pr
	pop	bc
.i_145
	call	l_gint4sp	;
	ld	de,8197
	and	a
	sbc	hl,de
	scf
	jr	nz,ASMPC+3
	ccf
	jp	nc,i_146	;
	call	l_gint4sp	;
	push	hl
	call	_car
	pop	bc
	push	hl
	call	l_gint4sp	;
	inc	hl
	push	hl
	call	_print2
	pop	bc
	pop	bc
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
	call	l_gint4sp	;
	push	hl
	call	_symbolp
	pop	bc
	ld	a,h
	or	l
	jp	z,i_147	;
	ld	hl,i_1+193
	push	hl
	call	_pr
	pop	bc
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	l_gint4sp	;
	inc	hl
	push	hl
	call	_print2
	pop	bc
	pop	bc
	ld	hl,4	;const
	add	hl,sp
	ld	(hl),5
	inc	hl
	ld	(hl),32
	jp	i_148	;EOS
.i_147
	call	l_gint4sp	;
	ld	de,8197
	and	a
	sbc	hl,de
	scf
	jr	nz,ASMPC+3
	ccf
	jp	nc,i_149	;
	ld	hl,i_1+3
	push	hl
	call	_pr
	pop	bc
	jp	i_145	;EOS
.i_146
	ld	hl,i_1+197
	push	hl
	call	_pr
	pop	bc
.i_133
	ret


	C_LINE	601,"kl.c::print2::0::98"

; Function print flags 0x00000200 __smallc 
; void print(int n)
; parameter 'int n' at sp+2 size(2)
	C_LINE	601,"kl.c::print::0::98"
._print
	ld	hl,2	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,0	;const
	push	hl
	call	_print2
	pop	bc
	pop	bc
	call	_flush
	ret


	C_LINE	606,"kl.c::print::0::99"

; Function lookup flags 0x00000200 __smallc 
; int lookup(int x)
; parameter 'int x' at sp+2 size(2)
	C_LINE	606,"kl.c::lookup::0::99"
._lookup
	push	bc
	ld	hl,(_Env)
	push	hl
	jp	i_152	;EOS
.i_150
	pop	hl
	push	hl
	push	hl
	call	_cdr
	pop	bc
	pop	bc
	push	hl
.i_152
	pop	hl
	push	hl
	ld	de,8197
	and	a
	sbc	hl,de
	scf
	jr	nz,ASMPC+3
	ccf
	jp	nc,i_151	;
	pop	hl
	push	hl
	push	hl
	call	_car
	pop	bc
	pop	de
	pop	bc
	push	hl
	push	de
	jp	i_155	;EOS
.i_153
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
.i_155
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	de,8197
	and	a
	sbc	hl,de
	scf
	jr	nz,ASMPC+3
	ccf
	jp	nc,i_154	;
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_caar
	pop	bc
	push	hl
	call	l_gint8sp	;
	pop	de
	call	l_eq
	jp	nc,i_156	;
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_cdar
	pop	bc
	pop	bc
	pop	bc
	ret
	jp	i_150	;EOS
.i_151
	call	l_gint6sp	;
	push	hl
	call	_cdr
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	618,"kl.c::lookup::0::102"

; Function specialp flags 0x00000200 __smallc 
; int specialp(int n)
; parameter 'int n' at sp+2 size(2)
	C_LINE	618,"kl.c::specialp::0::102"
._specialp
	pop	bc
	pop	hl
	push	hl
	push	bc
	ex	de,hl
	ld	hl,(_S_quote)
	call	l_eq
	jp	c,i_157	;
	pop	bc
	pop	hl
	push	hl
	push	bc
	ex	de,hl
	ld	hl,(_S_if)
	call	l_eq
	jp	c,i_157	;
	pop	bc
	pop	hl
	push	hl
	push	bc
	ex	de,hl
	ld	hl,(_S_prog)
	call	l_eq
	jp	c,i_157	;
	pop	bc
	pop	hl
	push	hl
	push	bc
	ex	de,hl
	ld	hl,(_S_ifnot)
	call	l_eq
	jp	c,i_157	;
	pop	bc
	pop	hl
	push	hl
	push	bc
	ex	de,hl
	ld	hl,(_S_lambda)
	call	l_eq
	jp	c,i_157	;
	pop	bc
	pop	hl
	push	hl
	push	bc
	ex	de,hl
	ld	hl,(_S_lamstar)
	call	l_eq
	jp	c,i_157	;
	pop	bc
	pop	hl
	push	hl
	push	bc
	ex	de,hl
	ld	hl,(_S_apply)
	call	l_eq
	jp	c,i_157	;
	pop	bc
	pop	hl
	push	hl
	push	bc
	ex	de,hl
	ld	hl,(_S_setq)
	call	l_eq
	jp	c,i_157	;
	pop	bc
	pop	hl
	push	hl
	push	bc
	ex	de,hl
	ld	hl,(_S_macro)
	call	l_eq
	jp	c,i_157	;
	ld	hl,0	;const
	jr	i_158
.i_157
	ld	hl,1	;const
.i_158
	ret


	C_LINE	630,"kl.c::specialp::0::103"

; Function check flags 0x00000200 __smallc 
; void check(int x, int k0, int kn)
; parameter 'int kn' at sp+2 size(2)
; parameter 'int k0' at sp+4 size(2)
; parameter 'int x' at sp+6 size(2)
	C_LINE	630,"kl.c::check::0::103"
._check
	ld	hl,0	;const
	push	hl
	ld	l,8
	add	hl,sp
	ld	hl,(hl)
	push	hl
	jp	i_161	;EOS
.i_159
	pop	hl
	push	hl
	push	hl
	call	_cdr
	pop	bc
	pop	bc
	push	hl
.i_161
	pop	hl
	push	hl
	push	hl
	call	_atomp
	pop	bc
	call	l_lneg
	jp	nc,i_160	;
	pop	de
	pop	hl
	inc	hl
	push	hl
	push	de
	jp	i_159	;EOS
.i_160
	pop	hl
	push	hl
	ld	de,8197
	and	a
	sbc	hl,de
	scf
	jr	nz,ASMPC+3
	ccf
	jp	c,i_163	;
	ld	hl,2	;const
	add	hl,sp
	ld	de,(hl)
	inc	hl
	call	l_gint8sp	;
	call	l_lt
	jp	c,i_163	;
	call	l_gint6sp	;
	ld	de,65535
	and	a
	sbc	hl,de
	scf
	jr	nz,ASMPC+3
	ccf
	jp	nc,i_164	;
	ld	hl,2	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	l_gint8sp	;
	pop	de
	call	l_gt
	jp	nc,i_164	;
.i_166_i_164
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_syntax
	pop	bc
.i_162
	pop	bc
	pop	bc
	ret


	C_LINE	640,"kl.c::check::0::104"
	C_LINE	642,"kl.c::check::0::104"

; Function load flags 0x00000200 __smallc 
; void load(char * s)
; parameter 'char * s' at sp+2 size(2)
	C_LINE	642,"kl.c::load::0::104"
._load
	ld	hl,65398	;const
	add	hl,sp
	ld	sp,hl
	ld	hl,(_Loads)
	ld	de,2
	ex	de,hl
	call	l_ge
	jp	nc,i_167	;
	ld	hl,i_1+199
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_error
	pop	bc
	pop	bc
.i_167
	ld	hl,(_Input)
	pop	de
	pop	bc
	push	hl
	push	de
	ld	hl,6	;const
	add	hl,sp
	ld	de,(_Inp)
	ld	(hl),de
	ex	de,hl
	ld	hl,4	;const
	add	hl,sp
	ld	de,(_Ink)
	ld	(hl),de
	ex	de,hl
	ld	hl,8	;const
	add	hl,sp
	ld	de,(_Inbuf)
	ld	(hl),de
	ex	de,hl
	ld	hl,(_Rejected)
	pop	bc
	push	hl
	ld	hl,10	;const
	add	hl,sp
	ld	(_Inbuf),hl
	ld	hl,0	;const
	ld	(_Ink),hl
	ld	(_Inp),hl
	ld	hl,8196	;const
	ld	(_Rejected),hl
	ld	hl,140	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,0	;const
	push	hl
	ld	hl,511	;const
	push	hl
	call	open
	pop	bc
	pop	bc
	pop	bc
	ld	(_Input),hl
	ld	a,h
	rla
	jp	nc,i_168	;
	ld	hl,i_1+206
	push	hl
	ld	hl,142	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_strsym
	pop	bc
	push	hl
	call	_error
	pop	bc
	pop	bc
.i_168
	ld	hl,(_Loads)
	inc	hl
	ld	(_Loads),hl
	dec	hl
.i_169
	call	_xread
	ld	(_Acc),hl
	ld	de,8196
	call	l_eq
	jp	c,i_170	;EOS
.i_172
	ld	hl,(_Acc)
	push	hl
	call	_eval
	pop	bc
	jp	i_169	;EOS
.i_170
	ld	hl,(_Loads)
	dec	hl
	ld	(_Loads),hl
	pop	hl
	push	hl
	ld	(_Rejected),hl
	call	l_gint8sp	;
	ld	(_Inbuf),hl
	call	l_gint4sp	;
	ld	(_Ink),hl
	call	l_gint6sp	;
	ld	(_Inp),hl
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	(_Input),hl
	ld	hl,138	;const
	add	hl,sp
	ld	sp,hl
	ret


	C_LINE	673,"kl.c::load::0::106"

; Function dowrite flags 0x00000200 __smallc 
; void dowrite(int fd, void * b, int k)
; parameter 'int k' at sp+2 size(2)
; parameter 'void * b' at sp+4 size(2)
; parameter 'int fd' at sp+6 size(2)
	C_LINE	673,"kl.c::dowrite::0::106"
._dowrite
	ld	hl,6	;const
	call	l_g2intspsp	;
	call	l_gint6sp	;
	push	hl
	call	write
	pop	bc
	pop	bc
	pop	bc
	push	hl
	call	l_gint4sp	;
	pop	de
	call	l_ne
	ret	nc
	ld	hl,i_1+211
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_error
	pop	bc
	pop	bc
.i_173
	ret


	C_LINE	678,"kl.c::dowrite::0::107"

; Function suspend flags 0x00000200 __smallc 
; void suspend(char * s)
; parameter 'char * s' at sp+2 size(2)
	C_LINE	678,"kl.c::suspend::0::107"
._suspend
	ld	hl,65404	;const
	add	hl,sp
	ld	sp,hl
	ld	hl,130	;const
	add	hl,sp
	push	hl
	ld	hl,136	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,420	;const
	push	hl
	call	creat
	pop	bc
	pop	bc
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
	ld	hl,130	;const
	add	hl,sp
	ld	hl,(hl)
	ld	a,h
	rla
	jp	nc,i_174	;
	ld	hl,i_1+223
	push	hl
	ld	hl,136	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_strsym
	pop	bc
	push	hl
	call	_error
	pop	bc
	pop	bc
.i_174
	ld	hl,0	;const
	add	hl,sp
	push	hl
	ld	hl,i_1+231
	push	hl
	call	strlen_fastcall
	inc	hl
	push	hl
	call	memcpy_callee
	ld	hl,128	;const
	add	hl,sp
	push	hl
	ld	hl,i_1+231
	call	strlen_fastcall
	inc	hl
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
	ld	hl,0	;const
	add	hl,sp
	ex	de,hl
	ld	hl,128	;const
	add	hl,sp
	ld	hl,(hl)
	add	hl,de
	ld	(hl),32
	ld	hl,0	;const
	add	hl,sp
	push	hl
	ld	hl,130	;const
	add	hl,sp
	ld	hl,(hl)
	inc	hl
	pop	de
	add	hl,de
	ld	(hl),0
	ld	hl,0	;const
	add	hl,sp
	push	hl
	ld	hl,130	;const
	add	hl,sp
	ld	hl,(hl)
	inc	hl
	inc	hl
	pop	de
	add	hl,de
	push	hl
	ld	hl,(_Freelist)
	ld	l,h
	ld	a,h
	rlca
	sbc	a
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,0	;const
	add	hl,sp
	push	hl
	ld	hl,130	;const
	add	hl,sp
	ld	hl,(hl)
	inc	hl
	inc	hl
	inc	hl
	pop	de
	add	hl,de
	ex	de,hl
	ld	hl,(_Freelist)
	ld	a,l
	ld	(de),a
	ld	hl,0	;const
	add	hl,sp
	push	hl
	ld	hl,130	;const
	add	hl,sp
	ld	bc,(hl)
	inc	hl
	ld	hl,4
	add	hl,bc
	pop	de
	add	hl,de
	push	hl
	ld	hl,(_Symbols)
	ld	l,h
	ld	a,h
	rlca
	sbc	a
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,0	;const
	add	hl,sp
	push	hl
	ld	hl,130	;const
	add	hl,sp
	ld	bc,(hl)
	inc	hl
	ld	hl,5
	add	hl,bc
	pop	de
	add	hl,de
	ex	de,hl
	ld	hl,(_Symbols)
	ld	a,l
	ld	(de),a
	ld	hl,0	;const
	add	hl,sp
	push	hl
	ld	hl,130	;const
	add	hl,sp
	ld	bc,(hl)
	inc	hl
	ld	hl,6
	add	hl,bc
	pop	de
	add	hl,de
	push	hl
	ld	hl,(_Id)
	ld	l,h
	ld	a,h
	rlca
	sbc	a
	pop	de
	ld	a,l
	ld	(de),a
	ld	hl,0	;const
	add	hl,sp
	push	hl
	ld	hl,130	;const
	add	hl,sp
	ld	bc,(hl)
	inc	hl
	ld	hl,7
	add	hl,bc
	pop	de
	add	hl,de
	ex	de,hl
	ld	hl,(_Id)
	ld	a,l
	ld	(de),a
	ld	hl,130	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,2	;const
	add	hl,sp
	push	hl
	ld	hl,132	;const
	add	hl,sp
	ld	bc,(hl)
	inc	hl
	ld	hl,8
	add	hl,bc
	push	hl
	call	_dowrite
	pop	bc
	pop	bc
	pop	bc
	ld	hl,130	;const
	add	hl,sp
	ld	de,(hl)
	inc	hl
	push	de
	ld	hl,_Car
	push	hl
	ld	hl,16384	;const
	push	hl
	call	_dowrite
	pop	bc
	pop	bc
	pop	bc
	ld	hl,130	;const
	add	hl,sp
	ld	de,(hl)
	inc	hl
	push	de
	ld	hl,_Cdr
	push	hl
	ld	hl,16384	;const
	push	hl
	call	_dowrite
	pop	bc
	pop	bc
	pop	bc
	ld	hl,130	;const
	add	hl,sp
	ld	de,(hl)
	inc	hl
	push	de
	ld	hl,_Tag
	push	hl
	ld	hl,8192	;const
	push	hl
	call	_dowrite
	pop	bc
	pop	bc
	pop	bc
	ld	hl,130	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	close
	ld	hl,134	;const
	add	hl,sp
	ld	sp,hl
	ret


	C_LINE	702,"kl.c::suspend::0::108"

; Function doread flags 0x00000200 __smallc 
; void doread(int fd, void * b, int k)
; parameter 'int k' at sp+2 size(2)
; parameter 'void * b' at sp+4 size(2)
; parameter 'int fd' at sp+6 size(2)
	C_LINE	702,"kl.c::doread::0::108"
._doread
	ld	hl,6	;const
	call	l_g2intspsp	;
	call	l_gint6sp	;
	push	hl
	call	read
	pop	bc
	pop	bc
	pop	bc
	push	hl
	call	l_gint4sp	;
	pop	de
	call	l_ne
	ret	nc
	ld	hl,i_1+236
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_error
	pop	bc
	pop	bc
.i_175
	ret


	C_LINE	707,"kl.c::doread::0::109"

; Function fasload flags 0x00000200 __smallc 
; void fasload(char * s)
; parameter 'char * s' at sp+2 size(2)
	C_LINE	707,"kl.c::fasload::0::109"
._fasload
	ld	hl,65400	;const
	add	hl,sp
	ld	sp,hl
	ld	hl,i_1+247
	pop	bc
	push	hl
	ld	hl,134	;const
	add	hl,sp
	push	hl
	ld	hl,140	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,0	;const
	push	hl
	ld	hl,511	;const
	push	hl
	call	open
	pop	bc
	pop	bc
	pop	bc
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
	ld	hl,134	;const
	add	hl,sp
	ld	hl,(hl)
	ld	a,h
	rla
	jp	nc,i_176	;
	exx
	ld	hl,136	;const
	add	hl,sp
	ld	sp,hl
	exx
	ret


.i_176
	ld	hl,132	;const
	add	hl,sp
	push	hl
	ld	hl,i_1+231
	call	strlen_fastcall
	inc	hl
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
	ld	hl,134	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,4	;const
	add	hl,sp
	push	hl
	ld	hl,136	;const
	add	hl,sp
	ld	bc,(hl)
	inc	hl
	ld	hl,8
	add	hl,bc
	push	hl
	call	_doread
	pop	bc
	pop	bc
	pop	bc
	ld	hl,130	;const
	add	hl,sp
	push	hl
	ld	hl,4	;const
	add	hl,sp
	ex	de,hl
	ld	hl,134	;const
	add	hl,sp
	ld	hl,(hl)
	add	hl,de
	ld	h,(hl)
	ld	l,0
	push	hl
	ld	hl,6	;const
	add	hl,sp
	push	hl
	ld	hl,138	;const
	add	hl,sp
	ld	hl,(hl)
	inc	hl
	pop	de
	add	hl,de
	ld	l,(hl)
	pop	de
	ld	h,d
	ld	a,l
	or	e
	ld	l,a
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
	ld	hl,2	;const
	add	hl,sp
	push	hl
	ld	hl,134	;const
	add	hl,sp
	ld	hl,(hl)
	inc	hl
	inc	hl
	pop	de
	add	hl,de
	ld	h,(hl)
	ld	l,0
	push	hl
	ld	hl,4	;const
	add	hl,sp
	push	hl
	ld	hl,136	;const
	add	hl,sp
	ld	hl,(hl)
	inc	hl
	inc	hl
	inc	hl
	pop	de
	add	hl,de
	ld	l,(hl)
	pop	de
	ld	h,d
	ld	a,l
	or	e
	ld	l,a
	ld	(_Freelist),hl
	ld	hl,2	;const
	add	hl,sp
	push	hl
	ld	hl,134	;const
	add	hl,sp
	ld	bc,(hl)
	inc	hl
	ld	hl,4
	add	hl,bc
	pop	de
	add	hl,de
	ld	h,(hl)
	ld	l,0
	push	hl
	ld	hl,4	;const
	add	hl,sp
	push	hl
	ld	hl,136	;const
	add	hl,sp
	ld	bc,(hl)
	inc	hl
	ld	hl,5
	add	hl,bc
	pop	de
	add	hl,de
	ld	l,(hl)
	pop	de
	ld	h,d
	ld	a,l
	or	e
	ld	l,a
	ld	(_Symbols),hl
	ld	hl,2	;const
	add	hl,sp
	push	hl
	ld	hl,134	;const
	add	hl,sp
	ld	bc,(hl)
	inc	hl
	ld	hl,6
	add	hl,bc
	pop	de
	add	hl,de
	ld	h,(hl)
	ld	l,0
	push	hl
	ld	hl,4	;const
	add	hl,sp
	push	hl
	ld	hl,136	;const
	add	hl,sp
	ld	bc,(hl)
	inc	hl
	ld	hl,7
	add	hl,bc
	pop	de
	add	hl,de
	ld	l,(hl)
	pop	de
	ld	h,d
	ld	a,l
	or	e
	ld	l,a
	ld	(_Id),hl
	ld	hl,130	;const
	add	hl,sp
	ld	hl,(hl)
	ld	de,8192
	and	a
	sbc	hl,de
	scf
	jr	nz,ASMPC+3
	ccf
	jp	c,i_178	;
	ld	hl,2	;const
	add	hl,sp
	push	hl
	ld	hl,i_1+231
	push	hl
	ld	hl,136	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	memcmp_callee
	ld	a,h
	or	l
	jp	z,i_177	;
.i_178
	ld	hl,0	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_error
	pop	bc
	pop	bc
.i_177
	ld	hl,134	;const
	add	hl,sp
	ld	de,(hl)
	inc	hl
	push	de
	ld	hl,_Car
	push	hl
	ld	hl,16384	;const
	push	hl
	call	_doread
	pop	bc
	pop	bc
	pop	bc
	ld	hl,134	;const
	add	hl,sp
	ld	de,(hl)
	inc	hl
	push	de
	ld	hl,_Cdr
	push	hl
	ld	hl,16384	;const
	push	hl
	call	_doread
	pop	bc
	pop	bc
	pop	bc
	ld	hl,134	;const
	add	hl,sp
	ld	de,(hl)
	inc	hl
	push	de
	ld	hl,_Tag
	push	hl
	ld	hl,8192	;const
	push	hl
	call	_doread
	pop	bc
	pop	bc
	pop	bc
	ld	hl,134	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,4	;const
	add	hl,sp
	push	hl
	ld	hl,1	;const
	push	hl
	call	read
	pop	bc
	pop	bc
	pop	bc
	ld	a,h
	or	l
	jp	z,i_180	;
	ld	hl,0	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_error
	pop	bc
	pop	bc
.i_180
	ld	hl,134	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	close
	ld	hl,138	;const
	add	hl,sp
	ld	sp,hl
	ret


	C_LINE	732,"kl.c::fasload::0::110"

; Function builtin flags 0x00000200 __smallc 
; int builtin(int x)
; parameter 'int x' at sp+2 size(2)
	C_LINE	732,"kl.c::builtin::0::110"
._builtin
	push	bc
	ld	hl,(_S_car)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	pop	de
	call	l_eq
	jp	nc,i_181	;
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,2	;const
	push	hl
	push	hl
	call	_check
	pop	bc
	pop	bc
	pop	bc
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	push	hl
	call	_atomp
	pop	bc
	ld	a,h
	or	l
	jp	z,i_182	;
	call	l_gint4sp	;
	push	hl
	call	_type
	pop	bc
.i_182
	call	l_gint4sp	;
	push	hl
	call	_caadr
	pop	bc
	pop	bc
	ret


.i_181
	ld	hl,(_S_cdr)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	pop	de
	call	l_eq
	jp	nc,i_184	;
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,2	;const
	push	hl
	push	hl
	call	_check
	pop	bc
	pop	bc
	pop	bc
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	push	hl
	call	_atomp
	pop	bc
	ld	a,h
	or	l
	jp	z,i_185	;
	call	l_gint4sp	;
	push	hl
	call	_type
	pop	bc
.i_185
	call	l_gint4sp	;
	push	hl
	call	_cdadr
	pop	bc
	pop	bc
	ret


.i_184
	ld	hl,(_S_eq)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	pop	de
	call	l_eq
	jp	nc,i_187	;
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,3	;const
	push	hl
	push	hl
	call	_check
	pop	bc
	pop	bc
	pop	bc
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_caddr
	pop	bc
	pop	de
	call	l_eq
	jp	nc,i_188	;
	ld	hl,(_S_t)
	jp	i_189	;
.i_188
	ld	hl,8197	;const
.i_189
	pop	bc
	ret


.i_187
	ld	hl,(_S_atom)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	pop	de
	call	l_eq
	jp	nc,i_191	;
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,2	;const
	push	hl
	push	hl
	call	_check
	pop	bc
	pop	bc
	pop	bc
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	push	hl
	call	_atomp
	pop	bc
	ld	a,h
	or	l
	jp	z,i_192	;
	ld	hl,(_S_t)
	jp	i_193	;
.i_192
	ld	hl,8197	;const
.i_193
	pop	bc
	ret


.i_191
	ld	hl,(_S_cons)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	pop	de
	call	l_eq
	jp	nc,i_195	;
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,3	;const
	push	hl
	push	hl
	call	_check
	pop	bc
	pop	bc
	pop	bc
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_caddr
	pop	bc
	push	hl
	call	_cons
	pop	bc
	pop	bc
	pop	bc
	ret


.i_195
	ld	hl,(_S_setcar)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	pop	de
	call	l_eq
	jp	nc,i_197	;
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,3	;const
	push	hl
	push	hl
	call	_check
	pop	bc
	pop	bc
	pop	bc
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	push	hl
	call	_atomp
	pop	bc
	ld	a,h
	or	l
	jp	z,i_198	;
	call	l_gint4sp	;
	push	hl
	call	_type
	pop	bc
.i_198
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_caddr
	pop	bc
	push	hl
	call	_setcar
	pop	bc
	pop	bc
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	pop	bc
	ret


.i_197
	ld	hl,(_S_setcdr)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	pop	de
	call	l_eq
	jp	nc,i_200	;
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,3	;const
	push	hl
	push	hl
	call	_check
	pop	bc
	pop	bc
	pop	bc
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	push	hl
	call	_atomp
	pop	bc
	ld	a,h
	or	l
	jp	z,i_201	;
	call	l_gint4sp	;
	push	hl
	call	_type
	pop	bc
.i_201
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_caddr
	pop	bc
	push	hl
	call	_setcdr
	pop	bc
	pop	bc
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	pop	bc
	ret


.i_200
	ld	hl,(_S_gensym)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	pop	de
	call	l_eq
	jp	nc,i_203	;
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,1	;const
	push	hl
	push	hl
	call	_check
	pop	bc
	pop	bc
	pop	bc
	ld	hl,(_Id)
	inc	hl
	ld	(_Id),hl
	push	hl
	call	_ntoa
	pop	bc
	pop	bc
	dec	hl
	push	hl
	ld	d,h
	ld	e,l
	ld	a,71
	ld	(de),a
	ld	hl,0	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	pop	bc
	ret


.i_203
	ld	hl,(_S_eofp)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	pop	de
	call	l_eq
	jp	nc,i_205	;
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,2	;const
	push	hl
	push	hl
	call	_check
	pop	bc
	pop	bc
	pop	bc
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	ld	de,8196
	call	l_eq
	jp	nc,i_206	;
	ld	hl,(_S_t)
	jp	i_207	;
.i_206
	ld	hl,8197	;const
.i_207
	pop	bc
	ret


.i_205
	ld	hl,(_S_read)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	pop	de
	call	l_eq
	jp	nc,i_209	;
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,1	;const
	push	hl
	push	hl
	call	_check
	pop	bc
	pop	bc
	pop	bc
	call	_xread
	pop	bc
	ret


.i_209
	ld	hl,(_S_prin)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	pop	de
	call	l_eq
	jp	nc,i_211	;
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,2	;const
	push	hl
	push	hl
	call	_check
	pop	bc
	pop	bc
	pop	bc
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	push	hl
	call	_print
	ld	hl,i_1+3
	ex	(sp),hl
	call	_pr
	pop	bc
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	pop	bc
	ret


.i_211
	ld	hl,(_S_prin1)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	pop	de
	call	l_eq
	jp	nc,i_213	;
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,2	;const
	push	hl
	push	hl
	call	_check
	pop	bc
	pop	bc
	pop	bc
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	push	hl
	call	_print
	pop	bc
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	pop	bc
	ret


.i_213
	ld	hl,(_S_print)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	pop	de
	call	l_eq
	jp	nc,i_215	;
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,2	;const
	push	hl
	push	hl
	call	_check
	pop	bc
	pop	bc
	pop	bc
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	push	hl
	call	_print
	pop	bc
	call	_nl
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	pop	bc
	ret


.i_215
	ld	hl,(_S_load)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	pop	de
	call	l_eq
	jp	nc,i_217	;
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,2	;const
	push	hl
	push	hl
	call	_check
	pop	bc
	pop	bc
	pop	bc
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	push	hl
	call	_symbolp
	pop	bc
	call	l_lneg
	jp	nc,i_218	;
	call	l_gint4sp	;
	push	hl
	call	_type
	pop	bc
.i_218
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	push	hl
	call	_symstr
	pop	bc
	push	hl
	call	_load
	pop	bc
	ld	hl,(_S_t)
	pop	bc
	ret


.i_217
	ld	hl,(_S_error)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	pop	de
	call	l_eq
	jp	nc,i_220	;
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,2	;const
	push	hl
	ld	l,3
	push	hl
	call	_check
	pop	bc
	pop	bc
	pop	bc
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	push	hl
	call	_symbolp
	pop	bc
	call	l_lneg
	jp	nc,i_221	;
	call	l_gint4sp	;
	push	hl
	call	_type
	pop	bc
.i_221
	call	l_gint4sp	;
	push	hl
	call	_cddr
	pop	bc
	ld	de,8197
	call	l_eq
	jp	nc,i_222	;
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	push	hl
	call	_symstr
	pop	bc
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_error
	pop	bc
	pop	bc
	jp	i_223	;EOS
.i_222
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	push	hl
	call	_symstr
	pop	bc
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_caddr
	pop	bc
	push	hl
	call	_error
	pop	bc
	pop	bc
.i_223
	ld	hl,8193	;const
	pop	bc
	ret


.i_220
	ld	hl,(_S_gc)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	pop	de
	call	l_eq
	jp	nc,i_225	;
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,1	;const
	push	hl
	ld	l,2
	push	hl
	call	_check
	pop	bc
	pop	bc
	pop	bc
	call	l_gint4sp	;
	push	hl
	call	_cdr
	pop	bc
	ld	de,8197
	and	a
	sbc	hl,de
	scf
	jr	nz,ASMPC+3
	ccf
	jp	nc,i_226	;
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	ld	de,8197
	and	a
	sbc	hl,de
	scf
	jr	nz,ASMPC+3
	ccf
	ld	hl,0	;const
	rl	l
	ld	(_Verbose_GC),hl
.i_226
	ld	hl,1	;const
	push	hl
	call	_gc
	pop	bc
	ld	hl,8197	;const
	pop	bc
	ret


.i_225
	ld	hl,(_S_suspend)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	pop	de
	call	l_eq
	jp	nc,i_228	;
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,2	;const
	push	hl
	push	hl
	call	_check
	pop	bc
	pop	bc
	pop	bc
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	push	hl
	call	_symbolp
	pop	bc
	call	l_lneg
	jp	nc,i_229	;
	call	l_gint4sp	;
	push	hl
	call	_type
	pop	bc
.i_229
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	push	hl
	call	_symstr
	pop	bc
	push	hl
	call	_suspend
	pop	bc
	ld	hl,(_S_t)
	pop	bc
	ret


.i_228
	call	l_gint4sp	;
	push	hl
	call	_syntax
	pop	bc
	ld	hl,8193	;const
	pop	bc
	ret


.i_183
	pop	bc
	ret


	C_LINE	834,"kl.c::builtin::0::129"

; Function cklam flags 0x00000200 __smallc 
; void cklam(int x)
; parameter 'int x' at sp+2 size(2)
	C_LINE	834,"kl.c::cklam::0::129"
._cklam
	push	bc
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,3	;const
	push	hl
	ld	hl,65535	;const
	push	hl
	call	_check
	pop	bc
	pop	bc
	pop	bc
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	pop	bc
	push	hl
	jp	i_233	;EOS
.i_231
	pop	hl
	push	hl
	push	hl
	call	_cdr
	pop	bc
	pop	bc
	push	hl
.i_233
	pop	hl
	push	hl
	push	hl
	call	_atomp
	pop	bc
	call	l_lneg
	jp	nc,i_232	;
	pop	hl
	push	hl
	push	hl
	call	_car
	pop	bc
	push	hl
	call	_symbolp
	pop	bc
	call	l_lneg
	jp	nc,i_234	;
	call	l_gint4sp	;
	push	hl
	call	_syntax
	pop	bc
	jp	i_231	;EOS
.i_232
	pop	bc
	ret


	C_LINE	842,"kl.c::cklam::0::130"
	C_LINE	845,"kl.c::cklam::0::130"

; Function special flags 0x00000200 __smallc 
; int special(int x, int * pm)
; parameter 'int * pm' at sp+2 size(2)
; parameter 'int x' at sp+4 size(2)
	C_LINE	845,"kl.c::special::0::130"
._special
	ld	hl,(_S_quote)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	pop	de
	call	l_eq
	jp	nc,i_235	;
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,2	;const
	push	hl
	push	hl
	call	_check
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_munsave
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	ret


.i_235
	ld	hl,(_S_if)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	pop	de
	call	l_eq
	jp	nc,i_237	;
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,4	;const
	push	hl
	push	hl
	call	_check
	pop	bc
	pop	bc
	ld	hl,6	;const
	ex	(sp),hl
	call	_msave
	pop	bc
	ld	hl,2	;const
	add	hl,sp
	ld	hl,(hl)
	ld	(hl),1
	inc	hl
	ld	(hl),0
	call	l_gint4sp	;
	push	hl
	call	_cddr
	pop	bc
	push	hl
	call	_save
	pop	bc
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	ret


.i_237
	ld	hl,(_S_prog)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	pop	de
	call	l_eq
	jp	nc,i_239	;
	ld	hl,2	;const
	add	hl,sp
	ld	hl,(hl)
	ld	(hl),1
	inc	hl
	ld	(hl),0
	call	l_gint4sp	;
	push	hl
	call	_cdr
	pop	bc
	ld	de,8197
	call	l_eq
	jp	nc,i_240	;
	ld	hl,8197	;const
	ret


.i_240
	call	l_gint4sp	;
	push	hl
	call	_cddr
	pop	bc
	ld	de,8197
	call	l_eq
	jp	nc,i_241	;
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	ret


.i_241
	ld	hl,9	;const
	push	hl
	call	_msave
	pop	bc
	call	l_gint4sp	;
	push	hl
	call	_cddr
	pop	bc
	push	hl
	call	_save
	pop	bc
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	ret


.i_236
	ld	hl,(_S_ifnot)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	pop	de
	call	l_eq
	jp	nc,i_242	;
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,3	;const
	push	hl
	push	hl
	call	_check
	pop	bc
	pop	bc
	ld	hl,7	;const
	ex	(sp),hl
	call	_msave
	pop	bc
	ld	hl,2	;const
	add	hl,sp
	ld	hl,(hl)
	ld	(hl),1
	inc	hl
	ld	(hl),0
	call	l_gint4sp	;
	push	hl
	call	_caddr
	pop	bc
	push	hl
	call	_save
	pop	bc
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	ret


.i_242
	ld	hl,(_S_lambda)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	pop	de
	call	l_eq
	jp	nc,i_244	;
	call	l_gint4sp	;
	push	hl
	call	_cklam
	pop	bc
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_munsave
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
	ld	hl,(_S_lamstar)
	push	hl
	ld	hl,(_Env)
	push	hl
	call	l_gint8sp	;
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_cons
	pop	bc
	pop	bc
	push	hl
	call	_cons
	pop	bc
	pop	bc
	ret


.i_244
	ld	hl,(_S_lamstar)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	pop	de
	call	l_eq
	jp	nc,i_246	;
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,3	;const
	push	hl
	ld	hl,65535	;const
	push	hl
	call	_check
	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_munsave
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
	call	l_gint4sp	;
	ret


.i_246
	ld	hl,(_S_apply)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	pop	de
	call	l_eq
	jp	nc,i_248	;
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,3	;const
	push	hl
	push	hl
	call	_check
	pop	bc
	pop	bc
	ld	hl,5	;const
	ex	(sp),hl
	call	_msave
	pop	bc
	ld	hl,2	;const
	add	hl,sp
	ld	hl,(hl)
	ld	(hl),1
	inc	hl
	ld	(hl),0
	call	l_gint4sp	;
	push	hl
	call	_caddr
	pop	bc
	push	hl
	call	_save
	ld	hl,8197	;const
	ex	(sp),hl
	call	_save
	pop	bc
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	ret


.i_248
	ld	hl,(_S_macro)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	pop	de
	call	l_eq
	jp	nc,i_250	;
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,2	;const
	push	hl
	push	hl
	call	_check
	pop	bc
	pop	bc
	pop	bc
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	push	hl
	call	_atomp
	pop	bc
	ld	a,h
	or	l
	jp	nz,i_252	;
	call	l_gint4sp	;
	push	hl
	call	_caadr
	pop	bc
	ex	de,hl
	ld	hl,(_S_lambda)
	call	l_ne
	jp	nc,i_251	;
.i_252
	call	l_gint4sp	;
	push	hl
	call	_syntax
	pop	bc
.i_251
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	push	hl
	call	_cklam
	pop	bc
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_munsave
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
	ld	hl,(_S_macro)
	push	hl
	ld	hl,(_S_lamstar)
	push	hl
	ld	hl,(_Env)
	push	hl
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_cdadr
	pop	bc
	push	hl
	call	_cons
	pop	bc
	pop	bc
	push	hl
	call	_cons
	pop	bc
	pop	bc
	push	hl
	ld	hl,8197	;const
	push	hl
	call	_cons
	pop	bc
	pop	bc
	push	hl
	call	_cons
	pop	bc
	pop	bc
	ret


.i_250
	ld	hl,(_S_setq)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_car
	pop	bc
	pop	de
	call	l_eq
	jp	nc,i_255	;
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,3	;const
	push	hl
	push	hl
	call	_check
	pop	bc
	pop	bc
	pop	bc
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	push	hl
	call	_symbolp
	pop	bc
	call	l_lneg
	jp	nc,i_256	;
	call	l_gint4sp	;
	push	hl
	call	_syntax
	pop	bc
.i_256
	ld	hl,8	;const
	push	hl
	call	_msave
	pop	bc
	ld	hl,2	;const
	add	hl,sp
	ld	hl,(hl)
	ld	(hl),1
	inc	hl
	ld	(hl),0
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	push	hl
	call	_save
	pop	bc
	call	l_gint4sp	;
	push	hl
	call	_caddr
	pop	bc
	ret


.i_255
	call	l_gint4sp	;
	push	hl
	call	_syntax
	pop	bc
	ld	hl,8193	;const
	ret


.i_243
	ret


	C_LINE	915,"kl.c::special::0::141"

; Function bindargs flags 0x00000200 __smallc 
; void bindargs(int v, int a)
; parameter 'int a' at sp+2 size(2)
; parameter 'int v' at sp+4 size(2)
	C_LINE	915,"kl.c::bindargs::0::141"
._bindargs
	ld	hl,8197	;const
	push	hl
	push	bc
	push	hl
	call	_save
	pop	bc
.i_258
	call	l_gint8sp	;
	push	hl
	call	_atomp
	pop	bc
	call	l_lneg
	jp	nc,i_259	;
	call	l_gint6sp	;
	ld	de,8197
	call	l_eq
	jp	nc,i_260	;
	ld	hl,i_1+257
	push	hl
	ld	hl,(_Acc)
	push	hl
	call	_error
	pop	bc
	pop	bc
.i_260
	call	l_gint8sp	;
	push	hl
	call	_car
	pop	bc
	push	hl
	call	l_gint8sp	;
	push	hl
	call	_car
	pop	bc
	push	hl
	ld	hl,8197	;const
	push	hl
	call	_cons
	pop	bc
	pop	bc
	push	hl
	call	_cons
	pop	bc
	pop	bc
	pop	bc
	push	hl
	push	hl
	call	l_gint4sp	;
	push	hl
	call	_cons
	pop	bc
	pop	bc
	pop	de
	pop	bc
	push	hl
	push	de
	ld	hl,(_Stack)
	push	hl
	call	l_gint4sp	;
	push	hl
	call	_setcar
	pop	bc
	pop	bc
	ld	hl,8	;const
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
	ld	hl,6	;const
	add	hl,sp
	push	hl
	ld	hl,(hl)
	push	hl
	call	_cdr
	pop	bc
	pop	de
	ex	de,hl
	ld	(hl),de
	jp	i_258	;EOS
.i_259
	call	l_gint8sp	;
	push	hl
	call	_symbolp
	pop	bc
	ld	a,h
	or	l
	jp	z,i_261	;
	ld	hl,8	;const
	call	l_g2intspsp	;
	ld	hl,8197	;const
	push	hl
	call	_cons
	pop	bc
	pop	bc
	push	hl
	call	_cons
	pop	bc
	pop	bc
	pop	bc
	push	hl
	push	hl
	call	l_gint4sp	;
	push	hl
	call	_cons
	pop	bc
	pop	bc
	pop	de
	pop	bc
	push	hl
	push	de
	ld	hl,(_Stack)
	push	hl
	call	l_gint4sp	;
	push	hl
	call	_setcar
	pop	bc
	pop	bc
	jp	i_262	;EOS
.i_261
	call	l_gint6sp	;
	ld	de,8197
	and	a
	sbc	hl,de
	scf
	jr	nz,ASMPC+3
	ccf
	jp	nc,i_263	;
	ld	hl,i_1+270
	push	hl
	ld	hl,(_Acc)
	push	hl
	call	_error
	pop	bc
	pop	bc
.i_262
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	hl,(_Env)
	push	hl
	call	_cons
	pop	bc
	pop	bc
	ld	(_Env),hl
	ld	hl,1	;const
	push	hl
	call	_unsave
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	939,"kl.c::bindargs::0::145"

; Function funapp flags 0x00000200 __smallc 
; int funapp(int x)
; parameter 'int x' at sp+2 size(2)
	C_LINE	939,"kl.c::funapp::0::145"
._funapp
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	(_Acc),hl
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_car
	pop	bc
	push	hl
	call	_atomp
	pop	bc
	ld	a,h
	or	l
	jp	nz,i_265	;
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_caar
	pop	bc
	ex	de,hl
	ld	hl,(_S_lamstar)
	call	l_ne
	jp	nc,i_264	;
.i_265
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_syntax
	pop	bc
.i_264
	ld	hl,(_Mstack)
	ld	de,8197
	and	a
	sbc	hl,de
	scf
	jr	nz,ASMPC+3
	ccf
	jp	nc,i_268	;
	ld	hl,(_Mstack)
	push	hl
	call	_car
	pop	bc
	ld	de,4
	call	l_eq
	jp	nc,i_268	;
.i_269_i_268
	ld	hl,(_Acc)
	push	hl
	call	_cadar
	pop	bc
	ld	(_Env),hl
	ld	hl,(_Acc)
	push	hl
	call	_caddar
	pop	bc
	push	hl
	ld	hl,(_Acc)
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_bindargs
	pop	bc
	pop	bc
	jp	i_270	;EOS
.i_267
	ld	hl,(_Env)
	push	hl
	call	_save
	ld	hl,(_Acc)
	ex	(sp),hl
	call	_cadar
	pop	bc
	ld	(_Env),hl
	ld	hl,(_Acc)
	push	hl
	call	_caddar
	pop	bc
	push	hl
	ld	hl,(_Acc)
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_bindargs
	pop	bc
	ld	hl,4	;const
	ex	(sp),hl
	call	_msave
	pop	bc
.i_270
	ld	hl,(_S_prog)
	push	hl
	call	l_gint4sp	;
	push	hl
	call	_cdddar
	pop	bc
	push	hl
	call	_cons
	pop	bc
	pop	bc
	ret


	C_LINE	956,"kl.c::funapp::0::148"

; Function expand flags 0x00000200 __smallc 
; int expand(int x)
; parameter 'int x' at sp+2 size(2)
	C_LINE	956,"kl.c::expand::0::148"
._expand
	push	bc
	push	bc
	push	bc
	call	l_gint8sp	;
	push	hl
	call	_atomp
	pop	bc
	ld	a,h
	or	l
	jp	z,i_271	;
	call	l_gint8sp	;
	pop	bc
	pop	bc
	pop	bc
	ret


.i_271
	ld	hl,(_S_quote)
	push	hl
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_car
	pop	bc
	pop	de
	call	l_eq
	jp	nc,i_272	;
	call	l_gint8sp	;
	pop	bc
	pop	bc
	pop	bc
	ret


.i_272
	ld	hl,4	;const
	add	hl,sp
	push	hl
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_car
	pop	bc
	push	hl
	call	_symbolp
	pop	bc
	ld	a,h
	or	l
	jp	z,i_273	;
	ld	hl,10	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	_car
	pop	bc
	push	hl
	call	_lookup
	pop	bc
	push	hl
	call	_car
	pop	bc
	jp	i_274	;
.i_273
	ld	hl,8193	;const
.i_274
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
	call	l_gint4sp	;
	push	hl
	call	_atomp
	pop	bc
	call	l_lneg
	jp	nc,i_276	;
	call	l_gint4sp	;
	push	hl
	call	_car
	pop	bc
	ex	de,hl
	ld	hl,(_S_macro)
	call	l_eq
	jp	nc,i_276	;
.i_277_i_276
	call	l_gint8sp	;
	push	hl
	call	_cdr
	pop	bc
	push	hl
	ld	hl,8197	;const
	push	hl
	call	_cons
	pop	bc
	pop	bc
	pop	de
	pop	bc
	push	hl
	push	de
	ld	hl,(_S_quote)
	push	hl
	call	l_gint4sp	;
	push	hl
	call	_cons
	pop	bc
	pop	bc
	pop	de
	pop	bc
	push	hl
	push	de
	ld	hl,2	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	ld	hl,8197	;const
	push	hl
	call	_cons
	pop	bc
	pop	bc
	pop	de
	pop	bc
	push	hl
	push	de
	call	l_gint4sp	;
	push	hl
	call	_cadr
	pop	bc
	push	hl
	call	l_gint4sp	;
	push	hl
	call	_cons
	pop	bc
	pop	bc
	pop	de
	pop	bc
	push	hl
	push	de
	ld	hl,(_S_apply)
	push	hl
	call	l_gint4sp	;
	push	hl
	call	_cons
	pop	bc
	pop	bc
	pop	de
	pop	bc
	push	hl
	push	de
	push	hl
	call	_save
	pop	bc
	ld	hl,4	;const
	add	hl,sp
	push	hl
	dec	hl
	dec	hl
	ld	hl,(hl)
	push	hl
	call	_eval
	pop	bc
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
	ld	hl,(_Stack)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_setcar
	pop	bc
	pop	bc
	ld	hl,4	;const
	add	hl,sp
	push	hl
	ld	hl,(hl)
	push	hl
	call	_expand
	pop	bc
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
	ld	hl,1	;const
	push	hl
	call	_unsave
	pop	bc
	call	l_gint4sp	;
	pop	bc
	pop	bc
	pop	bc
	ret


.i_275
	call	l_gint8sp	;
	pop	bc
	push	hl
	jp	i_280	;EOS
.i_278
	pop	hl
	push	hl
	push	hl
	call	_cdr
	pop	bc
	pop	bc
	push	hl
.i_280
	pop	hl
	push	hl
	push	hl
	call	_atomp
	pop	bc
	call	l_lneg
	jp	c,i_278	;EOS
.i_279
	pop	hl
	push	hl
	push	hl
	call	_symbolp
	pop	bc
	ld	a,h
	or	l
	jp	z,i_281	;
	call	l_gint8sp	;
	pop	bc
	pop	bc
	pop	bc
	ret


.i_281
	call	l_gint8sp	;
	push	hl
	call	_save
	pop	bc
	ld	hl,4	;const
	add	hl,sp
	ld	de,8197	;const
	ld	(hl),de
	ex	de,hl
	push	hl
	call	_save
	pop	bc
	call	l_gint8sp	;
	pop	bc
	push	hl
	jp	i_284	;EOS
.i_282
	pop	hl
	push	hl
	push	hl
	call	_cdr
	pop	bc
	pop	bc
	push	hl
.i_284
	pop	hl
	push	hl
	ld	de,8197
	and	a
	sbc	hl,de
	scf
	jr	nz,ASMPC+3
	ccf
	jp	nc,i_283	;
	pop	hl
	push	hl
	push	hl
	call	_car
	pop	bc
	push	hl
	call	_expand
	pop	bc
	pop	de
	pop	bc
	push	hl
	push	de
	ld	hl,4	;const
	add	hl,sp
	push	hl
	ld	hl,4	;const
	add	hl,sp
	ld	hl,(hl)
	push	hl
	call	l_gint8sp	;
	push	hl
	call	_cons
	pop	bc
	pop	bc
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
	ld	hl,(_Stack)
	push	hl
	call	l_gint6sp	;
	push	hl
	call	_setcar
	pop	bc
	pop	bc
	jp	i_282	;EOS
.i_283
	ld	hl,4	;const
	add	hl,sp
	push	hl
	ld	hl,1	;const
	push	hl
	call	_unsave
	pop	bc
	push	hl
	call	_nrev
	pop	bc
	pop	de
	ex	de,hl
	ld	(hl),de
	ex	de,hl
	ld	hl,1	;const
	push	hl
	call	_unsave
	pop	bc
	call	l_gint4sp	;
	pop	bc
	pop	bc
	pop	bc
	ret


	C_LINE	990,"kl.c::expand::0::151"

; Function eval flags 0x00000200 __smallc 
; int eval(int x)
; parameter 'int x' at sp+2 size(2)
	C_LINE	990,"kl.c::eval::0::151"
._eval
	push	bc
	push	bc
	call	l_gint6sp	;
	push	hl
	call	_expand
	pop	bc
	ld	(_Acc),hl
	ld	hl,0	;const
	push	hl
	call	_msave
	pop	bc
	ld	hl,1	;const
	pop	bc
	push	hl
.i_287
	ld	hl,(_Error)
	ld	de,0
	call	l_eq
	jp	nc,i_286	;
	pop	hl
	push	hl
.i_290
	call	l_case
	defw	i_291
	defw	1
	defw	i_299
	defw	2
	defw	i_302
	defw	5
	defw	i_305
	defw	6
	defw	i_308
	defw	7
	defw	i_311
	defw	3
	defw	i_316
	defw	4
	defw	i_317
	defw	8
	defw	i_318
	defw	9
	defw	i_321
	defw	0
	defw	0
	jp	i_289	;EOS
.i_291
	ld	hl,(_Acc)
	push	hl
	call	_symbolp
	pop	bc
	ld	a,h
	or	l
	jp	z,i_292	;
	ld	hl,(_Acc)
	push	hl
	call	_lookup
	pop	bc
	push	hl
	call	_car
	pop	bc
	pop	de
	pop	bc
	push	hl
	push	de
	ld	de,8193
	call	l_eq
	jp	nc,i_293	;
	ld	hl,i_1+281
	push	hl
	ld	hl,(_Acc)
	push	hl
	call	_error
	pop	bc
	pop	bc
.i_293
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	(_Acc),hl
	call	_munsave
	pop	bc
	push	hl
	jp	i_294	;EOS
.i_292
	ld	hl,(_Acc)
	push	hl
	call	_atomp
	pop	bc
	ld	a,h
	or	l
	jp	z,i_295	;
	call	_munsave
	pop	bc
	push	hl
	jp	i_296	;EOS
.i_295
	ld	hl,(_Acc)
	push	hl
	call	_car
	pop	bc
	push	hl
	call	_specialp
	pop	bc
	ld	a,h
	or	l
	jp	z,i_297	;
	ld	hl,3	;const
	pop	bc
	push	hl
	jp	i_298	;EOS
.i_297
	ld	hl,(_Acc)
	push	hl
	call	_cdr
	pop	bc
	push	hl
	call	_save
	ld	hl,(_Acc)
	ex	(sp),hl
	call	_car
	pop	bc
	ld	(_Acc),hl
	ld	hl,8197	;const
	push	hl
	call	_save
	ld	hl,2	;const
	ex	(sp),hl
	call	_msave
	pop	bc
	jp	i_289	;EOS
.i_299
	ld	hl,(_Stack)
	push	hl
	call	_cadr
	pop	bc
	ld	de,8197
	call	l_eq
	jp	nc,i_300	;
	ld	hl,(_Acc)
	push	hl
	ld	hl,1	;const
	push	hl
	call	_unsave
	pop	bc
	push	hl
	call	_cons
	pop	bc
	pop	bc
	push	hl
	call	_nrev
	pop	bc
	ld	(_Acc),hl
	ld	hl,1	;const
	push	hl
	call	_unsave
	pop	bc
	ld	hl,3	;const
	pop	bc
	push	hl
	jp	i_301	;EOS
.i_300
	ld	hl,(_Stack)
	push	hl
	ld	de,(_Acc)
	push	de
	push	hl
	call	_car
	pop	bc
	push	hl
	call	_cons
	pop	bc
	pop	bc
	push	hl
	call	_setcar
	pop	bc
	ld	hl,(_Stack)
	ex	(sp),hl
	call	_caadr
	pop	bc
	ld	(_Acc),hl
	ld	hl,(_Stack)
	push	hl
	call	_cdr
	pop	bc
	push	hl
	ld	hl,(_Stack)
	push	hl
	call	_cdadr
	pop	bc
	push	hl
	call	_setcar
	pop	bc
	pop	bc
	pop	hl
	push	hl
	push	hl
	call	_msave
	pop	bc
	ld	hl,1	;const
	pop	bc
	push	hl
	jp	i_289	;EOS
.i_302
	ld	hl,(_Stack)
	push	hl
	call	_car
	pop	bc
	ld	de,8197
	call	l_eq
	jp	nc,i_303	;
	ld	hl,(_Stack)
	push	hl
	ld	hl,(_Acc)
	push	hl
	call	_setcar
	pop	bc
	ld	hl,(_Stack)
	ex	(sp),hl
	call	_cadr
	pop	bc
	ld	(_Acc),hl
	ld	hl,5	;const
	push	hl
	call	_msave
	pop	bc
	ld	hl,1	;const
	pop	bc
	push	hl
	jp	i_304	;EOS
.i_303
	ld	hl,1	;const
	push	hl
	call	_unsave
	pop	bc
	pop	de
	pop	bc
	push	hl
	push	de
	ld	hl,1	;const
	push	hl
	call	_unsave
	pop	bc
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	hl,(_Acc)
	push	hl
	call	_cons
	pop	bc
	pop	bc
	ld	(_Acc),hl
	ld	hl,3	;const
	pop	bc
	push	hl
	jp	i_289	;EOS
.i_305
	ld	hl,1	;const
	push	hl
	call	_unsave
	pop	bc
	pop	de
	pop	bc
	push	hl
	push	de
	ld	hl,(_Acc)
	ld	de,8197
	call	l_eq
	jp	nc,i_306	;
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_cadr
	pop	bc
	ld	(_Acc),hl
	jp	i_307	;EOS
.i_306
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_car
	pop	bc
	ld	(_Acc),hl
.i_307
	ld	hl,1	;const
	pop	bc
	push	hl
	jp	i_289	;EOS
.i_308
	ld	hl,1	;const
	push	hl
	call	_unsave
	pop	bc
	pop	de
	pop	bc
	push	hl
	push	de
	ld	hl,(_Acc)
	ld	de,8197
	call	l_eq
	jp	nc,i_309	;
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	(_Acc),hl
	ld	hl,1	;const
	pop	bc
	push	hl
	jp	i_310	;EOS
.i_309
	call	_munsave
	pop	bc
	push	hl
	jp	i_289	;EOS
.i_311
	ld	hl,(_Acc)
	push	hl
	call	_car
	pop	bc
	push	hl
	call	_specialp
	pop	bc
	ld	a,h
	or	l
	jp	z,i_312	;
	ld	hl,(_Acc)
	push	hl
	ld	hl,2	;const
	add	hl,sp
	push	hl
	call	_special
	pop	bc
	pop	bc
	ld	(_Acc),hl
	jp	i_313	;EOS
.i_312
	ld	hl,(_Acc)
	push	hl
	call	_car
	pop	bc
	push	hl
	call	_symbolp
	pop	bc
	ld	a,h
	or	l
	jp	z,i_314	;
	ld	hl,(_Acc)
	push	hl
	call	_builtin
	pop	bc
	ld	(_Acc),hl
	call	_munsave
	pop	bc
	push	hl
	jp	i_315	;EOS
.i_314
	ld	hl,(_Acc)
	push	hl
	call	_funapp
	pop	bc
	ld	(_Acc),hl
	ld	hl,1	;const
	pop	bc
	push	hl
	jp	i_289	;EOS
.i_316
	ld	hl,1	;const
	push	hl
	call	_unsave
	pop	bc
	ld	(_Env),hl
	call	_munsave
	pop	bc
	push	hl
	jp	i_289	;EOS
.i_317
	ld	hl,1	;const
	push	hl
	call	_unsave
	pop	bc
	pop	de
	pop	bc
	push	hl
	push	de
	push	hl
	call	_lookup
	pop	bc
	push	hl
	ld	hl,(_Acc)
	push	hl
	call	_setcar
	pop	bc
	pop	bc
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	(_Acc),hl
	call	_munsave
	pop	bc
	push	hl
	jp	i_289	;EOS
.i_318
	ld	hl,(_Stack)
	push	hl
	call	_cdar
	pop	bc
	ld	de,8197
	call	l_eq
	jp	nc,i_319	;
	ld	hl,1	;const
	push	hl
	call	_unsave
	pop	bc
	push	hl
	call	_car
	pop	bc
	ld	(_Acc),hl
	ld	hl,1	;const
	pop	bc
	push	hl
	jp	i_320	;EOS
.i_319
	ld	hl,(_Stack)
	push	hl
	call	_caar
	pop	bc
	ld	(_Acc),hl
	ld	hl,(_Stack)
	push	hl
	push	hl
	call	_cdar
	pop	bc
	push	hl
	call	_setcar
	pop	bc
	ld	hl,9	;const
	ex	(sp),hl
	call	_msave
	pop	bc
	ld	hl,1	;const
	pop	bc
	push	hl
	jp	i_289	;EOS
.i_321
	ld	hl,(_Acc)
	pop	bc
	pop	bc
	ret
.i_286
	ld	hl,8197	;const
	pop	bc
	pop	bc
	ret


	C_LINE	1107,"kl.c::eval::0::169"

; Function init flags 0x00000200 __smallc 
; void init()
	C_LINE	1107,"kl.c::init::0::169"
._init
	ld	hl,0	;const
	ld	(_Verbose_GC),hl
	ld	hl,8197	;const
	ld	(_Symbols),hl
	ld	(_Tmpcar),hl
	ld	hl,8197	;const
	ld	(_Tmpcdr),hl
	ld	(_Tmp),hl
	ld	hl,0	;const
	ld	(_Id),hl
	ld	hl,8197	;const
	ld	(_Freelist),hl
	ld	hl,0	;const
	ld	(_Input),hl
	ld	hl,_Buffer
	ld	(_Inbuf),hl
	ld	hl,0	;const
	ld	(_Ink),hl
	ld	(_Inp),hl
	ld	hl,1	;const
	ld	(_Output),hl
	ld	hl,0	;const
	ld	(_Outp),hl
	ld	hl,8196	;const
	ld	(_Rejected),hl
	ld	hl,0	;const
	ld	(_Parens),hl
	ld	hl,8197	;const
	ld	(_Stack),hl
	ld	(_Mstack),hl
	ld	hl,0	;const
	ld	(_Error),hl
	ld	hl,8197	;const
	ld	(_Env),hl
	ld	hl,i_1+142
	push	hl
	ld	hl,8192	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_t),hl
	ld	hl,i_1+291
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_apply),hl
	ld	hl,i_1+297
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_if),hl
	ld	hl,i_1+300
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_ifnot),hl
	ld	hl,i_1+306
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_lambda),hl
	ld	hl,i_1+313
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_lamstar),hl
	ld	hl,i_1+321
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_macro),hl
	ld	hl,i_1+327
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_prog),hl
	ld	hl,i_1+332
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_quote),hl
	ld	hl,i_1+338
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_qquote),hl
	ld	hl,i_1+345
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_unquote),hl
	ld	hl,i_1+353
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_splice),hl
	ld	hl,i_1+360
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_setq),hl
	ld	hl,i_1+365
	push	hl
	ld	hl,8193	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_it),hl
	ld	hl,i_1+368
	push	hl
	ld	hl,8192	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_cons),hl
	ld	hl,i_1+373
	push	hl
	ld	hl,8192	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_car),hl
	ld	hl,i_1+377
	push	hl
	ld	hl,8192	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_cdr),hl
	ld	hl,i_1+381
	push	hl
	ld	hl,8192	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_atom),hl
	ld	hl,i_1+386
	push	hl
	ld	hl,8192	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_eq),hl
	ld	hl,i_1+389
	push	hl
	ld	hl,8192	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_eofp),hl
	ld	hl,i_1+394
	push	hl
	ld	hl,8192	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_setcar),hl
	ld	hl,i_1+401
	push	hl
	ld	hl,8192	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_setcdr),hl
	ld	hl,i_1+408
	push	hl
	ld	hl,8192	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_gensym),hl
	ld	hl,i_1+415
	push	hl
	ld	hl,8192	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_read),hl
	ld	hl,i_1+420
	push	hl
	ld	hl,8192	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_prin),hl
	ld	hl,i_1+425
	push	hl
	ld	hl,8192	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_prin1),hl
	ld	hl,i_1+431
	push	hl
	ld	hl,8192	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_print),hl
	ld	hl,i_1+217
	push	hl
	ld	hl,8192	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_error),hl
	ld	hl,i_1+206
	push	hl
	ld	hl,8192	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_load),hl
	ld	hl,i_1+437
	push	hl
	ld	hl,8192	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_gc),hl
	ld	hl,i_1+223
	push	hl
	ld	hl,8192	;const
	push	hl
	call	_addsym
	pop	bc
	pop	bc
	ld	(_S_suspend),hl
	ret


	C_LINE	1159,"kl.c::init::0::170"

; Function kbint flags 0x00000200 __smallc 
; void kbint(int x)
; parameter 'int x' at sp+2 size(2)
	C_LINE	1159,"kl.c::kbint::0::170"
._kbint
	ld	hl,1	;const
	ld	(_Error),hl
	ret


	C_LINE	1160,"kl.c::kbint::0::171"

; Function kbbrk flags 0x00000200 __smallc 
; int kbbrk()
	C_LINE	1160,"kl.c::kbbrk::0::171"
._kbbrk
	ld	hl,1	;const
	ld	(_Error),hl
	ret


	C_LINE	1162,"kl.c::kbbrk::0::172"

; Function main flags 0x00000000 __stdc 
; int main(int argc, char * * argv)
; parameter 'int argc' at 2 size(2)
; parameter 'char * * argv' at 4 size(2)
	C_LINE	1162,"kl.c::main::0::173"
._main
	call	_init
	ld	hl,_Restart
	push	hl
	call	l_setjmp
	pop	bc
	ld	a,h
	or	l
	jp	z,i_322	;
	ld	hl,1	;const
	call	exit_fastcall
.i_322
	pop	bc
	pop	de
	push	de
	push	bc
	ld	hl,1
	call	l_gt
	jp	nc,i_325	;
	call	l_gint4sp	;
	call	l_gint2	;
	jp	i_326	;
.i_325
	ld	hl,i_1+440
.i_326
	push	hl
	call	_fasload
	pop	bc
	ld	hl,_Restart
	push	hl
	call	l_setjmp
	pop	bc
	ld	hl,(_SIGINT)
	push	hl
	ld	hl,_kbint
	push	hl
	call	_signal
	pop	bc
	pop	bc
.i_327
	ld	hl,0	;const
	ld	(_Parens),hl
	ld	(_Loads),hl
	ld	hl,0	;const
	ld	(_Error),hl
	ld	hl,8197	;const
	ld	(_Env),hl
	ld	(_Acc),hl
	ld	hl,8197	;const
	ld	(_Mstack),hl
	ld	(_Stack),hl
	ld	hl,i_1+446
	push	hl
	call	_pr
	pop	bc
	call	_flush
	call	_xread
	ld	(_Acc),hl
	ld	hl,(_Error)
	ld	a,h
	or	l
	jp	nz,i_327	;EOS
.i_330
	ld	hl,(_Acc)
	ld	de,8196
	call	l_eq
	jp	c,i_328	;EOS
.i_331
	ld	hl,(_Acc)
	push	hl
	call	_eval
	pop	bc
	push	hl
	call	_print
	ld	hl,(_S_it)
	ex	(sp),hl
	call	_cdr
	pop	bc
	push	hl
	ld	hl,(_Acc)
	push	hl
	call	_setcar
	pop	bc
	pop	bc
	call	_nl
	jp	i_327	;EOS
.i_328
	call	_nl
	ld	hl,0	;const
	ret


	SECTION	bss_compiler
	SECTION	code_compiler
; --- Start of Optimiser additions ---
	defc	i_28 = i_26
	defc	i_39 = i_37
	defc	i_88 = i_87
	defc	i_97 = i_100
	defc	i_105 = i_106
	defc	i_129 = i_127
	defc	i_127 = i_125
	defc	i_125 = i_122
	defc	i_122 = i_119
	defc	i_119 = i_116
	defc	i_116 = i_114
	defc	i_114 = i_112
	defc	i_149 = i_148
	defc	i_141 = i_139
	defc	i_139 = i_135
	defc	i_135 = i_133
	defc	i_163 = i_166_i_164
	defc	i_230 = i_227
	defc	i_227 = i_224
	defc	i_224 = i_219
	defc	i_219 = i_216
	defc	i_216 = i_214
	defc	i_214 = i_212
	defc	i_212 = i_210
	defc	i_210 = i_208
	defc	i_208 = i_204
	defc	i_204 = i_202
	defc	i_202 = i_199
	defc	i_199 = i_196
	defc	i_196 = i_194
	defc	i_194 = i_190
	defc	i_190 = i_186
	defc	i_186 = i_183
	defc	i_239 = i_238
	defc	i_238 = i_236
	defc	i_257 = i_254
	defc	i_254 = i_249
	defc	i_249 = i_247
	defc	i_247 = i_245
	defc	i_245 = i_243
	defc	i_263 = i_262
	defc	i_285 = i_287
	defc	i_298 = i_296
	defc	i_296 = i_294
	defc	i_315 = i_313
	defc	i_11 = i_8
	defc	i_25 = i_26
	defc	i_26 = i_17
	defc	i_33 = i_29
	defc	i_51 = i_48
	defc	i_95 = i_92
	defc	i_96 = i_91
	defc	i_107 = i_97
	defc	i_143 = i_142
	defc	i_148 = i_145
	defc	i_156 = i_153
	defc	i_154 = i_150
	defc	i_164 = i_162
	defc	i_234 = i_231
	defc	i_268 = i_267
	defc	i_276 = i_275
	defc	i_294 = i_289
	defc	i_301 = i_289
	defc	i_304 = i_289
	defc	i_310 = i_289
	defc	i_313 = i_289
	defc	i_320 = i_289
	defc	i_289 = i_285

	SECTION	rodata_compiler
.i_1
	defm	""
	defb	10

	defm	""
	defb	0

	defm	"? "
	defb	0

	defm	": "
	defb	0

	defm	"? aborting"
	defb	0

	defm	" nodes reclaimed"
	defb	0

	defm	"out of nodes"
	defb	0

	defm	"stack empty"
	defb	0

	defm	"mstack empty"
	defb	0

	defm	"bad pair"
	defb	0

	defm	"missing ')'"
	defb	0

	defm	"long symbol"
	defb	0

	defm	"nil"
	defb	0

	defm	"syntax"
	defb	0

	defm	"type"
	defb	0

	defm	"extra paren"
	defb	0

	defm	"free dot"
	defb	0

	defm	"print depth"
	defb	0

	defm	"stop"
	defb	0

	defm	"*eot*"
	defb	0

	defm	"*unprintable*"
	defb	0

	defm	"*closure*"
	defb	0

	defm	"("
	defb	0

	defm	" . "
	defb	0

	defm	")"
	defb	0

	defm	"nested load"
	defb	0

	defm	"write error"
	defb	0

	defm	"suspend"
	defb	0

	defm	"KL21"
	defb	0

	defm	"read error"
	defb	0

	defm	"bad image"
	defb	0

	defm	"too few args"
	defb	0

	defm	"extra args"
	defb	0

	defm	"undefined"
	defb	0

	defm	"apply"
	defb	0

	defm	"if"
	defb	0

	defm	"ifnot"
	defb	0

	defm	"lambda"
	defb	0

	defm	"lambda*"
	defb	0

	defm	"macro"
	defb	0

	defm	"prog"
	defb	0

	defm	"quote"
	defb	0

	defm	"qquote"
	defb	0

	defm	"unquote"
	defb	0

	defm	"splice"
	defb	0

	defm	"setq"
	defb	0

	defm	"it"
	defb	0

	defm	"cons"
	defb	0

	defm	"car"
	defb	0

	defm	"cdr"
	defb	0

	defm	"atom"
	defb	0

	defm	"eq"
	defb	0

	defm	"eofp"
	defb	0

	defm	"setcar"
	defb	0

	defm	"setcdr"
	defb	0

	defm	"gensym"
	defb	0

	defm	"read"
	defb	0

	defm	"prin"
	defb	0

	defm	"prin1"
	defb	0

	defm	"print"
	defb	0

	defm	"gc"
	defb	0

	defm	"klisp"
	defb	0

	defm	"* "
	defb	0


; --- Start of Static Variables ---

	SECTION	bss_compiler
._Tag	defs	8192
._Car	defs	16384
._Cdr	defs	16384
._Freelist	defs	2
._Acc	defs	2
._Env	defs	2
._Stack	defs	2
._Mstack	defs	2
._Tmp	defs	2
._Tmpcar	defs	2
._Tmpcdr	defs	2
._Input	defs	2
._Inp	defs	2
._Ink	defs	2
._Inbuf	defs	2
._Buffer	defs	128
._Rejected	defs	2
._Output	defs	2
._Outp	defs	2
._Outbuf	defs	128
._Symbols	defs	2
._Id	defs	2
._Restart	defs	8
._Error	defs	2
._Parens	defs	2
._Loads	defs	2
._Verbose_GC	defs	2
._S_apply	defs	2
._S_if	defs	2
._S_ifnot	defs	2
._S_lambda	defs	2
._S_lamstar	defs	2
._S_macro	defs	2
._S_prog	defs	2
._S_quote	defs	2
._S_qquote	defs	2
._S_unquote	defs	2
._S_splice	defs	2
._S_setq	defs	2
._S_t	defs	2
._S_cons	defs	2
._S_car	defs	2
._S_cdr	defs	2
._S_atom	defs	2
._S_eq	defs	2
._S_gensym	defs	2
._S_it	defs	2
._S_suspend	defs	2
._S_gc	defs	2
._S_eofp	defs	2
._S_load	defs	2
._S_setcar	defs	2
._S_setcdr	defs	2
._S_read	defs	2
._S_prin	defs	2
._S_prin1	defs	2
._S_print	defs	2
._S_error	defs	2
._st_ntoa_buf	defs	20
._st_symstr_b	defs	66
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
	GLOBAL	l_setjmp
	GLOBAL	l_longjmp
	GLOBAL	_environ
	GLOBAL	execl
	GLOBAL	execv
	GLOBAL	_Tag
	GLOBAL	_Car
	GLOBAL	_Cdr
	GLOBAL	_Freelist
	GLOBAL	_Acc
	GLOBAL	_Env
	GLOBAL	_Stack
	GLOBAL	_Mstack
	GLOBAL	_Tmp
	GLOBAL	_Tmpcar
	GLOBAL	_Tmpcdr
	GLOBAL	_Input
	GLOBAL	_Inp
	GLOBAL	_Ink
	GLOBAL	_Inbuf
	GLOBAL	_Buffer
	GLOBAL	_Rejected
	GLOBAL	_Output
	GLOBAL	_Outp
	GLOBAL	_Outbuf
	GLOBAL	_Symbols
	GLOBAL	_Id
	GLOBAL	_Restart
	GLOBAL	_Error
	GLOBAL	_Parens
	GLOBAL	_Loads
	GLOBAL	_Verbose_GC
	GLOBAL	_S_apply
	GLOBAL	_S_if
	GLOBAL	_S_ifnot
	GLOBAL	_S_lambda
	GLOBAL	_S_lamstar
	GLOBAL	_S_macro
	GLOBAL	_S_prog
	GLOBAL	_S_quote
	GLOBAL	_S_qquote
	GLOBAL	_S_unquote
	GLOBAL	_S_splice
	GLOBAL	_S_setq
	GLOBAL	_S_t
	GLOBAL	_S_cons
	GLOBAL	_S_car
	GLOBAL	_S_cdr
	GLOBAL	_S_atom
	GLOBAL	_S_eq
	GLOBAL	_S_gensym
	GLOBAL	_S_it
	GLOBAL	_S_suspend
	GLOBAL	_S_gc
	GLOBAL	_S_eofp
	GLOBAL	_S_load
	GLOBAL	_S_setcar
	GLOBAL	_S_setcdr
	GLOBAL	_S_read
	GLOBAL	_S_prin
	GLOBAL	_S_prin1
	GLOBAL	_S_print
	GLOBAL	_S_error
	GLOBAL	_car
	GLOBAL	_cdr
	GLOBAL	_setcar
	GLOBAL	_setcdr
	GLOBAL	_atomp
	GLOBAL	_symbolp
	GLOBAL	_caar
	GLOBAL	_cadr
	GLOBAL	_cdar
	GLOBAL	_cddr
	GLOBAL	_caadr
	GLOBAL	_cadar
	GLOBAL	_caddr
	GLOBAL	_cdadr
	GLOBAL	_cddar
	GLOBAL	_caddar
	GLOBAL	_cdddar
	GLOBAL	_pr
	GLOBAL	_flush
	GLOBAL	_nl
	GLOBAL	_ntoa
	GLOBAL	_prnum
	GLOBAL	_print
	GLOBAL	_error
	GLOBAL	_fatal
	GLOBAL	_mark
	GLOBAL	_gc
	GLOBAL	_cons3
	GLOBAL	_cons
	GLOBAL	_nrev
	GLOBAL	_save
	GLOBAL	_unsave
	GLOBAL	_msave
	GLOBAL	_munsave
	GLOBAL	_strsym
	GLOBAL	_symstr
	GLOBAL	_findsym
	GLOBAL	_addsym
	GLOBAL	_rdch
	GLOBAL	_rdchci
	GLOBAL	_xread
	GLOBAL	_rdlist
	GLOBAL	_symbolic
	GLOBAL	_rdsym
	GLOBAL	_syntax
	GLOBAL	_quote
	GLOBAL	_rdword
	GLOBAL	_type
	GLOBAL	_print2
	GLOBAL	_lookup
	GLOBAL	_specialp
	GLOBAL	_check
	GLOBAL	_eval
	GLOBAL	_load
	GLOBAL	_dowrite
	GLOBAL	_suspend
	GLOBAL	_doread
	GLOBAL	_fasload
	GLOBAL	_builtin
	GLOBAL	_cklam
	GLOBAL	_special
	GLOBAL	_bindargs
	GLOBAL	_funapp
	GLOBAL	_expand
	GLOBAL	_init
	GLOBAL	_kbint
	GLOBAL	_kbbrk
	GLOBAL	_main
	GLOBAL	_signal
	GLOBAL	_SIGINT


; --- End of Scope Defns ---


; --- End of Compilation ---
