;Print our hello world
[ORG 0X0100]
jmp start   ;unconditional jump 
message: db 'hello world'    ;string to be printed
length: dw 11                ;length of our string

;clearing subroutine
clrscr:
;saving on stack
push es
push ax
push di

;initialize
mov ax , 0xb800  ;getting our first physical address remember only intel specific 
mov es , ax     
mov di , 0      ;now this will point to our first memory location

next_loc:
mov byte [es:di] , 0x0720
add di , 2      ;for moving to the next location for clean up
cmp di , 4000
jnz next_loc 

;restoring from stack
pop di
pop ax
pop es
ret

;Here printing took place
printing:
;pushing for saving our previous reg
push bp
mov bp , sp
push es
push ax
push cx 
push si 
push di 

mov ax , 0xb800
mov es , ax         ;points es to the video base
mov di , 0          ;points destination index to first location
mov si , [bp+6]     ;taking the char from stack using bp
mov cx , [bp+4]     ;load lenght of our string 
mov ah , 0x07       ;the attribute of our char

next_char:
mov al , [si]       ;the actual char 
mov [es:di],ax ;show this char on screen
add di ,2           ;for moving to the next screen location
add si ,1           ;for moving to the next char in our string
loop next_char ;loop cx time

;poping our regs back
pop di 
pop si 
pop cx 
pop ax
pop es
pop bp
ret 4

start:
call clrscr ;calling our clearing screen first 

mov ax , message ;passing our add to ax reg
push ax       ;Print our hello world
push word [length] ;passing our string length
call printing

;exit
mov ax , 0x4c00
int 0x21   ;pushing our add to the stack
