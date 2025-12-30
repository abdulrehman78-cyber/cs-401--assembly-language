[ORG 0x0100]
JMP main

data: dw 30, 40, 50, 10, 70
swap: db 0

main:
;intialize
mov byte [swap] , 0  ;seettin up a flag
mov bx , data    ;moving my base address of array
mov si , 0       ;index through which we can access

mov cx , 5 ;telling how many elements in our array
dec cx     ;decrementing cuz we have cx n-1 for n elements
shl cx , 1 ; means multiplying cx by 2 so we can get 10-1 bytes to move for 5 elements

    comparison:
    mov ax , [bx + si]   ;first index
    cmp ax , [bx + si + 2] ; second index
    jbe no_swap   ;jump if less then or equal

    ; swapping:
    xchg ax, [bx + si + 2] 
    mov [bx + si], ax 
    mov byte [swap] , 1

    no_swap:
    add si , 2    ;mov the index to next 
    cmp  si, cx   ;check if index reached at last remeber our buffer cx
    jnz comparison

;checking for if next iteration would take place or not 
cmp byte[swap] , 1  
je main

exit:

MOV AX , 0x4c00
INT 0x21

