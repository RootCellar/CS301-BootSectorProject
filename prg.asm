;loop:

mov al,'P'
mov ah,0x0e ; print command
int 0x10  ; talk to video card

loop:
jmp loop
