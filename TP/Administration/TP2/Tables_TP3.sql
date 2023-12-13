create table client (
IdCli NUMBER(5) constraint client_pk primary key,
nom VARCHAR2(20) not null constraint nom_cli_maj check (nom = UPPER(nom)),
prenom VARCHAR2(20) not null,
nbloc NUMBER(3) default 0);

create table prixloc (
TypeV VARCHAR2(7) constraint prixloc_pk primary key,
prix NUMBER(6,2) constraint prix_positif check (prix > 0),
constraint typeV_val check (TypeV in ('Petit', 'Moyen', 'Grand')));

create table vehicules (
IdVehi NUMBER(6) ,
TypeV VARCHAR2(7) constraint vehi_ref_prix references prixloc (TypeV),
libelle VARCHAR2(60),
constraint vehicules_pk primary key (IdVehi, TypeV));

create table location (
IdCli NUMBER(5) constraint loc_ref_cli references client(IdCli),
IdVehi NUMBER(6),
TypeV VARCHAR2(7),
DateDeb date,
dateFin date,
constraint location_pk primary key (IdVehi, TypeV, DateDeb),
constraint loc_ref_vehi foreign key (IdVehi, TypeV) references vehicules (IdVehi, TypeV),
constraint date_loc_coherent check (dateFin >= DateDeb));


create table factures (
IdCli NUMBER(5) constraint factures_ref_client references client (IdCli),
DateFact date,
montantF NUMBER(6,2),
constraint factures_pk primary key (IdCli, DateFact));


create table penalites (
IdCli NUMBER(5) constraint penaltes_ref_client references client (IdCli),
DatePen date,
montantP NUMBER(4,2),
constraint penalites_pk primary key (IdCli, DatePen));


create table retard (
NbJour NUMBER(2) constraint retard_pk primary key,
mtP NUMBER(4,2));
