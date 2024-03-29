--DDL Table PILOTES
create table PILOTE (
    idPilote number(4) constraint pk_idPilote primary key,
    nom varchar2(20) not null,
    prenom varchar2(20) not null,
    nbCourse number(4) default 0
);

--DDL Table COURSE
create table COURSE (
    idCourse number(3) constraint pk_idCourse primary key,
    nomCourse varchar2(20),
    dateCourse date
);

--DDL Table POINT
create table POINTS (
    place number(3) constraint pk_place primary key,
    point number(2)
);

--DDL Table RESULTAT
create table RESULTAT (
    idPilote number(4),
    idCourse number(3),
    place number(3),
    constraint pk_idPiloteidCourse primary key (idPilote, idCourse),
    foreign key (idPilote) references PILOTE(idPilote),
    foreign key (idCourse) references COURSE(idCourse)
);

--DDL Table CLASSEMENT
create table CLASSEMENT (
    idPilote number(4) constraint pk_idPilote primary key,
    points number(3),
    rang number(4),
    foreign key (idPilote) references PILOTE(idPilote)
);

-- Sequences


-- Trigger pour nbCourse
CREATE OR REPLACE TRIGGER majValnbCourse
AFTER INSERT ON RESULTAT
FOR EACH ROW
BEGIN
    UPDATE PILOTE
    SET nbCourse = nbCourse + 1
    WHERE IdPilote = :NEW.IdPilote;
END;
/

--
