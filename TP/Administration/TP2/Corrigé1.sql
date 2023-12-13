--2
create sequence seq_cli
start with 0;

--3
create or replace procedure insert_cli
(p_nom varchar2, p_prenom varchar2)
IS
BEGIN
	IF (p_nom = UPPER(p_nom) and p_nom is not null and p_prenom is not null)
	THEN
		INSERT INTO CLIENTS values (seq_cli.nextval,p_nom,p_prenom,null);
		DBMS_OUTPUT.PUT_LINE('CLIENT INSERE.');
	ELSE
		DBMS_OUTPUT.PUT_LINE('ERREUR LORS DE LA CREATION DU CLIENT.');
	END IF;
END;
/

--4
EXEC insert_cli('MOTSCH', 'David');
EXEC insert_cli('MOTSCH', null);
EXEC insert_cli('MOTsch', 'David');
EXEC insert_cli('DUPOND', 'Martin');
EXEC insert_cli('DURAND', 'Paul');
EXEC insert_cli('DUMONT', 'Pierre');
EXEC insert_cli('JEAN', 'Michel');

--5
insert into prixloc values ('Petit', 5);
insert into prixloc values ('Moyen', 8);
insert into prixloc values ('Grand', 10);

--5
insert into vehicules values (1, 'Petit', 'Clio');
insert into vehicules values (1, 'Moyen', 'Megane');
insert into vehicules values (1, 'Grand', 'Espace');
insert into vehicules values (2, 'Petit', '108');
insert into vehicules values (2, 'Moyen', '508');
insert into vehicules values (2, 'Grand', '5008');
insert into vehicules values (3, 'Petit', 'C1');
insert into vehicules values (3, 'Moyen', 'C3');
insert into vehicules values (3, 'Grand', 'C4');
insert into vehicules values (4, 'Petit', 'A1');
insert into vehicules values (4, 'Moyen', 'A3');
insert into vehicules values (4, 'Grand', 'A4');

--6

insert into location values (5, 1, 'Petit', sysdate -5, null);
insert into location values (6, 2, 'Petit', sysdate -3, null);
insert into location values (5, 2, 'Petit', sysdate -10, sysdate -7);
insert into location values (7, 3, 'Moyen', sysdate -1, null);
insert into location values (7, 3, 'Moyen', sysdate -3, sysdate -1);
insert into location values (8, 2, 'Moyen', sysdate -15, sysdate -7);
insert into location values (8, 1, 'Moyen', sysdate -10, null);
insert into location values (8, 4, 'Moyen', sysdate -6, sysdate -2);
insert into location values (7, 4, 'Grand', sysdate -13, sysdate -7);
insert into location values (6, 4, 'Grand', sysdate -4, null);
insert into location values (5, 3, 'Grand', sysdate -3, sysdate -1);
insert into location values (6, 1, 'Grand', sysdate -10, sysdate -7);
