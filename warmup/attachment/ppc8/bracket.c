#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// TODO: Add other necessary variables or functions here as you wish.

int work(char *buf) {
    int len = strlen(buf);
   
    // TODO: Supplement this function to match brackets.
    
}

int main() {
    unsigned long long flag = 0;
    char buf[1024];

    freopen("data.in", "r", stdin);

    while (gets(buf)) {
        int ans = work(buf);
        flag = (flag << 1) | ans;
    }

    puts("The flag is:");
    printf("ucatflags{%llx}\n", flag);

    fclose(stdin);
    return 0;
}