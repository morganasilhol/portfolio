-- Création de la table referentiel_geographique dans le datalake

CREATE TABLE dataimmo_lake.referentiel_geographique ( 
    reg_nom VARCHAR(26),
    dep_nom VARCHAR(43),
    com_code VARCHAR(6),
    com_nom_maj VARCHAR(32),
    com_nom VARCHAR(58),
    dep_code VARCHAR(3),
    reg_code INTEGER,
    last_updated TIMESTAMP DEFAULT NOW()
);

-- Création de la table valeurs_foncieres dans le datalake

CREATE TABLE dataimmo_lake.valeurs_foncieres ( 
    Date_mutation DATE,
    Valeur_fonciere FLOAT,
    No_voie INTEGER,
    B_T_Q VARCHAR(1),
    Type_de_voie VARCHAR(4),
    Voie VARCHAR(50),
    Code_postal INTEGER,
    Commune VARCHAR(30),
    Code_departement VARCHAR(3),
    Code_commune VARCHAR(3),
    Prefixe_de_section INTEGER,
    Section VARCHAR(2),
    No_plan INTEGER,
    No_lot VARCHAR(7),
    Surface_Carrez_du_1er_lot FLOAT,
    Type_local VARCHAR(11),
    Surface_reelle_bati INTEGER,
    Nombre_pieces_principales INTEGER,
    Nature_culture VARCHAR(2),
    Nature_culture_speciale VARCHAR(5),
    Surface_terrain INTEGER,
    last_updated TIMESTAMP DEFAULT NOW()
);

-- Création de la table donnes_recensement dans le datalake

CREATE TABLE dataimmo_lake.donnees_recensement ( 
    CODREG INTEGER,
    CODDEP VARCHAR(3),
    CODCOM VARCHAR(3),
    COM VARCHAR(45),
    PMUN INTEGER,
    PCAP INTEGER,
    PTOT INTEGER,
    last_updated TIMESTAMP DEFAULT NOW()
);

