.data
TA: .space 560
TB: .space 520
Suma: .double 0
TA_size: .word 140
TB_size: .word 130

.text
addi r1,r0,TA
lw r3,TA_size
addi r6,r0,#2208

wyp_TA:
sw 0(r1),r6
subi r3,r3,#1
addi r1,r1,#4
addi r6,r6,#1
bnez r3,wyp_TA
;
addi r1,r0,TA
addi r2,r0,TB
lw r3,TB_size

wyp_TB:
lw r6,20(r1)
lw r5,8(r1)
add r6,r6,r5
lw r5,4(r1)
add r6,r6,r5
addi r5,r0,#6
mult r6,r6,r5
sw 0(r2),r6
addi r1,r1,#4
addi r2,r2,#4
subi r3,r3,#1
bnez r3,wyp_TB
;
addi r2,r0,TB
lw r3,TB_size
addi r8,r0,#0
suma:
lw r5,0(r2)
add r8,r8,r5
subi r3,r3,#1
addi r2,r2,#4
bnez r3,suma

movi2fp f0,r8         
cvti2d f0,f0
sd Suma,f0
trap 0

; Obliczenia dla nr = 8
; TB[i] = (TA[i+5] + TA[i+2] + TA[i+1]) * 6
; TB[i] = ((2213+i) + (2210+i) + (2209+i)) * 6
; TB[i] = (6632 + 3i) * 6 = 39792 + 18i
;
; Pierwszy element TB (i=0): 39792
; Ostatni element TB (i=129): 39792 + 18*129 = 42114
; Suma ciągu arytmetycznego: ((39792 + 42114) / 2) * 130 = 5 323 890