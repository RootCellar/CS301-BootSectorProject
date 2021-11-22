; TO BE LOADED AND RAN

mov al, 'M'
call print_char_ex

mov bx, printed_string ; data at label
call print_string

; mov cx, 100
; mov dx, 100
; mov al, 0x00FF
; call draw_pixel

; HANG
loop:
jmp loop

print_char_ex:
	mov ah, 0x0e
	int 0x10
	ret

; cx: X
; dx: Y
; al: COLOR
draw_pixel:
  mov bh, 0
  mov ah, 0xC
  int 0x10
  ret

print_string:
  add bx, 0xB000 ; offset where we are loaded
  sub bx, 512 ; offset end of boot sector
  print_loop:
  cmp BYTE[bx], 0
  je end_print

  mov al, [bx]
  call print_char_ex
  add bx, 1
  jmp print_loop
  end_print:
  ret

section .data
printed_string:
  db `\nHello!`, 0
