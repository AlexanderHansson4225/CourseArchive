# Anteckningar
### Tänk på på tenta / Glöm ej / Dubbelkolla
- Gör substitutionen f(t)dir(t) = f(0)dir(t)
- Glöm inte krav sigma större än 0 
- Glöm inte krav t >= 0
- Checka så svaret är rätt eller rimligt
    - För derivator, kolla med begynelsevärderna.     
- Ta även bort theta om det är så att du har gjort ensidig laplace
      - Om du har gjort ensidig laplace, måste jag även ge t>=0
      - Om t är reelt kan vi lösa för positiva värden och se vilken av dem som passar på de negativa
      - Alternativt...
- För differentialekvationer. Får absolut inte göra laplace utan försäkring att den är kausal i defininitionsmängden. 
- Om jag löser en integral ekvation (som en diff ekv) kolla y(0)
- Glöm inte kolla begynelsevärdena
- - När jag ritar en graf med språng, så hamnar språngpilarna i grafen av derivatan av funktionen som har hopp i sig, inte i den som har hopp i sig

### Tips
- Gör både geometrisk och algebraisk derivering
    - Om du har tid
- Kom ihåg att enhetspuldrn enbart är definierad mellan 0 och delta
  - Ta bort de andra delarna av integralen
- Med faltning
    - Räkna båda fallen. Ex negativa och positiva värden
- Om jag inte vet hur jag ska räkna något
    - Prova laplace samt invers
    - Prova reglerna för omskrivning
- Om en faltning är svår
    - Gär öaplace
- Om det är en hög grad där nere, så kan jag ta varje term där uppe för sig. Och sedan förkorta bort
- Om jag har något in nämnaren av funktionen som är av hög grad och inte kan faktoriseras: faktorisera då med imaginära tal
- Om man inte kan göra ensidig laplace, även om man multipkicerar med theta:
    - Om det står att en kausal lösning söks så kan man göra laplace direkt
    - Begyenslevärderna kan även antas vara 0 (as per kausalitet)
- Om jag inte kan lösa ekvationssytemet genom laplace
    - Gör kramers regel
    - alternativt laplace och sedan kramers regel 
- i faltning så blir t nästan som en konstant i ijntegralen
- Då jag beräknar faltningar:
    - Alternativt: Gör laplace och sedan invers, alternativt integral
- "Kan systemet vara linjärt" kolla om en + andra blir tredje
- Överkomplicera inte. Om det finns en B2 lösning fast den inkluderar theta, använd då den
- Om jag tror att det inte är något, ex den inte är tidsinvariant, så kan jag försöka hittta ett motexempel
- Om möjligt, undvik ax+B i handpåläggningen och använd istllet A/s + B/s²

### Från extentor
- Skriv ... som ett system av diff ekvationer. gör u = y, v = y' 
- System är S eller bara fint ord för ekvationssystem
- Det är ok att bara skriva derivata av delta utan att förenkla
- Behöver inte alltid göra laplace när jag ska deriver
  - Se ex fråga 1 2022. Gör bara multiplikationssatsen
- Kolla om dom är linjärt oberoende mha scalarproduktet = 0
  - Måste man kolla linjärt oberoende?
  - Vad gör man om man har multipla egenvärden?
- Var nogrann med division med noll
  - Är ... en diagonalmatris? En fylld med bara 0:or är det

