
### 解题过程

本题考察数组的访问，每次移动就是对数组进行加减即可，注意边界检查。可按下述示例方法补全代码：

{% raw %}
```C

#include <stdio.h>

int n;                      // size of the map
int m;                      // the number of times you need to move
int stx, sty;               // coordinates of the starting point
int dx[1024], dy[1024];     // steps in every direction of each move
char Map[1024][1024];
char flag[1024];

int Move(int pos, int dis, int border) {
    if (pos + dis < 0) 
        return 0;
    else if (pos + dis >= border)
        return border - 1;
    else
        return pos + dis;
}

void work() {
    int i;
    int nowx = stx, nowy = sty;
    printf("%d %d\n", nowx, nowy);

    for (i = 0; i < m; i++) {
        nowx = Move(nowx, dx[i], n);
        nowy = Move(nowy, dy[i], n);
        printf("%d %d %d %c\n", nowx, nowy, Map[nowx][nowy], Map[nowx][nowy]);
        flag[i] = Map[nowx][nowy];
    }
    flag[m] = '\0';
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

```
{% endraw %}

### 题目flag

`ucatflags{T4ke_a_W41k}`

此题为固定flag。
