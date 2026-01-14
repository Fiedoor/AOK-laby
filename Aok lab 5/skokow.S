.data
LiczbaA: .float  -5.5  
LiczbaB: .float  5.5 
Wynik:   .float  0.00
.text
LF      F1, LiczbaA
LF      F2, LiczbaB
GTF     F1, F2      ;ustawia wartość rejestru FPSR   
    
BFPT    JestWieksza
NOP
J       JestMniejsza  
NOP                     
JestWieksza:
SF      Wynik, F1
    ;SF      Wynik+4,F1
TRAP	0
JestMniejsza:
SF      Wynik, F2
TRAP    0