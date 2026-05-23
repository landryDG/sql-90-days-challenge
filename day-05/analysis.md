# 📅 DAY 5 — Analyse & raisonnement (CTE & lisibilité)

---

## 🎯 Objectif

Comprendre :

- pourquoi les requêtes deviennent illisibles
- comment les CTE améliorent la structure
- comment découper une logique complexe
- différence sous-requête vs CTE

---

## 🔍 Compréhension des données

Aujourd’hui, on passe d’une logique “requête” à une logique “pipeline”.

👉 Chaque étape SQL devient un bloc logique indépendant.

---

## 🔹 Analyse technique & interprétation

### 1. Temps moyen par région (CTE)

🎯 Permet de structurer le calcul en étape lisible.

👉 On sépare la logique au lieu d’écrire une requête imbriquée.

---

### 2. CA total par région

🎯 Même logique : isoler le calcul business.

👉 Chaque métrique devient indépendante.

---

### 3. Comparaison avec moyenne globale

🎯 Introduction de plusieurs CTE.

👉 Permet de clarifier :
- métrique locale
- benchmark global

---

### 4. Clients au-dessus de la moyenne

🎯 Montre la puissance des CTE pour les comparaisons.

👉 Plus lisible qu’une sous-requête imbriquée.

---

### 5. Analyse métier complète

🎯 Combine :
- performance (temps)
- valeur business (CA)
- benchmark global

---

## 🔹 Analyse métier

### 🎯 Problématique

Identifier les régions qui combinent :

- lenteur opérationnelle
- fort impact business

---

### 🧠 Approche

1. Séparer les calculs (temps / CA)
2. Structurer avec des CTE
3. Comparer à une moyenne globale
4. Filtrer les cas prioritaires

---

### 📊 Insight

La région de Bordeaux présente un chiffre d’affaires élevé (400€) mais également un temps moyen de traitement supérieur à la moyenne globale (40).
Cette région combine donc un fort impact business avec une performance opérationnelle plus lente.
Une optimisation du temps de traitement pourrait permettre d’améliorer davantage la satisfaction client et l’efficacité opérationnelle sans compromettre la valeur générée.s.


---

## 🔹 Réflexion

- Les CTE rendent le code plus lisible
- Une requête complexe doit être découpée
- Une sous-requête est difficile à lire quand elle s’imbrique
- SQL devient un “pipeline logique”
- La lisibilité est une compétence métier

---

## 🧠 Bilan

- CTE = meilleure structure mentale
- Chaque étape doit être compréhensible seule
- Un analyste pense en blocs, pas en lignes
