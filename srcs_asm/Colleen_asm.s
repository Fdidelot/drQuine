; Outside

section .data
content:
	db "; Outside%2$c%2$csection .data%2$ccontent:%2$c%4$cdb %3$c%1$s%3$c, 0%2$c%2$csection .text%2$c%4$cglobal main%2$c%4$cextern printf%2$c%2$cstart:%2$c%4$ccall main%2$c%4$cret%2$c%2$cmain:%2$c%4$c; Inside%2$c%4$cpush rbp%2$c%4$cmov rbp, rsp%2$c%4$clea rdi, [rel content]%2$c%4$clea rsi, [rel content]%2$c%4$cmov rdx, 10%2$c%4$cmov rcx, 34%2$c%4$cmov r8, 9%2$c%4$ccall printf WRT ..plt%2$c%4$cmov rsp, rbp%2$c%4$cpop rbp%2$c%4$cret%2$c", 0

section .text
	global main
	extern printf

start:
	call main
	ret

main:
	; Inside
	push rbp
	mov rbp, rsp
	lea rdi, [rel content]
	lea rsi, [rel content]
	mov rdx, 10
	mov rcx, 34
	mov r8, 9
	call printf WRT ..plt
	mov rsp, rbp
	pop rbp
	ret
