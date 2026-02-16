
-- Pour chaque table : vider puis insertion des donnees depuis le data lake

TRUNCATE TABLE dataimmo_warehouse.regions CASCADE;

-- regions

INSERT INTO dataimmo_warehouse.regions (
    code_region,
    nom_region,
    last_updated
)
SELECT DISTINCT
    reg_code AS code_region,
    reg_nom AS nom_region,
    NOW()
FROM dataimmo_lake.referentiel_geographique;


-- departements

INSERT INTO dataimmo_warehouse.departements (
    code_departement,
    nom_departement,
    code_region,
    last_updated
)
SELECT DISTINCT
    dep_code AS code_departement,
	dep_nom AS nom_departement,
    reg_code AS code_region,
    NOW()
FROM dataimmo_lake.referentiel_geographique;

-- communes

INSERT INTO dataimmo_warehouse.communes (
    id_codedep_codecommune,
    nom_commune_maj,
    nom_commune,
    code_departement,
    last_updated
)
SELECT
    com_code AS id_codedep_codecommune,
    com_nom_maj AS nom_commune_maj,
    com_nom AS nom_commune,
    dep_code AS code_departement,
    NOW()
FROM dataimmo_lake.referentiel_geographique;

-- biens

INSERT INTO dataimmo_warehouse.biens (
    id_bien,
    id_codedep_codecommune,
    no_voie,
    b_t_q,
    type_de_voie,
    voie,
    code_postal,
    surface_carrez,
    type_local,
    surface_reelle_bati,
    nombre_pieces_principales,
    nature_culture,
    nature_culture_speciale,
    surface_terrain,
    last_updated
)
SELECT
    CONCAT(code_departement, code_commune, prefixe_de_section, section, no_plan, no_lot) AS id_bien,
    CONCAT(code_departement, code_commune) AS id_codedep_codecommune,
    no_voie,
    b_t_q,
    type_de_voie,
    voie,
    code_postal,
    surface_Carrez_du_1er_lot AS surface_carrez,
    type_local,
    surface_reelle_bati,
    nombre_pieces_principales,
    nature_culture,
    nature_culture_speciale,
    surface_terrain,
    NOW()
    FROM dataimmo_lake.valeurs_foncieres;

-- ventes

INSERT INTO dataimmo_warehouse.ventes (
    id_bien,
    date_mutation,
    valeur_fonciere,
    last_updated
)
SELECT
    CONCAT(code_departement, code_commune, prefixe_de_section, section, no_plan, no_lot) AS id_bien,
    date_mutation,
    valeur_fonciere,
    NOW()
FROM dataimmo_lake.valeurs_foncieres;

-- recensement

INSERT INTO dataimmo_warehouse.recensement (
    id_codedep_codecommune,
    popu_mun,
    popu_comptee_a_part,
    popu_totale,
    last_updated
)
SELECT
    CONCAT(CODDEP, CODCOM) AS id_codedep_codecommune,
    PMUN AS popu_mun,
    PCAP AS popu_comptee_a_part,
    PMUN + PCAP AS popu_totale,
    NOW()
FROM dataimmo_lake.donnees_recensement;