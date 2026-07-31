-- 📅 DAY 2 — SQL Exercises

-- 1. Temps moyen global de traitement
SELECT 
    AVG(temps_traitement) AS temps_moyen_global
FROM formation_sql.demandes;

-- 2. Temps moyen par région
SELECT 
    c.region,
    AVG(d.temps_traitement) AS temps_moyen
FROM formation_sql.demandes d
JOIN formation_sql.clients c 
    ON d.id_client = c.id_client
GROUP BY c.region;

-- 3. Régions avec temps moyen > 30 jours
SELECT 
    c.region,
    AVG(d.temps_traitement) AS temps_moyen
FROM formation_sql.demandes d
JOIN formation_sql.clients c 
    ON d.id_client = c.id_client
GROUP BY c.region
HAVING AVG(d.temps_traitement) > 30;

-- 4. Régions avec temps moyen > moyenne globale
SELECT 
    c.region,
    AVG(d.temps_traitement) AS temps_moyen
FROM formation_sql.demandes d
JOIN formation_sql.clients c 
    ON d.id_client = c.id_client
GROUP BY c.region
HAVING AVG(d.temps_traitement) > (
    SELECT AVG(temps_traitement)
    FROM formation_sql.demandes
);

-- 5. CA total par région
SELECT 
    c.region,
    SUM(v.montant) AS ca_total
FROM formation_sql.ventes v
JOIN formation_sql.clients c 
    ON v.id_client = c.id_client
GROUP BY c.region;

-- 🔹 Analyse métier (CTE)

WITH

temps_par_region AS (
    SELECT 
        c.region,
        AVG(d.temps_traitement) AS temps_moyen
    FROM formation_sql.demandes d
    JOIN formation_sql.clients c 
        ON d.id_client = c.id_client
    GROUP BY c.region
),

ca_par_region AS (
    SELECT 
        c.region,
        SUM(v.montant) AS ca_total
    FROM formation_sql.ventes v
    JOIN formation_sql.clients c 
        ON v.id_client = c.id_client
    GROUP BY c.region
)

SELECT 
    t.region,
    t.temps_moyen,
    c.ca_total
FROM temps_par_region t
JOIN ca_par_region c 
    ON t.region = c.region
WHERE t.temps_moyen > (
    SELECT AVG(temps_traitement) FROM formation_sql.demandes
)
AND c.ca_total > 300
ORDER BY t.temps_moyen DESC;
