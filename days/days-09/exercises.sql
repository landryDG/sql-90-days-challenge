-- 📅 DAY 9 — SQL Exercises

------------------------------------------------------------
-- Exercice 1 : Chiffre d'affaires total par client
------------------------------------------------------------

SELECT
    id_client,
    SUM(montant) AS chiffre_affaires_total
FROM formation_sql.ventes
GROUP BY id_client
ORDER BY chiffre_affaires_total DESC;

------------------------------------------------------------
-- Exercice 2 : Pourcentage de contribution au CA global
------------------------------------------------------------

SELECT
    id_client,
    SUM(montant) AS ca_client,
    SUM(montant) * 100.0 / SUM(SUM(montant)) OVER () AS pourcentage_client_sur_gobal_ca
FROM formation_sql.ventes AS v
GROUP BY id_client;

------------------------------------------------------------
-- Exercice 3 : CA cumulatif du plus gros client au plus petit
------------------------------------------------------------

WITH ca_client AS (
    SELECT
        id_client,
        SUM(montant) AS ca_client
    FROM formation_sql.ventes
    GROUP BY id_client
)

SELECT
    c.id_client,
    c.ca_client,
    SUM(c.ca_client) OVER (
        ORDER BY c.ca_client DESC
    ) AS ca_cumulatif_client
FROM ca_client AS c
ORDER BY c.ca_client DESC;;

------------------------------------------------------------
-- Exercice 4 : Pourcentage cumulatif
------------------------------------------------------------

WITH ca_client AS (
    SELECT
        id_client,
        SUM(montant) AS ca_client
    FROM formation_sql.ventes
    GROUP BY id_client
)

SELECT
    id_client,
    ca_client,
    SUM(ca_client) OVER (
        ORDER BY ca_client DESC
    ) AS ca_cumulatif,
    SAFE_DIVIDE(
        SUM(ca_client) OVER (
            ORDER BY ca_client DESC
        ),
        SUM(ca_client) OVER ()
    ) AS pct_ca_cumulatif
FROM ca_client
ORDER BY ca_client DESC;

------------------------------------------------------------
-- Exercice 5 : Clients représentant 80 % du CA
------------------------------------------------------------

WITH ca_client AS (
    SELECT
        id_client,
        SUM(montant) AS ca_client
    FROM formation_sql.ventes AS v
    GROUP BY id_client
),

cumul_ca AS (
    SELECT
        id_client,
        ca_client,
        SUM(ca_client) OVER (
            ORDER BY ca_client DESC
        ) AS ca_cumulatif_client,
        SAFE_DIVIDE(
            SUM(ca_client) OVER (
                ORDER BY ca_client DESC
            ),
            SUM(ca_client) OVER ()
        ) AS pct_ca_cumulatif
    FROM ca_client AS c
)

SELECT
    id_client,
    ca_client,
    ca_cumulatif_client,
    pct_ca_cumulatif
FROM cumul_ca
WHERE pct_ca_cumulatif <= 0.8
ORDER BY ca_client DESC;

ORDER BY chiffre_affaires_total DESC;
