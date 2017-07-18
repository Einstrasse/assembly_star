section .data
msg:	db	"*********", 0
nl:		db	0xa;, 0xd
section .text
global _start

_start:
	push rbp
	mov rbp, rsp
	mov rax, [rbp+8]; var rax = [rbp+8] = argc
	cmp rax, 1
	je _finish ;if num of argument is 1, finish
	mov	rdx, [rbp+24] ; var rdx = argv[0] = [rbp+24]
	mov cl, [rdx] ; var rcx = argv[1][0]
	sub rcx, 48 ; var rcx = argv[1][0] - '0';
	sub rsp, 500;
	mov [rbp-8], rcx; var [rbp-8] = num of star

	mov r9, 1 ; var r9 = delta = 1;
	mov r10, 1; var r10 = i = 1;
	cmp rcx, 0
	jne _print_loop
	mov qword [rbp-8], 1

_print_loop:
	cmp r10, 0
	je _finish ; finish cond

	cmp r10, [rbp-8]
	je _inverse_delta
_comeback_home:
	mov rdx, r10
	call _print_star
	call _newline
	add r10, r9
	jmp _print_loop
	nop


_inverse_delta:
	mov r9, -1
	jmp _comeback_home

_finish:
	mov rax, 60
	mov rdi, 1
	syscall;;exit process

_print_star: ;num of start = rdx
	mov rax, 1
	mov rdi, 0x1
	mov rsi, msg
	syscall
	ret

_newline:
	mov rax, 1
	mov rdi, 0x1
	mov rsi, nl
	mov edx, 1
	syscall
	ret