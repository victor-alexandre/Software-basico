#include <stdio.h>

int is_litte(){
	unsigned int temp;
	temp = 0x1234;

	unsigned char *p = (unsigned char*)(&temp);

	if(*p == 0x34)
		return 1;
	else
		return 0;
}

int main (){

	printf(is_litte() ? "little-endian\n" : "big-endian\n");

	return 0;
}