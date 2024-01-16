# Background
* Use fourth version of book, not third. 

* Second lab takes alot longer than first
* Project 2 takes much longer than project 1



# CIA 

## **(C)onfidentiality**
**What**
- Prevent unauthorized disclosure of info
- Related to **reading** data
    - Only applies to the existence of data

**Two aspects**
1. Data condifentiality: Protection of private infomation
2. Privacy: assurs that individuals control or influence info related to them

**Achived by**
1. Encryption
- Encrypt the data 
2. Access control
- Only the correct person can access the data

## **(I)ntegrity**
**What**
- Prevent unauthorized modification of information
- Related to the **writing** of data

**Two aspects**
1. Data integrity
- Assuring data and programs are changed only in a specified or authorized what
2. System integrity
- Assung a systems its intended function, free from unauthorized manipulation

**Achived by**
1. In communication
- Detection of modicfications
2. In genereal
- Make sure everything is as it is supporst to be

*Many tools*: CRCs, hash functions, MAC, Digital Signatures

## **(A)vailability**
* Assures that sustems work promplty and service is not denied to authorized users

**Two aspects'**
1. Quick access
- No (short) delay
2. Realiable access

**Risk**
1. *Denial of service attack*
- Prevention of authorized access of resource bu sending large amounts of malformed network packets
- Or registering the domain woth the name of a company may affect the availability for that company
    - People will send the packets to the wrong domain and thus cannot access even though they have authorized access

## **Others**
- Authenticity
    - Ability to check that the user is who they say they are
- Accountability
    - If someone does something, we can trace that back to them
- Nonrepudiation
    - If someone did something, they can say that they did not do it. 
        1. Nonrepudiation of origin: Ensures that the originator of information cannot successfully deny having sent the information
        2. Npnrepudiation of receipt. Emsires that the recipent of info cant successfully deny havinh received that info


# Assets of Computer Systems
- Security is about protecting assets

**Assets**
1. Hardware
2. Software
3. Data
4. Communicaton lines and networks

# Vulnerablities, Threats nd Attacs

## **Threats**
* Hypothetical events *capable* of exploiting vulnerabilities
    - Can create loss of C, I or A

* Potential secuirty harm to and asset or a resource
    - Person or event
    - Deliberate, accidental or an act of nature

## **Vunerability**
* An issue that *can* result in a successfu attack
* Intehrent weakness in the design, implementation, config etc
* Allows a threat to be realized

### **Categories**
* Leaky - Lost of C
* Corruption - Loss of I
* ????  - Loss of A

## **Attack**
* Caries out: Threat is carried out

### Types of attacks
*  Passive attack
    - Atempt to learn or make use of secret info without affecting the resources

* Active attack
    -   Attempt to alter system resources or affect theoperation

### Origin
- Insider attack
    - By an entity inside the secuirty system
- Outsider attack
    - ...

# Computer Security Statetegy

## **Specification/Policy**
- What do we want

## **Implementation**
**(Based on a stolen password example)**

### Prevention
- Use up-to-date software
- Validate all use input from webforms and open APIs

### Detect
- Reports from users about strange activity from their account
- Convient way for users to make reports

### Response
- tell all users to change password
- Know how to handle media etc

### Recovery
- Analyze attack and look over the prevention mechanism

## **Assurance and evaluation**
-  Is it working?






