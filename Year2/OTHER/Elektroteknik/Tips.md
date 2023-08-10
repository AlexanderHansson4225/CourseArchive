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


### Ej kan lösa
- Kolla lösningmetoder
- I fall av att jag inte kan lösa, även med hambley, kompendium, formelsamling osv
    - Kolla lösningar på gamla tentor, labbar, uppgifter
- Kolla med copilot

### Kolla rimligthet
- Kolla att värde vid t=0 och t=infinity är densamma som min ekvation ger
- Lös med flera olika metoder i mån av tid

### Öka chansen för korrekt
- Gör inte för hastiga slutsatser om v(0)
    - Speciellt för komplexa kretsar eller kretsar med transistorer
    - Motivera varför kapacitansen eller induktansen är något istället för enbart "det har gått lång tid" eller "kort tid"
    - Lita på matten istället
- Räkna helre v_ut från H(s) än att räkna v_ut direkt
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
    