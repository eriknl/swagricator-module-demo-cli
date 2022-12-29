#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(int argc, char **argv) {
    char *line = NULL;
    size_t len = 0;
    ssize_t nread;
    puts("Welcome to the demo-cli shell!");
    printf("> ");
    while ((nread = getline(&line, &len, stdin)) != -1) {
        line[nread-1] = 0x00;
        if (!strcmp(line, "quit")) {
            break;
        }
        else if (!strcmp(line, "whoami")) {
            system("whoami");
        }
        else if (!strcmp(line, "help")) {
            puts("Commands: quit, whoami, help");
        } else {
            printf("Unknown command %s\n", line);
        }
        free(line);
        line = NULL;
        printf("> ");
    }
    puts("Bye!");
    return 0;
}