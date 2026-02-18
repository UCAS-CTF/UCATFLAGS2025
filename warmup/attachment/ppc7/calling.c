#include <stdio.h>

void func_F(int x);
void func_N(int x, int sel);
void func_U(int x);
int  func_c(int x);
void func_o(int x);
void func_s(int x);
int  func_t(int x);
void func_u(int x);
void func_1(int x);
void func_2(int x);

int main() {
    int x;

    puts("Please Input an Integer:");

    scanf("%d", &x);
    func_F(x);
    return 0;
}

void func_F(int x) {
    if (x > 2333)
        func_u(x);
    else
        func_U(x);
}

void func_N(int x, int sel) {
    if (sel) {
        int ans = func_c(x);
    } else {
        func_s(x);
    }
}

void func_U(int x) {
    func_2(x);
}

int func_c(int x) {
    int ans = func_t(x);
    if (ans > 0) {
        return func_t(x);
    }
}

void func_o(int x) {
    return;
}

void func_s(int x) {
    for ( ; x % 3; x++);
    return;
}

int func_t(int x) {
    func_1(x);
    return ~x;
}

void func_u(int x) {
    func_N(x, 1);
    func_N(x, 0);
}

void func_1(int x) {
    func_o(x);
    x = -x;
}

void func_2(int x) {
    while (x--)
        func_2(x);
}