insert into fonction values ('SEC','Secr�taire',1500);
insert into fonction values ('ASSP','Assistant Projet',1600);
insert into fonction values ('ANA','Analyste',2000);
insert into fonction values ('CDP','Chef de Projet',1800);
insert into fonction values ('DIR','Directeur',2500);


insert into SERVICE values ('INFO','Informatique');
insert into SERVICE values ('COMP','Comptabilit�');
insert into SERVICE values ('RH','Ressources Humaines');
insert into SERVICE values ('PROD','Production');
insert into SERVICE values ('DIR','Direction');
insert into SERVICE values ('COM','Communication');

insert into employe values(1,'Durant', 'Pierre','ANA','INFO');
insert into employe values(2,'Dupont', 'Patrick','ANA','INFO');
insert into employe values(3,'Bonnet', 'Anne','SEC','INFO');
insert into employe values(4,'Bonnet', 'Yves','CDP','INFO');
insert into employe values(5,'Aupetit','Juliette','CDP','INFO');
insert into employe values(6,'Barbin', 'Paul','ANA','INFO');
insert into employe values(7,'Cantou', 'Bernard','DIR','COMP');
insert into employe values(8,'Dourine', 'Catherine','SEC','COMP');
insert into employe values(9,'Liagre', 'Corinne','SEC','COMP');
insert into employe values(10,'Mouffre', 'Sylvie','SEC','COMP');
insert into employe values(11,'Numero', 'Michelle','SEC','COMP');
insert into employe values(12,'Raton', 'Olivier','ANA','COMP');
insert into employe values(13,'Dupond', 'Catherine','ANA','COMP');
insert into employe values(14,'Blanc','Maxime','DIR','RH');
insert into employe values(15,'Bleuet','Dominique','DIR','RH');
insert into employe values(16,'Debat','Didier','ANA','RH');
insert into employe values(17,'Robin','Noelle','SEC','RH');
insert into employe values(18,'Deliat','Justine','DIR','PROD');
insert into employe values(19,'Calipe','Justin','SEC','PROD');
insert into employe values(20,'Etienne','Cl�mence','SEC','PROD');


commit;

