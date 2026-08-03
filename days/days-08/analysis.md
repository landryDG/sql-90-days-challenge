📅 DAY 8 — Analyse & raisonnement

---

🎯 Objectif

Découvrir les Window Functions afin de classer les données et suivre leur évolution dans le temps 
sans perdre le niveau de détail.

---

# 🔹 Analyse technique & interprétation

## 1. Classement des clients avec RANK()


Permet de classer les clients selon leur chiffre d'affaires total.
Les clients ayant le même chiffre d'affaires obtiennent le même rang, et le rang suivant est ignoré.

---

## 2. Classement avec DENSE_RANK()

Classe également les clients par chiffre d'affaires.
Contrairement à RANK(), aucun rang n'est sauté lorsqu'il y a des égalités.

---

## 3. Classement avec ROW_NUMBER()


Attribue un numéro unique à chaque client.
Même si deux clients possèdent exactement le même chiffre d'affaires, chacun reçoit un numéro différent.

---

## 4. Chiffre d'affaires cumulatif par mois


Permet de suivre la croissance progressive du chiffre d'affaires.
Cette approche met en évidence la tendance globale de l'activité au fil du temps.

---

## 5. Chiffre d'affaires cumulatif par région


Permet d'observer l'évolution du chiffre d'affaires indépendamment pour chaque région.
L'utilisation de PARTITION BY réinitialise automatiquement le cumul pour chaque région.

---

# 🔹 Analyse métier

## 🎯 Problématique

Le directeur souhaite identifier :

- les meilleurs clients ;
- les régions les plus performantes ;
- l'évolution du chiffre d'affaires dans le temps.

---

## Approche

- Calcul du chiffre d'affaires par client.
- Classement des clients avec les Window Functions.
- Calcul du chiffre d'affaires mensuel.
- Calcul du chiffre d'affaires cumulatif.
- Analyse région par région grâce à PARTITION BY.

---

 📊 Insight

Paris est le principal moteur du chiffre d'affaires, avec un CA cumulé de 820 €, largement devant Bordeaux (400 €), 
Lyon (370 €) et Marseille (125 €). Elle affiche également la plus forte progression (+280), confirmant une croissance soutenue. 
À l'inverse, Lyon présente 
une évolution plus volatile, tandis que les données de Bordeaux et Marseille sont insuffisantes pour évaluer leur dynamique.


 🔹 Réflexion

### GROUP BY vs OVER()

- GROUP BY regroupe les lignes et réduit le nombre de résultats.
- OVER() Conserve chaque ligne et calcule un indicateur analytique sans regrouper les données.


### RANK() vs DENSE_RANK() vs ROW_NUMBER()

- RANK() saute un rang après une égalité.
- DENSE_RANK() ne saute aucun rang.
- ROW_NUMBER() attribue un numéro unique à chaque ligne.


### Pourquoi le cumul est stratégique ?

Le cumul permet de suivre l'évolution des performances dans le temps et d'identifier les tendances de croissance.

---

### Ce que j'ai retenu aujourd'hui

Les Window Functions offrent une nouvelle façon d'analyser les données sans perdre leur granularité. Elles sont essentielles pour réaliser des classements, des comparaisons et des analyses temporelles avancées.
