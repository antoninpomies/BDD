Create table fonction
(numfonct varchar2(4) constraint fonction_pk primary key,
libfonct varchar2(20),
salaire number(8,2)
);

create table service
(numserv varchar2(4) constraint service_pk primary key,
libserv varchar2(30)
);

create table employe
(numemp number(4) constraint employe_pk primary key,
nom varchar2(20),
prenom varchar2(20),
numfonct varchar2(4) constraint employe_ref_fonction references fonction(numfonct),
numserv varchar2(4) constraint employe_ref_service references service(numserv)
);

