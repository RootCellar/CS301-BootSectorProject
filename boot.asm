BITS 16 ; everything here is 16 bit code



;  Code gets loaded by the PC BIOS into address 0x7C00 and executed.

	mov al,'H'

	mov ah,0x0e ; print command

	int 0x10  ; talk to video card

	

	mov al,'i'

	mov ah,0x0e ; print command

	int 0x10  ; talk to video card



hang:

	jmp hang



; Pad data out to magic boot sector identifier

times 512-2-($-$$) db 0  

	db 0x55

	db 0xaa
