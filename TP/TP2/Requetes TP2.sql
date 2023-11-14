--Question n°1
select p.nom, p.prenom from personne p order by nom, prenom;
--Question n°2
select s.libelle, c.nblit from chambre c inner join services s on c.nuserv = s.nuserv where c.nuch = 11;
--Question n°3
select nuch from hospitalisation where nbjour = (select max(nbjour) from hospitalisation);
--Question n°4
select p.nom, p.prenom from personne p inner join hospitalisation h on p.nupers = h.nupers where h.datedeb = to_date('09/01/2023', 'DD/MM/YYYY');
--Question n°5
select s.libelle from services s inner join chambre c on s.nuserv = c.nuserv inner join hospitalisation h on  c.nuch = h.nuch where h.datedeb = (select max (h1.datedeb) from hospitalisation h1);
--Question n°6
select h.datedeb + h.nbjour, h.nbjour from hospitalisation h inner join parsonne p on p.nupers = h.nupers where p.nom = 'LIENHART' and p.prenom = 'Jo' and nbjour = (select max(h1.nbjour) from hospitalisation h1 inner join personne p1 on p1.nupers = h1.nupers where p.nupers = p1.nupers);
--Question n°7
select avg(h.nbjour) from hospitalisation h inner join personne p on p.nupers = h.nupers where p.nom = 'MOULY' and p.prenom = 'Florent';
--Question n°8
select p.nom, p.prenom from personne p inner join hospitalisation h on p.nupers = h.nupers where p.sexe = 'M' group by p.nupers, p.nom, p.prenom having count(*) = (select max(count(*)) from personne p1 inner join hospitalisation h1 on p1.nupers = h1.nupers where p1.sexe = 'M' group by h1.nupers);
--Question n°9
select s.libelle from services s inner join chmabre c on s.nuserv = c.nuserv group by c.nuserv, s.libelle having sum(c.nblit) = (select min(sum(c1.nblit)) from chambre c1 graoup by c1.nuserv);
--Question n°10
select p.nom, s.libell from services s inner join chambre c on s.nuserv = c.nuserv inner join hospitalisation h on c.nuch = h.nuch inner join personne p on h.nupers = p.nupers where p.nom in ('DUMA', 'BETS');
--Qestion n°11
select p.nom, p.prenom, p.sexe, sum(h.nbjour) from personne p left join hospitalisation h on p.nupers = h.nupers group by p.nom, p.prenom, p.sexe order by p.sexe, p.nom;
--Question n°12
select c.nuch chambre from chambre c left join services s on s.nuserv = c.nuserv and s.libelle = 'Dermatologie' left join hospitalisation h on c.nuch = h.nuch where h.nupers is null and s.libelle is not null order by chambre;
--Question n°13
select p.nom, p.prenom, s.libelle, round(avg(h.nbjour), 2) from personne p inner join hospitalisation h on p.nupers = h.nupers inner join chambre c on c.nuch = h.nuch inner join services s on s.nuserv = c.nuserv where p.sexe = 'F' group by p.nom, p.prenom, s.libelle;
--Question n°14
select p.nom, p.prenom, h.nuch from personne p inner join hospitalisationh on p.nupers = h.nupers where '12/01/2023' between h.datedeb and (h.datedeb + nbjour);