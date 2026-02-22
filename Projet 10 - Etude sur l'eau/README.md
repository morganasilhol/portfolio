# 🌍 Projet 10 : Analyse de l'Accès à l'Eau Potable (Vision Humanitaire)

## 🎯 Objectif du Projet
Ce projet a été réalisé pour accompagner l'ONG DWFA (Drinking Water for All) dans le pilotage de ses interventions. L'objectif est de fournir un tableau de bord permettant d'identifier les pays qui rencontrent des difficultés d'accès à l'eau potable, et d'identifier ceux pour lesquels l'organisme doit concentrer ses efforts.

Plus précisément ce dashboard permet de :
* **Suivre et analyser** les taux d'accès à l'eau aux échelles mondiale, régionale et nationale.
* **Identifier les pays vulnérables** nécessitant une intervention prioritaire.
* **Corréler l'accès à l'eau** avec des facteurs contextuels (urbanisation, stabilité politique, taux de mortalité).

---

## 🛠️ Stack Technique
* **Data Warehouse :** Google BigQuery.
* **Transformation & Qualité (ELT) :** dbt (Data Build Tool).
* **Visualisation :** Power BI.
* **Données :** Fichiers CSV enrichis (Sources : OMS, Banque Mondiale).

---

## 🏗️ Structure du Dépôt
* **📁 data/** : Sources de données CSV utilisées pour l'intégration.
* **📁 models/** : Fichiers SQL dbt structurant la donnée.
* **📁 tests/** : Tests de qualité des données (intégrité, unicité, non-nullité).
* **📁 macros/** : Fonctions SQL réutilisables pour automatiser les transformations dbt.
* **📁 dashboard/** : Fichier `.pbip` (Power BI) contenant le rapport final.

---

## ⚙️ Architecture & Pipeline de Données (ELT)

Le projet suit une logique de transformation robuste au sein de **BigQuery** via **dbt**, structurée en trois couches distinctes :

1.  **Ingestion (Seeds)** : Intégration des données CSV brutes (données sources et extensions temporelles) directement dans BigQuery sans transformation préalable via la fonction `dbt seed`.
2.  **Transformation & Jointures (Couche Intermediate)** : 
    * Création des tables intermédiaires (`tf_table`, `vf_table`).
    * Exécution des **unions** pour l'extension temporelle et des **jointures**.
3.  **Modélisation en Étoile (Couche Marts)** :
    * Structuration finale en tables de faits (`FAIT_table`) et tables de dimensions (`DIM_table`).
    * Application des dernières transformations métiers pour optimiser les performances et la clarté du modèle de données dans **Power BI**.
4.  **Qualité & Gouvernance** : Utilisation de tests dbt pour valider la cohérence des indicateurs avant l'exposition dans le dashboard.

---

## 📊 Dashboard Power BI : Exploration & Analyse
Le dashboard est structuré en 4 onglets stratégiques pour répondre aux besoins des utilisateurs :

* **🌍 World** : Vue macroscopique permettant de suivre l'évolution des indicateurs à l'échelle mondiale et la corrélation de l'accès à l'eau avec des facteurs contextuels.
* **📍 Region** : Analyse comparative entre les sous-régions pour mettre en évidence les zones vulnérables.
* **🏳️ Country** : Focus détaillé par nation.
* **📖 Glossary** : Espace dédié à la définition des indicateurs pour garantir une interprétation fiable des données par les décideurs.

---

## 🚀 Comment consulter le projet ?
1.  Explorez les transformations SQL dans le dossier `models/`.
2.  Consultez le rapport présent dans `dashboard/`.