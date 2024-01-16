# Tips
### Lösningsmetoder
1. Spänning- eller strömdelning
2. Thevenin- eller Norton-ekvivalent
3. Spänningsvandring (KVL)
4. Nodanalys
5. Kolla upp vad som gäller för komponenter
    - No joke, bara kolla relevanta funktioner
6. Laplace
7. Kolla igenom formelsamlingen

### Förenkla uppgift
- Paralllellkopplad ind/kap => thevenin
- Hitta några tal: Se om de är lämpliga vilolägen 
    - då jag kollar vad något blir efter oändlig tid
- glöm ej boken eller kompendium
    - notera att det kanske inte heter exakt samma
    - kolla upp ialllafall ADDA begrepppen

### Gör ej fel
- negativ tid: Antag funnits sedan -oo
- inkludera omega vid överföring om den finns tillgänglig (ac)
- blint lita inte på datorn

### Ej kan lösa
- Kolla lösningmetoder
- I fall av att jag inte kan lösa, även med hambley, kompendium, formelsamling osv
    - Kolla lösningar på gamla tentor, labbar, uppgifter
- låt dator lösa del av problemet
- kolla tips på papper eller läs hela löspapper

### Kolla rimligthet
- Kolla att värde vid t=0 och t=infinity är densamma som min ekvation ger
- Lös med flera olika metoder i mån av tid
- blint lita inte på datorn

### Öka chansen för korrekt
- Gör inte för hastiga slutsatser om v(0)
    - Speciellt för komplexa kretsar eller kretsar med transistorer
    - Motivera varför kapacitansen eller induktansen är något istället för enbart "det har gått lång tid" eller "kort tid"
    - Lita på matten istället
- Räkna hellre v_ut från H(s) än att räkna v_ut direkt
    - Speciellt om H(s) är enkelt

- Var försiktig med vinkeln på vinkelformen. Vill ha arctan på rätt sida

### Bra att veta
- V_AB  + V_CD = V_AC + V_BD

### Trick
- Kan dra slutsatser om inre resistanser på icke ideella källor genom att vänta lång tid, räkna bort kapacitatorer och sedan räkna ut resistansen
- Kan inte lösa kapacitans i krets? Gör theveninekvivalent
    - Ersätt ofta strömkällor med spänningskällor
- Att hantera olinjära komponenter (dioder, transistorer...)
    - Thevenin på resten av kretsen
    - Grafiskt  (kolla upp)

### Trivia
*Tips*
- Kolla bok, efter sidor som angår. Bör stå svaret där om det är basic facts  
- mer sanolikt att det är falskt
- kan modellera i lcapy
- ej vet: kolla upp, gissa, confidence, förklara inte allt
- kolla båda delarna - fokus på "men" delen
- "alltid" är ofta fel  
- kolla på ind.kon formlerna- sätt i eller v och se vad som händer

\\
- om sant:
    - säg varför det fungera
    - ge en formel
    - varför man kan bekräfta det
    - när de fungerar  

\\  

- Strömgenerator kan egentligen inte existera idealt
    - Kan inte generera ström oberoende om man har oändlig resistans

- Unrealiable:
    - violates KVL, KCL
    - Spänningsnivån på en plats är ej väldefinierad
        - generatorrerna säger emot varandra
    - EX:
        - kapacitans blir fulladdad (tolka som oändlig resistans)
            - men vi har en strömgenerator
        - kan inte ha en strömgenerator genom en bruten (oändlig resistans) krets
        - visas som NaN i lcapy

- kolla på formler av kompoenter
    - ex om en krets bryts så kommer induktansen ge upphov till väldigt hög spänning
    - v(t) = L * di(t)/dt
        - oöändlig hög strömskillnad, för att ge ut konstant spänning tillslut?
        
- tvinga inte in ström in i en kondesator (spänningen växer obergränsat)


    