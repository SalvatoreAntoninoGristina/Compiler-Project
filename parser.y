%{
#include <stdio.h>
#include "symb_tab.h"
int yylex();
void yyerror (char const*);
%}
%union{
  char *stringa;
  int intero;
}
%error-verbose
%token <stringa> DATA PAROLE CODICE D_TAPPA PETTORINA
%token <intero> ORA_MIN_SEC
%token DPN SEP1 SEP2 SEP3 TRAT ARR PARA PARC VIR
%start Input
%%
Input: Data SEP1 Sezione1 SEP2 SEP3 Sezione2
  ;
Data: DATA
  ;
Sezione1: L_ciclisti
  ;
L_ciclisti: Ciclisti
  | Ciclisti L_ciclisti
  ;
Ciclisti: PARA CODICE VIR PAROLE VIR PAROLE VIR PETTORINA PARC {ins_ciclista($2,$4,$6,$8);}
  ;
Sezione2: L_tratti
  ;
L_tratti: Tratti
  | Tratti L_tratti
  ;
Tratti: D_TAPPA TRAT PAROLE TRAT PAROLE TRAT L_supporto {ins_tratto($1,$3,$5);}
  ;
L_supporto: Supporto
  | Supporto ARR L_supporto
  ;
Supporto: PARA PETTORINA DPN ORA_MIN_SEC DPN ORA_MIN_SEC DPN ORA_MIN_SEC PARC {ins_supporto($2,(($4*3600)+($6*60)+$8));}
  ;
%%
void yyerror (char const *s){
  fprintf(stderr, "%s\n",s);
}
int main(){
  if(yyparse() == 0){
  print_res();
  }
  return 0;
}
