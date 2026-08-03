# 📅 DAY 7 — Analyse & raisonnement (dynamique business)

---

## 🎯 Objectif

Comprendre :

- variation absolue
- variation relative (%)
- comparaison mois vs mois précédent
- logique de croissance business
- introduction aux window functions (`LAG`)

---

## 🔍 Compréhension des données

Aujourd’hui on ne regarde plus les chiffres isolés.

👉 On analyse **l’évolution dans le temps**.

Un bon analyste ne dit pas :
- “le CA est 10 000”

Il dit :
- “le CA augmente de 15% par rapport au mois dernier”

---

## 🔹 Analyse technique & interprétation

### 1. CA par mois

🎯 Base de toute analyse temporelle.

Permet d’avoir la structure du temps.

---

### 2. CA + mois précédent

🎯 Introduction de `LAG`.

👉 Permet de comparer chaque mois à son passé.

---

### 3. Variation absolue

🎯 Mesure brute de la différence.

👉 Utile pour voir l’ampleur réelle du changement.

---

### 4. Variation relative (%)

🎯 Mesure la croissance réelle.

👉 Plus pertinente car indépendante de l’échelle.

⚠️ Gestion des cas nuls obligatoire.

---

### 5. Classement des mois

🎯 Permet d’identifier les meilleures performances.

👉 Vision “business ranking”.

---

## 🔹 Analyse métier

### 🎯 Problématique

Le directeur veut comprendre la dynamique du business.

---

### 🧠 Approche

1. Calcul du CA mensuel  
2. Comparaison avec mois précédent  
3. Analyse des variations  
4. Identification des tendances  

---

### 📊 Insight

Le chiffre d’affaires baisse légèrement en février puis connaît une très forte hausse en mars (+220 %). 
Mars est donc le mois de plus forte croissance sur la période analysée.

---

## 🔹 Réflexion

- Variation absolue vs relative -> C’est l’écart brut entre deux valeurs.
- Importance du pourcentage -> C’est l’écart rapporté à la base initiale.
- Utilité de `LAG` -> LAG sert récupérer la valeur précédente
- Limites des sous-requêtes -> les sous-requetes on plusieur limites; Code lourd, On perd la logique métier, Risque d’erreurs, Maintenance compliquée 
- Lecture dynamique des données -> sert a comprendre la tendance, pas juste les valeurs 

---

## 🧠 Bilan

Aujourd’hui j’ai appris à :

- analyser une évolution business
- comparer des périodes
- détecter des tendances
- utiliser `LAG` pour simplifier les comparaisons
- penser en dynamique et non en statique
