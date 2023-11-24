Create table ELEVES
(numele number(3) constraint eleve_pk primary key,
nom varchar2(20) not null,
prenom varchar2(20) not null,
DateCreation date
);

create table MATIERES
(nummat number(2) constraint matiere_pk primary key,
libelle varchar2(25),
coeff number(1)
);

create table NOTES
(numele number(3) constraint notes_ref_eleve references eleves(numele),
nummat number(2) constraint notes_ref_matiere references matieres(nummat),
note number(2),
constraint notes_pk primary key(numele,nummat)
);
