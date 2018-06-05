#include <stdio.h>
struct date_t {
  int  ano;
  char mes;
  char dia;
};
struct pessoa_t {
  char *nome;
  struct date_t nascimento;
};
void format(char *buffer, struct date_t *d) {
  sprintf(buffer, "%d/%d/%d", d->dia, d->mes, d->ano);
}
void show(struct pessoa_t *p) {
  char data[11];
  format(data, &p->nascimento);
  printf("Nome: %s, nascido %s\n", p->nome, data);
}
int main() {
  struct pessoa_t p;
  p.nome = "Ernesto";
  p.nascimento.ano = 2002;
  p.nascimento.mes = 3;
  p.nascimento.dia = 15;
  show(&p);
  return 0;
}