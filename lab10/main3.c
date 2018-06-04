#include <stdio.h>

void foo(int a[], int n);


int main (){
	int batata[] = {1,1,1,0,2,2,2,0,3,3,3,0};

	foo(batata, 12);
	for(int i = 0; i < 12; i++)
		printf("%d ", batata[i]);

	printf("\n");
	return 0;
}