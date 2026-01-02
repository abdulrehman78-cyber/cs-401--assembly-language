;Printing Numbers 
[ORG 0x100]
jmp start
print_num:
push bp 
mov bp , sp 
push es
push ax
push bx
push cx
push dx  
push di

mov ax , 0xb800
mov es , ax
mov ax , [bp+4]
mov bx , 10
mov cx , 0


next_digit:
mov dx , 0
div bx
add dl, 0x30
push dx
inc cx
cmp ax , 0
jnz next_digit

mov di , 0

next_pos:
pop dx
mov dh , 0x07
mov [es:di] , dx
add di , 2
loop next_pos


pop di
pop dx
pop cx
pop bx 
pop ax 
pop es
pop bp
ret 2
start:
mov ax , 4325
push ax
call print_num


;Exit
mov ax , 0x04c00
int 0x21