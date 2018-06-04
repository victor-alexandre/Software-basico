#include <ctype.h>
#include <stdio.h>

int string2num (char *s) {
	int a = 0;
	for (; *s; s++)
		a = a*10 + (*s - '0');
	return a;
}

int string2numV1 (char *s,  char *b) {
	int a = 0;
	int base; int temp = 0;//temp armazenará a base que será inserida em char

	for (; *b; b++)
		temp = temp*10 + (*b - '0');
	
	for (; *s; s++){
		if(*s >= '0' && *s <='9')
			a = a*temp + (*s - '0');
		else
			a = a*temp + (*s - 'a' + 10);
	}
	return a;

}

int main (void) {
	printf("==> %d\n", string2num("1234"));
	printf("==> %d\n", string2num("1234") + 1);
	printf("==> %d\n", string2num("1234") + string2num("1"));
	 
	printf("==> %d\n", string2numV1("777", "8"));
	printf("==> %d\n", string2numV1("777", "10"));	 
 


	printf("%d\n", string2numV1("1a", "16"));
	printf("%d\n", string2numV1("a09b", "16"));
	printf("%d\n", string2numV1("z09b", "36")); 

	 return 0;
}
