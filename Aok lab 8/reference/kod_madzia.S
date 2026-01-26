.data
T: .space 1040
TB: .space 816
Skladnik: .double 1220
Ulamek: .double 0.22
Nr: .double 16.0
Jeden: .double 1.0
Suma: .double 0.0
Czynnik: .double 2.2
.text
addi r20, r0, T
ld f10, Skladnik
ld f12, Ulamek
ld f14, Nr
ld f16, Jeden
addi r30, r0, #130
addd f2, f14, f12 ;w f2 jest 16+0.22
addd f2, f2, f10 ;w f2 jest 16.22+1220
sd 0(r20), f2
addi r20, r20, #8
subi r30, r30, #1
addd f4, f2, f0
wypelnijT:
addd f4, f4, f16
sd 0(r20), f4
addi r20, r20, #8
subi r30, r30, #1
bnez r30, wypelnijT
addi r15, r0, TB
addi r20, r0, T
addi r16, r0, #102
addi r17, r0, Suma
ld f6, Czynnik
wypelnijTB:
ld f20, 0(r20)
ld f22, 8(r20)
ld f24, 16(r20)
ld f26, 24(r20)
ld f28, 32(r20)
;zolty nawias
multd f8, f6, f20 ;2.2*T[i]
multd f8, f8, f22 ;wyzsze*T[i+1]
;niebieski nawias
multd f18, f24, f26
multd f18, f18, f28
;mianownik to f24
;zolty + niebieski
addd f30, f8, f18 ;licznik
divd f10, f30, f24 ;caly element obliczony
sd 0(r15), f10 ;zapisanie pierwszego el TB
addd f12, f12, f10 ;suma=suma+obliczony el TB
addi r15, r15, #8
addi r20, r20, #8
subi r16, r16, #1
bnez r16, wypelnijTB
sd 0(r17), f12
;T first 1236,22
;T last 1365,22
;TB first 1539622,916
;TB last 1800469,556
trap 0