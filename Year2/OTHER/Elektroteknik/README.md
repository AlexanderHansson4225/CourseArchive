# Information
Tenta om man vill ha 4:a eller 5:a

Kursbok:  
https://lucris.lub.lu.se/ws/portalfiles/portal/133569346/main.pdf 

* Tror jag skippade lite från föreläsning 1 och 2
* Ej kunna matematika härledning av formler men förstå viss tanke bakom det
# Föreläsning 1
### Basics
puls, frekvens och våglängd formel
`f = 1/T`

### Hjälpmedel
* Kan använda av jupyter notebook
  * Python biiblotek
  * Klippa och klistra outputten

Behöver inte räkna ut det för hand

Note to self: Kolla upp förra boken?

# Föreläsning 2
### Begrepp
* Noder: Punkter där komponenter kopplas ihop via anslutningar
* Ström: `i = dq / dt` dvs tidsförändring av laddning q (C) per tidsenhet (s). Alt. i=U/R. Mäts i ampere (A)
* Spänning / potential: Den potentiella energi som finns för laddning. Mäts i volt. Då en laddning q rör sig genom kretsen ändras dess potentiella energi
* Effekt: Energi per tidsenhet i en komponent. Mäts i watt. `P = U * I`


---
### Kretselement / komponenter
* Kretselement är idealiserade modeller 
* Komponenter är verkliga komponenter. Kan behöva använda sig av flera kretselement för att beskriva komponenter

### Enheter
* Ω: R = U / I där R är resistansen, U är spänningen och I är strömmen. Linjär
* Kapacitet: C = Q / U där C är kapacitansen, Q är laddningen och U är spänningen. Linjär
* Induktans: L = U / I där L är induktansen, U är spänningen och I är strömmen
* Resitivitet (ρ) (motståndsförmåga);har enhet 1/σ dvs Ωm
* σ tror jag är ledningsförmåga. 

### Konduktans
* Konduktans är motsatsen till resistans   
* Ledningsförmåga (σ): Alla material kan leda
```
G = 1/R
```

Den har enheten siemens (S) = 1/Ω

### Transporten
* J (A/m^2) drivs av E
```
J=ρ*E
```  
* E är ...?

### Hur räknas motståndet/resistansen?
Om materialet är l lång och tvärsnitt A.  
* `R=V/I=ρ*l/A`

### Resistans exempel

```
ρ = 10^(-5) Ω meter
l = 50*10^(-3) meter
diameter = 0.5*10^(-3) meter
R =  ro*4*l/(4*pi*diameter^2) blir 2 Ω
```

---
### Energi och effekt
* Effekt är energi per tidsenhet.
* Mäts i joule eller Ws

```
V*A=J/C*C/s=J/s=W

```
Notera energi är effekten vid varje tidspunkt summerat
* Angpende vatten:
```
Effekt=Tryck*flöde*...
```


### Effekt
Alternativt:
```
P = U*I
```
---
### Elektriska kretsar
* En elektrisk krets utgörs av
  * Enjukda jinoinenter
    * Fysiska föremål
    * Identifierbara anslutningspunkter

### Spänning 
![Image](images/Screenshot%20from%202023-03-22%2020-35-52.png) 

### Ledare och noder
* Ledare: Anses beräknas vara ideala
  * ρ = 0
  * E = 0
  * i tillåts vara obegränsad

### Seriekoppling
Samma ström i går genom alla komponenter
Om komponenterna har resistanserna R1, R2, ..., Rn så blir resistansen i seriekopplingen R = R1 + R2 + ... + Rn
```
Dvs blir v = (R1 + R2 + ... + Rn) * i
```

### Parallellkoppling
Samma spänning v ligger över alla komponenter:
* Komponenterna brukar kallas parallellkopplade
```
1/R = 1/R1 + 1/R2 + ... + 1/Rn
```
dvs
```
i = v / R = v * (1/R1 + 1/R2 + ... + 1/Rn)
```

Dvs adderas konduktanserna i parallellkopplingen

