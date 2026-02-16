-- Creation d'une table temporaire pour accueillir toutes les donnees brutes de la table csv le temps de les transformer

CREATE TEMP TABLE temp_donnees_recensement (
    CODREG TEXT,
    CODDEP TEXT,
    CODARR TEXT,
    CODCAN TEXT,
    CODCOM TEXT,
    COM TEXT,
    PMUN TEXT,
    PCAP TEXT,
    PTOT TEXT
);

-- Importer toutes les données du csv dans la table temporaire

COPY temp_donnees_recensement
FROM 'C:/Open_Classrooms/data_immo/donnees_communes.csv'
DELIMITER ',' 
CSV HEADER;

-- Vider la table existante avant de charger de nouvelles données
TRUNCATE TABLE dataimmo_lake.donnees_recensement;

-- puis insertion dans la table du datalake

INSERT INTO dataimmo_lake.donnees_recensement (
    CODREG,
    CODDEP,
    CODCOM,
    COM,
    PMUN,
    PCAP,
    PTOT,
    last_updated
)
SELECT -- on sélectionne chaque colonne de la table temporaire qu'on souhaite ajouter dans la table finale, en faisant les transformations nécessaires
    CAST(CODREG AS INTEGER),
    LPAD(CODDEP, 2, '0'),
    LPAD(CODCOM, 3, '0'),
    COM,
    CAST(CASE WHEN PMUN = 'nan' OR PMUN = '' THEN '0' ELSE PMUN END AS INTEGER),
    CAST(CASE WHEN PCAP = 'nan' OR PCAP = '' THEN '0' ELSE PCAP END AS INTEGER),
    CAST(CASE WHEN PTOT = 'nan' OR PTOT = '' THEN '0' ELSE PTOT END AS INTEGER),
    NOW() -- mettre à jour la date/heure actuelle à chaque insertion
FROM temp_donnees_recensement;

-- Creation d'une table temporaire pour accueillir toutes les donnees brutes de la table csv le temps de les transformer

CREATE TEMP TABLE temp_referentiel_geographique (
    regrgp_nom TEXT,
    reg_nom TEXT,
    reg_nom_old TEXT,
    aca_nom TEXT,
    dep_nom TEXT,
    com_code TEXT,
    com_code1 TEXT,
    com_code2 TEXT,
    com_id TEXT,
    com_nom_maj_court TEXT,
    com_nom_maj TEXT,
    com_nom TEXT,
    uu_code TEXT,
    uu_id TEXT,
    uucr_id TEXT,
    uucr_nom TEXT,
    ze_id TEXT,
    dep_code TEXT,
    dep_id TEXT,
    dep_nom_num TEXT,
    dep_num_nom TEXT,
    aca_code TEXT,
    aca_id TEXT,
    reg_code TEXT,
    reg_id TEXT,
    reg_code_old TEXT,
    reg_id_old TEXT,
    fd_id TEXT,
    fr_id TEXT,
    fe_id TEXT,
    uu_id_99 TEXT,
    au_code TEXT,
    au_id TEXT,
    auc_id TEXT,
    auc_nom TEXT,
    uu_id_10 TEXT,
    geolocalisation TEXT
);

-- on importe toutes les données du csv dans la table temporaire

COPY temp_referentiel_geographique
FROM 'C:/Open_Classrooms/data_immo/fr-esr-referentiel-geographique.csv'
DELIMITER ',' 
CSV HEADER;

-- Vider la table existante avant de charger de nouvelles données
TRUNCATE TABLE dataimmo_lake.referentiel_geographique;

-- puis insertion dans la table du datalake

INSERT INTO dataimmo_lake.referentiel_geographique (
    reg_nom,
    dep_nom,
    com_code,
    com_nom_maj,
    com_nom,
    dep_code,
    reg_code,
    last_updated
)
SELECT -- on sélectionne chaque colonne de la table temporaire qu'on souhaite ajouter dans la table finale, en faisant les transformations nécessaires
    reg_nom,
    dep_nom,
    SUBSTRING(com_id FROM 2) AS com_code,
    com_nom_maj,
    com_nom,
    SUBSTRING(dep_id FROM 2) AS dep_code,
    CAST(reg_code AS INTEGER),
    NOW()
FROM temp_referentiel_geographique;


-- Creation d'une table temporaire pour accueillir toutes les donnees brutes de la table csv le temps de les transformer

