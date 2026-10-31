SELECT

Définition:
Permet de sélectionner et récupérer des données depuis une ou plusieurs tables.


Erreur fréquente:
- Utiliser `SELECT *` sans raison dans une analyse professionnelle.
- Sélectionner des colonnes inutiles qui ralentissent la requête.

Exemple:
```sql
SELECT 
    customer_name,
    city
FROM customers;
```

----------------

GROUP BY

Définition :Permet de regrouper des lignes ayant une valeur commune afin d'effectuer des calculs.


Erreur fréquente :
- Oublier d'ajouter une colonne dans le `GROUP BY`.
- Utiliser `GROUP BY` alors qu'une simple sélection suffit.

Exemple:

```sql
SELECT
    country,
    COUNT(*) AS total_customers
FROM customers
GROUP BY country;
```


----------------

HAVING

...

_____________________________

## Jour 11 — Nouvelles notions SQL

### CTE — Common Table Expression

Une CTE est une requête temporaire définie avec `WITH`.

Elle permet de découper une requête complexe en plusieurs étapes pour rendre le code plus lisible.

```sql
WITH ventes_region AS (
    SELECT
        c.region,
        SUM(v.montant) AS chiffre_affaire
    FROM `formation_sql.ventes` AS v
    INNER JOIN `formation_sql.clients` AS c
        ON v.id_client = c.id_client
    GROUP BY c.region
)
SELECT *
FROM ventes_region;
```

### FULL OUTER JOIN

`FULL OUTER JOIN` permet de conserver toutes les lignes des deux tables, même lorsqu'il n'existe pas de correspondance entre elles.

Il est utile pour rapprocher deux analyses qui ne contiennent pas nécessairement les mêmes régions.

### COALESCE()

`COALESCE()` renvoie la première valeur non nulle parmi les valeurs fournies.

Exemple :

```sql
COALESCE(so.region, sc.region) AS region
```

Cette expression récupère la région disponible dans l'une des deux sources.

### Fonctions de fenêtre — OVER()

`OVER()` permet d'effectuer un calcul sur plusieurs lignes sans regrouper les résultats en une seule ligne.

Exemple :

```sql
AVG(chiffre_affaire) OVER () AS ca_moyen
```

Cette expression calcule la moyenne des chiffres d'affaires présents dans les lignes analysées.

### Écart à la moyenne

L'écart à la moyenne mesure la différence entre une valeur et une moyenne de référence.

Exemple :

```sql
chiffre_affaire - AVG(chiffre_affaire) OVER () AS ecart_moyen_ca
```

- Écart positif : valeur supérieure à la moyenne.
- Écart négatif : valeur inférieure à la moyenne.
- Écart nul : valeur égale à la moyenne.

### CASE WHEN

`CASE WHEN` permet de créer une catégorie en fonction de conditions.

Exemple :

```sql
CASE
    WHEN ecart_moyen_ca > 0 THEN 'supérieur à la moyenne'
    WHEN ecart_moyen_ca < 0 THEN 'en dessous de la moyenne'
    ELSE 'dans la moyenne'
END AS categorie_ca
```

### COUNT(DISTINCT)

`COUNT(DISTINCT colonne)` compte les valeurs distinctes non nulles.

Exemple :

```sql
COUNT(DISTINCT d.id_client) AS nb_client
```

Cette expression compte chaque client une seule fois dans le groupe étudié.
