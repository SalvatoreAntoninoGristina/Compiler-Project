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
%token <stringa> DATA PAROLE CODICE D_TAPPA
%token <intero> ORA_MIN_SEC PETTORINA
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
Ciclisti: PARA CODICE VIR PAROLE VIR PAROLE VIR PETTORINA PARC {
if((ins_ciclista($2,$4,$6,$8))==0){
  yyerror("ERRORE, PETTORINA GIA INSERITA...");
  YYABORT;
  }
  }
  ;
Sezione2: L_tratti
  ;
L_tratti: Tratti
  | Tratti L_tratti
  ;
Tratti: D_TAPPA TRAT PAROLE TRAT PAROLE TRAT L_supporto {

  switch(ins_tratto($1,$3,$5)){
    case 0:
    yyerror("ERRORE CITTA PARTENZA DIVERSA CITTA ARRIVO...");
    YYABORT;
    break;

    case 1:
    yyerror("ERRORE DATE UGUALI...");
    YYABORT;
    break;

    default:
    break;
    }
}
  ;
L_supporto: Supporto
  | Supporto ARR L_supporto
  ;
Supporto: PARA PETTORINA DPN ORA_MIN_SEC DPN ORA_MIN_SEC DPN ORA_MIN_SEC PARC {

if($4<0||$6<0||$8<0){
  yyerror("IL TEMPO DELLE TRATTE DEVE ESSERE MAGGIORE DI 0...");
  YYABORT;
}
if((ins_supporto($2,(($4*3600)+($6*60)+$8)))==NULL){
  yyerror("PETTORINA NON TROVATA NELLA LISTA DEI CICLISTI...");
  YYABORT;
}

}
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
