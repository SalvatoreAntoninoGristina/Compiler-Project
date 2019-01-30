/*#define HASHSIZE 101

typedef struct c{
    char *nome;
    char *codice;
    char *squadra;
    char *pettorina;
    struct c *next;
}ciclista;

typedef struct t{
    char *data;
    char *citta_p;
    char *citta_a;
    struct s *s;
    struct t *next;
}tratto;

typedef struct s{
    int tempo_tratto;
    int tempo_totale;
    char *pettorina;
    struct c *c;
    struct s *next;
}supporto;

ciclista *hashtable[HASHSIZE];

unsigned int hash(char *s);
ciclista *lookup(char *s);
ciclista *ins_ciclista(char *codice, char *nome, char *squadra, char *pettorina);
tratto *ins_tratto(char *data, char *c_partenza, char *c_arrivo);
supporto *ins_supporto(char *pettorina, int tempo);
void ordina_totale(supporto *start);
void ordina_tratto(supporto *start);
void swap_totale(supporto *a, supporto *b);
void swap_tratto(supporto *c, supporto *d);
void print_res();
void bonus_posizione(supporto *current);
*/

#define HASHSIZE 101

typedef struct c{
  char *codice;
  char *nome;
  char *squadra;
  char *pettorina;
  struct c *next;
}ciclista;

typedef struct s{
  int tempo_tratto;
  int tempo_totale;
  char *pettorina;
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
unsigned int hash(char *s);
ciclista *lookup(char *s);
ciclista *ins_ciclista(char *codice, char *nome, char *squadra, char *pettorina);
tratto *ins_tratto(char *data, char *c_partenza, char *c_arrivo);
supporto *ins_supporto(char *pettorina, int tempo);
void ordina_totale(supporto *start);
void swap_totale(supporto *a, supporto *b);
void ordina_tratto(supporto *start);
void swap_tratto(supporto *c, supporto *d);
void bonus_posizione(supporto *current);
void print_res();
