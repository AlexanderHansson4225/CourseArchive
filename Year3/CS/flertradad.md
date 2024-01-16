# Kursinformation
* Videor ersätter inte föreläsningarna
* Anmäll till labbar (senast 3/9)  
* Tentan testar programmering och teori
* Måste inte ha boken (bara bra att ha)

# Flertrådad programmering
* **Real time systems**
    * System med tidskrav



## Locks
* Using a lock to protect the critical section
    * En tråd pausas (låses)


* **Mutual exclusion** - Only one thread can be in the critical section at a time  (aka mutex - mutal exclusion)

* **Kapplöppnig**
    * Resultatet beror på vilken tråd som blir klar först (dåligt)

* Bank account
    1. Lock (taken by withdraw)
    2. Withdraw 
    3. Unlock
    4. Lock (taken by deposit)
    5. Deposit

* java: `lock()`
    - låser (kan enbart en gång)

* java: `unlock()`
    - låser upp


* **Semaphore**
    * `s.acquire` & `s.release`
    * Kan låsa flera gånger_
        var s= new Semaphore(1)
            * mer generrellt fall