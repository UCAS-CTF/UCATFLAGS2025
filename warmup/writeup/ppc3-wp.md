# 解题过程

## 1. 题目名称及描述

### 1.1. 题目名称

数星星

### 1.2 题目描述

最近我有些失眠，于是在字符串中数星星……

对于每组询问，请数出这个闭区间内有多少“*”字符，并转成ASCII码输出（详见example.txt）。

## 2. 题目部署方法

提供附件给选手下载

### 2.1. 解题过程

1. 本题考察循环，难度不大，用一个循环扫描整个数组，找到“*”并计数即可。可按下述示例方法补全代码：

```C
#include <stdio.h>
#include <string.h>

int len;                // length of the input string
char str[5000];         // the input string
char flag[5000];        // record your answer here

int work(int l, int r) {
    int cnt = 0;
    int j;
    for (j = l; j <= r; j++)
        if (str[j] == '*')          // 找到星星
            cnt++;                  // 计数
    return cnt;
}

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
        char cnt = 0;
        int j;
        for (j = l; j <= r; j++) {
            if (str[j] == '*')
                cnt++;
        }
        flag[i] = cnt;
    }
    flag[m] = '\0';
    printf("The flag is: %s\n", flag);
    return 0;
}

```

2. 运行补全后的代码获得flag即可。

## 2. 相关问题

### 2.1 题目分值

**50分**

### 2.2 题目flag

`ucatflags{C0unt1ng_st4rS}`

此题为固定flag，flag取自美国流行摇滚乐队OneRepublic的歌曲《Counting Stars》。

### 2.3 彩蛋

> 提示文本的第一句话改编自《Counting Stars》第一句歌词的中文翻译。
> 
> 如果你仔细看过data.in这个文件，你也许会发现，读入数据来自于《Counting Stars》这首歌的歌词，只是其中的空格被我换成了若干个“*”。

## 附件列表

- **附件1：题目源代码**
- **附件2：解题工具**
- **附件3：选手下载附件**
