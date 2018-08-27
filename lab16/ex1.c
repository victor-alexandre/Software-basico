
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
	int num = ;
	int i = 0;

	while(frac != 1){
		if(frac & 0xfffffff1 == 1){
			num = num + pow(2,i);
		}
		i++;
		frac = frac>>1;
	}



}

int main (){
	float teste = 15.2;
	int temp = -4;
	//scanf("%d", &temp);
	printf("%f  float x 2\n\n\n\n", float2(f1));
	printf("int %d  to float %f\n", temp, int2float(temp));



	int i;
	printf("\n******** int2float ****************\n");
	i = 0;
	printf(" %d -> %+10.6f\n", i, int2float(i));
	i = 1;
	printf(" %d -> %+10.6f\n", i, int2float(i));
	i = -1;
	printf(" %d -> %+10.6f\n", i, int2float(i));
	i = 2;
	printf(" %d -> %+10.6f\n", i, int2float(i));
	i = 5;
	printf(" %d -> %+10.6f\n", i, int2float(i));
	i = 0x7fffffff;
	printf(" %d -> %+10.6f\n", i, int2float(i));
	i = -i;
	printf(" %d -> %+10.6f\n", i, int2float(i));
	i = 12345;
	printf(" %d -> %+10.6f\n", i, int2float(i));
	i = -12345;
	printf(" %d -> %+10.6f\n", i, int2float(i));


	i = 0x7fffffff;
	printf("%d -> %+10.6f\n final\n", i, (float)i);

	return 0;
}