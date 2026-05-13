# 📅 DAY 4 — Analyse & raisonnement

---

## 🎯 Objectif

Comprendre :

- moyenne globale vs moyenne locale
- sous-requêtes
- benchmark analytique
- structuration logique des requêtes

---

## 🔍 Compréhension des données

Aujourd’hui, focus sur la comparaison des performances.

👉 Une métrique seule n’a pas de sens sans point de référence.

Exemple :
- plus lent que quoi ?
- plus rentable que qui ?
- au-dessus de quelle moyenne ?

---

## 🔹 Analyse technique & interprétation

### 1. Temps moyen global

🎯 Sert de benchmark global.

👉 Permet de comparer les régions à une référence commune.

---

### 2. Temps moyen par région

🎯 Permet une analyse locale.

👉 Chaque région possède sa propre performance moyenne.

---

### 3. Régions au-dessus de la moyenne globale

🎯 Identifie les régions sous-performantes.

👉 Utilisation d’une sous-requête dans `HAVING`.

⚠️ La moyenne doit être calculée avant le filtrage.

---

### 4. CA moyen par client

🎯 Permet de comprendre la valeur moyenne des clients.

👉 Nécessite une sous-requête car on agrège d’abord par client avant de calculer une moyenne globale.

---

### 5. Clients au-dessus du CA moyen

🎯 Permet d’identifier les clients les plus rentables.

👉 Comparaison entre :
- performance individuelle
- benchmark global

---

## 🔹 Analyse métier

### 🎯 Problématique

Identifier les régions à risque :

- plus lentes que la moyenne
- générant un CA important

---

### 🧠 Approche

1. Calculer les performances par région  
2. Comparer à la moyenne globale  
3. Ajouter une condition business sur le CA  
4. Prioriser les régions critiques  

---

### 📊 Insight

Les régions prioritaires sont celles qui combinent :

- faible performance opérationnelle
- fort impact business

👉 Une région lente avec un CA élevé représente un risque stratégique important.

---

## 🔹 Réflexion

- Compréhension des sous-requêtes
- Différence entre benchmark global et métrique locale
- Difficulté : choisir le bon niveau d’agrégation
- Compréhension de l’ordre logique SQL
- `HAVING` utilisé après agrégation

---

## 🧠 Bilan

- Une métrique doit toujours être comparée à un benchmark
- Les sous-requêtes permettent des comparaisons dynamiques
- Comprendre la logique SQL est aussi important que le résultat
