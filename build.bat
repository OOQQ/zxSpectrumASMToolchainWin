@echo
assembler\sjasmplus.exe src\main.asm

emulator\fuse.exe --machine 48 --tape release\tape.tap -g 2x