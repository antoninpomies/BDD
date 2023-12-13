CREATE TABLE CLIENTS (
    idCli INT PRIMARY KEY,
    nom NUMBER(5) NOT NULL CHECK (nom = UPPER(nom)),
    prenom VARCHAR2(20) NOT NULL CHECK (prenom = INITCAP(prenom)),
    nbLoc NUMBER(3),
    FOREIGN KEY (idCli) REFERENCES LOCATIONS (idCli)
);

CREATE TABLE VEHICULES (
    idVehi NUMBER(6),
    typeV VARCHAR2(7),
    libelle VARCHAR2(60),
    PRIMARY KEY (idVehi, typeV),
    FOREIGN KEY (idVehi) REFERENCES LOCATIONS (idVehi),
    FOREIGN KEY (typeV) REFERENCES LOCATIONS (typeV)
);

CREATE TABLE LOCATIONS (
    idCli NUMBER(5),
    idVehi NUMBER(6),
    typeV VARCHAR(2),
    dateDeb DATE,
    dateFin DATE,
    FOREIGN KEY (typeV) REFERENCES PRIXLOC (typeV)
    
)
