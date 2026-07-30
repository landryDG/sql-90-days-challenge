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
