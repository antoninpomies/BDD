CREATE OR REPLACE TRIGGER update_recap
AFTER INSERT ON enseigne
FOR EACH ROW
DECLARE
    v_numprof NUMBER(3);
    v_nbh NUMBER(3);
BEGIN
    -- Récupérer le numéro du professeur et le nombre d'heures ajoutées
    v_numprof := :NEW.numprof;
    v_nbh := :NEW.nbh;

    -- Mettre à jour le temps total dans la table "recap"
    UPDATE recap
    SET totalh = NVL(totalh, 0) + v_nbh
    WHERE numprof = v_numprof;

    -- Mettre à jour le temps total du professeur dans la table "professeur" (si existant)
    UPDATE professeur
    SET ttal = NVL(ttal, 0) + v_nbh
    WHERE numprof = v_numprof;
END;
/
