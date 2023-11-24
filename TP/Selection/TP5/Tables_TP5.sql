create table CLIENT
(NUMCLI number(4) constraint client_pk primary key,
NOM varchar2(20) not null,
PRENOM varchar2(20) not null
);

create table PRODUIT
(NUMPROD number(4) constraint produit_pk primary key,
LIBELLE varchar2(10) not null,
PRIX number(6,2) not null
);

create table FACTURE
(NUMFACT number(4) constraint facture_pk primary key,
NUMCLI number(4) constraint facture_ref_client references CLIENT(NUMCLI),
DATEFACT DATE
);


create table LIGNEFACTURE
(NUMFACT number(4) constraint lignefacture_ref_facture references FACTURE (NUMFACT),
NUMPROD number(4) constraint lignefacture_ref_produit references PRODUIT (NUMPROD),
QTE number(3),
constraint lignefacture_pk primary key(NUMFACT, NUMPROD)
);


drop table LIGNEFACTURE;
drop table FACTURE;
drop table CLIENT;
drop table PRODUIT;
