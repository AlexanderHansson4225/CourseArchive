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
