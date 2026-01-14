.data
liczba1: .word 0x7F000000
liczba2: .word 0x7F000000
.text

lf f1, liczba1
lf f2, liczba2
addf f3, f1, f2

trap 0