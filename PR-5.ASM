[ORG 0x0100]
JMP main

data: dw 30, 40, 50, 10, 70
swap: db 0

main:
    ;intialize
    mov byte [swap] , 0
    mov bx , 0

    comparison:
    mov ax , [data + bx]
    cmp ax , [data + bx + 2]
    jbe no_swap

    ; swapping:
    mov dx,[data + bx + 2]
    mov [data+bx],dx
    mov [data + bx + 2],ax
    mov byte [swap] , 1

    no_swap:
    add bx , 2
    cmp bx , 8
    jnz comparison

    cmp byte[swap] , 1
    je main

exit:

MOV AX , 0x4c00
INT 0x21

