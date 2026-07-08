-- 📅 DAY 8 — SQL Exercises


-- Exercice 1 : Classement des clients par chiffre d'affaires


SELECT
    id_client,
    SUM(montant) AS chiffre_affaires_total,
    RANK() OVER (
        ORDER BY SUM(montant) DESC
    ) AS classement_client
FROM formation_sql.ventes
GROUP BY id_client;


-- Exercice 2 : Classement avec DENSE_RANK()


SELECT
    id_client,
    SUM(montant) AS chiffre_affaires_total,
    DENSE_RANK() OVER (
        ORDER BY SUM(montant) DESC
    ) AS classement_client
FROM formation_sql.ventes
GROUP BY id_client;


-- Exercice 3 : Classement avec ROW_NUMBER()


SELECT
    id_client,
    SUM(montant) AS chiffre_affaires_total,
    ROW_NUMBER() OVER (
        ORDER BY SUM(montant) DESC
    ) AS numero_ligne
FROM formation_sql.ventes
GROUP BY id_client;


-- Exercice 4 : Chiffre d'affaires cumulatif par mois


WITH chiffre_affaires_par_mois AS (

SELECT
     DATE_TRUNC(date_vente, MONTH) AS mois,
     SUM(montant) AS chiffre_affaires_mensuel
  
FROM formation_sql.ventes
GROUP BY mois

)

SELECT
      mois,
      chiffre_affaires_mensuel,
      SUM(chiffre_affaires_mensuel) OVER(ORDER BY mois) AS chiffre_affaires_cumulatif

FROM chiffre_affaires_par_mois
ORDER BY mois;


-- Exercice 5 : Chiffre d'affaires cumulatif par région

WITH chiffre_affaires_region_mois AS (

SELECT
      c.region,
      DATE_TRUNC(v.date_vente, MONTH) AS mois,
      SUM(v.montant) AS chiffre_affaires_mensuel

FROM formation_sql.clients c
JOIN formation_sql.ventes v
ON c.id_client = v.id_client

GROUP BY
c.region,
mois

)

SELECT
     region,
     mois,
     chiffre_affaires_mensuel,
     SUM(chiffre_affaires_mensuel) OVER( PARTITION BY region ORDER BY mois ) AS chiffre_affaires_cumulatif

FROM chiffre_affaires_region_mois

ORDER BY region,
         mois;
