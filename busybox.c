/*
 * This code can be used to run "busybox init" with a program of an
 * arbitrary name, without being forced to call it "init".
 *
 * Compile it with "gcc busybox.c -o busybox" and use that binary
 * for the init kernel parameter instead.
 */
#include <unistd.h>
main() {
  execl("/bin/busybox", "init", (char *) 0);
}
