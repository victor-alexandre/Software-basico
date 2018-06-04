#include <stdio.h>
	
void dump (void *p, int n){
	unsigned char *p1 = p;
	while (n--){
		printf("%p - %02x\n", p1, *p1);
		p1++;
	}
}

void dump1 (void *p, long n){
	unsigned char *p1 = p;
	while (n--){
		printf("%p - %02x\n", p1, *p1);
		p1++;
	}
}

void dump2 (void *p, short n){
	unsigned char *p1 = p;
	while (n--){
		printf("%p - %02x\n", p1, *p1);
		p1++;
	}
}

void dump3 (void *p, char n){
	unsigned char *p1 = p;
	while (n--){
		printf("%p - %02x\n", p1, *p1);
		p1++;
	}
}

void dump4 (void *p, char n){
	unsigned char *p1 = p;
	while (n--){
		printf("%p - %02x\n", p1, *p1);
		p1++;
	}
}



int main (void){	
	int i = 10000;
	printf("\tint\n");
	dump(&i, sizeof(i));
	
	long j = 10000;
	printf("\n\tlong\n");
	dump1(&j, sizeof(j));
	
	short k = 10000;
	printf("\n\tshort\n");
	dump2(&k, sizeof(k));

	char l = 'b';
	printf("\n\tchar\n");
	dump3(&l, sizeof(l));

	char p[] = "7509";
	printf("\n\tstring\n");
	dump4(p, sizeof(p));

	return 0;
}