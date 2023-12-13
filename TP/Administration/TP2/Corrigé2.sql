--7
create or replace function vehi_dispo
return varchar2
is
listeVehi varchar2(180);
begin 
	select listagg(libelle, ', ') within group (order by idvehi, typeV desc) into listeVehi 
    from vehicules v 
    where not exists (select null from locations l where l.idvehi = v.idVehi and l.typeV = v.typeV
	and datefin is null);

	return listeVehi;
END;

--8
create or replace function nb_loc
(idV number, typV varchar2)
return number
IS
nb_loca number(3);
BEGIN
Select count(*) into nb_loca
from location 
where idVehi = idV and typeV = typV;
return nb_loca;
END;
/

select nb_loc(1, 'petit') from dual;

--9
create or replace procedure listeVehi
IS
cursor c1 is 
select libelle, count(*) from vehicules v inner join location l on v.idVehi = l.idVehi and v.typeV = l.typeV
group by libelle;

v_libelle varchar2(20);
v_count number(3);

BEGIN
open c1;
loop
fetch c1 into v_libelle, v_count;
exit when c1%notfound;
    DBMS_OUTPUT.PUT_LINE('Véhiculle : ' || v_libelle || ' - nb location : ' || v_count);
end loop;
close c1;
END;
/

exec listeVehi;

--10
create or replace function diff_date
(date_d date, date_f date)
return number
IS
BEGIN
return floor((date_f - date_d));
END;
/

select diff_date ('07/11/2012', trunc(SYSDATE)) from dual;

--11
select to_char(sysdate, 'MM') from dual;

select extract (month of sysdate) from dual;


select listagg(libelle || ' ' || datedeb || ' -> ' || datefin, ', ') within group (order by datedeb)
from locations inner join vehicules on v.idVehi = l.idVehi and v.typeV = l.typeV
group by nom, prenom

--12
create or replace procedure listeloc_client IS
cursor c1 is
select distinct nom, prenom, c.idcli from client c inner join locations l on c.idcli = l.idcli;
v_nom varchar2(20);
v_prenom varchar2(20);
v_id number(3);
v_loc varchar2(200);
BEGIN
open c1;
loop
fetch c1 into v_nom, v_prenom, v_id;
exit when c1%notfound;
select listagg(libelle || ' ' || datedeb || ' -> ' || datefin, ', ') 
within group (order by datedeb)
into v_loc
from locations l inner join vehicules v on v.idVehi = l.idVehi and v.typeV = l.typeV
where idcli = v_id;
DBMS_OUTPUT.PUT_LINE('Nom : ' || v_nom || ' ' ||v_prenom || ' - locs : ' ||v_loc);
end loop;
close c1;
END;
/
