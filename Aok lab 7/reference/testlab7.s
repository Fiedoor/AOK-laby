.data
TA: .space 560 ;rezerwuje 560 bajtów pamięci dla tablicy
TB: .space 520 ;rezerwuje 520 bajtów dla tablicy
rozmiar_ta: .word 140 ;definiuje stałą o wartości 140
rozmiar_tb: .word 130 ;definiuje stałą o wartości 130
Suma: .double 0.0 ;rezerwuje 8 bajtów na liczbę zmiennoprzecinkową (double) i inicjuje ją zerem
stala: .word 14
.text
addi r1, r0, TA ;do rejestru r1 ładowany jesy adres początkowy tablicy TA r1 to wskaźnik
addi r2, r0, #140 ;licznik petli
lw r20, stala ;ładowanie zmiennej stała
loop1:
addi r4, r20, #2200 ;dodawanie stałej do liczby którą podaje polecenie
add r5, r4, r0 ;Kopiowanie wartość z r4 do r5
sw 0(r1), r5 ;zapisanie wartosci z r5 do pamieci pod adres wskazany przez r1
addi r1, r1, #4 ;przesuniecie iteratora
addi r20, r20, #1 ;inkrementacja stałej bo uzupełniamy tablice co jeden 
subi r2, r2, #1 ;zmniejszenie licznika petli o 1
bnez r2, loop1 ;sprawdzenie czy wyzerowalismy liznik petli jezeli nie to powielanie petli do wyzerowania 
;trap 0
; reset po wykonaniu pętli
addi r1, r0, TA ;wskaźnik który wskazuje poczatek tablicy TA
addi r6, r0, TB ;ustawia wskaźnik zapisu na poczatektablicy
lw r7, rozmiar_ta ;ładuje rozmiar tablicyTA do r7
lw r8, rozmiar_tb ;ładuje rozmiar tablicyTA do r7 - licznik petli
addi r13, r0, #6 ;ustawienie stałej mnożenia 
loop2:
lw r10, 4(r1) ; TA[i+1]
lw r11, 8(r1) ; TA[i+2]
lw r12, 20(r1) ; TA[i+5]
add r10, r10, r11 ; sumuje r10 i r11
add r10, r10, r12 ; sumuje r10 i r12
mult r10, r10, r13 ; mnożmy sume przez stała którą zapisalismy uprzednio w r13
sw 0(r6), r10 ;zapisuje wynik z r10 do adresu na który wskazuje r6
addi r1, r1, #4 ;przesuniecie wskaznika TA o jeden element w prawo czyli o 4 bajty 
addi r6, r6, #4 ;przesuniecie wskaznika TB o jeden element w prawo czyli o 4 bajty 
subi r8, r8, #1 ;zmniejszenie licznik petli 
bnez r8, loop2 ; ;sprawdzenie czy wyzerowalismy liznik petli jezeli nie to powielanie petli do wyzerowania 

; reset po wykonaniu pętli
addi r6, r0, TB ;reset wskaźnika z r6 na poczatek tablicy TB
lw r8, rozmiar_tb ;rest licznika petli na wartosc poczatkowa czyli 130
lw r14, #0 ;nie wiem na chuj to ale obstawiam ze resetuje sztucznei r14

SumaTB:
lw r15, 0(r6) ;pobieranie aktualnego elementu na który wskazuje wskaźnik z r6 do r15
add r14, r14, r15 ; dodanie elementu do głównej sumy r14 sie zmienia podane w zadaniu 
addi r6, r6, #4 ;przesuniecie wskaźnika na kolejny element tablicy 
subi r8, r8, #1 ;zmniejszenie lcznika 
bnez r8, SumaTB ;sprawdzenie czy wyzerowalismy liznik petli jezeli nie to powielanie petli do wyzerowania 
movi2fp f1, r14
;Move Integer to FP register: Kopiuje bity z rejestru całkowitego r14 (suma) do rejestru zmiennoprzecinkowego f1. 
;Liczba nadal jest traktowana jako integer, tylko jest w innym rejestrze
cvti2d f6, f1
;Convert Integer to Double: Konwertuje liczbę całkowitą w f1 na liczbę zmiennoprzecinkową podwójnej precyzji (Double) i zapisuje w parze rejestrów f6 (i f7).
sd Suma, f6
;Store Double: Zapisuje wartość z f6 pod adres zmiennej Suma w pamięci.
trap 0
; 2200+14+i-1
; TB[1] = (2215+2216+2219)*6 = 39900
; TB[150] = (2344+2345+2348)*6 = 42222