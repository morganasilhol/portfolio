# 💶 Projet 12 : Détection des faux billets

## 🎯 Contexte du projet
Ce projet a pour objectif de créer un outil capable d'identifier automatiquement les billets de banque contrefaits en se basant sur leurs dimensions géométriques (longueur, hauteur, marges, etc.). 

Le projet s'appuie sur un jeu de données de billets préalablement étiquetés (True/False).

---

## 🛠️ Stack Technique
* **Langage :** Python 3.11.4
* **Analyse & Stats :** `Pandas`, `Numpy`, `Statsmodels` (MANOVA, OLS)
* **Machine Learning :** `Scikit-learn`
    * *Preprocessing :* StandardScaler, Pipeline
    * *Modèles :* Logistic Regression, One-Class SVM, Random Forest, KNN, SVC
    * *Unsupervised :* KMeans, PCA (Analyse en Composantes Principales)
    * *Validation :* GridSearchCV, Cross-validation, CalibratedClassifierCV
* **Sérialisation :** `Joblib`
* **Environnement :** Jupyter Notebook & Scripting Python

---

## 📂 Structure du Projet

### 1. 📔 Notebook d'analyse & Modélisation
Le fichier `notebook_analyse` détaille toute la démarche scientifique :
* **Nettoyage & EDA :** Analyse des variables (dimensions des billets) et traitement des valeurs manquantes.
* **Feature Engineering :** Sélection des variables les plus discriminantes.
* **Modélisation :** * Entraînement et comparaison de modèles de classification.
    * Sélection de deux modèles finaux : **LogReg Pipeline** (Régression Logistique) et **OC-SVM Pipeline** (One-Class SVM).
* **Validation :** Évaluation des performances via les métriques classiques (Accuracy, Recall, Matrice de confusion).

### 2. 🐍 Script de Prédiction
Le fichier `script_detection.py` est l'outil opérationnel. Il permet de :
* Charger les modèles pré-entraînés (`logreg_pipeline` et `oc_svm_pipeline`).
* Traiter un nouveau fichier CSV en entrée contenant les dimensions de billets à tester.
* Exporter les résultats de catégorisation (Vrai/Faux) de manière automatisée.

---

## 🛠️ Installation des Prérequis
Pour installer les bibliothèques nécessaires et garantir le bon fonctionnement du notebook et du script, utilisez le fichier `requirements.txt` fourni :

```bash
pip install -r requirements.txt
```

---

## 🚀 Utilisation du script
Pour tester le script de détection sur vos propres fichiers :

1. Assurez-vous d'avoir installé les dépendances nécessaires.
2. Placez votre fichier csv dans le même dossier que le script, et mettez le nom de votre fichier csv dans le script.
3. Indiquez le nom de votre fichier csv dans le script.