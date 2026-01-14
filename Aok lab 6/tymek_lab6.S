.data
wektor: .word 214,224,234,244,254,264,274,284,294,304,314,324 ;tablica
suma1: .word 0 ; miejsce na sumę przed zmianą
suma2: .word 0 ; miejsce na sumę po zmianie
stala: .word 42 ; stała do dodania
rozmiar: .word 12 ; rozmiar tablicy
roznica: .word 0
iloczyn: .word 0
.text
addi r20, r0, wektor  ; załadowanie adresu 1 elementu tablicy
addi r21, r0, #12   ; załadowanie licznika kroków
suma:
lw r2, 0(r20)  ; załadowanie do r2 wartości z pod adresu z r20
add r14, r14, r2  ; sumowanie
addi r20, r20, #4 ; przeskok adresu do następnego elementu (adres 1 elementy + 4 bajty)
subi r21, r21, #1 ; dekrementacja licznika kroków (iteratora )
bnez r21, suma  ; jeśli r21 != 0 skocz do suma z powrotem
sw suma1, r14   ; zapis sumy do pamięci po skończeniu przejścia pętli
addi r20, r0, wektor ; reset wskaźnika
addi r21, r0, #12 ; reset LK
lw r3, stala ; załadowanie stałej do r3
mod:    ; modyfikacja 
lw r2, 0(r20) ; ładowanie elemetu tablicy do r2 z pod adresu z r20
add r6, r2, r3 ; dodanie do elementu tablicy stałej 
sw 0(r20), r6 ; zapisanie zmodyfikowanej wartości w pamięci
addi r20, r20, #4 ; przeskok adresu do następnego elementu (adres 1 elementy + 4 bajty)
subi r21, r21, #1 ; dekrementacja licznika kroków (iteratora )
bnez r21, mod ; jeśli r21 != 0 skocz do mod z powrotem
addi r20, r0, wektor ; reset
addi r21, r0, #12 ; reset
lw r14, #0 ;reset
sumamod:  ; drugie sumowanie po modyfikacji analogiczne do pierwszego
lw r2, 0(r20)
add r14, r14, r2
addi r20, r20, #4
subi r21, r21, #1
bnez r21, sumamod
sw suma2, r14
lw r7, suma1 ; ładowanie sum
lw r8, suma2
sub r14, r8, r7  ; suma2-suma1 
sw roznica, r14  ;zapis tego^ działania w pamięci
lw r11, stala
lw r12, rozmiar
mult r14, r11, r12
sw iloczyn, r14
trap 0