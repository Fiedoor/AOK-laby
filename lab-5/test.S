.data
liczba_A:   .word 10
tablica_B:  .word 101, 102, 103, 104, 105, 106

; obszar deklaracji kodu jest oznaczany 
; dyrektywą .text
.text
; tu umieszczamy rozkazy, które zostaną umieszczone 
; od adresu 100h = 256 dziesiętnie
lw     r1, liczba_A
addi   r2, r1, #100

; zakończenie programu
trap 0