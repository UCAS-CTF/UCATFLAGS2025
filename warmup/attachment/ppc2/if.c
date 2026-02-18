#include <stdio.h>

void get_flags();   // get the flags.

int main() {
    int x, True;
    int y = 998244353;

    puts("If you have the password, I'll give you flag!");
    puts("Please input a six-figure integer as passord.");

    scanf("%d", &x);

    if (x <100000 || x > 999999) {
        goto LABEL_FAILED;
    }

    True = x % 3 ? 0 : 1;
    if (!True)
        goto LABEL_FAILED; 

    x -= 266999;
    if (x > 0) 
        if (x - 266999 > 266999)
            goto LABEL_FAILED;
    else 
        x >>= 1;
    
    if (x == 266999)
        if (y = 3) {
            get_flags();        // You don't need to know how this function get_flags() works.
                                // As long as you input the right password, it will give you the flag. 
            return 0;
        }

LABEL_FAILED:
    puts("Sorry, your password is wrong!");
    return 0;
}