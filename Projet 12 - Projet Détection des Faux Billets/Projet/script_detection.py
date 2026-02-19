import pandas as pd
import joblib
from pathlib import Path


BASE_DIR = Path(__file__).resolve().parent

# importer modèle (exporté avec joblib dans le notebook)

model = joblib.load(BASE_DIR / "logreg_pipeline.pkl")
oc_svm = joblib.load(BASE_DIR / "oc_svm_pipeline.pkl")

# Import données à passer dans l'algorithme

df = pd.read_csv(BASE_DIR / "P12 billets_test.csv", sep=",")

# Ajout features + sécurisation colonnes

height_mean = (df['height_left'] + df['height_right']) / 2

df['height_diff'] = abs(df['height_right'] - df['height_left'])

cols_model = [
    'diagonal', 'height_left', 'height_right', 'margin_low', 
    'margin_up', 'length', 'height_diff'
]

# Prédiction

X_prod = df[cols_model]

predictions = model.predict(X_prod)
probas = model.predict_proba(X_prod)[:, 1]

df["is_genuine"] = predictions
df["proba_is_true"] = (probas * 100).round(2)
df["outliers_alert"] = oc_svm.predict(X_prod)

df.to_csv(BASE_DIR / "résultats.csv", index=False, sep=";")
print("Fichier résultats.csv créé dans :", BASE_DIR)