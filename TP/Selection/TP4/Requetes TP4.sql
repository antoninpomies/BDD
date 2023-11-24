--1
select nom, prenom
from pilote
order by nom desc;

--2
select count(*) from course;

--3
select nomcourse, longueur
from course 
where datecourse LIKE '%/08/22';

--4
select nomcourse
from course 
where longueur = (select MAX(longueur) from course);

--5
select nom, prenom
from pilote p 
inner join resultat r on r.idpilote = p.idpilote 
inner join course c on c.idcourse = r.idcourse
where nomcourse = 'MONACO';

--6
select nom, prenom
from pilote 
p inner join resultat r on r.idpilote = p.idpilote
inner join course c on c.idcourse = r.idcourse
having count(r.idpilote) < 4
group by nom, prenom;

--7
select nomcourse
from course 
where longueur in (
select longueur
from course
group by longueur
having count(*) > 1);
--ou
select c1.nomcourse from course c1, course c2
where c1.idcourse != c2.idcourse and c1.longueur = c2.longueur

--8
select nom, prenom, p.point
from pilote p
inner join resultat r on r.idpilote = p.idpilote
inner join course c on c.idcourse = r.idcourse
left join point p on r.place = p.place
where nomcourse = 'INTERLAGOS';

--9
select nom count(*)
from pilote
inner join resultat on resultat.idpilote = pilote.idpilote
where place = 4
group by nom
HAVING count(*) = (select max(count(*)) 
				   from pilote
				   inner join resultat on resultat.idpilote = pilote.idpilote
				   inner join course on course.idcourse = resultat.idcourse
				   where place = 4
				   group by nom);$
--9
select nom, count(*), (select sum(pc.point) from  resultat r1 
                        inner join course c1 on c1.idcourse = r1.idcourse
                        inner join point pc
                        on pc.place = r1.place
                        and c1.idpilote = p.idpilote)
from pilote p
inner join resultat r on r.idpilote = p.idpilote
where place = 4
group by nom
HAVING count(*) = (select max(count(*)) 
				   from pilote
				   inner join resultat on resultat.idpilote = pilote.idpilote
				   inner join course on course.idcourse = resultat.idcourse
				   where place = 4
				   group by nom);

--10
select ecurie
from pilote
minus
select ecurie
from pilote p
left join resultat r on r.idpilote = p.idpilote
left join course c on c.idcourse = r.idcourse
left join point p on r.place = p.place
where nomcourse = 'IMOLA'
group by ecurie;
--ou
select distinct p.ecurie from pilote p where not exists (
select null from pilote p1 inner join resultat r on p1.idpilote = r.idpilote
inner join course c on c.idcourse = r.idcourse
where c.nomcourse = 'IMOLA' and p1.ecurie = p.ecurie);

--11
select pi.nom, pi.prenom, sum(p.point)
from pilote pi  
inner join resultat r on r.idpilote = pi.idpilote
inner join course c on c.idcourse = r.idcourse
inner join point p on r.place = p.place
having sum(p.point) = (select max(sum(po.point))
					   from resultat r
					   inner join course c on c.idcourse = r.idcourse
					   inner join point po on r.place = po.place
					   group by r.idpilote)
group by pi.nom, pi.prenom;

--12
select p1.nom, p1.prenom
from pilote p1
minus
select nom, prenom
from pilote p
inner join resultat r on r.idpilote = p.idpilote
inner join course c on c.idcourse = r.idcourse
where r.place > (select max(place) 
				 from point);

--13
select nom, prenom, sum(p.point)
from pilote p
left join resultat r on r.idpilote = p.idpilote
left join course c on c.idcourse = r.idcourse
left join point p on r.place = p.place
group by nom, prenom
order by 3 desc
OFFSET 2 ROWS
FETCH NEXT 1 ROWS ONLY;
--mieux
--13
select ecurie, nb_point from (
select rownum rang, t1.* from (select p.ecurie, sum(po.point) nb_point
from pilote p
left join resultat r on r.idpilote = p.idpilote
left join course c on c.idcourse = r.idcourse
left join point po on r.place = po.place
group by p.ecurie
order by 2 desc) t1)
where rang = 3;
--ou
with t1 as (select p.ecurie, sum(po.point) nb_point
from pilote p
left join resultat r on r.idpilote = p.idpilote
left join course c on c.idcourse = r.idcourse
left join point po on r.place = po.place
group by p.ecurie
order by 2 desc)
select ecurie, nb_point from (
select rownum rang, t1.* from t1)
where rang = 3;


--14
select nom, prenom, avg(point)
from pilote p
left join resultat r on r.idpilote = p.idpilote
left join course c on c.idcourse = r.idcourse
left join point p on r.place = p.place
where ecurie = 'Lotus'
and datecourse > '01/06/22'
and longueur > 5000
group by nom, prenom
order by avg(point) desc
