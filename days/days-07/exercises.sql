-- 📅 DAY 7 — SQL Exercises (variation & LAG)

-- 1. CA mensuel
WITH ca_mensuel AS (

    SELECT
        DATE_TRUNC(date_vente, MONTH) AS mois,
        SUM(montant) AS ca_mensuel

    FROM formation_sql.ventes

    GROUP BY mois
),

-- 2. Ajout du mois précédent (LAG)
ca_avec_lag AS (

    SELECT
        mois,
        ca_mensuel,

        LAG(ca_mensuel) OVER(
            ORDER BY mois
        ) AS ca_mois_precedent

    FROM ca_mensuel
),

-- 3. Calcul des variations
ca_avec_variations AS (

    SELECT
        mois,
        ca_mensuel,
        ca_mois_precedent,

        -- variation absolue
        ca_mensuel - ca_mois_precedent AS variation_absolue,

        -- variation relative (%)
        SAFE_DIVIDE(
            ca_mensuel - ca_mois_precedent,
            ca_mois_precedent
        ) * 100 AS variation_pourcentage

    FROM ca_avec_lag
)

-- Résultat final
SELECT
    mois,
    ca_mensuel,
    ca_mois_precedent,
    variation_absolue,
    variation_pourcentage
WHERE variation_pourcentage IS NOT NULL
ORDER BY variation_pourcentage DESC;
  
FROM ca_avec_variations
