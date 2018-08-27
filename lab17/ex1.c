
#include <stdio.h>
#include <math.h>

#define makefloat(s,e,f) ((s & 1)<<31 | (((e) & 0xff) << 23) | ((f) & 0x7fffff))
#define getsig(x) ((x)>>31 & 1)
#define getexp(x) ((x)>>23 & 0xff)
#define getfrac(x) ((x) & 0x7ffff)


typedef union {
float f;
unsigned int i;
} U;
U u;

float f1 = 0.125;
unsigned int u1;



float float2(float f){// função multiplica um float por 2 em binario
	u.f = f1; /* armazena o float na union */
	u1 = u.i; /* obtem a representação "manipulável" do float */

	printf("%f numero inicial\n", f);

	unsigned int  exp = getexp(u1);
	printf("%u expoente\n", exp);

	unsigned int sinal = getsig(u1);
	printf("%u sinal\n", sinal);

	unsigned int frac = getfrac(u1);
	printf("%u frac\n", frac);

	u.i =  makefloat(sinal, exp+1, frac);

	//u.i = u1;/* armazena a representação binária na union*/
	//f1 = u.f; /* obtém o float correspondente a essa representação */

	return u.f;
}


float int2float(int i){

	unsigned int sinal;

	if(i == 0){
		u.i =  makefloat(0, 0, 0);
		return u.f;
	}

	if(i < 0){
		i = -i;
		sinal = 1;
	}else{
		sinal = 0;
	}

	unsigned int frac = i;
	printf("%u frac\n", frac);

	unsigned int exp = 0;
	
	unsigned int temp = frac;
	while(temp != 1){
		exp++;
		temp = temp>>1;
	} 

	printf("%u exp\n \n", exp);
	if(exp < 23){
		u.i =  makefloat(sinal, exp+127, frac<<(23-exp));
	}else{
		u.i =  makefloat(sinal, exp+127, frac>>exp-23);
	}

	return u.f;
}

int float2int (float f){
	if (f == 0){
		return 0;
	}

	u.f = f;
	unsigned int exp, sinal, frac;
	exp = getexp(u.i)-127;

	sinal = getsig(u.i);
	frac = getfrac(u.i);
	int num = 0;
	int i = 0;

	while(exp >= 0){
		if(frac>>23-i == 1){
			num = num + pow(2,i);
		}
		exp--;
		i++;
		frac = frac>>1;
	}



}

int main (){

	float f;
	printf("\n******** float2int ****************\n");
	f = 0.0;
	printf(" %+10.4f -> %d\n", f, float2int(f));
	f = 1.0;
	printf(" %+10.4f -> %d\n", f, float2int(f));
	f = -1.0;
	printf(" %+10.4f -> %d\n", f, float2int(f));
	f = 12345.0;
	printf(" %+10.4f -> %d\n", f, float2int(f));
	f = -12345.0;
	printf(" %+10.4f -> %d\n", f, float2int(f));
	f = 1.5;
	printf(" %+10.4f -> %d\n", f, float2int(f));
	f = 2.5;
	printf(" %+10.4f -> %d\n", f, float2int(f));
	f = 2.4;
	printf(" %+10.4f -> %d\n", f, float2int(f));
	f = 0.5;

	return 0;
}