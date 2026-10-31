## Jour 10 — Ne pas chercher à confirmer mon hypothèse

### Ce que je pensais

Une fois qu'une hypothèse me paraît logique, je pouvais chercher dans les données des éléments permettant de la confirmer.

### Ce que j'ai compris

Une hypothèse doit être testée, et non défendue.

Si les données ne permettent pas de la soutenir, je dois accepter de réorienter mon analyse vers une autre piste.

### À retenir

> Mon objectif n'est pas de prouver mon hypothèse. Mon objectif est de comprendre ce que les données permettent réellement de conclure.
-----------------------------------------------------

## Jour 11 — Erreurs rencontrées et corrections

### 1. Oublier une virgule

**Erreur :** oublier une virgule entre deux expressions dans un `SELECT`.

**Correction :** vérifier que chaque expression est séparée de la suivante par une virgule, sauf après la dernière.

### 2. Utiliser un mauvais nom d'alias

**Erreur :** utiliser un nom différent de celui défini dans la requête.

**Correction :** réutiliser exactement le même alias, par exemple `moyen_du_temps_traitement`.

**Leçon :** les noms des colonnes calculées doivent être cohérents dans toute la requête.

### 3. Confondre nombre de demandes et nombre de clients

**Erreur :** utiliser `COUNT(id_client)` pour compter les clients uniques.

**Correction :**

```sql
COUNT(DISTINCT d.id_client)
```

**Leçon :** un même client peut effectuer plusieurs demandes. Il faut distinguer le nombre de demandes du nombre de clients différents.

### 4. Confondre deux types de moyennes

**Erreur :** considérer que la moyenne des moyennes régionales est toujours égale à la moyenne de toutes les demandes.

**Leçon :** ces calculs peuvent donner des résultats différents. Il faut choisir celui qui répond à la question métier.

### 5. Construire une requête complexe en une seule étape

**Difficulté :** regrouper les indicateurs commerciaux et opérationnels, calculer les moyennes et classer les régions.

**Solution :** utiliser plusieurs CTE avec `WITH` pour séparer les calculs et faciliter la lecture.

### Bilan

Le jour 11 m'a appris à vérifier les alias, à distinguer les indicateurs et à structurer une requête SQL complexe en plusieurs étapes.
