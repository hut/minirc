#include <unistd.h>
main() {
  execl("/bin/busybox", "init", (char *) 0);
}
