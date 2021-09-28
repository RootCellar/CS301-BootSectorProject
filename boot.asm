BITS 16 ; everything here is 16 bit code
;  Code gets loaded by the PC BIOS into address 0x7C00 and executed.
	; set up a stack - 8 kilobytes
	mov ax, 0x7C00 + 544
	mov ss, ax
	mov sp, 8192

	mov al,'B'
	mov ah,0x0e ; print command
	int 0x10  ; talk to video card

	; read the disk into 0x8000
	mov bx, 0x8000 ; where to put the loaded data
	mov dh, 4 ; sectors to read

	push dx
	mov ah, 0x02
	mov cl, 2 ; 2nd sector
	mov ch, 0 ; cylinder
	mov dh, 0 ; head number
	int 0x13 ; interrupt BIOS and read the data
	jc hang ; jump to hang if there was a problem

	pop dx

	mov al, 'S' ; success!
	call print_char

	; jump to it
	; jmp bx

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
