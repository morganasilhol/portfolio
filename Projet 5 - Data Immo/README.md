# Projet DataImmo : Architecture Data Pipeline (SQL)

Ce projet présente la mise en place d'une infrastructure de données complète sur PostgreSQL. L'objectif est de transformer des données immobilières et démographiques brutes en un entrepôt de données (Data Warehouse) structuré pour l'analyse.

## Structure du Projet

* **data/** : Contient les sources de données brutes au format CSV (Valeurs foncières, Recensement, Référentiel Géo).
* **scripts_sql/dataimmo_lake/** : Scripts de création et d'ingestion des données dans la zone de "Staging" (Lake).
* **scripts_sql/dataimmo_warehouse/** : Scripts de modélisation en étoile et de transformation finale pour le "Reporting" (Warehouse).

## Installation et Configuration

### 1. Pré-requis
* PostgreSQL installé localement.
* Une base de données nommée "dataimmo".

### 2. Adaptation des chemins (Action requise)
PostgreSQL nécessite des chemins absolus pour importer les fichiers. Avant d'exécuter les scripts, ouvrez les fichiers d'insertion et modifiez la ligne **FROM** pour qu'elle corresponde à l'emplacement du dossier `/data` sur votre ordinateur.

**Fichiers à modifier :**
* `scripts_sql/dataimmo_lake/insert_dataimmo_lake.sql`

**Exemple de modification :**
```sql
COPY temp_valeurs_foncieres 
FROM 'C:/Votre_Chemin/portfolio/data/valeurs-foncieres.csv' 
DELIMITER ',' CSV HEADER;