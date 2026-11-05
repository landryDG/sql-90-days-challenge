# Jour 12 — Analyser et classer les performances régionales

## 🎯 Objectif du jour

Apprendre à classer les régions selon leur chiffre d'affaires et à comparer leurs performances.

L'objectif est de comprendre les fonctions de classement SQL, d'identifier les régions les plus performantes et de savoir interpréter les résultats pour répondre à une question métier.

---

## 🔹 1. Ce que j'ai appris

### Les fonctions de classement

- `RANK()` permet de classer les résultats. Les régions ayant la même valeur obtiennent le même rang, puis un rang est sauté.
- `DENSE_RANK()` attribue également le même rang aux ex æquo, mais sans laisser d'écart dans les rangs suivants.
- `ROW_NUMBER()` attribue un numéro différent à chaque ligne, même lorsque plusieurs régions ont le même chiffre d'affaires.

### Les CTE

- `WITH` permet de créer des requêtes temporaires.
- Les CTE permettent de séparer les étapes d'une analyse.
- Elles rendent les requêtes plus lisibles et plus faciles à comprendre.

### Les fonctions de fenêtre

- `OVER()` permet d'utiliser une fonction de fenêtre.
- Les fonctions de classement permettent de comparer et d'organiser les résultats sans regrouper les lignes dans une seule valeur.

---

## 🔹 2. Les indicateurs étudiés

J'ai travaillé sur :

- Le chiffre d'affaires total par région.
- Le classement des régions selon leur chiffre d'affaires.
- La comparaison entre `RANK()`, `DENSE_RANK()` et `ROW_NUMBER()`.

---

## 🔹 3. Résultats obtenus

Les régions ont été classées selon leur chiffre d'affaires.

| Région | Chiffre d'affaires |
|---|---:|
| Paris | 820 € |
| Lyon | 600 € |
| Bordeaux | 600 € |
| Marseille | 125 € |

Paris arrive en première position avec 820 € de chiffre d'affaires.

Lyon et Bordeaux réalisent le même chiffre d'affaires et sont donc ex æquo.

---

## 🔹 4. Analyse métier

### Paris

Paris arrive en première position avec un chiffre d'affaires de 820 €.

C'est la région qui génère le chiffre d'affaires le plus élevé dans cette analyse.

### Lyon et Bordeaux

Lyon et Bordeaux réalisent toutes les deux 600 € de chiffre d'affaires.

Elles obtiennent donc le même rang avec `RANK()`.

### Marseille

Marseille possède le chiffre d'affaires le plus faible avec 125 €.

Elle se retrouve en dernière position dans le classement.

### Comprendre les trois premières positions

Avec `RANK()`, plusieurs régions peuvent partager une même position.

Si deux régions sont à égalité à la troisième place, une demande portant sur les trois premières positions peut donc retourner quatre régions.

C'est le comportement normal de cette fonction.

---

## 🔹 5. Ce que je retiens

Une région classée première n'est pas forcément la plus rentable.

Le chiffre d'affaires ne prend pas en compte les coûts et les charges. Il ne suffit donc pas à mesurer toute la performance commerciale.

Deux régions qui réalisent le même chiffre d'affaires n'ont pas forcément les mêmes performances.

Elles peuvent avoir un nombre de ventes, un nombre de clients et un panier moyen différents.

Un classement ne doit jamais être interprété seul. Il faut regarder les indicateurs qui le composent et tenir compte du contexte pour éviter de tirer de mauvaises conclusions.

---

## 🔹 6. Limites de l'analyse et pistes d'amélioration

Le classement repose uniquement sur le chiffre d'affaires.

Pour mieux comprendre les performances des régions, il serait intéressant d'étudier :

- Le nombre de ventes.
- Le nombre de clients.
- Le panier moyen.
- Les coûts et les charges.
- L'évolution du chiffre d'affaires dans le temps.

Ces indicateurs permettraient d'avoir une vision plus complète des performances commerciales.

**Conclusion :** Paris arrive en tête selon le chiffre d'affaires. Lyon et Bordeaux sont à égalité. Marseille possède le chiffre d'affaires le plus faible. Cependant, ce classement ne permet pas à lui seul de déterminer quelle région est la plus rentable ou la plus performante dans son ensemble.