* Specialfall: n = 2
```
R = R1 * R2 / (R1 + R2)
```

Notera även att för spänningar över komponenter:
v1=v2=-v3
Givet v3 är bakvänd satt

### Nät
* Nät: består av grenar som sammanbinds i knytpunkter. En gren måste innehålla åtminstoende en komponent.
* Node: En punkt där två grenar möts
* Väsentlig nod: En nod som har minst tre grenar som går in i den

![Image](images/Screenshot%20from%202023-03-22%2020-36-01.png)

---
### Nollställning  
* Spännignskälla: Nollställs genom kortslutning (ingen spänning)    
* *Strömkälla: Nollställs genom ett avbrott (ingen ström)
--- 
### Kritchoffs späningslag (KVL)
* Om man går runt i en slinga (cykel) så blir summan av spänningarna noll
  * Dvs om man går runt medurs eller moturs och kommer till samma punkt:
Spänning är samna som innan man gick
--- 
### Kapacitant, induktans
Kapacitans
* Elektriska fält
* Spänningströg

Induktans
* Magnetiska fält
* Strömtrög

---
### Krichoffs strömlag  (KCL)
* Ström in = ström ut (in i en nod)  
Dvs om ström in är i1 och i2 och ström ut är i3 så:
* `i1+i2=i3`
### Kondensator
Tog detta väldigt snabbt. Se slides

# Föreläsning 3

# Föreläsning 4
### (->) = Strömkälla
Det tecknet (->)2mA betyder att den skapar en ström 2mA åt det specifika hålet. Ingen annan ström finns över den vägen

### Spännignskälla  (- +)
Skapar en skillnad i spänning mellan de två punkterna

Spänningskälla skapar problem vid en spänningskälla
- Svårt att räkna för man behöver veta resistansen på spänningskällan
- Alternativ lösning: Anta ett område som är spänningkällan och dess två närmaste områden
  - Räkna strömmen in och ut ur detta område

**Exempelvist**
Har spänning v2 vid höger nod. Sedan en spänningskälla (- +) med spänningsskillnad två. Sedan en spänning v3 till höger nod.
- Vad är v2 och v3? 
  - Gör ström analys men även tänk å att v2+2=v3


![image](images/exempel.png)

### Styrda källor
Spänningskällor och strömkällor med riktning

**Exempelvist**
om vi har ->(+ -) -2 [V/mA]
I exemplet ovan har vi nu inte v2+2=v3
- Istället har vi v3=v2+(-2)(1-v2)*1/1

Dvs räknar ut spänningsskillnaden genom att ta -2*i
där i = (1-v2)*1/1 

**Exempelvist**
Nodera om vi har ->(+ -) 2 [V/mA]
så får vi lösningen 
* v3+v2=1
* v3+v2=2

Detta är rätt räknat, men vi har kopplat konstigt, så vi får positiv återgång (dvs g ökar i, som ökar g osv)

### Ekvivalent krets med källa (lite oklart)
![image](images/ekvivalent.png)

Dvs tänk att vi har iA och iB.
- Det är linjär: så vi behöver bara två punkter för att räkna ut alla

vi har punkterna (i0, 0) och (0, v0) på i mot v graf
- Där `v0` är när `i = 0`
- vi är då v = 0 dvs vi har kortslutit kretsen

Kort sagt: Alla kretser som bestär av kombination av resistanser kan vi argumentera med hjälp av en **Thevenin ekvivalent krets**:

![image](images/thevenin.png)
![image](images/thevenin2.png)

notera att lutningen på den linjära grafen bli R=v0/i0
- Så räkna enbart `v0` & `i0` tror jag
- Kan då lösa resten av punkterna med den resulterande grafen

### Recept för nodanalys
```
1. Slå samman resistanser
2. Välj noder och referensnod
3. Sätt ut nodspänningar
4. Skapa supernoder
5. Skriv nätekvationer
  1. KCL i vanliga noder och supernoder
  2. KVL för noder i supernoder
6. För styrda källor
  1. Uttryck i nodspänningar
  2. Substituera i nätekvationerna
7. Normalisera ekvationerna (matrisform)
8. Beräkna nodspänningar (invertera matrisen)
9. Beräkna strömmar och andra spänningar
```

