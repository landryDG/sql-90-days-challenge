# 📅 DAY 2 — Analyse & raisonnement

---

## 🎯 Objectif

Approfondir la compréhension de `GROUP BY`, `HAVING` et des logiques d’agrégation.

---

## 🔍 Compréhension des données

Même structure que Day 1 :

- clients → dimension (région)
- demandes → performance (temps)
- ventes → business (CA)

👉 Focus aujourd’hui : agrégation et comparaison

---

## 🔹 Analyse technique & interprétation

### 1. Temps moyen global

🎯 Donne une référence globale pour comparer les performances.

---

### 2. Temps moyen par région

🎯 Permet de passer d’une analyse globale à une analyse locale.

---

### 3. Régions avec temps > 30 jours

🎯 Identifie les régions lentes selon un seuil fixe.

---

### 4. Régions > moyenne globale

🎯 Permet une analyse relative (plus pertinente qu’un seuil arbitraire).

👉 Ici, utilisation de `HAVING` car on filtre une agrégation.

---

### 5. CA par région

🎯 Permet d’identifier les zones à fort impact business.

---

## 🔹 Analyse métier

### 🎯 Problématique

Identifier les régions problématiques :

- Temps moyen > moyenne globale  
- CA > 300€  

---

### 🧠 Approche

1. Calculer les métriques par région  
2. Comparer au global  
3. Appliquer des conditions business  
4. Prioriser  

---

### 📊 Insight

Les régions problématiques sont celles qui combinent :

- une inefficacité opérationnelle (temps élevé)
- un fort impact business (CA élevé)

👉 Ce sont les priorités d’action.

---

## 🔹 Réflexion

- Meilleure compréhension de `GROUP BY`
- `HAVING` utilisé pour filtrer des agrégations
- Différence claire entre moyenne globale vs locale
- Difficulté : comprendre quand utiliser une sous-requête
- Compréhension du lien entre logique SQL et logique business


