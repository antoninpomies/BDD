--exemple
--1
select m.libelle , m.coeff from matieres m
where m.coeff = (select max(m1.coeff) from matieres m1);

--2
select e.nom, e.prenom, nvl(to_char(n.note), 'Pas de note dans la matiere')  
from eleves e, notes n
where e.numele = n.numele (+)
and n.nummat(+) = 3;
--ou
select e.nom, e.prenom, n.note, n.nummat from eleves e left join notes n
on e.numele = n.numele and n.nummat = 3;

--3
select e.nom, e.prenom, round(sum(n.note*m.coeff)/sum(m.coeff), 2)
from eleves e, notes n, matieres m
where e.numele = n.numele and n.nummat = m.nummat
group by e.nom, e.prenom;
--ou
select e.nom, e.prenom, round(sum(n.note*m.coeff)/sum(m.coeff), 2)
from eleves e inner join notes n on e.numele = n.numele 
inner join matieres m on n.nummat = m.nummat
group by e.nom, e.prenom;

--4
select e.nom, e.prenom from eleves e
minus
select e1.nom, e1.prenom from eleves e1, notes n
where e1.numele = n.numele and n.nummat = 3;
--ou
select e.nom, e.prenom from eleves e
where not exists (select null from notes n
                  where n.numele = e.numele
                  and n.nummat = 3);
--ou
SELECT * FROM ELEVES E LEFT JOIN NOTES N ON E.NUMELE = N.NUMELE
 AND N.NUMMAT = 3 WHERE N.note is null;
--ou
SELECT * FROM ELEVES E, NOTES N where E.NUMELE = N.NUMELE(+)
 AND N.NUMMAT(+) = 3 AND N.note is null;

--5
select nom, prenom from eleves e
where exists (select null from notes n where n.nummat = 2 and e.numele = n.numele)
and exists (select null from notes n1 where n1.nummat = 3 and e.numele = n1.numele);
--ou
select nom, prenom from eleves e 
where numele in (select numele from notes where nummat = 3)
and numele in (select numele from notes where nummat = 2 );
--ou
select nom, prenom from eleves e, notes n
where e.numele = n.numele and n.nummat = 2
INTERSECT
select nom, prenom from eleves e, notes n
where e.numele = n.numele and n.nummat = 3;
--ou
select nom, prenom from eleves e inner join notes n
on e.numele = n.numele and n.nummat = 2
INTERSECT
select nom, prenom from eleves e inner join notes n
on e.numele = n.numele and n.nummat = 3;

--6
select e.nom, e.prenom
from eleves e, notes n, matieres m
where e.numele = n.numele and m.nummat = n.nummat
group by e.nom, e.prenom
having sum(n.note * m.coeff)/sum(m.coeff) = (select max (sum(n1.note * m1.coeff)/sum(m1.coeff))
                                       from eleves e1, notes n1, matieres m1
                                       where e1.numele = n1.numele and m1.nummat = n1.nummat
                                       group by n1.numele);
--ou
select e.nom, e.prenom, round(sum(n.note*m.coeff)/sum(m.coeff), 2) moyenne
from eleves e join notes n on e.numele = n.numele 
join matieres m on n.nummat = m.nummat
group by e.nom, e.prenom
order by moyenne
fetch first 1 row only;
--ou
select * from (
select e.nom, e.prenom, round(sum(n.note*m.coeff)/sum(m.coeff), 2) moyenne
from eleves e join notes n on e.numele = n.numele 
join matieres m on n.nummat = m.nummat
group by e.nom, e.prenom
order by moyenne desc)
where rownum = 1;

--7
select m.libelle, e.nom, e.prenom, n.note
from eleves e, notes n, matieres m
where e.numele = n.numele and m.nummat = n.nummat
and n.note = (select max(n1.note)
              from notes n1
              where n.nummat = n1.nummat);
--ou
select m.libelle, e.nom, e.prenom, n.note
from eleves e, notes n, matieres m
where e.numele = n.numele and m.nummat = n.nummat
and n.note = (select n1.note
              from notes n1
              where n.nummat = n1.nummat
			  order by n1.note desc
			  fetch first 1 row only);
--ou
select e.nom, e.prenom, m.libelle, n.note from notes n, eleves e, matieres m
where e.numele = n.numele 
and m.nummat = n.nummat
and (m.nummat, note)  in (
select n1.nummat, max(n1.note) from notes n1
group by n1.nummat);

--8
select T.libelle, listagg (T.nom || ' ' || T.prenom, ', ' ) within group (order by T.nom) from (
select m.libelle, e.nom, e.prenom
from eleves e, matieres m, notes n
minus 
select m.libelle, e.nom, e.prenom
from eleves e, matieres m, notes n
where e.numele = n.numele and m.nummat = n.nummat) T
group by T.libelle
order by T.libelle;
--ou
select m.libelle, e.nom, e.prenom
from eleves e cross join matieres m
minus 
select m.libelle, e.nom, e.prenom
from eleves e inner join  notes n on e.numele = n.numele 
inner join matieres m on m.nummat = n.nummat
order by libelle;
--ou
select m.libelle, e.nom, e.prenom
from eleves e, matieres m, notes n
where m.nummat = n.nummat(+) and e.numele = n.numele(+)
and n.note is null;
--ou
select m.libelle, listagg (e.nom || ' ' || e.prenom, ', ' ) within group (order by nom)
from eleves e cross join matieres m
left join notes n on e.numele = n.numele and m.nummat = n.nummat
where note is null
group by m.libelle;
--ou
select  m.libelle, listagg (e.nom || ' ' || e.prenom, ', ' ) within group (order by nom)
from eleves e cross join matieres m
where not exists (select null from notes n where n.numele = e.numele and n.nummat = m.nummat)
group by m.libelle
order by m.libelle;

select *
from eleves e full join notes m on e.numele = n.numele
full join matieres n on n.nummat = m.nummut;
