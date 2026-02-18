#include <stdio.h>
#include <stdlib.h>

// TODO: Add other necessary variables or functions here as you wish.

char read() {
    char c = getchar();
    while(c != EOF) {
        if (c != ' ' && c != '\n')
            return c;
        c = getchar();
    }
    return '\0';
}

int main() {
    freopen("data.in", "r", stdin);
    
    int n, m;
    scanf("%d%d", &n, &m);

    int i, j;
    for (i = 1; i <= m; i++) {
        char op, c;
        int id;
        op = read();
        if (op == 'p') {
            scanf("%d", &id);
            c = read();
            // TODO : Supplement this code block to push an element into the queue.
        } else if (op == 'q') {
            // TODO : Supplement this code block to pop elements out of the queue.
        }
    }

    fclose(stdin);
    return 0;
}