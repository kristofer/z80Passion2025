# Test programs Makefile for Agon Light 2 VDP input testing

# Tool directories and configuration
AGONTOOLS = $(shell agondev-config --prefix)
CC = $(AGONTOOLS)/bin/ez80-none-elf-clang
CFLAGS = -target ez80-none-elf -v -Oz -Wa,-march=ez80+full -I $(AGONTOOLS)/include

# Memory and linker configuration
RAM_START = 0x40000
RAM_SIZE = 0x70000
LINKER = $(AGONTOOLS)/bin/ez80-none-elf-ld
LINKERCONFIG = $(AGONTOOLS)/config/linker.conf
LINKER_EXIT = -defsym=_has_exit_handler=0
LINKER_ARGS = -defsym=_parse_option=0
MEMCONFIG = -defsym=RAM_START=$(RAM_START) -defsym=RAM_SIZE=$(RAM_SIZE)
LINKERLIBFLAGS = -L$(AGONTOOLS)/lib -\( -l c -l agon -l crt -l fp -\)
SETPROGNAME = $(AGONTOOLS)/bin/agondev-setname

# Directories
OBJDIR = obj
BINDIR = bin

# Programs to build
PROGRAMS = key_logger key_visualizer key_event_tester input_latency_test vdp_key_tester arrow_key_test
BINARIES = $(patsubst %,$(BINDIR)/%.bin,$(PROGRAMS))

# Default target builds all binaries
all: dirs $(BINARIES)

# Create directories
dirs:
	@mkdir -p $(OBJDIR) $(BINDIR)

# Clean build files
clean:
	@rm -f $(OBJDIR)/*.o $(BINDIR)/*.bin $(BINDIR)/*.map
	@echo "Cleaned build files"

# Build a single .c file into a .bin file
$(BINDIR)/%.bin: %.c
	@echo "Building $<..."
	@$(CC) $(CFLAGS) -c $< -o $(OBJDIR)/$*.o
	@$(LINKER) $(MEMCONFIG) $(LINKER_ARGS) $(LINKER_EXIT) -Map=$(BINDIR)/$*.map -T $(LINKERCONFIG) --oformat binary -o $@ $(OBJDIR)/$*.o $(LINKERLIBFLAGS)
	@$(SETPROGNAME) $@ >/dev/null
	@echo "$@ built successfully"

# Individual targets for convenience
key_logger: $(BINDIR)/key_logger.bin
key_visualizer: $(BINDIR)/key_visualizer.bin
key_event_tester: $(BINDIR)/key_event_tester.bin
input_latency_test: $(BINDIR)/input_latency_test.bin
vdp_key_tester: $(BINDIR)/vdp_key_tester.bin
arrow_key_test: $(BINDIR)/arrow_key_test.bin

# Copy all binaries to a specified location
# Usage: make copy DEST=/path/to/destination
copy: all
	@if [ -z "$(DEST)" ]; then \
		echo "Error: DEST is not set. Use 'make copy DEST=/path/to/destination'"; \
		exit 1; \
	fi
	@echo "Copying binaries to $(DEST)"
	@mkdir -p $(DEST)
	@cp $(BINARIES) $(DEST)
	@echo "All binaries copied to $(DEST)"

.PHONY: all clean dirs copy $(PROGRAMS)