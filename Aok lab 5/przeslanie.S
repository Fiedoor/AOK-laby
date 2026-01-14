.data
liczba_A:   .word 200

.text
lw     r1, liczba_A
sw	   $TEXT, r1
; zakończenie programu
trap 0