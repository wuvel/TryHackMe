# Anthem

## Website Analysis

+ **Let's run nmap and check what ports are open**
  ```
  nmap -sC -sV -oN nmap/initial 10.10.130.57

  Description
  -sV			Attempts to determine the version of the services running
  -sC			Scan with the default nmap scripts
  -oN			Save the output file to the directory listed
  ```
+ **Result**
  ```
  Host is up (0.42s latency).
  Not shown: 995 closed ports

  PORT     STATE SERVICE       VERSION
  80/tcp   open  http          Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
  135/tcp  open  msrpc         Microsoft Windows RPC
  139/tcp  open  netbios-ssn   Microsoft Windows netbios-ssn
  445/tcp  open  microsoft-ds?
  3389/tcp open  ms-wbt-server Microsoft Terminal Services
  | rdp-ntlm-info: 
  |   Target_Name: WIN-LU09299160F
  |   NetBIOS_Domain_Name: WIN-LU09299160F
  |   NetBIOS_Computer_Name: WIN-LU09299160F
  |   DNS_Domain_Name: WIN-LU09299160F
  |   DNS_Computer_Name: WIN-LU09299160F
  |   Product_Version: 10.0.17763
  |_  System_Time: 2020-05-18T07:07:27+00:00
  | ssl-cert: Subject: commonName=WIN-LU09299160F
  | Not valid before: 2020-04-04T22:56:38
  |_Not valid after:  2020-10-04T22:56:38
  |_ssl-date: 2020-05-18T07:08:36+00:00; 0s from scanner time.
  Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

  Host script results:
  | smb2-security-mode: 
  |   2.02: 
  |_    Message signing enabled but not required
  | smb2-time: 
  |   date: 2020-05-18T07:07:26
  |_  start_date: N/A
  ```
+ **What port is for the web server?**

  ```
  80/tcp   open  http          Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
  ```
  We can see the web server is running on **port 80** based on the result.
  
+ **What port is for remote desktop service?**
  ```
  3389/tcp open  ms-wbt-server Microsoft Terminal Services
  ```
  We can see the RDP service is running on **port 3389** based on the result.
  
+ **What is a possible password in one of the pages web crawlers check for?**
  
  We can check the robots.txt file on the web server.
  
  ![1]
  
  we got the "possible password" on the robots file, which is **UmbracoIsTheBest!**.

+ **What CMS is the website using?**
  
  ![1]
 
  We can check the robots.txt file and we can see there's a directory called **/umbraco/** on the Disallow part, so this web server use umbraco CMS.

+ **What is the domain of the website?**
  
  ![2]
  
  As we can see on the homepage, the server use **anthem.com** as the domain.

+ **What's the name of the Administrator**

  First, we must check all the pages that exist on the server.  There is an articled called "A cheers to our IT department". There is a poem on the content that belongs to him (the Admin). 
  
  ![3]
  
  Let's search it up on the search engine should we?
  
  ![4]
  
  And.. We got the Administrator name! (the poem autor), which is **Solomon Grundy**.
 
+ **Can we find find the email address of the administrator?**

  There is an article called "We are hiring" and the appliers must send the CV to JD@anthem.com. 

  ![5]
  
  Change the "JD" letter to "SG" (Solomon Grundy) and we got the Admin e-mail! It's **SG@anthem.com**.
  
## Spot The Flags

+ **What is flag 1?**

  We should check the source-code of each page before going to anything else. On the "We are hiring" article (http://10.10.130.57/archive/we-are-hiring/), we can find the flag at the meta content from the source-code. It's **THM{L0L_WH0_US3S_M3T4}**.
  
  ![6]
  
+ **What is flag 2?**

  We also find the flag on the "Search" menu's source-code! It's **THM{G!T_G00D}**.
  
  ![7]
  
+ **What is flag 3?**

  We can find the flag on the "Author" menu's source-code that we can find on the bottom page on the article! It's **THM{L0L_WH0_D15}**.
  
  ![8]
  
+ **What is flag 4?**
http://10.10.130.57/archive/a-cheers-to-our-it-department/
  We can find the flag on the "A cheers to our IT deparment" article's source-code! It's **THM{AN0TH3R_M3TA}**.
  
  ![9]
  
  
  
[1]:./images/robots.png
[2]:./images/homepage.png
[3]:./images/poem.png
[4]:./images/search.png
[5]:./images/hiring.png
[6]:./images/flag1.png
[7]:./images/flag2.png
[8]:./images/flag3.png
[9]:./images/flag4.png
