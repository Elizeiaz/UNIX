#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include <sys/types.h>

int main(int argc, char *argv[]) {
    int fd = open("fileA", O_CREAT | O_TRUNC | O_WRONLY, 0777);
    int size = 4 * 1024 * 1024 + 1;
    for (int i = 0; i < size; i++) {
    	if (i == 0 || i == size - 1 || i == 10000) {
    		write(fd, "1", 1);
    	}
    	else {
    	write(fd, "0", 1);
    	}
    }
    close(fd);
    return 0;
}
