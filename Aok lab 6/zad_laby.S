.data
wektor: .word 108,118,128,138,148,158,168,178,188,198
suma1: .word 0
suma2: .word 0
roznica: .word 0
iloczyn: .word 0
rozmiar: .word 10
stala: .word 8
.text
addi r20, r0, wektor ;wskaźnik
lw r21,rozmiar ;licznik kroków
;suma do r8
sum1:
lw r2,0(r20)
add r8,r8,r2
addi r20,r20,#4
subi r21,r21,#1
bnez r21,sum1
sw suma1,r8
addi r20, r0, wektor ;wskaźnik
lw r21,rozmiar ;licznik kroków
;modyfikacja
lw r22,stala
modify:
lw r2,0(r20)
add r2,r2,r22
sw 0(r20),r2
addi r20,r20,#4
subi r21,r21,#1
bnez r21,modify

addi r20, r0, wektor ;wskaźnik
lw r21,rozmiar ;licznik kroków
;suma do r9
sum2:
lw r2,0(r20)
add r9,r9,r2
addi r20,r20,#4
subi r21,r21,#1
bnez r21,sum2

sw suma2,r9

;różnica suma2 - suma1 (r9-r8) do r10
sub r10,r9,r8
sw roznica,r10
;iloczyn 10 * stała do r11
lw r21,rozmiar
mult r11,r21,r22
sw iloczyn,r11
trap 0