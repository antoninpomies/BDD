create or replace trigger MAJ_HORAIRE_PROF
AFTER INSERT OR UPDATE OR DELETE ON ENSEIGNE
FOR EACH ROW
DECLARE
	nb_recap NUMBER(3);
	nb_recap_2 NUMBER(3);
BEGIN
	IF INSERTING
	THEN
		update PROFESSEUR p set Ttal = Ttal + :new.nbh
		where p.numprof = :new.numprof;
		
		select count(*) into nb_recap from recap r where r.numProf = :new.numprof and r.promo = :new.promo;
		IF(nb_recap = 0)
		THEN
			INSERT INTO RECAP values (:new.numprof, :new.promo, :new.nbh);
		ELSE 
			update RECAP r set Totalh = Totalh + :new.nbh
			where r.numprof = :new.numprof and r.promo = :new.promo;
		END IF;	
	ELSIF UPDATING
    THEN
		update PROFESSEUR p set Ttal = Ttal + :new.nbh - :old.nbh
		where p.numprof = :new.numprof;
		
		update RECAP r set Totalh = Totalh + :new.nbh - :old.nbh
		where r.numprof = :new.numprof and r.promo = :new.promo;
	ELSIF DELETING 
	THEN
		update PROFESSEUR p set Ttal = Ttal - :old.nbh
		where p.numprof = :old.numprof;
		
        select Totalh into nb_recap_2 from recap where 
		numprof = :old.numprof and promo = :old.promo;
        
        IF(nb_recap_2 <> :old.nbh)
        THEN
            update RECAP r set Totalh = Totalh - :old.nbh
            where r.numprof = :old.numprof and r.promo = :old.promo;
        ELSE
            DELETE FROM RECAP where numprof = :old.numprof and promo = :old.promo;
        END IF;
	END IF;
END;
/
