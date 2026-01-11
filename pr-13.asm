;WRite a program that swap the value of 2 variables using subroutine
[org 0x0100]

jmp start

num1:db 6
num2:db 5

swapping:
mov ax,[num1]
mov  dx ,[num2]
mov [num2], ax
mov [num1] , dx

ret


start:
call swapping

;exit
mov ax , 0x4c00
int 0x21