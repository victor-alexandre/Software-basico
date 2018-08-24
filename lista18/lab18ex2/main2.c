#include <stdio.h>
#include <math.h>

float calc3(float a, float b);

float calc4(float a, float b) {
 return sin(a) + b;
}

int main (){
	float b = 5;
	float a = M_PI/3;
	
	//scanf ("%lf%f", &a, &b);
	
	printf("%f\n  %f\n", calc3(a,b), calc4(a,b));
	return 0;	
} 
