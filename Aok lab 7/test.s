.data
DodatnieD: .double 1,2,3,100,1000.123456789
UjemneD: .double -1, -2, -3, -100, -1000.123456789

.text
;adresy
addi r3, r0, DodatnieD
addi r4, r0, UjemneD

;wczytywanie rejestrów
ld f10, 0(r3)
ld f20, 0(r4)

ld f12, 8(r3)
ld f22, 8(r4)

ld f14, 24(r3)
ld f24, 24(r4)

ld f16, 32(r3)
ld f26, 32(r4)

trap 0