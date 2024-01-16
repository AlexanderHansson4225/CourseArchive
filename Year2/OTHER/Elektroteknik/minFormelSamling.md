# Formelsamling
- https://lucris.lub.lu.se/ws/portalfiles/portal/133569346/main.pdf 
    - boken
- https://canvas.education.lu.se/courses/22921/files/3393193?module_item_id=816009 
    - adda kompendium


# Grundlagar
* `f = 1/T`

# Ström
* `i = δq / δt`
    * `δq` är laddningsskillnaden

# spänning
->(+ -)->
   * Om pilen representerar strömmens riktning så potentialen till höger lägre

# Resistans
* `R=V/I=ρ*l/A`
    * `ρ` är resistivitet

* Seriekoppling: `v = (R1 + R2 + ... + Rn) * i `

* Parallellkoppking: `v = (1/R1 + 1/R2 + ... + 1/Rn) * i`

# Kondensator
* Trög för ändringar i v(t)

*Standardlösning för ett RC system i DC:*  
 - Härledd av diff.ekv
v_C(t) = V(t)(1-*e^(-t/RC))  
c_R(t) = V_0*e^(-t/RC)

*Lösning i AC:*  
- Dator
- H(jw)

```
v(t) = R*i(t)
i(t) = C*δv(t)/δt
=> v(t) = -R*C*δv(t)/δt
```

```
i = δq/δt
q = C*v
    => i = C*δv/δt
```

* Seriekoppling: `1/C = 1/C1 + 1/C2 + ... + 1/Cn`
* Parallelkoppling: `C = C1 + C2 + ... + Cn`

**Hur mycket effekt levereras till kondensatorn eller en resistans**  

Alternativ 1:
```
p(t) = i(t)*v(t)
    => p(t) = C*δv/δt * v(t)
```

Alternativ 2: 

```
p(t) = v_C(t)^2/R
```
- Notera att v_c(t) kan göras om till ström om vi inte hanterar en seriekoppling 

**Hur mycket energi lagras i en kodensator**  
* `w(t) =  1/2*C*v(t)^2`

# Spole
* Trög för ändringar i i(t)

*Standardlösning för ett RL system i DC:*  
 - Härledd av diff.ekv
i_L(t) = i_oo(t)(1-*e^(-t/tau))  
- tau = L/R

*Lösning i AC:*  
- Dator
- H(jw)

```
v(t) = L * di(t)/dt
```

```
i(t) = Const + integral(from 0 to t, v(t) dt) / L
```

* Seriekoppling: `L = L1 + L2 + ... + Ln`
* Parallelkoppling: `1/L = 1/L1 + 1/L2 + ... + 1/Ln` ---

**Hur mycket effekt levereras till induktor**   ---- 


```
p(t) = v_L(t)^2/R
```

**Hur mycket energi lagras i en induktor**  
* `W = 1/2 * L * i(t)^2`


### Effekt
* `p(t) = i(t) * v(t) = v(t)^2 / R = i(t)^2 * R`

* Ögonblickseffekt: p(t) = v^2(t)/R

### Energi
Energi per period T
* E_T = 1/R integral(from 0 to T, V^2(t) dt)

Ger medeleffekt
* P = E_T/T = 1/T*1/R integral(from 0 to T, V^2(t) dt)

### Superposition
* Kortslut alla strömkällor
* Avbryt kablar in i alla strömkällor

* Gör grundläggande superposition

# Delning
## Spänningsdelning
* `v_1 = v_tot * (R1 / (R1 + R2))`

## Strömdelning
* `i_1 = i_tot * (R2 / (R1 + R2))`

# Thevenin och Norton
### R_t
* Kortslut alla spänningskällor
* Avbryt kablar in i alla strömkällor

* Alternativt räkna V_infinity/I_0
### V_t
* Ersätt resistorer där det ej går ström med kortslutningar (per URI)
* Beräkna V_A mha nodanalys och eventuellt superposition


### I_n
I_n = V_t / R_t
Alternativt räkna I_O


# Fasvektorer
𝑉0∠𝜃 <-> 𝑉0(cos 𝜔𝑡 + 𝜃)

# Spektrumanalys
## Decibel (tror detta stämmer)
- `20 * log_10 (v_eff_2 / v_eff_1)` -> dB
    - v_eff_2 är värdet
    - v_eff_1 är den vi jämför med
- `20 * log_10 (v_eff)` -> dBV
    - dvs v_max = v_eff * sqrt(2)
    - Notera om vi får dbV och gör till V, så får vi v_eff
    * Representerar hur det förhåller sig relativt till 1 V
        * ex tänk v_eff/1 = v_eff
    * Detta vi plottar i grafen - de olika nivåerna
        * notera att k=1 hamnar på 20log(v_rms)

