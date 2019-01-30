#define HASHSIZE 101

typedef struct c{
  char *codice;
  char *nome;
  char *squadra;
  int pettorina;
  struct c *next;
}ciclista;

typedef struct s{
  int tempo_tratto;
  int tempo_totale;
  int pettorina;
  ciclista *c;
  struct s *next;
}supporto;


typedef struct t{
  char *data;
  char *citta_p;
  char *citta_a;
  supporto *s;
  struct t *next;
}tratto;


ciclista *hashtable[HASHSIZE];
ciclista *lookup(int s);
unsigned int hash(int s);
int ins_ciclista(char *codice, char *nome, char *squadra, char *pettorina);
int ins_tratto(char *data, char *c_partenza, char *c_arrivo);
supporto *ins_supporto(int pettorina, int tempo);
void ordina_totale(supporto *start);
void swap_totale(supporto *a, supporto *b);
void ordina_tratto(supporto *start);
void swap_tratto(supporto *c, supporto *d);
void bonus_posizione(supporto *current);
void print_res();
