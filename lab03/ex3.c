#include <stdio.h>



unsigned char switch_byte(unsigned char x) {
	unsigned char y;
	
	y = ((x & 0x0F) << 4) | ((x & 0xF0) >> 4);

	return y;
}

unsigned char rotate_left(unsigned char x, int n) {
	unsigned char y;
	
	y = (x >> 8 - n) | (x << n);

	return y;
}

int main() {

	unsigned int temp;
	int n;

	scanf("%x %d", &temp, &n);
	
	printf("número inicial: %x        número após o switch: %x\n\n", temp, switch_byte(temp));

	printf("número inicial: %x        número após a rotação: %x\n", temp, rotate_left(temp, n));

	return 0;
}