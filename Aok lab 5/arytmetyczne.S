.data
X:	.byte 0xA5
Y: .byte 0x0F
.text
lb r1, X
lb r2, Y
XOR r3,r1,r2
sb $DATA+12, r3
trap 0