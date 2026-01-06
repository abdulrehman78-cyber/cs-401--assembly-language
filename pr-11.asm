section .data
message: db  "Hello" , 0xa
message_len equ $ - message 

section .text
    global _start

_start:
;(write 1 , message, message_len)
mov eax , 4 ; (i waana write)
mov ebx , 1 ; (stdout file descripter)
mov ecx , message  ;(mesage i mean hello)
mov edx , message_len ; (mesage length)
int 0x80      ;invoke kernal system call 

;exit
mov eax , 1 ; exit system call
mov ebx , 0  ;exit status 
int 0x80
 
