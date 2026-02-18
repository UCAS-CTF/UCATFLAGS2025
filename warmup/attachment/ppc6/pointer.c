#include <stdio.h>

#define uc  unsigned char
#define ui  unsigned int
#define ull unsigned long long

int n;                  // number of options
char flag[1024];
uc   *ptr0 = flag;
ui   *ptr1 = (ui*)flag;
ull  *ptr2 = (ull*)flag;

// TODO: Add other necessary variables or functions as you wish.

void work_ptr0(int step, uc data) {
    // TODO: Supplement this function so ptr0 works properly.
}

void work_ptr1(int step, ui data) {
    // TODO: Supplement this function so ptr1 works properly.
}

void work_ptr2(int step, ull data) {
    // TODO: Supplement this function so ptr2 works properly.
}

int main() {
    int i;

    freopen("data.in", "r", stdin);

    scanf("%s", flag);
    scanf("%d", &n);
    for (i = 1; i <= n; i++) {
        int id, step;
        ull data;
        scanf("%d%d%llu", &id, &step, &data);
        if (id == 0) {
            work_ptr0(step, (uc)data);
        } else if (id == 1) {
            work_ptr1(step, (ui)data);
        } else {
            work_ptr2(step, data);
        }
    }

    printf("%s", flag);
    fclose(stdin);
    return 0;
}