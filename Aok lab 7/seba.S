.data
TA: .space 560
TB: .space 520
rozmiar_ta: .word 140
rozmiar_tb: .word 130
Suma: .double 0.0 
stala: .word 18
.text
addi r1, r0, TA 
addi r2, r0, #140
lw r20, stala
loop1:
addi r4, r20, #2200
add r5, r4, r0
sw 0(r1), r5
addi r1, r1, #4
addi r20, r20, #1
subi r2, r2, #1
bnez r2, loop1

addi r1, r0, TA
addi r6, r0, TB
lw r7, rozmiar_ta
lw r8, rozmiar_tb
addi r13, r0, #6

loop2:
lw r10, 4(r1) ; TA[i+1]
lw r11, 8(r1) ; TA[i+2]
lw r12, 20(r1) ; TA[i+5]
add r10, r10, r11
add r10, r10, r12
mult r10, r10, r13
sw 0(r6), r10
addi r1, r1, #4
addi r6, r6, #4
subi r8, r8, #1
bnez r8, loop2

addi r6, r0, TB
lw r8, rozmiar_tb
addi r18, r0, #0

SumaTB:
lw r15, 0(r6)
add r18, r18, r15
addi r6, r6, #4
subi r8, r8, #1
bnez r8, SumaTB
movi2fp f10, r18

cvti2d f0, f10

sd Suma, f0

trap 0

; TB[i] = (TA[i+1] + TA[i+2] + TA[i+5]) * 6
; TA[0] = 2218

; Pierwszy element tablicy TB
; TB[0] = (TA[1] + TA[2] + TA[5]) * 6
; TB[0] = (2219 + 2220 + 2223) * 6 = 6662 * 6 = 39972
;
; Ostatni element TB
; TB[129] = (TA[130] + TA[131] + TA[134]) * 6
; TB[129] = (2348 + 2349 + 2352) * 6 = 42294