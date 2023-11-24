--1
select nom, prenom
from client
order by nom, prenom;

--2
select p.libelle from produit p
where p.prix = (select max(p1.prix) from produit p1);

--3
select nom, prenom, count(f.numcli)
from client c, facture f
where c.numcli = f.numcli(+)
group by nom, prenom;

--4
select numfact, sum(prix*qte)
from lignefacture l, produit p
where l.numprod = p.numprod
group by numfact;
--ou
select numfact, sum(prix*qte)
from lignefacture l inner join produit p
on l.numprod = p.numprod
group by numfact;

--5
select nom, prenom
from client
minus
select nom, prenom
from facture f, client c
where c.numcli = f.numcli;

--6
select p.libelle
from produit p, lignefacture l
where p.numprod = l.numprod and l.numfact = 3
intersect 
select p1.libelle
from produit p1, lignefacture l1
where p1.numprod = l1.numprod and l1.numfact = 4;
-- ou
select p.libelle
from produit p
where p.numprod in (select l.numprod from lignefacture l where l.numfact = 3)
and p.numprod in (select l1.numprod from lignefacture l1 where l1.numfact = 4);

--7
select nom, prenom
from client c, facture f, lignefacture l
where c.numcli = f.numcli and l.numfact = f.numfact
group by nom, prenom, l.numfact
having count(*) = (select count(*) from produit);
--ou
select nom, prenom
from client c inner join facture f on c.numcli = f.numcli
inner join lignefacture l
on l.numfact = f.numfact
group by nom, prenom, l.numfact
having count(*) = (select count(*) from produit);

--8
select libelle
from produit p, lignefacture l
where p.numprod = l.numprod
group by libelle
having count(*) = (select count(*) from facture);

--9
select libelle
from produit p, lignefacture l
where p.numprod = l.numprod
group by libelle
having sum(qte) = (select max(sum(qte)) from lignefacture group by numprod);

--10
select l.numfact, p.libelle, l.qte
from produit p inner join lignefacture l
on p.numprod = l.numprod
where (qte, numfact) in (select max(l1.qte), l1.numfact from lignefacture l1 group by l1.numfact)
order by l.numfact;
--ou 
select l.numfact, p.libelle, l.qte
from produit p inner join lignefacture l
on p.numprod = l.numprod
where l.qte = (select max(l1.qte) from lignefacture l1 where l1.numfact = l.numfact)
order by numfact;


--11
select nom, prenom
from client c, facture f, lignefacture l, produit p
where c.numcli = f.numcli and l.numfact = f.numfact and l.numprod = p.numprod
group by nom, prenom, f.numfact
having(sum(prix*qte)) = (select max(sum(prix*qte))
						 from lignefacture l1, produit p1
						 where l1.numprod = p1.numprod
						 group by l1.numfact);

--12
select c.nom, c.prenom, f.numfact
from client c, facture f, lignefacture l, produit p
where c.numcli = f.numcli
and l.numfact = f.numfact
and l.numprod = p.numprod
group by c.nom, c.prenom, f.numfact, c.numcli
having(sum(prix*qte)) = (select min(sum(prix*qte))
						 from lignefacture l1, produit p1, facture f1
						 where l1.numprod = p1.numprod
						 and l1.numfact = f1.numfact
						 and f1.numcli = c.numcli
						 group by f1.numfact)
order by nom, prenom;

--13
select p.libelle from produit p, lignefacture l2, lignefacture l3,
where l2.numprod(+) = p.numprod and l3.numprod(+) = p.numprod
and l2.numfact (+) = 2 and l3.numfact (+) = 3 
and l2.numfact is null and l3.numfact is null;

select p.libelle from produit p 
left join lignefacture l2 on l2.numprod = p.numprod and l2.numfact = 2 
left join lignefacture l3 on l3.numprod = p.numprod and l3.numfact = 3
where l2.numfact is null and l3.numfact is null;

--14
select sum(lf.qtite) from lignefacture lf group by lf.numfact;

--15
select libelle from produit p, 
(select lf.numprod, f.numfact 
from lignefacture lf, facture f 
where f.numfact = lf.numfact and f.datefact = '15/09/2022') T
where T.numprod (+) = p.numprod and T.numfact is null;
--ou
WITH T AS (select distinct lf.numprod 
from lignefacture lf, facture f 
where f.numfact = lf.numfact and f.datefact = '15/09/2022')
SELECT libelle from produit p, T
where T.numprod (+) = p.numprod and T.numprod is null;
--ou
select p.libelle from produit p
where p.numprod not in (select lf.numprod
                        from lignefacture lf 
                        inner join facture f on f.numfact = lf.numfact 
                        and f.datefact = '15/09/2022');
--ou
select p.libelle from produit p
minus
select p.libelle from lignefacture lf1, facture f, produit p 
where p.numprod = lf1.numprod and lf1.numfact = f.numfact and f.datefact = '15/09/2022';

--16
select c.nom, c.prenom
from client c
minus 
select c.nom, c.prenom
from client c, facture f
where f.numcli = c.numcli
and f.datefact in ('15/09/2018', '17/07/18');

--17
select lf.qte from lignefacture lf, produit p1
where lf.numprod = p1.numprod and lf.numfact in (
select l.numfact
from facture f, lignefacture l, produit p
where l.numfact = f.numfact
and l.numprod = p.numprod
group by f.numfact
having(sum(prix*qte)) = (select max(sum(prix*qte))
						 from lignefacture l1, produit p1
						 where l1.numprod = p1.numprod
						 group by l1.numfact))
and p1.prix in (select min(prix) from produit p2, lignefacture lf2 where p2.numprod = lf2.numprod and lf2.numfact = lf.numfact);

--18
select p.libelle from produit p
minus 
select p2.libelle from produit p2, lignefacture l2
where p2.numprod = l2.numprod
and l2.numfact in (
select l.numfact
from facture f, lignefacture l, produit p
where l.numfact = f.numfact
and l.numprod = p.numprod
and f.numcli = 4
group by l.numfact, f.numcli
having(sum(prix*qte)) = (select min(sum(prix*qte))
						 from lignefacture l1, produit p1, facture f1
						 where l1.numprod = p1.numprod and f1.numfact = l1.numfact
                         and f1.numcli = f.numcli  
						 group by l1.numfact));
