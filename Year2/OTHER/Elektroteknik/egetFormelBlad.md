# Formelblad
- https://www.eit.lth.se/fileadmin/eit/courses/ess010/appadda_mod13.pdf

- https://canvas.education.lu.se/courses/22921/files/3393193?module_item_id=816009 

## Grundläggande
### Grundlagar
* `f = 1/T`

### Ström
* `i = δq / δt`
    * `δq` är laddningsskillnaden

### spänning
->(+ -)->
   * Om pilen representerar strömmens riktning så potentialen till höger lägre

### Resistans
* `R=V/I=ρ*l/A`
    * `ρ` är resistivitet

* Seriekoppling: `v = (R1 + R2 + ... + Rn) * i `

* Parallellkoppking: `v = (1/R1 + 1/R2 + ... + 1/Rn) * i`

### Kondensator
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
p(t) = abs(vC (t))^2/R
```

**Hur mycket energi lagras i en kondensator**  
* `w(t) =  1/2*C*v(t)^2`

### Induktans
* Spänningen:
  * `v(t) = L * di(t)/dt`

* Lagrad energi:
  * `W = 1/2 * L * i(t)^2`


### Effekt
* `p(t) = i(t) * v(t) = v(t)^2 / R = i(t)^2 * R`

* Ögonblickseffekt: p(t) = v^2(t)/R

### Energi
Energi per period T
* E_T = 1/R integral(from 0 to T, V^2(t) dt)

Ger medeleffekt
* P = E_T/T = 1/T*1/R integral(from 0 to T, V^2(t) dt)



## Frekvenser och amplituder
* V_pp = 2 * amplitude (point to point voltage)

### Decibel (tror detta stämmer)
- `20 * log_10 (v_2 / v_1)` -> dB
- `20 * log_10 (v)` -> dBV

**Tror detta stämmer bättre**
* `abs(H(jɷ))dB = 20log_10(abs(H(jɷ)))`
    * Medför: 10log_10(p1/p2)

## Effekt
### Effektivvärde
* Genomsnittlig effekt i en signal

* Fyrkantsvåg: V_eff = (amplitude)^2 tror jag
    * notera att (amp(t))^2 = amplitude^2

### Medeleffekt
* Medeleffekt (i form av värme som en resistans ger ut)
    * P = V * I = V^2 / R = I^2 * R
    * Occilerande: P = V_eff^2 / R

### Frekvensdiagram
1. f_s = sampelfrekvens
2. omega = `2 * pi * f` -> vinkelfrekvens
3. f_b = brytfrekvens 

* Det som visas är effektivvärdet (dbV)
* Effektivvärde som visas är relativt till amplituden av k = 1(typ 4/pi)
* så k=1 har höjden av sitt effektivvärde i dbV, i jämfört med dess egna amplitud

* Hur mycket summerar alla topparna i frekvensdigrammet till?
    * Alla summerar till effektivvärdet av amplituden


* Signaler med f_n = n × f_s + f_blue
    * Oskiljbara från f_blue

## Omvandlare
### Analog till digital
V_lsb = V_ref / (2^n-1) = V_FS / (2^n-1)
    * V_ref är referensspänningen
    * V_FS är omfånget av spänningen
        * Full-scale voltage 
        * Vill 

* sampelvärde (icke binärt) hänvisar till utdata från omvandlaren (maximalt 2^n-1)
    * Så vid trunkering z++ vid V_lsb
    * Så vid avrundning z++ vid V_lsb / 2

* Beräkna m och k för AD omvandlare
    * hämta två punkter dvs x är en volt, och y är ett sampelvärde

## Laplace
* H(S) = V_ut(s)/V_in(s)



