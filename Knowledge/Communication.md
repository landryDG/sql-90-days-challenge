🗣 **Communication — 10 min**

### Question du jour 10 :

Le directeur demande : ⚠️ Mot interdit : **« agrégation »**

> « C’est quoi un GROUP BY ? »

🎯 Objectif : expliquer simplement, avec des mots compréhensibles par une personne qui ne connaît pas SQL.

=  Un GROUP BY sert à rassembler les données qui se ressemblent pour avoir une vue par catégorie (exemple:le chiffre d’affaires groupe par client, les ventes groupe par mois ou le nombre de commandes par commercial)

-----------------------------------------

# Formuler une analyse sans surinterpréter les données

## Pourquoi le vocabulaire est important

Dans une analyse Data, il est important de distinguer ce que les données permettent réellement d'affirmer de ce qui constitue seulement une hypothèse.

Le rôle du Data Analyst n'est pas uniquement de trouver une anomalie. Il doit également être capable de communiquer ses constats avec le bon niveau de certitude.

Une formulation trop affirmative peut transformer une hypothèse en conclusion alors que les données ne permettent pas encore de l'établir.

---

## 1. Partir d'un constat

Lorsqu'un phénomène est directement visible dans les données, je peux utiliser des formulations comme :

* « On observe une baisse du chiffre d'affaires. »
* « On constate un écart entre cette région et la moyenne. »
* « Le nombre de clients a diminué sur la période étudiée. »
* « Cette région présente une anomalie par rapport à la référence retenue. »

À ce stade, je décris ce que les données montrent.

Je ne cherche pas encore à expliquer pourquoi.

---

## 2. Identifier une anomalie ou un signal

Une anomalie ou un écart constitue un point qui mérite une investigation.

Exemple :

> « Le chiffre d'affaires de cette région est inférieur à celui de la période précédente. »

Cette observation devient un signal d'investigation.

Je peux alors me demander :

* Le nombre de clients a-t-il diminué ?
* Le nombre de commandes a-t-il diminué ?
* Le nombre de ventes a-t-il diminué ?
* Le panier moyen a-t-il évolué ?
* Cette évolution est-elle spécifique à cette région ?
* Observe-t-on la même tendance dans les autres régions ?

L'objectif est de passer du constat à la recherche d'explications.

---

## 3. Formuler une hypothèse

Une hypothèse est une explication possible du phénomène observé.

Je peux utiliser :

* « Une hypothèse serait que… »
* « Cela pourrait s'expliquer par… »
* « Une piste d'explication serait… »
* « Cela pourrait être lié à… »
* « Ce facteur pourrait contribuer à… »

Exemple :

> « Le nombre de clients ayant diminué en parallèle du chiffre d'affaires, une hypothèse serait que la baisse du nombre de clients contribue à la baisse du chiffre d'affaires. »

Cette formulation ne présente pas encore cette relation comme une causalité démontrée.

---

## 4. Vérifier l'hypothèse

Une hypothèse doit être confrontée aux données disponibles.

Je peux donc chercher :

* si l'évolution apparaît au même moment ;
* si elle concerne uniquement cette région ;
* si elle est suffisamment importante ;
* si d'autres indicateurs évoluent également ;
* si un événement métier connu peut expliquer cette évolution.

L'objectif est de déterminer si les données apportent suffisamment d'éléments pour soutenir ou écarter l'hypothèse.

---

## 5. Distinguer association et causalité

Deux phénomènes peuvent évoluer ensemble sans que l'un soit nécessairement la cause de l'autre.

Il faut donc privilégier des formulations prudentes lorsque la causalité n'est pas établie :

> « On observe une association entre la baisse du nombre de clients et la baisse du chiffre d'affaires. »

plutôt que :

> « La baisse du nombre de clients a causé la baisse du chiffre d'affaires. »

La seconde formulation nécessite des éléments permettant réellement de soutenir une relation causale.

---

## 6. Passer de l'analyse à la recommandation

Une fois les constats et les hypothèses suffisamment étudiés, je peux formuler une recommandation.

La logique devient :

**Observation → Écart / anomalie → Hypothèse → Investigation → Vérification → Conclusion → Recommandation**

Exemple :

> « Le chiffre d'affaires de la région A a diminué de manière significative par rapport à la période de référence. Cette baisse est accompagnée d'une diminution du nombre de clients actifs. L'analyse devra permettre de vérifier si cette évolution est spécifique à la région et d'identifier les facteurs métier pouvant l'expliquer. »

Cette formulation distingue clairement :

* ce qui est observé ;
* ce qui constitue une piste ;
* ce qui reste à vérifier.

---

## 7. Application à une demande métier ambiguë

Lorsqu'un responsable demande :

> « Quelles sont les régions qui méritent une attention particulière ? »

la première étape consiste à clarifier ce qu'il entend par « attention particulière ».

Je peux demander :

> « Quand vous dites qu'une région mérite une attention particulière, quels critères avez-vous en tête ? Baisse du CA ? Baisse des ventes ? Rentabilité ? Délais de traitement ? Nombre de clients ? »

Si le responsable ne définit pas de critère précis, je dois construire une première approche à partir du contexte de l'entreprise et des données disponibles.

Dans le cas d'une entreprise commerciale, des indicateurs comme le chiffre d'affaires, le nombre de ventes, le nombre de commandes et le nombre de clients peuvent constituer des points de départ pertinents.

Cependant, ils ne doivent pas être considérés automatiquement comme les bons critères : leur pertinence dépend de la problématique métier.

---

## 8. Deux situations différentes

### Cas 1 — La question est large

> « Quelles sont les régions qui méritent notre attention ? »

Je dois d'abord définir ce que signifie « mériter une attention particulière ».

Je cherche donc à :

1. clarifier la demande ;
2. comprendre les objectifs de l'entreprise ;
3. identifier les indicateurs pertinents ;
4. rechercher les écarts ou anomalies ;
5. formuler des hypothèses ;
6. investiguer les causes possibles.

### Cas 2 — La question contient déjà le problème

> « Pourquoi les ventes baissent-elles dans cette région ? »

Le point de départ est déjà défini.

Je peux alors commencer par vérifier la baisse des ventes et examiner les indicateurs susceptibles d'être liés au phénomène :

* chiffre d'affaires ;
* nombre de ventes ;
* nombre de commandes ;
* nombre de clients ;
* évolution dans le temps.

Je recherche ensuite les anomalies et les éléments pouvant expliquer cette évolution.

---

## À retenir

Le Data Analyst doit constamment distinguer :

**Ce que je sais**
→ ce que les données montrent.

**Ce que je soupçonne**
→ mon hypothèse.

**Ce que je dois vérifier**
→ mon investigation.

**Ce que je peux conclure**
→ ce que les éléments disponibles permettent réellement d'affirmer.

**Ce que je recommande**
→ l'action que je propose à partir de l'analyse.

Le bon vocabulaire permet donc de communiquer une analyse avec le bon niveau de certitude et d'éviter de transformer une hypothèse en affirmation.
