
1. 改正代码：

{% raw %}
```C
#include <stdio.h>                     // 中文《》改为<>

#define len 16                         // defien改为define
char flags[len] = "t1_Nur_n4c_i_k0";   // '改为"

void reverse (char *ans) {             // viod改为void
	int now = 0;                        // 等号右边英文字母o改为数字0
	while (now < len - 2 - now) {       // 删去()右边的分号;否则将死循环
		char c = ans[now];               // 中文分号；改为英文分号;     
		ans[now] = ans[len - 2 - now];   // 将==改成=（==用来判断相等而不是赋值）
		ans[len - 2 - now] = c;          // asn改成ans
		now++;                           // +改成++
	}
	printf("ucatflags{%s}\n", ans);     // 输出时调用的函数是printf()而不是print()
}                                      // 补上}，否则括号不匹配

int main() {                           // mian改成main
	reverse(flags);                     // 补上缺少的分号;以及将flag改成flags
	return 0;                           // retun改成return
}

```
{% endraw %}

2. 运行改正后的代码获得flag

   ![img](image/解题过程/答案输出.png)

> 题目的flag：`ucatflags{th1s_i5_an_3xample}`
