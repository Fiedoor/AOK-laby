- TA TB wyniki ręcznie jako komentarz
- policzyć elementy TA
- testowo wypełnić 10-20 elementów tablicy żeby sprawdzić czy działa

- R8 off limits do sumy
nr = 8 
ta[0] = 2208
2209
2210
2213
TB[i] = (TA[i+5] + TA[i+2] + TA[i+1]) * 6

załaduj do r6 ta[r1+5]
załaduj do r5 ta[r1+2]
dodaj r6=r6+r5
załaduj do r5 ta[r1+1]
r6=r6+r5
r6=r6*6
zapisz pod r2 r6


r1 - adres TA
r2 - adres TB
r3 - iterator
r5 argument 
r6 wynik wzoru do wpisania