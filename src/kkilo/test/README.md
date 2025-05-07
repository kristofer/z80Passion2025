# Agon VDP Input Testing Utilities

This directory contains testing utilities for understanding and debugging input handling on the Agon Light 2 VDP, specifically focused on issues that might affect text editors like kilo.

## Available Test Programs

1. **key_logger.c** - Records all keypress codes to a file for analysis
   - Creates detailed keylog.txt file
   - Shows real-time key codes on screen

2. **key_visualizer.c** - Interactive display of key codes with history
   - Shows hex codes and interpretations
   - Maintains a visual history of recent keys
   - Identifies special keys like arrows

3. **key_event_tester.c** - Tests timing and sequence of keypresses
   - Records timestamps for each key
   - Can generate reports during testing (Ctrl+P)
   - Useful for detecting key sequence issues

4. **input_latency_test.c** - Measures input timing and latency
   - Calculates average time between keypresses
   - Helps identify VDP input processing delays
   - Shows timing statistics in milliseconds

5. **vdp_key_tester.c** - Tests the VDP key API directly
   - Uses event callbacks from VDP key system
   - Monitors the key state bits array
   - Compares stdio input with VDP events

6. **arrow_key_test.c** - Specifically tests arrow key handling for kilo
   - Maps raw key codes to kilo's internal constants
   - Shows history of navigation keys
   - Logs detailed key mappings for reference

## Building and Running

To build all test programs:
```
cd test
mkdir -p bin obj
make
```

This will create binary files in the `bin` directory with the `.c.bin` extension, ready to be copied to your Agon device or emulator.

To build a specific test:
```
make key_logger        # Builds bin/key_logger.c.bin
make vdp_key_tester    # Builds bin/vdp_key_tester.c.bin
```

To copy all test binaries to a specific location:
```
make copy DEST=/path/to/destination
```

## Running Tests on the Agon

1. Copy the generated `.bin` files to your Agon's SD card or emulator directory
2. Run the program from MOS by typing:
   ```
   *./key_logger.c.bin
   ```
   
3. Each program will create a log file in the current directory

## Troubleshooting Tips

1. If arrow keys behave inconsistently, check if the raw key codes match those expected in `editorReadKey()` in kilo.c.

2. For any key mapping issues, use `arrow_key_test` to verify the mapping between VDP raw key codes and kilo's internal constants.

3. If key events seem to be missed, use `key_event_tester` to check timing between keypresses.

4. For mysterious key behavior, use `vdp_key_tester` to monitor both stdio input and VDP key events to see if they differ.

5. The `vdp_key_bits` array should reflect the current state of keys. Monitor this using `vdp_key_tester` to check if key state is being properly maintained.

## Understanding Key Mapping

In kilo.c, key mapping happens in `editorReadKey()`. Arrow keys and special keys are mapped from raw Agon VDP codes to kilo's internal key constants (e.g., ARROW_UP, ARROW_DOWN).

The mapping is:
- 0x0b → ARROW_UP (1000)
- 0x0a → ARROW_DOWN (1001)
- 0x0c → ARROW_RIGHT (999)
- 0x08 → ARROW_LEFT (998)

If these mappings are incorrect or inconsistent, editing operations will behave erratically.