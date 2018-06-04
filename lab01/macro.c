#define inc(x, y) x++; y++
#define dobro(x) (x + x)
#define calc(x, y) (x + y * 2)
int main(){

    int a = 10;
    int b = 20;
    if (a > 5)
        inc(a, b);
    a = dobro(++b);
    b = calc(a, 1+5);


    return 0;
}
