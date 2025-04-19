# ----------------------------
# Makefile Options
# ----------------------------

EZ80ASM            = ez80asm
EZ80ASM_FLAGS      = -x -m 
RM                 = rm -f
# FAB_AGON_EMU       = fab-agon-emulator
# FAB_AGON_EMU_FLAGS = --vdp ~/development/tools/fab-agon/firmware/vdp_console8.so --mos ~/development/tools/fab-agon/firmware/mos_console8.bin --sdcard bin/

default: all

main:
	@echo "Building project..."
	mkdir -p bin
	$(EZ80ASM) $(EZ80ASM_FLAGS) src/main.asm
	mv src/main.bin bin/main.bin

symtest:
	@echo "Building project..."
	mkdir -p bin
	$(EZ80ASM) $(EZ80ASM_FLAGS) src/symtest.asm
	mv src/symtest.bin bin/symtest.bin

regtest:
	@echo "Building project..."
	mkdir -p bin
	$(EZ80ASM) $(EZ80ASM_FLAGS) src/regtest.asm
	mv src/regtest.bin bin/regtest.bin

hellowait:
	@echo "Building project..."
	mkdir -p bin
	$(EZ80ASM) $(EZ80ASM_FLAGS) src/hellowait.asm
	mv src/hellowait.bin bin/hellowait.bin


clean:
	@echo "Cleaning project..."
	rm -rf bin
	rm -rf src/*.bin
	
run:
	@echo "Launching emulator..."
	$(FAB_AGON_EMU) $(FAB_AGON_EMU_FLAGS) 
