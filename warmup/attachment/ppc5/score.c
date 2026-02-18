#include <stdio.h>

struct student {
    char name[30];
    int ch, ma, en, ph, chm, bio, plo, hst, geo, tech;
} info[1024];

int n;

// TODO: Add other necessary variables or functions as you wish.

void work() {
    // TODO: Supplement this function to get the student with the max score;
}

int main() {
    freopen("data.in", "r", stdin);

    int i;
    scanf("%d", &n);
    for (i = 0; i < n; i++) {
        scanf("%s%d%d%d%d%d%d%d%d%d%d", info[i].name, &info[i].ch, &info[i].ma, &info[i].en, &info[i].ph, \
                                        &info[i].chm, &info[i].bio, &info[i].plo, &info[i].hst, &info[i].geo, \
                                        &info[i].tech);
    }

    work();

    fclose(stdin);
    return 0;
}