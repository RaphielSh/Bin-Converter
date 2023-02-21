section .data
req db "Type a number:", 0xA
req_len equ $-req
cnst db 1
section .bss
numa resb 8
numa_len resb 1
mas resb 10
count resb 1
section .text
global _start
_start:

mov byte[mas + 9], ' '

mov eax, 4
mov ebx, 1
mov ecx, req
mov edx, req_len
int 0x80

;variable assigment
mov eax, 3
mov ebx, 0
mov ecx, numa
mov edx, 8
int 0x80

;numa lengh assigment
mov [numa_len], eax

;counter from 8 to 0
mov ebx, 8

_loop:
mov al, [cnst]
mov ecx, [count]
and al, [numa + ecx]
add al, 48
mov [mas + ebx], al

dec ebx
cmp ebx, 0
je _print

shr byte[numa + ecx], 1
jmp _loop

_print:
mov eax, 4
mov ebx, 1
mov ecx, mas
mov edx, 10
int 0x80

mov eax, [numa_len]
inc byte[count]
mov ebx, 8
cmp [count], al
jne _loop

;_exit:
mov eax, 1
int 0x80
