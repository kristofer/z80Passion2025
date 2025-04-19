
default: all

klispc:
	@echo "Building klispc..."
	mkdir -p bin
	zcc +agon -o bin/klc.bin main.c -DAMALLOC
	cp bin/klc.bin ~/LocalProjects/agon-emulator/fab-agon-emulator/sdcard/bin

hello:
	@echo "Building hello world..."
	mkdir -p bin
	zcc +agon -o bin/hello.bin hello.c -DAMALLOC
	cp bin/hello.bin ~/LocalProjects/agon-emulator/fab-agon-emulator/sdcard/bin


clean:
	@echo "Cleaning project..."
	rm -rf bin
	rm -rf src/*.bin
	
all: klispc hello
	@echo "All targets built successfully."
	@echo "You can find the binaries in the bin directory."
	@echo "Remember to copy them to the appropriate location for your emulator."
