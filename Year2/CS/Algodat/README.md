# Info
 - 6 labs  
- jonasskeppstedt.net har videor (notera att har inget om lab 4)  
- calendly.com/forsete
- På tenta så är det inte skriftliga problem
  - Snarare "hur skulle du påbörja denna lösning"
  - Skulle detta kunna gå genom att använda greedy?
  - Förklara för en fyraåring hur man gör en viss sak (något han sa att han ofta frågar)
- I varje video så står det 3, 4, 5.
  - Representerar vilken nivå videon är på

- Måste vi ha koll på bevisen?
  - Oklart
  - Gör dom i efterhand isf?
  - Fråga på lektionen
### Todo tidigt i kursen
- Start preparing lab 2
- Download documentation
- Read input format (?)
  
# Föreläsning 1
## Algoritmer
- P: Polynomisk  tid
- NP: Lätt att testa, svårt att lösa
  - Definition: Om någon gissar en lösning så kan man på polynomisk tid verifiera om det är rätt eller fel
- NPC: Svårt

## Big O notation
 - Notera att O(n) ingår i mängden O(n²)  
 - Omega(n): 

- O(n^k) klassas som en effektiv algoritm

## Matchning
A matching M is a set of pairs (x,y) such that and x and y appear in at most one pair
 - Kan exempelvist användas för att hitta en bra matchning mellan jobb och personer

If all pairs are matched: M is a perfect matching
 - All companies have exaclty one job offer
 - Each company and student has an ordered list of preferences
 - If it is the best match so far, the match is added
   - If at a later stage, another student is added, the individual is switched out
   - Unstable matching: if either the student or the company would prefer another match
   - Is carried out by Gale-shapley algorithm
   - 


Algorithm temrination
Lemma: The Gale-Shapley algorithm terminates after at most n² iterations, due to there being at most that many combinayions of students and companies
 - Svårt att dra denna slutsats från koden, men lättare att se det då kombinationer räknas mellan student och företagslistan. 

Hint lab 1:
- The companies should not store students as preference list. Instead of storing 4,2,1,3 store 3,2,4,1. Meaning that student 3 is the first choice, 2 is the second choice, etc. This is referred to as the inverted list.

# Föreläsning 2  
Interval scheduling: 
The need of scheduling the use of a resource

Weighted Interval Scheduling

Solved easiest by dynamic programming

### Bipartite graph mathing
The nodes are partitioned in two sets  
No edges between nodes in the same set  
...tror inte detta var så viktigt i nuläget

## Hash map
Open adressing
- Hashfunktionen ger en index
- Förvarar nyckeln och datan i olika tabeller
  - stores saker i olika listor för att man bara behöver datan, så när datan sedan hämtas, så undeviker man att hämta nyckeln (när datan försöker vara smart - se yttligare förklaring kring detta längre ner)
- Vad lägg koliderad data?

Seperate chaining
- Hashfunktionen ger en index
- Vid kollision så läggs elementet i en länkad lista på den platsen

Load factor:
a = n/m = antal element stored / storlek på tabellen
## Seperate chaining
- Seperate chaining allows higher load factor but is slower to search (speciellt vid hög load factor)
  - Avoidance method: move frequently used elements to the front of the list
  - List tend to be slower because the data is spread out in the ram, meaning that the chance that the data is in the cache is lower  

## Open adressing
- Open adressing allows lower load factor but is faster to search
  - In array, the data is stored in a contigous manner (i en bunt, där varje element ligger efter varandra), meaning that the chance that the data is in the cache is higher
- Load factor has to be as low as possible, and always lower than one

### Linear probing (open adresesing method)
- Linear probing is a method of open adressing
- If a collision occurs, the next free slot is used instead
- Problem: If we delete an element, can we simply replace it with null?
  - no. Better solution is to mark the element as deleted
  - Alternativly move the next element to the deleted element
    - Problem: We also have to make sure to check if the element actually should be moved to the deleted element
      - It should only be moved if the next comming element should of originally been placed at the deleted element

