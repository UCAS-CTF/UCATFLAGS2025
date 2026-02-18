# 解题过程

## 1. 题目名称及描述

### 1.1. 题目名称

评分系统

### 1.2 题目描述

总分高者是flag（详见example.txt）。

## 2. 题目部署方法

提供附件给选手下载

### 2.1. 解题过程

1. 本题考察结构体的操作，将每个结构体的各项分数相加并找到最大值对应的名字即可。注意有几个结构体中各项分值较大，因此需要使用long long记录最大值。可按下述示例方法补全代码：

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

2. 运行补全后的代码获得flag即可。

## 2. 相关问题

### 2.1 题目分值

**50分**

### 2.2 题目flag

`ucatflags{sc0r3_1snt_3v3ryth1ng}`

此题为固定flag。

### 2.3 需注意的问题

> 这道题需要使用long long来记录总分，因为中间几个数据的总和可能会超出int的范围。这算是本题的一个坑点。
>
> 使用排序算法来求最大值也是可以的，但显然没必要这么麻烦，因此解题过程没有给出这种方案的实现。

## 附件列表

- **附件1：题目源代码**
- **附件2：解题工具**
- **附件3：选手下载附件**
