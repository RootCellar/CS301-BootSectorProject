;
; BUILD:
; nasm -f bin -o boot.bin boot.asm
;
; RUN:
; qemu-system-x86_64 boot.bin
;

BITS 16 ; everything here is 16 bit code
;  Code gets loaded by the PC BIOS into address 0x7C00 and executed.
	; set up a stack
	mov bp, 0x8000
	mov sp, bp

	mov al,'B'
	mov ah,0x0e ; print command
	int 0x10  ; talk to video card

	; read the disk into 0xB000
	mov bx, 0
	mov es, bx
	mov bx, 0xB000 ; where to put the loaded data

	push dx
	mov ah, 0x02
	mov al, 1 ; sectors to read
	mov cl, 2 ; 2nd sector
	mov ch, 0 ; cylinder
	mov dh, 0 ; head number
	int 0x13 ; interrupt BIOS and read the data
	jc hang ; jump to hang if there was a problem

	pop dx

	;mov bx, 0
	;mov es, bx

	mov al, 'S' ; success!
	call print_char

	;mov bx, 0xB000
	;mov al, [bx]
	;call print_char

	mov bx, 0
	mov es, bx
	mov bx, 0xB000

	; jump to it
	jmp bx

	jmp hang

print_char:
	mov ah, 0x0e
	int 0x10
	ret

hang:
	mov al, 'H'
	call print_char
hang2:
	jmp hang2

; Pad data out to magic boot sector identifier
times 512-2-($-$$) db 0
	db 0x55
	db 0xaa

%include "prg.asm"
