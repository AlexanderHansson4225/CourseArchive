# Oklara frågor
1.14. Förstår ej
13.6 - varfäör blir min uträkning fel?
13.8, svaret. Varför är laplace av R = R != sR?. 
16.2

# Varför fel? 
2.3

# Lärt mig
- Spänningen delas jämt i en parallellkopplad krets (mellan de olika grenarna)
    - Båda har samma spänning som om de hade varit seriekopplade

- Alternativt: Spänningsdelning för R1 parallellkopplad med R2
    - V_0 * R2/(R2+R1)
        - Om R1 och R2 är seriekopplade med en R1 så blir strämdelningen över R1:
            - V_0*--- 
    - Notera att R/(R+R) -> 1/2. Varfär inte ett?

- Strömdelning:
    - I = V / R, där V är spänningen över den, R är strömmen över den
    - Strömdelning tror jag inte finns
    - Borde väll visst finnas....?

- Spänningsdelning, seriekoppling:
    - samma som parallellkoplling
        - Så om vi har R1, R2 och R3 som ovan, och man vill beräkna soääningen över parallellkopplingen R1||R2:
            - v_12(t) = v_tot * (r1||r2)/(r1+r2+r3) 

- Spänning över en kapacitator
    - Görs med laplace
    - Vc(s) = Vs(s) * (1 / (s * C))
    -  1/sC? är impedansen
        - Kan räkna med det som resistans?
    - Vs(s) är den totala spänningen över kretsen i frekvensdomänen

- Spänningendelning mellan en resistans parallelkopplad med en kapacitator
    - VR = Vs * (R / (R + 1/(sC)))    
    - VC = Vs * (1/(sC) / (R + 1/(s*C)))
        - Se svaret på V_s(t) för vad V_s är. V_s är iaf strömmen över hela parallelkopplade systemet
            - Men även lite mer än så

- Kolla baksidan på boken också
- Varför blir laplace av V0 till V0/s? (samma med C)
    - I svaret på 13.6, varför blir spänningdelningen S

- Tomma kondensatorer är som kortslutningar
- Fulla är som en oändlig resistans

Om man har parallellkopplad i serie med en till resistans, och vill göra spänningsdelning:
    - Kolla på svaret för 13.8
    
Att hitta arbetslinjen:
- KVL: v_g(t) - IR - v_x(t) = 0
  - där v_g är voltgeneratorn, R är resistansen, i är ström genom kretsen och v_x är okända komponenten
  - Detta ger v_g(t) = IR + v_x(t)
  - Anta att I = 0 -> v_x(t) = v_g(x)
  - Anta att v_x(t) = 0 -> I = v_g(t)/R
  - Kan sedan rita ut två punkter som nu ger en rät linje
  - givet att v_g(t) = 0.3, R = 200
     - Kalla i = y, v_x(t) = x
     - Har 0.3 = 200*y + x
     - 0.3-x = 200*y
     - y = -x/200 + 0.3/200 -> dvs m = 0.0015 (samma som fås då v_x antas som noll) och k = -1/200 


- **Läs mer om impedance**

- tips är att spänningsvandra. Säg att i=i1+i2 om de ej finns
- Tror att spänningsdelning över spänningsgeneratorer är typ: v1/(v1+v2)... oklart



- För 3 parallellkopplade resistanser gäller:
    -  i<sub>3</sub> = (1/R<sub>3</sub>)/(1/R<sub>1</sub> + 1/R<sub>2</sub> + 1/R<sub>3</sub>)

- Om kopplingen varit på "länge" så kommer inte någon ström gå genom kapacitorn (alltid?) pga den är "full" med laddning!
