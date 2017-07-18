# Printing Star

```
nasm -f elf64 test.asm && ld -o test test.o
```

%rax	SysCall 		%rdi	%rsi		%rdx
0		sys_read		fd 		*buf		count
1		sys_write		fd 		*buf 		count
41		sys_socket		family	type		protocol
42 		sys_connect		fd 		uservaddr	addrlen
60		sys_exit		retval
read	0 
write	1
socket	41
connect	42