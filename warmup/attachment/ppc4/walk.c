#include <stdio.h>

int n;                      // size of the map
int m;                      // the number of times you need to move
int stx, sty;               // coordinates of the starting point
int dx[1024], dy[1024];     // steps in every direction of each move
char Map[1024][1024];
char flag[1024];

// TODO: Add other necessary variables or functions as you wish.

void work() {
    
    // TODO: Supplement this function to walk in the map;

}

int main() {
    int i, j;

    freopen("data.in", "r", stdin);

    scanf("%d%d", &n, &m);
    scanf("%d%d", &stx, &sty);
    for (i = 0; i < m; i++) {
        scanf("%d%d", &dx[i], &dy[i]);
    }
    for (i = 0; i < n; i++) {
        scanf("%s", Map[i]);
    }

    work();

    printf("ucatflags{%s}\n", flag);
    
    fclose(stdin);
    return 0;
}