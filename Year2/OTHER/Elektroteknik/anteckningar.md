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
* Ström: `i = dq / dt` dvs tidsförändring av laddning q (C) per tidsenhet (s)
* Spänning / potential: Den potentiella energi som finns för laddning. Mäts i volt. Då en laddning q rör sig genom kretsen ändras dess potentiella energi
* Effekt: Energi per tidsenhet i en komponent. Mäts i watt. `P = U * I`

---
### Kritchoffs ström- och spänningslagar

---
### Kretselement / komponenter
* Kretselement är idealiserade modeller 
* Komponenter är verkliga komponenter. Kan behöva använda sig av flera kretselement för att beskriva komponenter

### Enheter
* Ohm: R = U / I där R är resistansen, U är spänningen och I är strömmen
* Kapacitet: C = Q / U där C är kapacitansen, Q är laddningen och U är spänningen. 
* Induktans: L = U / I där L är induktansen, U är spänningen och I är strömmen
* Resitivitet (rå) (motståndsförmåga);har enhet 1/sigma dvs Ohm meter
* Sigma tror jag är ledningsförmåga. 

### Konduktans
* Konduktans är motsatsen till resistans   
* Ledningsförmåga (sigma): Alla material kan leda
```
G = 1/R
```

Den har enheten siemens (S) = 1/ohm

### Transporten
* J (A/m^2) drivs av E
```
J=rå*E
```
E är ...?
---
###. Hur räknas motståndet/resistansen?
Om materialet är l lång och tvärsnitt A.  
R=V/I=rå*l/A

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

### Nät
* Nät: består av grenar som sammanbinds i knytpunkter. En gren måste innehålla åtminstoende en komponent.
* Node: En punkt där två grenar möts
* Väsentlig nod: En nod som har minst tre grenar som går in i den

![Image](Screenshot%20from%202023-03-22%2020-36-01.png)

---
### Nollställning
Spännignskälla: Nollställs genom kortslutning (ingen spänning)  
Strömkälla: Nollställs genom ett avbrott (ingen ström)

