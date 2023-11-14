--Question n°1
select s.libserv from service s order by s.libserv;
--Question n°2
select e.nom, e.prenom from EMPLOYE e where e.numfonct = 'CDP';
--Question n°3
select f.libfonct, f.salaire from fonction f order by salaire desc;
--Question n°4
select e.nom, e.prenom, e.numfonct from employe e where e.numfonct = (select e.numfonct from employe e where e.nom = 'Durant' and e.prenom = 'Pierre');
--Question n°5
select s.libserv from service s left join employe e on s.numserv = e.numserv where e.numserv is null;
--Question n°6
select s.libserv as 'Service ayant Analyste et Directeur', e.numfonct as 'Fonction' from service s inner join employe e on s.numserv = e.numserv where e.numfonct = 'DIR' or e.numfonct = 'ANA' order by numfonct;
--Question n°7
select s.libserv from service s left join employe e on s.numserv = e.numserv where s.numserv = 'DIR' and e.numfonct is null;
--Question n°8
select f.libfonct, count(e.numemp) from fonction f  left join employe e on e.numfonct = f.numfonct group by f.libfonct;
--Question n°9
select s.libserv, count(e.numemp) from service s left join employe e.numfonct = f.numfonct group by e.numemp desc
--Question n°10
select s.libserv