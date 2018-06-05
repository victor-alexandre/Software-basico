#include <stdio.h>
struct date_t {
	int ano;
	char mes;
	char dia;
};
struct pessoa_t {
	char *nome;
	struct date_t nascimento;
};
int compare(struct date_t *d1, struct date_t *d2){
	int resp = 0;
	if (d1->dia == d2->dia && d1->mes == d2->mes && d1->ano == d2->ano)
		resp = 1;
	return resp;
}

int main() {
	int i, j;
	struct pessoa_t p[3];
	p[0].nome = "Ernesto";
	p[0].nascimento.ano = 2002;
	p[0].nascimento.mes = 3;
	p[0].nascimento.dia = 15;
	p[2].nome = "Borges";
	p[2].nascimento.ano = 2002;
	p[2].nascimento.mes = 3;
	p[2].nascimento.dia = 15;
	p[1].nome = "Cecilia";
	p[1].nascimento.ano = 2001;
	p[1].nascimento.mes = 8;
	p[1].nascimento.dia = 2;
	for (i = 0; i < 3 ; i++) {
		for (j = 0; j < 3; j++) {
			if (i == j)
			continue;
			if (compare(&p[i].nascimento, &p[j].nascimento))
				printf("%s nasceu no mesmo dia de %s\n", p[i].nome, p[j].nome);
		}
	}
	return 0;
}