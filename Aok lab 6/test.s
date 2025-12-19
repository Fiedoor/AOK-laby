.data 
liczbaA: .word 10
liczbaB: .word 101,102,103,104,105,106
suma: .word 0
.text 
lw r1,liczbaA
addi r30,r0,#6
addi r20,r0,liczbaB
mod:
lw r2, 0(r20)
add r10, r1, r2
sw 0(r20), r10
addi r20, r20, #4
subi r30, r30, #1
bnez r30, mod
addi r30, r0, #6
addi r20, r0, liczbaB
j sum
sum:
lw r2, 0(r20)
add r5, r5, r2
addi r20, r20, #4
subi r30, r30, #1
bnez r30,sum
sw suma,r5
trap 0