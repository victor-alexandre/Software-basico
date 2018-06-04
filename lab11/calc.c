int sum(int x, int y, int z, int w);
int calc(int a, int b, int c, int d) {
  int i, j, k;
  i = sum(a+1, b, c+2, d);
  j = sum(b, d+1, a, c+2);
  k = sum(a-1, b, c-2, d);
  return i + j + k;
}