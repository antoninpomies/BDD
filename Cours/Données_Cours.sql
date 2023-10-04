insert into ELEVES values (1,'ALBERT','Etienne', null);
insert into ELEVES values (2,'BETS','Guillaume', null);
insert into ELEVES values (3,'DUMAS','Julien', null);
insert into ELEVES values (4,'DURANS','Luc', trunc(sysdate));
insert into ELEVES values (5,'BOIS','Jean', sysdate);
insert into ELEVES values (6,'DUJARDIN','Alex', sysdate);


insert into MATIERES values (1,'Anglais', 2);
insert into MATIERES values (2,'Reseaux', 4);
insert into MATIERES values (3,'Programmation', 3);

insert into NOTES values (1,1,14);
insert into NOTES values (2,1,12);
insert into NOTES values (3,1,9);
insert into NOTES values (4,1,8);
insert into NOTES values (5,1,7);

insert into NOTES values (1,2,4);
insert into NOTES values (2,2,13);
insert into NOTES values (3,2,7);
insert into NOTES values (4,2,15);
insert into NOTES values (5,2,7);

insert into NOTES values (1,3,3);
insert into NOTES values (3,3,7);
insert into NOTES values (4,3,8);
insert into NOTES values (5,3,17);

commit;
