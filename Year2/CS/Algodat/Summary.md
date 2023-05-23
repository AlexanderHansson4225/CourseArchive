
# Sorry, it is not formatted for md.
\\
O(n): Upper bound time complexity. Efficient: O(n²)
Ω(n): Lower bound time complexity
θ(n): Average time
Example: f(n) = 123n, g(n) = 32n³ => f(n)∈O(n²). g(n)∈Ω(n²)
_______________________________________________________________________________
Matchning: Algorithm sida 124
Match: Ett set av par (x_i, y_i) s.t de element enbart finns i ett par
Perfect match: All x_i and y_i are matched
Stable: No two pairs are unstable
Unstable((s_I, c_J), (s_K, c_L)) = 
(s_I prefer c_L && c_L prefer s_I) || (s_K prefer c_J && c_J prefer s_K)
Algorithm explained:
Take a list p of students. 
For each student, take the company they prefer most and havent applied to
add (s,c) if c has no student or prefers s over current (else add student to end of list)
Tip: Use inverted list (at index k is the students position in preference list) for companies preferences: Constant time to look up index i and index j and compare them
Time complexity: O(n²). n elever. n företag. En elev kan max söka n företag. Har n elever: O(n²)
Varför skapar perfekt, stabil matchning: 
Vet att om ett student ej har ett företag så finns det ett företag de ej sökt till (eftersom #student = #företag. Vet att företaget måste ta studenten om de ej är matchade. Dvs studenten har inte sökt alla företag)
Antag felaktigt att while-loopen terminerar med en student utan ett företag, för han har sökt till alla företag. Kommer alldrig ske pga punkt 1
_______________________________________________________________________________
Länkad lista (single, double, circular): Sida 46
AVL: 
Hashmap:
loadfactor = #element/(total size)
Seperate chaining (öppen hastabell): Vid collision läggs elementet i en länkad lista på indexet
Open adressing (stängd hashtabell): Vid collision lägs elementet på nästa lediga plats:
Linear probing: i = f(key) % n. if(!(a[i].empty)) then i++. Insert at i
Specialcase delete: Kan inte bar sätta till null (förlorar kommande element	
Replace with “deleted”
Move to left (flytta inte orelaterat element - beräkna nyckeln på elementet och kolla att den nyckeln stämmer överens med det vi flyttar)
Pseudokod sida 81

Quadratic probing (SIDA 84): Vill undvika clustering
h(k,i) = (h’(k) + i²) % m - tanken med i² (mot bara i) är att lämna en cluster snabbare
Om två olika nycklar har samma hashvarde så får vi cluster ändå
Om det finns tom plats hittar vi den inte nödvändigtvist: Förutom om #tabell är primtal och load factor är mindre än ½ (sida 84)
Dubbel hashing. Vill undvika andra hands clustering
h(k,i) = (h1(k)+ih2(k)
Risken att två nycklar har samma hashvärde är lägre
Garantera att alla postioner prövas (dvs kan nås av hashfunktionen: Sida 84

_______________________________________________________________________________
Graph representation:
Note: Can use both at the same time 
Adjancency matrix:
Edge i to j is represented by m[i][j]=1
notera: dubbletter i oriktad graf. Förvara då bara hälften
For dense graph: Smaller options, and just as quick
Pros&cons
Adjacensy list:
Edge i to j is represenated by i containing j (i contains its neighbors)
Path: Sequence of neighboaring nodes
Simple path: All nodes are distinct
Tree: (connected) undirected graph with no cycle
Depth first search (sida 91)
dfnum: Id på en nod
Ana (ancestor) & ättling (decendant): Om finns väg v->w, så är v ana, och w ättling 
Strikt ana: om v är ana till w och v != w
Trädkant: Är en kant i sökträdet T. Den finns då: I varje dfs(w) - DVS undersök w - och vi har en kant v->w och w inte har besöks så finns en trädkant (v,w)
Framåtkant:kant (u,v) s.t v är strikt ättling till u i T men v är inte ett barn till u i T. Framåtkanten upptäcks när vi är i u och v har blivit besökt, men ät inte i sökstacken och u < v. 
Korsande kant:  kant (u,v) s-t u är inte en ättling till v och v är inte en ättling till u.
Algorithm. Tänk på att gå djupet först. DFS är depth first search
Gör dfs på startnod
Gå nästa nivå, gör dfs
Upprepra 2 tills vi når djupet. 
Gå upp ett steg. Upprepra 3
Tidskomplexitet O(V+E)
Givet konstant lookup på successors
Pga 
_______________________________________________________________________________
Breadth first seach (sidan 93)
Kolla på noder med avstånd 1 från start 
Upperepa 1 för 2,3, …, n tills vi hittar slut eller vi har letat alla noder
Den rekursion som hittar t först returnerar alla deras predecessors. 
Tidskomplexitet
_______________________________________________________________________________
Mutably reachable: Path from u to v && path from v to u
Starkt sammankopplad: All nodes are mutably reachable
Starkt sammankopplad komponent: En delgraf som är stark sammankopplad
Starkt sammankopplat lemma: 
s är en godtycklig nod i G. G är starkt sammankopplad ⇔ Varje nod är nåbar från s, s kan nå alla noder
Bevis => per definition av stark sammankopplad G
<= för att vi vet att vägarna (u,....s,.....v) och (v,.......s,.......u) finns enligt lemma
Avgör stark sammankopplad med BFS: 
Välj en godtycklig nod, s
Kolla att alla noder kan nås från s
Invertera G. Kolla att alla noder kan nås (ekvivalent med att alla kan nå s)
Enligt lemma om 2 och 3 gäller ⇔ G är starkt sammankopplad
Hitta alla starkt sammankopplade komponenter: Tarjans algoritm
Low link: Det lägsta besöksordningsnumret för noden eller någon av dess ättlingar i grafen. 
Hjälper till att hitta noder som är  starkt kopplade till varandra
Algoritmen
Starta med en tom stack och en lista för att hålla reda på besöksordningen för varje nod i grafen.
Börja från en godtycklig nod i grafen och utforska dess grannar. För varje grannnod som inte har besökts än, kör Tarjan's algoritm rekursivt på den grannnoden.
Under den rekursiva utforskningen av en nod, håll koll på och uppdatera tre viktiga egenskaper för noden: 
dess visitationsordning (low-link-värdet)
om den är i stacken eller inte
om det finns en starkt sammanhängande komponent som hittats.
När rekursionen återvänder från en grannnod, jämför den besökta nodens visitationsordning (low-link-värdet) med grannnodens visitationsordning. Om grannnodens visitationsordning är lägre, uppdatera den besökta nodens visitationsordning till grannnodens värde. Detta hjälper till att hitta nodar som tillhör samma starkt sammanhängande komponent.
Om den besökta noden är roten för en starkt sammanhängande komponent (dess visitationsordning är lika med dess low-link-värde), töm stacken tills den besökta noden är överst i stacken. De noderna som tas bort från stacken tillhör samma starkt sammanhängande komponent.
Upprepa steg 1 till 4 för varje nod i grafen som inte har besökts ännu.
_______________________________________________________________________________
Greedy algorithm (sida 21): En algorithm som gör beslut utan all information
Bevisa att greedy är optimal
Greedy är alltid, åtminstoende, lika bra som en optimal
Utbytesargument. Transformera utfatan från en optimal algorithm (utan att göra den suboptimal) 
Interval scheduling: Hitta det största subsettet, så att alla element är compatibla
Compatible: Inga request överlappar
Algorithm: 
Sortera listan baserat på klar först
Välj request som är klar först: Addera till res
Ta bort överlappande
Goto 1
Tidskomplexitet: O(n log n)
Sortera: O(log n)
Välj ut: maximalt O(n)
Minimera förseningar
Soft deadlines (d(r): Kan failas, men föredras att inte - minimera totala förseningar
Output: Start s(r) och sluttiderna f(r) på requests
Input: tid(r), d(r). Ex r: t(r) = 2, d(r) = 3. Kan ex läggas s(r) = 1, f(r) = 3. Ger ingen försening
Algorithm:
Välj r_i med tidigast deadline: d(r_i) 
Schemealägga så att början på r_i+1 är i slutet av r_i
_______________________________________________________________________________
Dijkstra: Hitta den kortaste vägen (s.104)
d(v) är kortaste vägen från start till v
Q: Alla noder
S: Alla noder vi kan den kortaste vägen till	
Sätt d(s) till 0
Välj v som har kortast d(u)+w(e); u∈S, v∉S. e = (u,v)
Gör predecessor(v) = u
d(v) = d(u)+w(e)
Remove v from Q, add to S
Go to 1 while Q != null
Tidskomplexitet O(m log n)
Med antagandet att alla noder kan nås från s: #edges >= #nodes
Skapa ny heap: O(n) eller O(n log n) beroende på metod
Varje nod måste kolla varje granne i Q och eventuellt minska grannen nyckel. Tiden för att minska en nyckel är O(log n) - O(m log n)
Why is it correct?
Induktionsbevis
Basfalet då S=1. Dvs enbart s är i S. Då är d(s) är 0. Vilket vi vet stämmer
Inductive hypothesis: Assume theorem is true for |S| ≥ 1.
_______________________________________________________________________________
Minimum spanning tree (MST)
Uppspänt träd: Anta att vi har en oriktad graf G
Ett uppspänt träd till G, är ett träd som innehåller alla noder från G, men inte nödvändigtvist alla kanter.
Minimalt uppspännande träd: Ett uppspännande träd där summan av kanternas vikter är minimal
Jarniks algorithm / prims algoritm: 
Q: Till en början alla kanter, förutom start (en godtycklig nod)
Representerar de noder som finns kvar att integrera in i trädet
T: Representerar vårt uppsåänande träd (tom från början)
Välj en nod v, med minst vikt från u till v, där u∉Q, v∈Q
Ta bort v från Q
lägg till (u,v) till T
gå till 1 medans Q inte är tom
Time complexity O(m log n) givet m >= n:
O(n) iterationer av whilelooop
O(log n) att ta bort minimala noden 
Varje nod måste kolla varje av dess grannar, som inte är i Q & potentiellt 
m grannar värsta fall. Reduce key är O(log n) (reduce ley för Q ändras - därmed ändras w(u,v) vilket vi sorterar listan utifrån
ger O(m log n)
Kruskals algoritm
Välj den kant med minimal vikt
Om kanten inte skapar en cykel med T, lägg till den i T
ta bort kanten från möjliga conteneors för B
Gå till 1 medans vi har B != null
Detektera en cykel: 
Då vi väljer en kant, lägg till båda noderna i en mängd
om man vill lägga till kant (u,v)
givet find(x) ger mängden som x är i:
gör find(a) och find(b)
om de är samma, så är det en cykel
Union-find datastruktur
Kan merge två mängden
Skapa mängder med enbart ett element i varje mängd
Naive Union
parrent(v) = u. Lägger in v och alla under v i datastrukturen u är i
Quicker union
Håll koll på storleken på mängderna
Ta den minsta mängden, och lägg in den i den största mängden
Uppdatera storleken på den största mängden till summan av storleken av mängderna
Find(Hitta vilken mängd ett element är en del av)
Naive find:
Returnera v om v inte har en förälder
Annars returna find av föräldern
Quicker find:
Gör på samma sätt som naiva find, men under körningen, använd även path compression
DVS om v1 har föräldrer v2, v2 har föräldrer v3 osv upp till v_k
Sätt föräldrer till alla dessa till v_k, farfarfar….far. Höjden blir 2 på delträdet
Tidskomplexitet union-find:
Då path compression och union by size 
_______________________________________________________________________________
Rekursionsekvation
T(n): Runtime
example: T(n) = if(n == 1) return 0 else return 2T(n/2)+n
Used to analyze runtime
Mergesort relation
Open form / implicit form: T(n) <= if(n == 1) return 0 else return T(roundup(n/2)) + T(rounddown(n/2))+n
So: Total T(n) är arbetet gjort på den nuvarande nivån + summan av arbetet gjort på nivåerna under
Closed form / explicit form: T(n) = nlog_2(n)
Att hitta den explicita formen:
Kolla hur det ser ut i de lägre nivåerna
Gör en gissning
Bevisa mha induktionsbevis
Vårt fall:
Base case: n = 1: T(1) = 1 log2 1 = 0 => stämmer
Antag T(n) = n log2 n
T(2n) = 2T(n) + 2n = 2n log2 n + 2n = 2n(log2 n + 1) =
2n(log2 2n − 1 + 1) = 2n log 2n
The master theorem:
Nice  way to find closed form T(n) for many recursive algorithms:
T(1) = 1
T(n) = aT(n/b)+n²
Three solutions to master theorem:
T(n) = O(n²) if s > log_b(a)
T(n) = O(n^s log_2(n)) if s = log_b(a)
T(n) = O(n^(log_b(a)) if s<log_b(a)
_______________________________________________________________________________
Convex hull (inte i boken)
En delmängd av punkterna och kanter runtomkring dem, som omringar alla punkter
What is an leftturn
Vi vill kolla om det är en vänstersväng då vi går från p0, över p1, till p2
Gör vector från p0 till p1. Gör vector från p0 till p2
om kryssprodukten av p0p1 vector och p0p2 vektorn är positiv så är det en vänstersväng
Jarvis march
Välj en punkt p_0 som helt säkert är en del av convex hull (ex leftmost)
Välj nästa punkt p_j
Om vi enbart gör vänstersvängar då vi går från p0, p_j till 
Graham scan
Algorithm
Ta punkten p0 med lägst y och gör den till origo
Sortera punkterna utefter deras vinkel till x-axeln (arctan)
Specialfall, då två har samma vinkel. Vi vill inte ha den närmast origo, så lägg den först i listan, så att den senare kan pop:as av den längre bort från origo
Gå igenom de sorterade punkterna. För varje punkt, kontrollera om den gör en högersväng eller en vänstersväng jämfört med de två föregående punkterna i höljet. Om den gör en högersväng innebär det att den föregående punkten inte ska vara en del av det konvexa höljet och tas bort. Upprepa detta steg tills den aktuella punkten gör en vänstersväng.
Upprepra till vi har behandlat alla punkter
_______________________________________________________________________________
Dynamisk programmering: 
Uttryck en lösning utifrån lösningar av delproblem
I jämfört med divide and conquer så finns överlappande problem
DVS memoization är viktigt för optimering
Egentligen bara ett fint ord för att effektivt räkna ut alla lösningar
Weighted interval scheduling (sida 41)
Input: Requests, with starts, finishes and weights
Output: Maximum the sum of the weights
Namn: f(r_1)=f(1)<=f(r_2)=f(2) <= ….
dvs f(1) har sluttid först

Algorithm (utan memoization)
Bilda en funktion rekursiv funktion OPT(n) som räknar hur den maximala värdet av alla requests från r0 till rn (genom att beräkna alla alternativ)
Välj det request, p(n) med tidigast sluttid som är kompatibel med nuvarande schemat
Med hjälp av OPT(n), kolla om p(n) borde vara en del av resultatet. DVS: 
Om OPT(n) = v(n) + OPT(p(n)) så läggs p(n) till i resultatet
Om OPT(n) = OPT(n-1) så läggs p(n) inte till
Algortithm (memoization)
OPT(i) kommer aldrig att ändras. Finns bara en unik optimal lösning
Kan göra OPT(i) bättre genom att göra så att den minns OPT(i)
DVS om OPT(i) inte har beräknats förut: Beräkna och skriv ner det
Om opt(i) har berknats förut, använd det värdet
Time complexity
String allignment
Bellman-ford: Shortest path.
Kanter kan vara engativa
Minimal kostnad för att nå start till mfål
OPT(i,v) är en väg v->t som använder <= i kanter
Algorithm:
Tilldela alla noders avstånd från startnoden till oändligt, förutom startnoden själv som tilldelas avståndet 0. 
Gå igenom varje kant i grafen och uppdatera avståndet till den angränsande noden om det finns en kortare väg genom den aktuella kanten. Uppdatera även föregångaren för den angränsande noden.
Upprepa steg 2 för antalet noder minus 1 gånger. Detta är nödvändigt för att säkerställa att alla möjliga kortaste vägar har identifierats och att eventuella negativa cykler upptäcks.
Kontrollera om det finns några negativa cykler (dvs oändligt låg lösning?) genom att utföra ytterligare en avslappning på kanterna. Om någon nod har en kortare väg genom en negativ cykel, kommer algoritmen att upptäcka detta och rapportera att det inte finns någon lösning.
(använd föregångarlistan för att hitta den kortaste vägen)
Flow network
flöde: Hur mycket går över en kant
Capacitet: Hur mycket flöde får gå över en 
Cut: En delmängd (A, B) där start tillhör A, slutet tillhör B
Kapcitet av en cut: Summan av kapaciteten av alla kanter som går ut från mängden
Maximum flow problem: Maximera flöded som går in till t
Ford fulekrsson algorithmen… med problem att vi kan fastna (s.112)
Delta(e) = utrymmet för förbättring på en kant
Representeras av ett värde större än 0 i g_f
DELTA(path) = flaskhalsvärdet = min(delta(path(1)), delta(path(2)) … )
Residualgraf: En graf med samma noder som den ursprungliga grafen, men med kanter vars vikt representerar hur mycket mer flöde kan skickas mellan två givna noder i den ursprungliga grafen
Framåtkant: alltid c(e)-f(e) (så mycket vi kan öka) 
Bakåtkant alltid f(e) (så mycket vi kan minska)
I ford fulkersson har en kant en riktning, som sätts i början, men man har möjlighet att färdas åt båda riktningarna
Initiera G och G_f. 
G har till en början 0/c(e) på alla kanter
G_f har till en början c(e) i riktningen av alla framåtkanter (inga bakåtkanter finns)
Kollla efter en enkel väg från s till t i residualgraf och beräkna DELTA(väg) != 0
Öka flödet med DELTA i G
Uppdatera G_f enligt 
Framåtkant: alltid c(e)-f(e) (så mycket vi kan öka) 
Bakåtkant alltid f(e) (så mycket vi kan minska)
Upprepa 2 till ingen mer väg finns till slutet i G_f
Om en sådan väg inte finns: har vi maximalt flow. 

Tidskomplexitet:
Vid varje iteration ökar flow med minst 1
om C är summan av alla kapaciteter, så kan vi maximalt ha C iterationer
Vid varje iteration utförs en sökning till slutet. 
Med antagandet att BFS används, tar denna sökning tiden O(m)
Så vi får tidskomplexitet O(Cm)
Biparte match: 
_______________________________________________________________________________
Array based heap:
Root stored at index 1
k_j means the key stored at index j
Structure of array based heap: Parent is always smaller than children
k_j <= k_2j, k_j <= k_2j+1
We know nothing about k_2j vs k_2j+1
Delete min:
Replace the element at index 1, with the last element
Move it down to its correct position - with comparisons and switches (O(log n))
Insert:
Add element on the end
Move it upwards with comparsions and switches
Decrease-key / change priority:
Minska värdet på en nyckel av ett specifikt element
Ändra värdet på nyckeln (nu bryter det mot heap egenskapen
Flytta den uppåt med jämförelser med föräldrar till man når den rätta platsen
Initialize a heap
ALT 1: n inserts 
ALT 2 (bättre): Heapify - min heap förklarat, men funkar likadant för max heap
Starta med en osorterad array som du vill använda för att skapa en heap.
Börja från den sista föräldern i arrayen och arbeta dig bakåt till roten. För en array med n element är den sista föräldern på index (n/2) trunkerat
För varje förälder, jämför dess värde med sina barn och byt plats om det behövs för att upprätthålla heapegenskapen. Genom att byta plats med det minsta barnet flyttar man  successivt mindre element mot toppen av heapen.
Upprepa steg 3 för varje förälder tills roten i heapen är nådd.
Height of heap: log_2(n) trukerat
Antal noder på en viss höjd: roundup(n/2^i+1); i är höjden (höjd 0 är lövens nivå)
Specialfall. För löven kan man även ha mindre än detta antal
FÖRL 8. Kolla på video om hollow heap
_______________________________________________________________________________
Hard problem: No one knows an efficient solution (O(n^k)
Decision based problem: yes or no question
Optimazation based problem:  Find an optimized solution to an problem
P class: Problems where there exists an O(n^k) solution to the problem
NP class: Problems where there exists a O(n^k) verification algorithm
Notera att P är en delmängd av NP
Polynomial time reductions
Consider problems P1 and P2 and solution A2, solving P2
We need P1. P1 has input x
Consider f(x) which maps A1 input to A2 input 
If A2(f(x)) = A1(x), you have found A1
If f(x) is efficient, we have created an polynomial time reduction
Vi noterar detta som P1 <=p P2 för att P1, är lika svårt eller lättare än P2
P1 is o

Y <=p X
X easy => Y is easy
Y is hard => X is hard
X ≡p Y = Y <=p X && X <=p Y
Y hard ⇔ X hard
Y easy ⇔ X easy
NP-competedness (NPC)
X ∈ NP
For all Y ∈ NP we have Y ≤P X
NP-hard 
For all Y ∈ NP we have Y ≤P X
Ergo, doesnt necessarily need to be in NP
Ergo doesnt even have to have a polynomial verification
Proving NP-completedness
Show Y is NP (ergo has polynomial verification)
Take a problem X that is NPC and make a reduction from X, dvs show X <=p Y
DVS Y är åtminstoende lika svårt som X
DVS Y är NPC
The first NP-completedness proof
Visa Y är NP
For all X ∈ NP we have X ≤P Y
Unit propagation













