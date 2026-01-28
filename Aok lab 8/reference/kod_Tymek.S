.data
T: .space 1040 ;miejsce na T
TB: .space 840 ;miejsce na TB
Suma: .double 0.0 ;miejsce na sumę
skladnik: .double 1550 ;skladnik
ulamek: .double 0.55 ; ułamek
jeden: .double 1.0  ; jedynka bo ld a nie addi r0 +1
stala: .double 5.2  ; stała
nr: .double 14.0 	; numer na liście
rozmiar: .word 105  ; rozmiar TB
rozmiarT: .word 130 ; rozmiar T
.text
addi r1, r0, T  	; adres T
addi r2, r0, TB 	; adres TB
ld f2, skladnik
ld f4, ulamek 
ld f8, nr			; ładowanie WSZYSTKIEGO
ld f10, jeden
lw r4, rozmiarT		; licznik/iterator
addd f6, f2, f4 	; dodawanie double
addd f6, f6, f8 	; tu też
loop1:  			; pętla do wypełniania TB
sd 0(r1), f6  		; zapis elementu do pamięci
addd f6, f6, f10	; obliczenie następnego elementu
addi r1, r1, #8 	; inkrementacja adresu
subi r4, r4, #1 	; dekrementacja licznika
nop					; 
nop					;	nop-y do synchronizacji bo ciapak od DLX spierdolił forwardnig
nop					; 
bnez r4, loop1		; warunek kontynuacji pętli po liczniku - KLASYK
addi r1, r0, T 		; reset adresu T
addi r2, r0, TB 	; ładowanie adresu TB - drugi raz ale ok
lw r3, rozmiar 		; ładowanie do licznika rozmiaru TB
;lw r4, rozmiarT
; Stala 5.2
ld f14, stala		; ładowanie stałej
loop2:				; pętla do wypełnienia TB
; T[i]
ld f2, 0(r1)
; TB[i]
;ld f4, 0(r2)
; T[i+1]
ld f6, 8(r1)
; T[i+2]
ld f8, 16(r1) 		; wczytywanie danych do TB z T [i+coś]
; T[i+3]
ld f10, 24(r1)
; T[i+4]
ld f12, 32(r1)
; T[i+5]
ld f24, 40(r1)
; T[i+6]
ld f22, 48(r1)
multd f16, f2, f14 	
multd f16, f16, f6
multd f16, f16, f22
addd f18, f8, f10 	; liczenie TB[i]
addd f18, f18, f12	
subd f16, f16, f18
divd f16, f16, f24  
addd f20, f20, f16  ; dodanie elementu do ogólnej sumy
sd 0(r2), f16		; zapis obliczonej wartości TB
addi r1, r1, #8 	; inkrementacja adresu T
addi r2, r2, #8 	; inkrementacja adresu TB
subi r3, r3, #1 	; dekrementacja licznika 
bnez r3, loop2 		; warunek przejścia pętli
sd Suma, f20		; zapis sumy do 
trap 0              ; KONIEC
;nr=14
; 14+1550+0.55+i-1
; TB[1] = ((5.2*1564.55*1565.55*1570.55)-(1566.55+1567.55+1568.55))/1569.55 = 12744894,44
; TB[105] = ((5.2*1668.55*1669.55*1674.55)-(1670.55+1671.55+1672.55))/1673.55 = 14494436,52