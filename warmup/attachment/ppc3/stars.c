#include <stdio.h>
#include <string.h>

int len;                // length of the input string
char str[5000];         // the input string
char flag[5000];        // record your answer here

// TODO: Add other necessary variables or functions as you wish.

int main() {
    freopen("data.in", "r", stdin);

    scanf("%s", &str);
    len = strlen(str);
    printf("The length of the string is: %d\n", len);

    int m, l, r;
    int i;
    scanf("%d", &m);
    for (i = 0; i < m; i++) {
        scanf("%d%d", &l ,&r);

        // TODO: Supplement the code to count stars here.

    }
    flag[m] = '\0';
    printf("The flag is: %s\n", flag);
    return 0;
}