# 📅 DAY 3 — Analyse & raisonnement

---

## 🎯 Objectif

Approfondir :

- `GROUP BY`
- `HAVING`
- `DISTINCT`
- Comprendre les effets des `JOIN`
- Comprendre pourquoi `DISTINCT` n’est pas une solution magique

---

## 🔍 Compréhension des données

Aujourd’hui, focus sur la granularité des données.

👉 Une ligne SQL représente toujours une unité d’analyse.

Exemple :
- une vente
- une demande
- un client

⚠️ Un `JOIN` peut multiplier les lignes lorsqu’une relation est de type 1 → N.

---

## 🔹 Analyse technique & interprétation

### 1. Clients distincts ayant fait une demande

🎯 Permet d’identifier le nombre réel de clients actifs.

👉 Utilisation de `DISTINCT` pour éviter de compter plusieurs fois le même client.

---

### 2. Nombre de demandes par client

🎯 Permet d’identifier les clients les plus actifs.

👉 Utilisation de `GROUP BY` pour agréger les demandes.

---

### 3. Clients avec plus d’une demande

🎯 Met en évidence les clients récurrents.

👉 Utilisation de `HAVING` pour filtrer après agrégation.

---

### 4. Chiffre d’affaires total par région

🎯 Permet d’identifier les régions les plus rentables.

👉 Nécessite un `JOIN` entre clients et ventes.

---

### 5. Nombre de demandes par région

🎯 Permet de mesurer la charge opérationnelle par région.

⚠️ Important :
L’unité d’analyse reste la demande.

👉 Il faut compter les demandes et non les lignes générées par le `JOIN`.

---

## 🔹 Analyse métier

### 🎯 Problématique

Les régions générant le plus de chiffre d’affaires sont-elles aussi celles ayant le plus de demandes ?

---

### 🧠 Approche

1. Calculer le volume de demandes par région  
2. Calculer le chiffre d’affaires par région  
3. Comparer volume et valeur business  

---

### 📊 Insight

Une région avec beaucoup de demandes ne génère pas forcément le plus de chiffre d’affaires.

👉 Volume ≠ valeur business.

Certaines régions peuvent avoir moins de demandes mais un CA plus élevé, ce qui modifie les priorités stratégiques.

---

## 🔹 Réflexion

- Compréhension des effets des `JOIN`
- Différence entre ligne réelle et duplication logique
- `DISTINCT` ne doit pas masquer une erreur de raisonnement
- Importance de la granularité des données
- Meilleure compréhension de `HAVING`

---

## 🧠 Bilan

- Toujours identifier l’unité d’analyse
- Vérifier ce qu’on compte réellement
- Comprendre pourquoi une requête fonctionne est aussi important que le résultat obtenu
