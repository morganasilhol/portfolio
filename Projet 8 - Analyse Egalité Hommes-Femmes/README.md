# 📊 Automatisation du Rapport Égalité Femmes/Hommes

## 🎯 Objectif du Projet
Ce projet vise à automatiser la chaîne de traitement des données RH pour produire les indicateurs de l'égalité professionnelle entre les femmes et les hommes. L'enjeu est de transformer des données brutes en un rapport visuel exploitable, tout en garantissant la confidentialité des collaborateurs.

## 🛠️ Stack Technique
* **ETL :** KNIME Analytics Platform
* **Objectif Visualisation :** Tableau
* **Données :** Fichiers Excel (Sources RH)

## ⚙️ Architecture du Workflow KNIME
Le workflow est structuré en 4 grandes étapes clés :

1.  **Ingestion & Fusion :** Lecture des sources Excel et fusion des données.
2.  **Anonymisation (RGPD) :** Anonymisation des données identifiables (ID, dates de naissances) .
3.  **Calcul des Indicateurs :** 
    * Calcul rémunération totale
    * Groupes temps partiel/temps complet
    * Groupes ancienneté
4.  **Export & Visuels :** Génération d'un fichiers prêt pour Tableau et création de graphiques de contrôle directement dans KNIME.

## 📁 Structure du Dépôt
* **`KNIME_project`** : Le dossier racine de mon projet ouvert.
    * **`data/`** : Contient les sources Excel.
    * **`workflow.knime`** : Le fichier de configuration principal.
    * **`Node folders/`** : Les dossiers techniques pour chaque étape (Nettoyage, Anonymisation, etc.).

## 🚀 Comment utiliser ce projet
1. Téléchargez le dossier.
2. Ouvrez KNIME et importez le dossier via **File > Import KNIME Workflow**.
3. Assurez-vous que les fichiers dans `/data` sont liés (chemins relatifs configurés).
4. Exécutez le workflow pour voir la transformation en temps réel.