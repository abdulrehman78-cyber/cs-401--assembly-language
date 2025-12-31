; clearing screen
[org 0x0100]

mov ax , 0xb800     ;load the video base in ax
mov es , ax         ;load in the es segment (now this points es to the video base)
mov di , 0          ;point di(destination index) to the top left coloumn

next_char: 
mov word [es:di] , 0x0720  ;clear next char on the screen 
add di , 2                 ;mov t0 the next location on the screen
cmp di , 4000              ;if we multiply the 80(row)*25(coloumn) it will = 2000 now every word has 2 byte =4000 
jnz next_char              ;if no clear move to the next poistion

mov ax , 0x4c00
int 0x21