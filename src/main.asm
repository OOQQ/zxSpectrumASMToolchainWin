		DEVICE ZXSPECTRUM48
		org $8000								;code origin

start:
		ld hl, string						;address of string
		call printString				;show string to the screen
		ret

newLine:
		ld a, 13								;carriage return only - ZX doesn't like CHR(10)
		jr printChar

printChar:
		push hl
		push bc
		push de
		push af
				ld a, 2							;select stream 2 = topscreen
				call $1601					;ROM CHAN_OPEN
		pop af
		push af
				rst 16							;call &0010 print_a_1
		pop af
		pop de
		pop bc
		pop hl
		ret

printString:
		ld a, (hl)							;print a 0 terminated string
		cp 0
		ret z
		inc hl
		call printChar
		jr printString

string: db "Hello World!", 0

		SAVETAP "../release/tape.tap", start
														;save tape file, autolaunch start address is $8000
