Create table PERSONNES
(Nupers number(3) constraint personnes_pk primary key,
nom varchar2(20),
prenom varchar2(20),
age number(3)
);

create table AVION
(Nuavi number(2) constraint avion_pk primary key,
typeavi varchar2(25),
nbpersmaxi number(2)
);

Create table VOL
(Nuvol number(3) constraint vol_pk primary key,
nuavi number(2) constraint vol_ref_avion references avion(Nuavi),
datevol date,
villedep varchar2(25),
villearr varchar2(25),
distance number(4)
);

create table VOYAGE
(
Nuvol number(3) constraint voyage_ref_vol references vol(Nuvol),
Nupers number(3) constraint voyage_ref_personnes references personnes(Nupers),
constraint voyage_pk primary key (Nupers, Nuvol)
);

delete from voyage;

delete from vol;

delete from personne;

delete from avion;
