📚 **Culture Data — 10 min**

### Sujet du jour 10 : La clé primaire

**Définition**
Une **clé primaire** est un identifiant **unique** qui permet de reconnaître chaque ligne d’une table.

**Exemple — Table clients**

| id_client (clé primaire) | nom          |
| ------------------------ | ------------ |
| 1                        | Entreprise A |
| 2                        | Entreprise B |
| 3                        | Entreprise C |

✅ Ici, **id_client** est la clé primaire car chaque valeur est unique.

**Pourquoi c’est important ?**

* Évite les doublons d’identifiants.
* Permet de relier les tables avec des jointures.

**Exemple de jointure :**
`clients.id_client = demandes.id_client`

➡️ Si la clé n’est pas unique, les résultats de la jointure peuvent être incorrects.
--------------------------------------------------------

Si cette clé n'était pas unique dans clients, tes résultats pourraient être faux.



________________________________________
## Jour 11 — Transformer les données en décisions

### Pourquoi analyser les performances régionales ?

Une entreprise peut comparer ses régions pour repérer les écarts de performance et identifier les situations qui nécessitent une investigation.

Le chiffre d'affaires renseigne sur la performance commerciale.

Le temps moyen de traitement renseigne sur un aspect de la performance opérationnelle.

L'analyse conjointe de ces indicateurs donne une vision plus complète.

### Transformer les indicateurs en signaux d'alerte

Une région dont le chiffre d'affaires est inférieur à la moyenne et dont le temps moyen de traitement est supérieur à la moyenne peut nécessiter une investigation.

Ce classement constitue un signal, mais pas une preuve de mauvaise performance.

Il faut examiner les volumes, le contexte et les causes possibles avant de prendre une décision.

### Pourquoi vérifier les volumes ?

Une moyenne calculée sur deux demandes est moins représentative qu'une moyenne calculée sur plusieurs centaines de demandes.

Il est donc important de connaître le nombre de demandes avant de tirer des conclusions.

### Ce que je retiens

Un analyste ne se contente pas de produire des chiffres.

Il doit comparer les indicateurs, interpréter les écarts et expliquer les limites de son analyse pour aider à la prise de décision.
