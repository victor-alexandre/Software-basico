#include <stdio.h>
#include <math.h>

double calc3(float a, float b);

double calc4(float a, float b) {
	return sin(a) + cos(b);
}


int main (){
	float b = 5;
	float a = M_PI/3;
	
	//scanf ("%lf%f", &a, &b);
	
	printf("%f\n  %f\n", calc3(a,b), calc4(a,b));
	return 0;	
} 
