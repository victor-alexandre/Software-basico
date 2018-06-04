#include <stdio.h>
int calc(int a, int b, int c, int d);
int sum(int x, int y, int z, int w) {
   return x+y+z+w;
}
int main (void) {
   printf("%d\n",calc(1,2,3,4));
   return 0;
}