# Tips och bra att veta

### Tips / undvika
* Om jag har svårt att lösa en funktion fråga
    * Kolla på returtypen jag försöker få och kombinera relevanta funktioner för att få den typen

* Glöm ej basfallet

* Glöm ej qualified typen

### Centralt
* (a->b) = (a1 -> b1) -> (b1 -> c1) -> a1 -> c1
    * a = (a1 -> b1)
    * b = (b1 -> c1) -> a1 -> c1

* Om du vill göra en toStrig eller `-` på en av dina egna typer
    * Skapa en av Show eller Eq (eller gör din instance till en av dem)

* Point free: Hjälper att tänka på det som att man måste kunna sätta () runt den funktion jag har kommit fram till

* Flip
    * Lägg bara till det framför din funktion, om du vill byta plats på argumenten som kommer in
    * Försök inte något med (.)


* Vid bevis av funktioner skrivna i point free (och vill bevisa att de är samma)
    * Skicka in en samma (generella) argument och visa att det blir samma


### Mindre centralt
* Använd (/) 1.0 3.0 to make sure att det inte blir heltalsdivision

* [1 3..y] 
    * Ojämna tal från 1 till y
    * inte 1,3,4,5,6....

* Föredra $ över ()

* Föredra gaurds med funktioner över switch garder

* Om jag gör en instance of Ord (ord är en subklass till Eq)
    * Behöver inte implementera Eq och dess funktioner