CREATE TEMP TABLE temp_valeurs_foncieres (
    Code_service_CH TEXT,
    Reference_document TEXT,
    "1_Articles_CGI" TEXT, -- on met des guillemets car postgree n'aime pas les colonnes commençant par un numero
    "2_Articles_CGI" TEXT,
    "3_Articles_CGI" TEXT,
    "4_Articles_CGI" TEXT,
    "5_Articles_CGI" TEXT,
    No_disposition TEXT,
    Date_mutation DATE,
    Nature_mutation TEXT,
    Valeur_fonciere TEXT,
    No_voie TEXT,
    "B/T/Q" TEXT, -- guillemets car postgree n'aime pas les caractères spéciaux
    Code_type_de_voie TEXT,
    Type_de_voie TEXT,
    Code_voie TEXT,
    Voie TEXT,
    Code_ID_commune TEXT,
    Code_postal TEXT,
    Commune TEXT,
    Code_departement TEXT,
    Code_commune TEXT,
    Prefixe_de_section TEXT,
    Section TEXT,
    No_plan TEXT,
    No_Volume TEXT,
    "1er_lot" TEXT,
    Surface_Carrez_du_1er_lot TEXT,
    "2eme_lot" TEXT,
    Surface_Carrez_du_2eme_lot TEXT,
    "3eme_lot" TEXT,
    Surface_Carrez_du_3eme_lot TEXT,
    "4eme_lot" TEXT,
    Surface_Carrez_du_4eme_lot TEXT,
    "5eme_lot" TEXT,
    Surface_Carrez_du_5eme_lot TEXT,
    Nombre_de_lots TEXT,
    Code_type_local TEXT,
    Type_local TEXT,
    Identifiant_local TEXT,
    Surface_reelle_bati TEXT,
    Nombre_pieces_principales TEXT,
    Nature_culture TEXT,
    Nature_culture_speciale TEXT,
    Surface_terrain TEXT,
    Nom_de_lacquereur TEXT
);

-- on importe toutes les données du csv dans la table temporaire

COPY temp_valeurs_foncieres
FROM 'C:/Open_Classrooms/data_immo/valeurs-foncieres.csv'
DELIMITER ',' 
CSV HEADER;

-- Vider la table existante avant de charger de nouvelles données
TRUNCATE TABLE dataimmo_lake.valeurs_foncieres;

-- puis insertion dans la table du datalake

INSERT INTO dataimmo_lake.valeurs_foncieres (
    Date_mutation,
    Valeur_fonciere,
    No_voie,
    B_T_Q,
    Type_de_voie,
    Voie,
    Code_postal,
    Commune,
    Code_departement,
    Code_commune,
    Prefixe_de_section,
    Section,
    No_plan,
    No_lot,
    Surface_Carrez_du_1er_lot,
    Type_local,
    Surface_reelle_bati,
    Nombre_pieces_principales,
    Nature_culture,
    Nature_culture_speciale,
    Surface_terrain,
    last_updated
)
SELECT -- on sélectionne chaque colonne de la table temporaire qu'on souhaite ajouter dans la table finale, en faisant les transformations nécessaires
    Date_mutation,
    CAST(REPLACE(Valeur_fonciere, ',', '.') AS FLOAT), -- transformation de la decimale
    CAST(CASE WHEN No_voie = 'nan' OR No_voie = '' THEN '0' ELSE No_voie END AS INTEGER), -- transformation des vides en 0
    REPLACE("B/T/Q", '/', '_'), -- transformation de B/T/Q en B_T_Q
    Type_de_voie,
    Voie,
    CAST(CASE WHEN Code_postal = 'nan' OR Code_postal = '' THEN '0' ELSE Code_postal END AS INTEGER),
    Commune,
    LPAD(Code_departement, 2, '0'),
    LPAD(Code_commune, 3, '0'),
    CAST(CASE WHEN Prefixe_de_section = 'nan' OR Prefixe_de_section = '' THEN '0' ELSE Prefixe_de_section END AS INTEGER),
    Section,
    CAST(CASE WHEN No_plan = 'nan' OR No_plan = '' THEN '0' ELSE No_plan END AS INTEGER),
    "1er_lot" AS No_lot,
    CAST(REPLACE(Surface_Carrez_du_1er_lot, ',', '.') AS FLOAT),
    Type_local,
    CAST(CASE WHEN Surface_reelle_bati = 'nan' OR Surface_reelle_bati = '' THEN '0' ELSE Surface_reelle_bati END AS INTEGER),
    CAST(CASE WHEN Nombre_pieces_principales = 'nan' OR Nombre_pieces_principales = '' THEN '0' ELSE Nombre_pieces_principales END AS INTEGER),
    Nature_culture,
    Nature_culture_speciale,
    CAST(REPLACE(Surface_terrain, ',', '.') AS FLOAT),
    NOW()
FROM temp_valeurs_foncieres;