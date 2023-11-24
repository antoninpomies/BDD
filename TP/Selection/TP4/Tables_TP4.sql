Create table PILOTE
(IdPilote number(3) constraint pilote_pk primary key,
nom varchar2(20),
prenom varchar2(20),
ecurie varchar2(20)
);

create table COURSE
(IdCourse number(3) constraint course_pk primary key,
nomCourse varchar2(20),
dateCourse date,
longueur number (4)
);

Create table POINT
(Place number(1) constraint points_pk primary key,
point number(2)
);

create table RESULTAT
(IdCourse number(3) constraint resultat_ref_course references course(IdCourse),
IdPilote number(3) constraint resultat_ref_pilote references pilote(IdPilote),
Place number(2),
constraint resultat_pk primary key(IdPilote, IdCourse)
);


drop table PILOTE;

drop table COURSE;

drop table POINT;

drop table RESULTAT;


