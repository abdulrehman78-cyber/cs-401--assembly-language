; hello world printing with a null terminated strings using string statements
[ORG 0X0100]
jmp start
message: db 'hello world',0

printing:
push bp 
mov bp , sp
push es
push ax
push cx
push si 
push di

push ds     
pop es       ;loading ds in es segment
mov di, [bp+4]   ;point di to string
mov cx, 0xffff
xor al , al  ;cleaning al
repne scanb
mov ax ,0xffff ;loading maximum number in ax
sub ax, cx    ;find change in cx
dec ax        ;exclude null from lenght
jz exit       ;no printing if string is empty

mov cx, ax    ;load string length in cx
mov ax, 0xb800
mov es, ax ; point es to video base
mov al, 80 ; load al with columns per row
mul byte [bp+8] ; multiply with y position
add ax, [bp+10] ; add x position
shl ax ,1  ; turn into byte offset
mov di,ax  ; point di to required location
mov si, [bp+4]  ; point si to string
mov ah, [bp+6] ; load attribute in ah

cld
nextchar:
lodsb
stosw
loop nextchar

exit:
pop di
pop si
pop cx
pop ax
pop es
pop bp

ret 8

start:
mov ax , 30  ;X position 
push ax 
mov ax , 20  ;Y position
push ax
mov ax, 1    ;moving attribute
push ax
mov ax , message  ;passing address of string
push ax
call printing


mov ax , 0x4c00
int 0x21