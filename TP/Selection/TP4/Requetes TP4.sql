--Question n°1
select p.nom, p.prenom from pilote p order by p.nom desc;
--Question n°2
select count(*) from course;
--Question n°3
select c.nomCourse, c.longueur from course c where c.dateCourse = '21/08/22';
--Question n°4
select c.nomCourse from course c where c.longueur = (select max(c1.longueur) from course c1);
--Question n°5
select p.nom, p.prenom from pilote p inner join resultat r on r.IdPilote = p.IdPilote inner join course c on c.IdCourse = r.IdCourse where c.nomCourse = 'MONACO';
--Question n°6
select p.nom, p.prenom from pilote p inner join resultat r on r.IdPilote = p.IdPilote;


