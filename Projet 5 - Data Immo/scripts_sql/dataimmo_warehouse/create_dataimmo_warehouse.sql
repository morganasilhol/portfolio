-- Création de la table regions

CREATE TABLE dataimmo_warehouse.regions (
                code_region INTEGER PRIMARY KEY,
                nom_region VARCHAR(26),
                last_updated TIMESTAMP DEFAULT NOW()
);


-- Création de la table departements

CREATE TABLE dataimmo_warehouse.departements (
                code_departement VARCHAR(3) PRIMARY KEY,
                nom_departement VARCHAR(43),
                code_region INTEGER,
				last_updated TIMESTAMP DEFAULT NOW(),
                CONSTRAINT regions_departements_fk FOREIGN KEY (code_region)
                REFERENCES dataimmo_warehouse.regions (code_region)
);

-- Création de la table communes

CREATE TABLE dataimmo_warehouse.communes (
                id_codedep_codecommune VARCHAR(255) PRIMARY KEY,
                nom_commune_maj VARCHAR(32),
                nom_commune VARCHAR(58),
                code_departement VARCHAR(3),
                last_updated TIMESTAMP DEFAULT NOW(),
                CONSTRAINT departements_communes_fk FOREIGN KEY (code_departement)
                REFERENCES dataimmo_warehouse.departements (code_departement)
);

-- Création de la table biens

CREATE TABLE dataimmo_warehouse.biens (
                id_bien VARCHAR(255) PRIMARY KEY,
                id_codedep_codecommune VARCHAR(255) NOT NULL,
                no_voie INTEGER,
                b_t_q VARCHAR(1),
                type_de_voie VARCHAR(4),
                voie VARCHAR(50),
                code_postal INTEGER,
                surface_carrez FLOAT,
                type_local VARCHAR(11),
                surface_reelle_bati INTEGER,
                nombre_pieces_principales INTEGER,
                nature_culture VARCHAR(2),
                nature_culture_speciale VARCHAR(5),
                surface_terrain INTEGER,
                last_updated TIMESTAMP DEFAULT NOW(),
                CONSTRAINT communes_biens_fk FOREIGN KEY (id_codedep_codecommune) 
                REFERENCES dataimmo_warehouse.communes (id_codedep_codecommune)
);


-- Création de la table recensement

CREATE TABLE dataimmo_warehouse.recensement (
                id_codedep_codecommune VARCHAR(255) PRIMARY KEY,
                popu_mun INTEGER,
                popu_comptee_a_part INTEGER,
                popu_totale INTEGER,
                last_updated TIMESTAMP DEFAULT NOW(),
                CONSTRAINT recensement_communes_fk FOREIGN KEY (id_codedep_codecommune) 
                REFERENCES dataimmo_warehouse.communes (id_codedep_codecommune)
);


CREATE TABLE dataimmo_warehouse.ventes (
                id_vente SERIAL PRIMARY KEY,
                id_bien VARCHAR(255) NOT NULL,
                date_mutation DATE,
                valeur_fonciere FLOAT,
                last_updated TIMESTAMP DEFAULT NOW(),
                CONSTRAINT biens_ventes_fk FOREIGN KEY (id_bien) 
                REFERENCES dataimmo_warehouse.biens (id_bien)
);