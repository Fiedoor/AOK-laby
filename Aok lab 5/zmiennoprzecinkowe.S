.data
liczbaA: .word 0x7f800000
liczbaB: .word 0xFF7FFFFF
.text
LF F1, liczbaA
LF F2, liczbaB
SUBF F3, F2, F1
TRAP 0