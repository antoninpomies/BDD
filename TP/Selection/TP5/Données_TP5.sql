insert into CLIENT values (1,'MARTIN','Jean');
insert into CLIENT values (2,'DUPONT','Pierre');
insert into CLIENT values (3,'RICHARD','Michel');
insert into CLIENT values (4,'LAFORET','Etienne');
insert into CLIENT values (5,'DURAND','Marie');

insert into PRODUIT values (1,'Livre',10.92);
insert into PRODUIT values (2,'Tabouret',30.4);
insert into PRODUIT values (3,'Lit',750.2);
insert into PRODUIT values (4,'Chaise',50.5);
insert into PRODUIT values (5,'Table',100.5);

insert into FACTURE values (1,1,'15/06/22');
insert into FACTURE values (2,1,'15/07/22');
insert into FACTURE values (3,3,'17/07/22');
insert into FACTURE values (4,2,'15/08/22');
insert into FACTURE values (5,2,'16/08/22');
insert into FACTURE values (7,4,'16/08/22');
insert into FACTURE values (8,1,'15/09/22');
insert into FACTURE values (9,1,'15/09/22');
insert into FACTURE values (10,4,'15/09/22');


insert into LIGNEFACTURE values (1,1,5);
insert into LIGNEFACTURE values (1,2,2);
insert into LIGNEFACTURE values (2,3,1);
insert into LIGNEFACTURE values (3,1,1);
insert into LIGNEFACTURE values (3,3,1);
insert into LIGNEFACTURE values (3,4,10);
insert into LIGNEFACTURE values (4,1,6);
insert into LIGNEFACTURE values (4,2,5);
insert into LIGNEFACTURE values (4,4,3);
insert into LIGNEFACTURE values (4,5,4);
insert into LIGNEFACTURE values (5,2,1);
insert into LIGNEFACTURE values (7,1,3);
insert into LIGNEFACTURE values (7,2,8);
insert into LIGNEFACTURE values (7,3,4);
insert into LIGNEFACTURE values (7,4,9);
insert into LIGNEFACTURE values (7,5,4);
insert into LIGNEFACTURE values (8,2,7);
insert into LIGNEFACTURE values (9,5,9);
insert into LIGNEFACTURE values (9,4,1);
insert into LIGNEFACTURE values (10,1,1);
insert into LIGNEFACTURE values (10,2,2);
insert into LIGNEFACTURE values (10,4,1);

COMMIT;
