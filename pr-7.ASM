;Parameters passing to stack 
[org 0x0100]
JMP calling
data: dw 90, 38, 29,88,10
swap: db 0

bubble_sort:
;saving prevoius
push bp
mov bp , sp
push bx 
push ax
push si
push cx

initialize:
mov byte [swap] , 0
mov si , 0
mov bx , [bp+6] 
mov cx , [bp+4]
dec cx
shl cx ,1

checking:
mov ax , [bx+si]
cmp ax , [bx+si+2]
jbe no_swap

swapping:
xchg ax , [bx+si+2]
mov [bx+si],ax
mov byte[swap] , 1

no_swap:
add si ,2
cmp si , cx
jb checking


cmp byte [swap] , 1
je initialize

pop cx
pop si
pop ax
pop bx 
pop bp

ret 4
jmp exit

calling:
mov ax , data   ;Passing our array
push ax
mov cx , 5      ;5 elements in our array
push cx
call bubble_sort


exit:
    mov ax, 0x4c00
    int 0x21