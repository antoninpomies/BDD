create table PROFESSEUR
(Numprof number(3) constraint professeur_pk primary key,
nom varchar2(30) not null,
prenom varchar2(30) not null,
datenais date constraint date_prof check (datenais > to_date('01/01/1900', 'MM/DD/YYYY')),
Ttal NUMBER(5) default 0 not null constraint Ttal_positif check (Ttal >= 0)
);

Create table MATIERE
(nummat number(3) constraint matiere_pk primary key,
libelle varchar2(30) not null,
coef number(3));

Create table ENSEIGNE
(numProf number(3) constraint enseigne_ref_professeur references professeur(numProf),
numMat number(2) constraint enseigne_ref_matiere references matiere(numMat),
Promo varchar2(2) constraint promo_valeur check (promo in ('B3', 'M1', 'M2')),
Nbh number(3) default 0 not null constraint Nbh_positif check (Nbh >= 0),
constraint enseigne_pk primary key (numProf, numMat, Promo)
);

create table RECAP
(numProf number(3) constraint recap_ref_professeur references professeur(numProf),
Promo varchar2(2) constraint promo_valeur_recap check (promo in ('B3', 'M1', 'M2')),
Totalh number(3) default 0 not null constraint Totalh_positif check (Totalh >= 0),
constraint recap_pk primary key (numProf, Promo)
);
