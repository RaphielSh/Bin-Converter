section .data
cnst db 1
test1 dd 4294967295
section .bss
mas resb 100
section .text
global _start
_start:


mov ebx, 32
mov ecx, 99

_loop:
mov al, [cnst]
and al, [test1]
add al, byte 48
mov [mas + ecx], al

dec ebx
dec ecx
cmp ebx, 0
je _print

shr dword[test1], 1
jmp _loop

_print:
mov eax, 4
mov ebx, 1
mov ecx, mas
mov edx, 100
int 0x80

;_exit:
mov eax, 1
int 0x80
