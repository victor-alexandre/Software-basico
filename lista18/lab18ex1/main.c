#include <stdio.h>


float calc1(double a, float b);

float calc2(double a, float b) {
 return (a+b)*(a-b);
}


int main (){
	float b;
	double a;
	
	scanf ("%lf%f", &a, &b);
	
	printf("%f\n  %f\n", calc1(a,b), calc2(a,b));
	return 0;	
} 