**Clustering**: When a lot of elements are placed in a row, meaning that the next element is placed in the next slot
- Side effect: An increased amount of unsuccessful searches
- Dvs du söker första positionen: Den är upptagen
- Söker nästa position: Den är upptagen
- etc
- Clustering casues a lot of unsuccessful searches
### Quadratic probing (open adresesing method)
- Quadratic probing is a method of open adressing
- Instead of simply adding pos+i (pos+1, pos+2, pos+3, pos+4) we instead add i² (pos+1, pos+4, pos+9, pos+16)
- A maximum of load factor is set
- (Tip: when debugging the hashFunction x -> 0 is good)
- Fattade inte detta helt

### Double hashing (open adresesing method)
- Double hashing is a method of open adressing
- Have two hash functions
- h(k,i) = h1(k) + i*h2(k)
  - where k is the key, i is the number of collisions, and h1 and h2 are the two hash functions
- If clustering occurs, the second hash function will be used to spread the elements out
  - Avoids clustering
- Chosing h2:
  - Let h2 be relativly prime to prime
    - Achived by m = 2^n
    - ...
  
## Graphs
- A graph is a set of nodes and edges
- Can be directed or undirected
  - Dvs om man kan gå i båda riktningarna eller i bara en riktning
- Ofta i kursen: n antalet noder, m antalet kanter

### Graph representation
Two main ways of representing a graph:

### Adjacency matrix
- A matrix where the rows and columns represent the nodes
- If there is an edge between two nodes i and j, the value of (i,j) is 1, otherwise 0
- Fördel: Easy to check if there is an edge between two nodes
- Nackdel: Diffucult to figure out all neighboars of a node
- Optimization: Store only the upper or lower triangle of the matrix  
### Adjacency list
- A list where each node has a list of its neighbors
- Fördel: Easy to figure out all neighboars of a node
- Nackdel: Diffucult to check if there is an edge between two nodes

### Path and connectivity
- A path is a sequence of nodes where each node is connected to the next node
- An undirected graph is connected if there is a path between every pair of nodes

### Trees
- A tree is a connected undirected graph without cycles
- A tree always has n-1 edges
- In a rooted tree, there is a special node called the root

## Grafsökning
### Depth first search (DFS)
- Start at a node and visit all nodes that are reachable from that node
- Numerera noderna med så kallade "djupet först nummer"
- Görs lättast med rekursion 
  - `function DFS = forall(osökta noder): DFS(nästa nod)`

tror att:  
Cycle: Go to a lower index som inte är besökt
Forward: Go to a higher index som inte är besökt
Cross: 

# Föreläsning 3
## Strong connectivity in directed graphs
* Nodes u and v are mutually reacjaböe of tjere os a path from u to v and a path from v to u
* A directed graph is strongly connected if every pair of nodes are mutually reachable

### Lemma
* Let s be any node in a directed graph G. 
  * G is strongly connected <=> every node is reachable from s and s is reachable from every node

### Determening strong connectivity
1. Select any node s tllhör V
2. Use BFS on G from v and check if all of V is reachable
3. Consttruct G^r from G by revering all edges
4. Use BFS from G^r from s and check if all of V is reached
5. if s can reach a node u in G^r, thenu can reach s in G
6. if all of V is reached in both searches, G is strongly connected
  * O(n+m)

### Alternativly: Tarjan's algorithm
```
int dfnum
procedure strong_connect (v)
  dfn (v) ← dfnum
  lowlink (v) ← dfnum
  visited(v) ← true
  push (v)
  dfnum ← dfnum +1

  for each w ∈ succ(v) do
    if (not visited(w)) {
      strong_connect (w)
      lowlink(v) ← min (lowlink (v), lowlink(w))
    } else if (dfn (w) < dfn (v) and w is on stack)
        lowlink(v) ← min (lowlink (v), dfn (w))

  if (lowlink (v) = dfn (v))
    scc ← ∅
    do
      w ← pop ()
      add w to scc
    while (w ̸= v)
    process_scc(scc )
end

```

**The steps:**
* Se slidsen för stegen
* Säkert lättare att bara se en video på det

