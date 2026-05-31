# 📅 DAY 6 — Analyse & raisonnement

---

## 🎯 Objectif

Comprendre :

- l'analyse temporelle
- l'utilisation de `DATE_TRUNC`
- l'évolution du chiffre d'affaires dans le temps
- l'importance du tri chronologique

---

## 🔍 Compréhension des données

Aujourd'hui, l'objectif n'est plus seulement de mesurer une performance.

L'objectif est de comprendre comment cette performance évolue dans le temps.

👉 Une analyse temporelle permet d'identifier :

- les périodes fortes
- les périodes faibles
- les tendances d'activité

---

## 🔹 Analyse technique & interprétation

### 1. Chiffre d'affaires total global

🎯 Permet de connaître le revenu total généré.

Il sert de référence générale pour l'analyse.

---

### 2. Chiffre d'affaires par mois

🎯 Permet de suivre l'évolution de l'activité.

L'utilisation de `DATE_TRUNC()` regroupe toutes les ventes d'un même mois.

---

### 3. Chiffre d'affaires par mois trié chronologiquement

🎯 Facilite la lecture de l'évolution temporelle.

Sans tri chronologique, l'analyse des tendances devient difficile.

---

### 4. Nombre de ventes par mois

🎯 Permet de distinguer :

- une hausse du nombre de ventes
- une hausse du montant moyen des ventes

Ces deux phénomènes peuvent produire un même CA.

---

### 5. Chiffre d'affaires mensuel par région

🎯 Permet d'analyser les performances régionales dans le temps.

Cette analyse aide à identifier :

- les régions en croissance
- les régions en ralentissement

---

## 🔹 Analyse métier

### 🎯 Problématique

Le directeur souhaite savoir si l'activité accélère ou ralentit.

---

### 🧠 Approche

1. Calculer le chiffre d'affaires mensuel
2. Identifier les meilleurs mois
3. Identifier les mois les plus faibles
4. Comparer les performances

---

### 📊 Insight

Le chiffre d'affaires le plus faible a été enregistré en février 2026 avec 325 €, 
tandis que le plus élevé a été observé en mars 2026 avec 1 040 €.
Cette hausse significative suggère une accélération de l'activité entre les deux périodes.

---

## 🔹 Réflexion

- Compréhension de l'utilité de `DATE_TRUNC`
- Importance de l'analyse temporelle
- Importance du tri chronologique
- Différence entre indicateur global et évolution dans le temps

---

## 🧠 Bilan

Aujourd'hui, j'ai appris à :

- analyser les données dans le temps
- regrouper les données par période
- suivre l'évolution du chiffre d'affaires
- identifier les variations d'activité
- utiliser `DATE_TRUNC()` pour construire une analyse temporelle
