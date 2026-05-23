-- 📅 DAY 5 — SQL Exercises (CTE & lisibilité)

-- 1. Temps moyen par région (CTE)
WITH temps_par_region AS (
    SELECT 
        c.region,
        AVG(d.temps_traitement) AS temps_moyen
    FROM formation_sql.clients c
    JOIN formation_sql.demandes d
        ON c.id_client = d.id_client
    GROUP BY c.region
)
SELECT * FROM temps_par_region;


-- 2. CA total par région (CTE)
WITH ca_par_region AS (
    SELECT 
        c.region,
        SUM(v.montant) AS ca_total
    FROM formation_sql.clients c
    JOIN formation_sql.ventes v
        ON c.id_client = v.id_client
    GROUP BY c.region
)
SELECT * FROM ca_par_region;


-- 3. Régions au-dessus de la moyenne globale (CTE)
WITH 
temps_par_region AS (
    SELECT 
        c.region,
        AVG(d.temps_traitement) AS temps_moyen
    FROM formation_sql.clients c
    JOIN formation_sql.demandes d
        ON c.id_client = d.id_client
    GROUP BY c.region
),

moyenne_globale AS (
    SELECT AVG(temps_traitement) AS avg_global
    FROM formation_sql.demandes AS d
)

SELECT 
    t.region,
    t.temps_moyen
FROM temps_par_region AS t
CROSS JOIN moyenne_globale AS m
  
WHERE t.temps_moyen > m.avg_global;


-- 4. Clients au-dessus du CA moyen
WITH ca_par_client AS (
    SELECT 
        id_client,
        SUM(montant) AS ca_total
    FROM formation_sql.ventes
    GROUP BY id_client
),

moyenne_ca AS (
    SELECT AVG(ca_total) AS ca_moyen
    FROM ca_par_client
)

SELECT 
    c.id_client,
    c.ca_total
FROM ca_par_client c
CROSS JOIN moyenne_ca m

WHERE c.ca_total > m.ca_moyen;


-- 5. Analyse métier (CTE propre)
WITH temps_par_region AS (
    SELECT 
        c.region,
        AVG(d.temps_traitement) AS temps_moyen
    FROM formation_sql.clients c
    JOIN formation_sql.demandes d
        ON c.id_client = d.id_client
    GROUP BY c.region
),

ca_par_region AS (
    SELECT 
        c.region,
        SUM(v.montant) AS ca_total
    FROM formation_sql.clients c
    JOIN formation_sql.ventes v
        ON c.id_client = v.id_client
    GROUP BY c.region
),

analyse AS (
    SELECT 
        t.region,
        t.temps_moyen,
        c.ca_total
    FROM temps_par_region t
    JOIN ca_par_region c
        ON t.region = c.region
)

SELECT *
FROM analyse
WHERE temps_moyen > (
    SELECT AVG(temps_traitement)
    FROM formation_sql.demandes
)
AND ca_total > 350;