## Frekvensdiagram
* Frekvens på x-axeln, effekt på y axeln

1. f_s = sampelfrekvens
2. omega = `2 * pi * f` -> vinkelfrekvens
3. f_b = brytfrekvens = 1/(2*pi*R*C)


* Det som visas är effektivvärdet (dbV)
* Effektivvärde som visas är relativt till amplituden av k = 1(typ 4/pi)
* så k=1 har höjden av sitt effektivvärde i dbV, i jämfört med dess egna amplitud

* Hur mycket summerar alla topparna i frekvensdigrammet till?
    * Alla summerar till effektivvärdet av amplituden


* Signaler med f_n = n × f_s + f_blue
    * Oskiljbara från f_blue
    * aliasing
    * viker/speglas vid f_s/2
        * de som viker in sig måste vara lägre än 1/2 V_lsb

* Nollpunktsfel: `abs(m-m0)`
    * m0 är det ideala
    * alternativt: 'abs(m/k)
        * m, k är icke ideala

* förstärkningsel:
    * (k-k0)/ k = ...%

* kvantiseringsfel:
    * fel pga avrundning
    * ex för trunkering: V_lsb
    * vid avrundning: V_lsb/2

## Omvandlare

### Analog till digital
* Tar analoga värden och gör dem digitala (binära)

