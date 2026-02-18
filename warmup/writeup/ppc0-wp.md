## ppc0-WriteUp

模拟竖式加法即可。可以按如下方式补全代码：

{% raw %}
```c
#include <stdio.h>
#include <string.h>

char a[100], b[100];
char flag[100];

int main() {
    freopen("data.in", "r", stdin);
    scanf("%s%s", a, b);
    int n = strlen(a);
  
    int i;
    int c = 0;   // 记录进位
    for (i = n - 1; i >= 0; i--) {
        int x = a[i] - '0' + b[i] - '0' + c;
        if (x >= 10) {
            c = 1;
            x -= 10;
        } else {
            c = 0;
        }
        flag[i] =  x + '0';
    }
    if (c > 0) {
        for (i = n - 1; i >= 0; i--) {
            flag[i + 1] = flag[i];
        }
        flag[0] = c + '0';
        flag[n + 1] = '\0';
    }

    printf("ucatflags{%s}\n", flag);

    fclose(stdin);
    return 0;
}
```
{% endraw %}

PPC是程序编程基础区，本区的题目大多与此题相似，风格近似OI（信息学奥赛），但比OI简单很多，难度应该不会超过普及组前两题的难度。

PPC的**大多数（不是所有）** 题目会下发三个文件：

* `example.txt`：包含对题意更详细的解释，以及样例输入输出及其解释。
* `data.in`：用来获取 `flag`的输入数据。读取其中数据作为输入并计算，你将能获取 `flag`。
* 一个 `.c`文件：其中有我们预先写好的数据输入（以及输出）的代码，你可以通过补全它来完成此题；如果你清楚如何输入输出，也可以不管这个文件从头开始写。

**PPC的考点在我们C语言编程基础班的授课范围内**。
