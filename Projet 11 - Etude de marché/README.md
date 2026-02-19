# 🐔 Projet 11 : Étude de Marché à l'International - Export de Poulet Bio

## 🎯 Objectif du Projet
L'objectif est d'identifier les marchés étrangers les plus propices à l'exportation de poulet français certifié biologique. Ce projet combine une analyse macro-économique (PESTEL) et des techniques de Data Science pour segmenter les pays et isoler un cluster cible.

## 📊 Sources de Données
Le projet repose sur des variables PESTEL collectées depuis trois sources :
* **[FAO](http://fao.org)** : Données sur la sécurité alimentaire et la production animale.
* **[World Bank](http://databank.worldbank.org)** : Indicateurs économiques et démographiques (PIB, Croissance).
* **[CEPII](http://cepii.fr)** : Données géographiques et distances entre pays pour évaluer les coûts logistiques.

## 🛠️ Stack Technique
* **Langage :** Python
* **Nettoyage & Ingestion :** `Pandas`, `PyJanitor`.
* **Analyse de données :** `Scikit-learn` (PCA, K-means), `SciPy` (Clustering hiérarchique).
* **Visualisation :** `Seaborn`, `Matplotlib`.

---

## 📂 Organisation du Projet

### 1️⃣ Préparation & Analyse PESTEL (`notebook_exploration.ipynb`)
Construction d'un dataset unique en croisant les varnotebook_explorationiables du modèle **PESTEL** :
* **Politique/Économique :** Stabilité, régulation, PIB, variation du taux de change.
* **Social/Démographique :** Population totale, croissance, disponibilité alimentaire.
* **Environnemental :** Production (prix) et production (quantité).
* **Technique/Logistique :** Distance avec la France.

### 2️⃣ Analyse Multivariée & Clustering (`notebook_analyse.ipynb`)
* **Analyse en Composantes Principales (ACP) :** Réduction du nombre de variables pour comprendre.
* **K-Means Clustering :** Partitionnement des pays en clusters. 
* **Classification Ascendante Hiérarchique (CAH) :** Création d'un **dendrogramme** pour identifier le nombre naturel de groupes de pays.