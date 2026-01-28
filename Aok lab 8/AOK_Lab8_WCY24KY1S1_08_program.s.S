.data
T: .space 1040
TB: .space 840
Suma: .double 0.0
rozmiar: .word 130
rozmiarTB: .word 105
skladnik: .double 1550.0
ulamek: .double 0.55
stala: .double 5.2
nr: .double 8.0
jedynka: .double 1.0

.text
addi r1,r0,T
addi r2,r0,TB
lw r3,rozmiar
ld f0,skladnik
ld f2,ulamek
ld f4,nr
ld f6,jedynka
addd f8,f0,f2
nop
nop
nop
addd f8,f8,f4
sd 0(r1),f8
addi r1,r1,#8
subi r3,r3,#1 ; dekrementacja licznika
T_fill:
addd f8,f8,f6 ;dodanie jedynki
sd 0(r1),f8 ; zapis elementu
subi r3,r3,#1 ; dekrementacja licznika
addi r1,r1,#8 ; pointer + 8
nop
nop
nop
bnez r3,T_fill


addi r1,r0,T
addi r2,r0,TB
lw r3, rozmiarTB
ld 	f10,stala
TB_fill:
ld f12,0(r1) ;T[i]
ld f14,8(r1) ;T[i+1]
ld f16,16(r1) ;t[i+2]
ld f18,24(r1) ;t[i+3]
ld f20,32(r1) ;t[i+4]
ld f22,40(r1) ;t[i+5]
ld f24,48(r1) ;t[i+6]
;liczenie tb[i]
multd f26,f10,f12 ;5,2*t[i]
addd f28,f16,f18 ;t [i+2] + t[i+3]
multd f26,f26,f14 ;poprzednie * t[i+1]
addd f28,f28,f20
multd f26,f26,f24
subd f28,f26,f28
divd f28,f28,f22

subi r3,r3,#1
sd 0(r2),f28
addi r2,r2,#8
addi r1,r1,#8
addd f30,f30,f28
nop
nop
nop
nop
bnez r3,TB_fill

sd Suma,f30
trap 0