create or replace trigger nb_loc
after insert or delete on location
for each row
begin
if inserting
then
	update client set nbloc = nvl(nbloc, 0) +1 where idCli = :new.idcli;
end if;
if deleting
then
	update client set nbloc = nbloc -1 where idCli = :old.idcli;
end if;
end;
/

create or replace trigger init_cli
before insert on client
for each row
begin
	:new.nbloc := 0;
end;
/