**Remarks**  
* Consider the edge (v,w)  
* When w is not yet visited, we must visist it by calling strong_connect(w)  
* When w is already visited, we must check if w is on the stack
* If w has been visisted: we have two main cases:  
  1. w is not on the stack, because it has already found its SCC
  2. w is on the stack, baucse it is waiting to be popped from the stack  
     1. If dfn(w) < dfn(v), then v must set its lowlink so it does not think it is its own SCC
     2. If dfn(w) > dfn(v) then no more information for v is availbable. There is another path from v to w due to which they belong to the same SCC

## Greedy algorithms
* It is not trivial to define that makes an algoirithm greedy  
  * The main idea is to se a simple rule to ake decisions (without taking all information into account)
* Proving a greedy algorithm is optimal:
  * Method 1: The greedy algoritm "stays ahead" - by proving it is always at least as good as an optimal solution
  * Exchange argment - transform the output of an optimal algoritm (without changing its quality) to the output of the greedy algoritm

## Interval scheduling
* A set R of requests, ri with a start time s(i)  and a finish time f(i)
* A set of requests is **compatible** if they do not overlap in time
* The **interval scheduling problem** is to find the largest subset S of R that is compatible
* All requests have equal value and it is the size of S we want to maximize
* A compatible set of maximum size is called an **optimal schedule**

### Greedy algorithm for interval scheduling
```
procedure schedule (R)
S ← ∅ /* S is a sequence */
while R ̸= null
  r ← select a request from R
  remove r from R
  add r to the end of S
  remove all request in R which overlap with r
return S

```
**A good select function**
Take the request with the earliest finish time

In psuedocode:
1. Select the request with the earliest finish time
2. remove all requests that overlap with this request
3. repeat until R is empty

**Example of proving that this is optimal**
* Using "our algorithm stays ahead of the optimal solution" method
* That is size(S) >= size(T)
  * Where S is the output of our algorithm and T is the output of the optimal algorithm
  * Meaning that our algorithm is at least as good as the optimal solution
  * Or in this case: They output the samer thing

### Greedy algorithm for interval scheduling while to minimize delays
* Consider now requests with a soft deadline d(r) and a time length t(r)
* It is not a disaster to faila  soft deadline compared to a hard deadline
* s(r) and f(r) are the start and finish times and in this problem they are the output, not the input
* The delay of one request is max(0, f(r) - d(r))
* goal: minimize the total delay of all requests

**How?**
* Select next with earliest deadline
* Schedule requests so that s(ri+1) = f(ri)

**Sidenote: var denna föreläsning klar?**

# Föreläsning 4
## Närmaste vägen för en riktad graf - Dijkstra's algoritm
**Antar att våran graf har godtyckliga positiva vikter**

### Variabler
d(v) = minsta avståndet från start (s) till v (slut)
 - Behöver två mängder
  - S: Sökta noder
  - Q: Noder vi inte känner till

### Algoritmen
* Från start: väljer ut den nod som ligger i Q, som har den kortaste vägen från startnoden. 
  * Hur? Titta på en nod på S.
  * minsta möjliga d(u) + w(u, w), där uϵS, vQ

  **Måste vi ha koll på varför det leder till optimal lösning?**

### Implementering av Dijkstra (pseudocode)

```
Mängder Q och S
S behöver ingen datastruktur
Q använder en prioritetskö
prioritet i Q är d(v)

while Q isNotEmpty
u = remove_min(Q)
for each neighbour v of u
  if d(u)+w(u,v) < d(v)
    d(v) = d(u)+w(u,w)
    pred(v)=u

```

### Tidskomplexitet?
m kanter
n noder

log n att sortera prioritetskö
För varje kant, tar vi bort en nod och sorterar:

O(m*log n)

---

## Hitta ett minimalt uppspännande träd (MST)
Vill minimera den totala vikten av alla kanter i trädet

### Alternativ 1: Prims algoritm
* Liknar Dijkstra
* Starta i en godtycklig nod s och lägg till närmaste noden till de vi redan besökt

**Utförande**
Ungefär samma som dijkstra (står i boken)

### Alternativ 2: Kruskal's algoritm
**Pseudokod**

1. Sotera alla kanter
2. Tag billigaste kanten som inte ger en cykel 
* Notera att kanten inte måste vara precis brevid trädet vi redan har
3. Upprepa tills vi har n-1 kanter

