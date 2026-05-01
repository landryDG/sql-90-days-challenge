# 📅 DAY 1 — Analyse & raisonnement

---

## 🎯 Objectif

Renforcer les bases SQL et adopter une logique d’analyse de données.

---

## 🔍 Compréhension des données

Avant d’écrire les requêtes, analyse des tables :

- `clients` → informations clients + région  
- `demandes` → temps de traitement  
- `ventes` → chiffre d’affaires  

👉 Objectif : comprendre la structure et les relations.

---

## 🔹 Analyse technique & interprétation

### 1. Demandes avec temps > 30 jours  
🎯 Permet d’identifier les inefficacités opérationnelles.

---

### 2. Nombre total de demandes  
🎯 Donne une vision globale de l’activité.

---

### 3. Temps moyen par région  
🎯 Permet de comparer la performance entre régions.

---

### 4. Régions au-dessus de la moyenne  
🎯 Met en évidence les zones sous-performantes nécessitant une action.

---

### 5. CA total par client  
🎯 Permet d’identifier les clients les plus rentables.

---

## 🔹 Analyse métier

### 🎯 Problématique

Identifier les régions lentes ET générant un fort chiffre d’affaires.

---

### 🧠 Approche

- Calcul du temps moyen par région  
- Calcul du CA par région  
- Croisement des deux indicateurs  

---

### 📊 Insight

Les régions combinant un temps de traitement élevé et un chiffre d’affaires important doivent être priorisées car elles représentent un fort impact business.

---

## 🔹 Réflexion

- Bonne compréhension de la différence entre WHERE et HAVING  
- Amélioration de l’utilisation de GROUP BY
- Difficulté rencontrée : choix du bon niveau d’agrégation
- Point à consolider : ordre d’exécution SQL
- Compréhension du fonctionnement des CTE 
- Difficulté rencontrée : choix du bon niveau d’agrégation  
- Point à consolider : ordre d’exécution SQL  
- Compréhension du fonctionnement des CTE  
