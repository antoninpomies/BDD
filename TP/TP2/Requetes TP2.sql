--Question n°1
select p.nom, p.prenom from personne p order by nom, prenom;
--Question n°2
select s.libelle, c.nblit from chambre c inner join services s on c.nuserv = s.nuserv where c.nuch = 11;
--Question n°3
