[org 0x0100]
jmp start

multiplicand: db 13
multiplier:   db 5  
result:       db 0

start:
    mov cl, 8           ; Process all 8 bits
    mov bl, [multiplicand] ; bl = 13
    mov dl, [multiplier]   ; dl = 5
    mov byte [result], 0   ; Clear result

check_bit:
    shr dl, 1           ; Check bit, result goes to Carry Flag
    jnc skip_add        ; If no carry (bit was 0), skip
    
    
    mov al, [result]    ;  Load current result
    add al, bl          ;  Add multiplicand
    mov [result], al    ;  Store back

skip_add:
    shl bl, 1           ; Multiply by 2 for next bit position
    dec cl              ; One bit processed
    jnz check_bit       ; Repeat for all bits

exit:
    mov ax, 0x4c00
    int 0x21