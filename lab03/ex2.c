#include <stdio.h>

int odd_onesv1(unsigned int x) {
	unsigned int y = x;
	y = x & 1;
	printf("\nO número  possui %x bits com o número 1\n", y);
	if(y==0)
		return 0;
	else
		return 1;
}	

int odd_ones(unsigned int x) {
	int i = 0;
	unsigned int y, tempx, tempc, lixo, cont = 0;
	lixo = x;//guarda o valor inicial de x

	while(i < 32){
		tempx = x;//sempre reinicio o valor de tempx com o valor de x com um bit deslocado a direita a fim de varrer todos os bits
		y = (tempx >> 31);// jogo o primeiro bit de temp para o ultimo bit de temp, o resto é zerado
		//y = (y & 0x00000001);//com isso eu testo se o valor de é 1 ou 0; EDIT NEM PRECISO DISSO

		if(y == 1)
			cont++;

		x = (x << 1);
		i++;			
	}

	tempc = cont;//pego o valor de cont para modificar ele a fim de verificar se ele é par ou impar
	printf("\nO número %x possui %d bits com o número 1\n", lixo, cont);
	
	if((tempc << 31 == 0))//isso que dizer que o número é par, pois o ultimo bit termina com 0
		return 0;
	
	else
		return 1;
}




int main() {

	unsigned int temp;

	printf("O número %x tem numero %s de bits\n", 0x01010101, odd_onesv1(0x01010101) ? "impar" : "par");
	printf("O número %x tem numero %s de bits\n", 0x01030101, odd_onesv1(0x01030101) ? "impar" : "par");
	printf("O número %x tem numero %s de bits\n", 0x01030100, odd_onesv1(0x01030100) ? "impar" : "par");
	return 0;
}