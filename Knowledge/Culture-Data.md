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
