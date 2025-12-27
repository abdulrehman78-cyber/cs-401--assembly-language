[ORG 0x0100]
;INTITIALIZE
XOR AX , AX 

ADD [RESULT] = [NUM1]   ;taking  10 and storing in result memory location
ADD [RESULT] = [NUM1+2] ;taking  20 and storing in result memory location
ADD [RESULT] = [NUM1+4] ;taking  30 and storing in result memory location
ADD [RESULT] = [NUM1+6] ;taking  40 and storing in result memory location
ADD [RESULT] = [NUM1+8] ;taking  50 and storing in result memory location

;EXIT

MOV AX , 0x4c00
INT 0x21 

;DATA
NUM1: DW 10 , 20, 30, 40, 50 
RESULT: DW 0 