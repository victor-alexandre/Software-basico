#include <stdio.h>
#include <math.h>

double calc5(double *a, int n) {
	int i;
	double r = 0.0;
	for (i = 0; i < n; i++) {
	r += sin(*a);
	a++;
	}
	return r;
}


double calc4(double *a, int n);


int main (){
	int n = 3;
	double a[] = {5.5,5.6,5.7};
	//a[0]= 5.5;
	
	
	printf("%f\n  %f\n", calc4(a,n), calc5(a,n));
	return 0;	
} 
