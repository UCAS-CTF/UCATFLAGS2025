#include <stdio.h>
#include <string.h>

char a[100], b[100];    // Input number
char flag[100];         // Put your result here

// TODO: Add other necessary variables or functions as you wish.

int main() {
    freopen("data.in", "r", stdin);
    scanf("%s%s", a, b);
    int n = strlen(a);      // The length of the input number.

    // TODO: Supplement the code to calculate the result here.

    printf("ucatflags{%s}\n", flag);

    fclose(stdin);
    return 0;
}