V_lsb = V_ref / (2^n-1) = (V_FS-offset() / (2^n-1)  
    * V_ref är referensspänningen (tillåtna ingångsspänningar)
    * V_FS är omfånget av spänningen  
        * Full-scale voltage   

* sampelvärde (icke binärt) hänvisar till utdata från omvandlaren (maximalt 2^n-1)
    * Så vid trunkering z++ vid V_lsb
    * Så vid avrundning z++ vid V_lsb / 2

* Beräkna m och k för AD omvandlare
    * hämta två punkter dvs x är en volt, och y är ett sampelvärde

### Antivikningsfilter
- 80dB filterkrav betyder att en minskning på 80dB ska ske vid f_s-f_b
    - Det är ju signalerna mellan f_s-f_b och f_s som kommer att vikas in
    - Så man lovar att det är en minskning på åtminstoende 80dB där

- Nödvändig ordning på filtret på sida 5 i ADDA kompendiumet
    - A_SB är nödvändig dämpning i stoppbandet
    - Glöm ej avrunda uppåt. Så 4.4 blir ordning 5

- mycket annat bra i kompendiyumet

### Kvantisering
* V_lsb = V_ref / (2^n-1) = V_FS / (2^n-1)  
    * V_ref är referensspänningen  
    * V_FS är omfånget av spänningen  
        * Full-scale voltage

* Bilden nedan visar hur 1/N till N/N bitar kommer att kvantiseras
![image](images/kvantisering.png)


### Digital till analog
* Representerar en binär signal med en spänning

# AC
* omega påverkar överföringen, och därmed p(t)
* v_ut = H(jw) * v_in
* v_ut_eff = abs(H(jw)) * v_in_eff

## Effekt / värme
- Räkna vanligt p(t)
    - Men med hänsyn till omega vid överföring
- p är även samma som P = Re{S}
- kan inte summera två effektivvärden
    -  räkna p(t), summera dem. räkna v_eff ur det

# Filter
### Grundläggande
* Dämpningen vid brytfrekvensen är -3dB
    * Dämpningen vid brytfrekvensen är 1/sqrt(2) = 0.707
    * Härledning: 20log_10(w/w_b)
        * = 20log_10(1/sqrt(2))

* Decade: 10 gånger större frekvens

* H(S) = V_ut(s)/V_in(s)

### Dämpning och förstärkning
1. att sätta in s = jw
2. beräkna 20log_10(abs(H(jw)))
    - w är vinkelfrekvensen
        - w = 2*pi*f = 2*pi*440k exempevis
    - w_b är brytfrekvensen
        - w_b = 1/(R*C)
        - alternativt samma som resonansfrekvensen

### Resonans vid frekvensen
Kräver att L och C har samma impedans med olika tecken, och vi får resonans vid:
* 1/2𝜋√𝐿𝐶
    * Notera även att de tar ut varandra


2. Alternativt: 20log_10(abs(H(jw))) = 
    - 20log_10(abs(H(jw_b)))
    - Där man använder v(t)

### Impedans
* Impedans: Z = R + jwL + 1/jwC
    * R är resistans
    * L är induktans
    * C är kapacitans
    * Förläng med L och C med j vid förenkling


## MOS
![image](images/mos.png)
![image](images/matta.png)
strypt, linärt och mättat syftar på I_D
* Se grafiska lösningar i slidsen

Trivia:
* i(t) mot gate = 0 pga oxidlagret
    * mycket användbart även utanför trivia
* symmetrisk
* s & B ofta ihopkopplade
* dopingen avgör villken transistor
    * reistiviteten och riktningen på i_D då också
* småsignal på 219
    * C_g sida 223 (mest relevant vid höga frekvenser)

### Förenklat
* K = kW/2L
    * k är konstant (det funky k)
    * W är bredden
    * L är längden
    * Finns även en alternativ uträckning till detta beroende på epsilon
* Subtröskel: I_D = 0
    * "V_out är 0" kan man typ säga...
* Linjärt: I_D = linjär
* Mättat: I_D = konstant
* Gate strömmen är 0 (idealt)

### Begrepp
* V_DD: Matningsspänning
* Statisk strömförbrukning:                  Strömförbrukning när komponenten är inaktiv
    * Sker då nmos och pmos leder samtidigt
* Krav på inspänning
    1. 0 <= V_in <= V_DD
    2. !(v_in > v_h && v_in < v_l)
        * v_l är högsta spänningen som ger 0
        * v_h är lägsta spänningen som ger 1
* Parasitkapacitans

### Beräkning av v_h och v_l & statisk strömförbrukning
* Med kravet att vi inte vill ha statisk strömförbrukning:
    1. v_l = abs(v_tn)
    2. v_h = v_DD - abs(v_tp)
    * v_tn är tröskelspänningen för nmos
    * v_tp är tröskelspänningen för pmos
    * Inte helt säker om absolutbeloppet ska vara där, men verkar som det

* Energi förbrukas då båda MOS leder
    * Dvs då v_in > v_l eller v_in < v_h

### Output spänning
* En MOS kommer antingen vara av eller på
    * Den gränsen går vid V_GS = V_tn
    * Dess output spänning kommer då öka tills den når V_DD
* Inputen ökar över tid
    * DVS kommer finnas ett läge där båda MOS leder (ger ut spänning)

### Approximation av seriekopplade MOS
* Två likadana, seriekopllade transistorer
    * Dvs samma W och L
    * Kan approximeras som en MOS med newL = 2L

T3 och T4 är seriekopplade  
Blanda inte ihop hur seriekopplade komponenter och seriekopplade transistorer ser ut  

### Tidsberäkningar
* "Vilken tog längst tid"
    1. Flaskhalsen är transistorerna (räkna tiden för sladdar som 0)
    2. Tiden för en transistor att förändra sig till input är proportionell mot i_D 
        * DVS högre i_D -> snabbare
    3. i_D är proportionell mot K = kW/2L
    4. Så om något är dubbellt så långt, men 3 gånger större k -> 3/2 så lång tid

### Värmeutveckling
* Bara transistorer som det går ström igenom utvecklar värme
* DVS inaktiv (ex om PMOS får 0) -> ingen värme
* Om en transistor med total paracitkapacitans C byter håll så blir energiförbrukningen
    * E = 1/2 * C * V_DD^2
* T1 leder och "avbryts" av T2
    * T1 utvecklar värme


### Förbrukad effekt
* Som vanligt:
### Effekt
* `p(t) = i(t) * v(t)`
    * DVS vårt fall:
        * `p(t) = i_D(t) * v_DS`

### Utecklad värme
- beror på C_g
    - räkna p(t) some en vanlig kapacitans

## Diod
* Tänk också på att den kan bli en kortslutning
    * Dra inte för snabb slutsats om kapacitanser och spolar
* DVS om ström går mot en diod så vet vi att den har satisfactory spänning för att leda ström

### Begrepp
* Hur den fungerar:
    * Dioden leder ström i en riktning
        * Riktning = från anod till katod
        * DVS den riktningen som pilen pekar
    * Dioden leder inte ström i andra riktningen
    * DVS enbart om v(t) > 0 leder den ström

* Ideal: 
    * Framspänningsfall: 0V

* Framspänningsfall: 0.7V
    * DVS om v(t) > 0.7V leder den ström
    * DVS om v(t) < 0.7V leder den inte ström

## Olinjära komponenter
### Process (samt loadlinje)
* Förenkla allt som är linjärt med thevenin
* Gör en grafisk lösning
    * Plotta i_D = f(v_D) -> motsvarar genom och över det olinjära
    * V_t - R_t * i_D = v_D = f-1(i_D)
    * Rita linjen genom 
        1. punkterna I_D = 0 och V_D = V_t
        2. i_D = V_t / R_t och V_D = 0
    * Skärningspunkten är lösningen

### Fungerar även för transistorer
![image](images/loadline.png)

# Begrepp
* belastad
    * extra tillagd komponent, antingen i serie eller parallellt
    * Noggranhet, upplösning, v_lsb
    * se kompendium



