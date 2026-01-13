;Disable keyboard interrupt in PIC mask register
[org 0x0100]

in al , 0x21  ;read interrupt mask register
or al , 2     ;set bit for IQR2
out 0x21 ,al  ;write back mask register
;Exit
mov ax , 0x4c00 
int 0x21