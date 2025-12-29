[ORG 0x0100]
JMP main

data: dw 30, 40, 50, 10, 70
swap: db 0

main:

    ;intialize
    mov si , 0
    mov bx , data     ;moving array address into bx reg
    mov cx , 8        ;setting our counter    

    outerloop:
    mov si , 0
    mov byte [swap] , 0
    dec cx
    jz exit

  
    inner_loop:
    ;checking
    
    mov  ax,[bx+si]
    cmp  ax,[bx+si+2] 
    jbe no_swap
    
    ;swapping take place
    xchg ax , [bx+si+2] 
    mov byte [swap] , 1
    

    no_swap:
    add si , 2
    cmp byte[swap] , 1
    je outerloop


    ;exit
    exit:

MOV AX , 0x4c00
INT 0x21

