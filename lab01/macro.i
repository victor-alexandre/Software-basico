# 1 "macro.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "macro.c"



int main(){

    int a = 10;
    int b = 20;
    if (a > 5)
        a++; b++;
    a = (++b + ++b);
    b = (a + 1+5 * 2);


    return 0;
}
