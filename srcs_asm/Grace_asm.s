; I'm a comment

	extern dprintf
	extern main
	default rel

%define file_content "; I'm a comment%1$c%1$c%2$cextern dprintf%1$c%2$cextern main%1$c%2$cdefault rel%1$c%1$c%%define file_content %3$c%4$s%3$c%1$c%%define file_name %3$cGrace_kid.s%3$c%1$c%1$c%2$csection .data%1$ccontent:%1$c%2$cdb file_content, 0%1$cname:%1$c%2$cdw file_name, 0%1$c%1$c%2$csection .text%1$c%%macro MAIN 0%1$cmain:%1$c%2$cpush rbp%1$c%2$cmov rbp, rsp%1$c%1$c%2$clea rdi, name%1$c%2$cmov rsi, 65%1$c%2$cmov rdx, 448%1$c%2$cmov rax, 2%1$c%2$csyscall%1$c%1$c%2$cmov rdi, rax%1$c%2$clea rsi, content%1$c%2$cmov rdx, 10%1$c%2$cmov rcx, 9%1$c%2$cmov r8, 34%1$c%2$clea r9, content%1$c%2$ccall dprintf WRT ..plt%1$c%1$c%2$cmov rax, 0%1$c%2$cmov rsp, rbp%1$c%2$cpop rbp%1$c%2$cret%1$c%%endmacro%1$c%1$cstart:%1$c%2$cMAIN%1$c"
%define file_name "Grace_kid.s"

	section .data
content:
	db file_content, 0
name:
	dw file_name, 0

	section .text
%macro MAIN 0
main:
	push rbp
	mov rbp, rsp

	lea rdi, name
	mov rsi, 65
	mov rdx, 448
	mov rax, 2
	syscall

	mov rdi, rax
	lea rsi, content
	mov rdx, 10
	mov rcx, 9
	mov r8, 34
	lea r9, content
	call dprintf WRT ..plt

	mov rax, 0
	mov rsp, rbp
	pop rbp
	ret
%endmacro

start:
	MAIN