* Generellt, fungerar alltid
* Finns ofta enklare sätt - hitta dom
* Ekvivalenter och superpositioner

---

### Generellt tips då jag hanterar kretsar 
* from what I have observed of what he has done
  
Om jag ska mäta resistansen eller spänningen mellan två punkter
- Förenkla systemet utifrån de punkter jag ska ska jämföra
- Så skillnaden mellan punkt a och b:
  - Rita a längst upp i en graf, sedan grenar, och sedan slutar i en punkt b. Så kort sagt förenklar bilden, så det är lättare att analysera

---
# Föreläsning 5
### Kondensator
```
C = kapacitans (konstant om man inte rör på kondensatorn)
q = laddning
v = spänning
```


```
i = δq/δt
q = C*v
    => i = C*δv/δt
```

**Hur mycket effekt levereras till kondensatorn**  

```
p(t) = i(t)*v(t)
    => p(t) = C*δv/δt * v(t)
```

**Notera**: 
om `i = 0` 
=> `δv/δt = 0` 
=> spänningen är konstant 
(den bevaras även om strömmen stängs av)

**Hur mycket energi levereras från kondensatorn**  
- Note, denna typ av (enklare) integraler förväntas vi ha koll på
```
w(t) = w(0) + ∫p(t)dt  = ∫p(t)dt = 1/2*C*v(t)^2
```

(w(0) = start effekten)


### Missade regeln för kondensatorer över distans

---
### Serie och parallellkopplade kondensatorer
**Serie**
Att seriekoppla kondensatorer -> högre kapacitans
Formel: `C = C1 + C2 + ... + Cn`


**Parallell**
Att parallellkoppla kondensatorer -> lägre kapacitans
Formel: `1/C = 1/C1 + 1/C2 + ... + 1/Cn`

### Att vrida tillbaka spänningen
- Ger tillbaka negativ spänning
  - Resulterar i ström åt andra hållet
    - enligt `i = C*δv/δt`

### Övning kondesatorer
![image](images/2023-03-30-09-22-17.png)

Tydliggörelse: Den X liknande grejen i mitten är en strömbrytare med en pil över (ignonera pilen)

**Kortsluten krets**
Vid `t=t0` är strömbrytaren stängd
- Blir kortslutning (kan d ignonera högersidan)
- Vi kommer tillslut får `v(t) = 0`  oberoende av vad v(0) är
  - Enligt KSV så blir spääningen över R2 samma som spänningen över C (v(t))
  - Detta leder till en ström moturs. 
    - DVS man leder ström ut ur kondensatorn
  - i(t) i `i(t) = C*δv/δt` blir negativ
    - Dvs `δv/δt` är negativ. 
    - DVS spänningen blir tillslut noll
(Överkomplicera ej. Analysera folmerna bara)

**SIDENOTE**
Den sträckade lådan kallas fyrpol
```
v_in(t) = v_AB(t)
v_ut(t) = v_CD(t)
=>

h(t) = v_ut(t)/v_in(t)
H(s) = V_ut(s)/V_in(s) -- överföringsfunktion

```


**`i(t) = C*δv/δt`** i s-domänen
I(s) = CsV(s) - V
- Poängen är: Kan räkna i s-domän och det blir enklare

**Strömbrytaren öppen**
Kan slå ihop R1 och R2
Vi får då en spänning över R: `V_s-v(t)`
- Detta resulterar i en ström medurs
- Efter lång tid kommer då v(t) gå mot Vs

Då får vi 
```
v(t) = R*i(t)  -- Se till att du förstår varför
i(t) = C*δv(t)/δt
=> v(t) = -R*C*δv(t)/δt

-- löses med att räkna -R*C som konstant & V_s
v(t) = V_s*e^(-t/RC) 

```
**Note**: Ofta görs benämningen τ = RC för att RC har enheten sekunder







