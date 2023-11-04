	global main
	extern sprintf
	extern dprintf
	extern system
	extern strncpy
	default rel

	extern printf

	section .data
content:
	db "%2$cglobal main%1$c%2$cextern sprintf%1$c%2$cextern dprintf%1$c%2$cextern system%1$c%2$cextern strncpy%1$c%2$cdefault rel%1$c%1$c%2$cextern printf%1$c%1$c%2$csection .data%1$ccontent:%1$c%2$cdb %3$c%4$s%3$c, 0%1$cname:%1$c%2$cdb %3$cSully_%%d.s%3$c, 0%1$cnasm:%1$c%2$cdb %3$cnasm -f elf64 %%s%3$c, 0%1$cgcc:%1$c%2$cdb %3$cgcc -Wall -Wextra -Werror -z noexecstack -o %%s %%s.o%3$c, 0%1$crun:%1$c%2$cdb %3$c./%%s%3$c, 0%1$cvalue:%1$c%2$cdq %5$d%1$c%1$c%2$csection .bss%1$cfile_name: resb 16%1$cexec_name: resb 16%1$ccmd: resb 64%1$c%2$csection .text%1$cmain:%1$c%2$cpush rbp%1$c%2$cmov rbp, rsp%1$c%1$c%2$clea rdi, file_name%1$c%2$clea rsi, name%1$c%2$clea rdx, value%1$c%2$cmov rdx, [rdx]%1$c%2$cdec rdx%1$c%2$ccall sprintf WRT ..plt%1$c%1$c%2$clea rdi, file_name%1$c%2$cmov rsi, 65%1$c%2$cmov rdx, 448%1$c%2$cmov rax, 2%1$c%2$csyscall%1$c%1$c%2$ccmp rax, 0%1$c%2$cjl .end%1$c%2$cpush rax%1$c%2$cmov rdi, rax%1$c%2$clea rsi, content%1$c%2$cmov rdx, 10%1$c%2$cmov rcx, 9%1$c%2$cmov r8, 34%1$c%2$clea r9, content%1$c%2$clea r10, value%1$c%2$cmov r10, [r10]%1$c%2$cdec r10%1$c%2$cpush r10%1$c%2$ccall dprintf WRT ..plt%1$c%2$cpop r10%1$c%2$cpop rax%1$c%1$c%2$cmov rdi, rax%1$c%2$cmov rax, 3%1$c%2$csyscall%1$c%1$c%2$clea r10, value%1$c%2$cmov r10, [r10]%1$c%2$ccmp r10, 1%1$c%2$cjl .end%1$c%1$c%2$clea rdi, exec_name%1$c%2$clea rsi, file_name%1$c%2$cmov rdx, 7%1$c%2$ccall strncpy WRT ..plt%1$c%1$c%2$clea rdi, cmd%1$c%2$clea rsi, nasm%1$c%2$clea rdx, file_name%1$c%2$ccall sprintf WRT ..plt%1$c%1$c%2$clea rdi, cmd%1$c%2$ccall system WRT ..plt%1$c%1$c%2$clea rdi, cmd%1$c%2$clea rsi, gcc%1$c%2$clea rdx, exec_name%1$c%2$clea rcx, exec_name%1$c%2$ccall sprintf WRT ..plt%1$c%1$c%2$clea rdi, cmd%1$c%2$ccall system WRT ..plt%1$c%1$c%2$clea r10, value%1$c%2$cmov r10, [r10]%1$c%2$ccmp r10, 2%1$c%2$cjl .end%1$c%1$c%2$clea rdi, cmd%1$c%2$clea rsi, run%1$c%2$clea rdx, exec_name%1$c%2$ccall sprintf WRT ..plt%1$c%1$c%2$clea rdi, cmd%1$c%2$ccall system WRT ..plt%1$c%1$c.end:%1$c%2$cmov rax, 0%1$c%2$cmov rsp, rbp%1$c%2$cpop rbp%1$c", 0
name:
	db "Sully_%d.s", 0
nasm:
	db "nasm -f elf64 %s", 0
gcc:
	db "gcc -Wall -Wextra -Werror -z noexecstack -o %s %s.o", 0
run:
	db "./%s", 0
value:
	dq 5

	section .bss
file_name: resb 16
exec_name: resb 16
cmd: resb 64
	section .text
main:
	push rbp
	mov rbp, rsp

	lea rdi, file_name
	lea rsi, name
	lea rdx, value
	mov rdx, [rdx]
	dec rdx
	call sprintf WRT ..plt

	lea rdi, file_name
	mov rsi, 65
	mov rdx, 448
	mov rax, 2
	syscall

	cmp rax, 0
	jl .end
	push rax
	mov rdi, rax
	lea rsi, content
	mov rdx, 10
	mov rcx, 9
	mov r8, 34
	lea r9, content
	lea r10, value
	mov r10, [r10]
	dec r10
	push r10
	call dprintf WRT ..plt
	pop r10
	pop rax

	mov rdi, rax
	mov rax, 3
	syscall

	lea r10, value
	mov r10, [r10]
	cmp r10, 1
	jl .end

	lea rdi, exec_name
	lea rsi, file_name
	mov rdx, 7
	call strncpy WRT ..plt

	lea rdi, cmd
	lea rsi, nasm
	lea rdx, file_name
	call sprintf WRT ..plt

	lea rdi, cmd
	call system WRT ..plt

	lea rdi, cmd
	lea rsi, gcc
	lea rdx, exec_name
	lea rcx, exec_name
	call sprintf WRT ..plt

	lea rdi, cmd
	call system WRT ..plt

	lea r10, value
	mov r10, [r10]
	cmp r10, 2
	jl .end

	lea rdi, cmd
	lea rsi, run
	lea rdx, exec_name
	call sprintf WRT ..plt

	lea rdi, cmd
	call system WRT ..plt

.end:
	mov rax, 0
	mov rsp, rbp
	pop rbp
