%macro print 2
	mov rax,01
	mov rdi,01
	mov rsi,%1
	mov rdx,%2
	syscall
%endmacro


section .data
msg db "hello", 0Ax
len equ $ - msg
cnt db 4

section .bss
name resb 10


section .text
global _start

_start:
	print msg,len

	mov rax,00
	mov rdi,00
	mov rsi,name
	mov rdx,10
	syscall
	
loop:	
	print name,10

        dec byte[cnt]
	jnz loop 


	mov rax,60
	mov rdi,0
	syscall



