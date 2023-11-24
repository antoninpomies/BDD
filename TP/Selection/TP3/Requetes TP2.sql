--1
SELECT p.nom, p.prenom 
FROM personnes p 
ORDER BY p.nom DESC;

--2
SELECT a.typeavi, a.nbpersmaxi
FROM avion a
WHERE a.nuavi = 2;

--3
SELECT a.typeavi 
FROM avion a INNER JOIN vol v ON a.nuavi = v.nuavi
WHERE v.distance = (SELECT MIN(v1.distance) FROM vol v1);

-- 4
SELECT p.nom, p.prenom 
FROM personnes p INNER JOIN voyage v ON v.nupers = p.nupers 
JOIN vol vo ON v.nuvol = vo.nuvol
WHERE vo.datevol = '16/08/2022';

--5
SELECT v1.datevol
FROM vol v INNER JOIN AVION a on a.nuavi = v.nuavi 
and a.typeavi = 'F-Jet'
AND v.distance = (SELECT MIN(v1.distance) 
				  FROM vol v1 INNER JOIN avion a1 ON v1.nuavi = a1.nuavi
				  WHERE a1.typeavi = 'F-Jet');
				
--6
SELECT AVG(v.distance) 
FROM vol v INNER JOIN avion a ON v.nuavi = a.nuavi
WHERE a.typeavi = 'A330';

--7
SELECT p.nom, p.prenom 
FROM personnes p INNER JOIN voyage v ON v.nupers = p.nupers
where p.age > 50
GROUP BY p.nom, p.prenom
HAVING COUNT(*) = (SELECT MAX(COUNT(*)) FROM voyage v1 INNER JOIN personnes p1 ON v1.nupers = p1.nupers
			where p1.age > 50
			GROUP BY v1.nupers );
				   
--8
SELECT a.typeavi 
FROM avion a INNER JOIN vol v ON a.nuavi = v.nuavi
GROUP BY a.typeavi
HAVING SUM(v.distance) = (SELECT max(SUM(v1.distance)) FROM vol v1
                          GROUP BY v1.nuavi);

--9
SELECT a.typeavi 
FROM avion a INNER JOIN vol v ON a.nuavi = v.nuavi 
INNER JOIN voyage vo ON v.nuvol = vo.nuvol
JOIN personnes p ON vo.nupers = p.nupers
WHERE p.nom = 'VOGEL' AND p.prenom = 'Jean'
INTERSECT 
SELECT a.typeavi 
FROM avion a INNER JOIN vol v ON a.nuavi = v.nuavi 
INNER JOIN voyage vo ON v.nuvol = vo.nuvol
JOIN personnes p ON vo.nupers = p.nupers
WHERE p.nom = 'PONSONNET' AND p.prenom = 'Pierre';
	
--10
select a.typeavi from personnes p 
inner join voyage v on v.nupers = p.nupers 
inner join vol vo ON v.nuvol = vo.nuvol 
inner join avion a on vo.nuavi = a.nuavi
where p.age = (select max (p1.age) from personnes p1)
and vo.distance = (select max(vo1.distance) from voyage v1 
			inner join vol vo1 ON v1.nuvol = vo1.nuvol 
			where v1.nupers = p.nupers);

					  
--11
SELECT p.nom, p.prenom, SUM(vo.distance) 
FROM personnes p LEFT JOIN voyage v ON v.nupers = p.nupers
LEFT JOIN vol vo ON v.nuvol = vo.nuvol
GROUP BY p.nom, p.prenom;


--12
SELECT p.nom, p.prenom 
FROM personnes p 
WHERE p.age < 60
AND nupers NOT IN (SELECT nupers 
                      FROM voyage v INNER JOIN vol vo ON v.nuvol = vo.nuvol 
                      INNER JOIN avion a ON vo.nuavi = a.nuavi
                      WHERE a.typeavi = 'Falcon');
--ou
SELECT p.nom, p.prenom 
FROM personnes p 
WHERE NOT exists (SELECT null
                      FROM voyage v INNER JOIN vol vo ON v.nuvol = vo.nuvol 
                      INNER JOIN avion a ON vo.nuavi = a.nuavi
                      and p.nupers = v.nupers
                      WHERE a.typeavi = 'Falcon'); 
--ou
SELECT p.nom, p.prenom 
FROM personnes p 
WHERE p.age < 60
minus 
SELECT p1.nom, p1.prenom 
FROM personnes p1 INNER JOIN voyage v ON p1.nupers = v.nupers 
INNER JOIN vol vo ON v.nuvol = vo.nuvol 
INNER JOIN avion a ON vo.nuavi = a.nuavi
and p.nupers = v.nupers
WHERE a.typeavi = 'Falcon';

--13
select a.typeavi, avg(p.age)
from personnes p 
INNER JOIN voyage v ON p.nupers = v.nupers 
INNER JOIN vol vo ON v.nuvol = vo.nuvol 
INNER JOIN avion a ON vo.nuavi = a.nuavi
WHERE vo.distance > 500
group by a.typeavi;


--14
SELECT p.nom, p.prenom 
FROM personnes p INNER JOIN voyage v ON v.nupers = p.nupers 
JOIN vol vo ON v.nuvol = vo.nuvol
WHERE vo.villedep = 'Paris' AND vo.datevol BETWEEN '01/06/2019' AND '30/06/2022'
INTERSECT SELECT nom,prenom 
FROM personnes p INNER JOIN voyage v ON v.nupers = p.nupers 
JOIN vol vo ON v.nuvol = vo.nuvol
WHERE vo.villedep = 'Lyon' AND vo.datevol BETWEEN '01/06/2019' AND '30/06/2022';
