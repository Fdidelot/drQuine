	; Outside
	global main
	extern printf
	default rel

section .data
content:
	db "%2$c; Outside%1$c%2$cglobal main%1$c%2$cextern printf%1$c%2$cdefault rel%1$c%1$csection .data%1$ccontent:%1$c%2$cdb %3$c%4$s%3$c%1$c%1$csection .text%1$cmain:%1$c%2$c; Inside%1$c%2$cpush rbp%1$c%2$cmov rbp, rsp%1$c%2$clea rdi, content%1$c%2$cmov rsi, 10%1$c%2$cmov rdx, 9%1$c%2$cmov rcx, 34%1$c%2$clea r8, content%1$c%2$ccall printf WRT ..plt%1$c%2$cmov rax, 0%1$c%2$cmov rsp, rbp%1$c%2$cpop rbp%1$c%2$cret%1$c"

section .text
main:
	; Inside
	push rbp
	mov rbp, rsp
	lea rdi, content
	mov rsi, 10
	mov rdx, 9
	mov rcx, 34
	lea r8, content
	call printf WRT ..plt
	mov rax, 0
	mov rsp, rbp
	pop rbp
	ret
