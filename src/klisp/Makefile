# ----------------------------
# Makefile Options
# ----------------------------

EZ80ASM            = ez80asm
EZ80ASM_FLAGS      = -x
RM                 = rm -f
# FAB_AGON_EMU       = fab-agon-emulator
# FAB_AGON_EMU_FLAGS = --vdp ~/development/tools/fab-agon/firmware/vdp_console8.so --mos ~/development/tools/fab-agon/firmware/mos_console8.bin --sdcard bin/

default: all

all: kl0.asm
	@echo "Building project..."
	mkdir -p bin
	$(EZ80ASM) $(EZ80ASM_FLAGS) kl0.asm
	mv main.bin bin/klisp0.bin

clean:
	@echo "Cleaning project..."
	rm -rf bin
#	rm -rf src/*.bin
	
run:
	@echo "Launching emulator..."
	$(FAB_AGON_EMU) $(FAB_AGON_EMU_FLAGS) 
