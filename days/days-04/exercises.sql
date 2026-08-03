-- 📅 DAY 4 — SQL Exercises

-- 1. Temps moyen global
SELECT 
    AVG(temps_traitement) AS temps_moyen_global
FROM formation_sql.demandes;

-- 2. Temps moyen par région
SELECT 
    c.region,
    AVG(d.temps_traitement) AS temps_moyen
FROM formation_sql.clients AS c
JOIN formation_sql.demandes AS d
    ON c.id_client = d.id_client
GROUP BY c.region;

-- 3. Régions avec temps moyen > moyenne globale
SELECT 
    c.region,
    AVG(d.temps_traitement) AS temps_moyen
FROM formation_sql.clients AS c
JOIN formation_sql.demandes AS d
    ON c.id_client = d.id_client
GROUP BY c.region
HAVING AVG(d.temps_traitement) > (
    SELECT AVG(temps_traitement)
    FROM formation_sql.demandes
);

-- 4. CA moyen par client
SELECT 
    AVG(ca_client) AS ca_moyen_client
FROM (
    SELECT 
        id_client,
        SUM(montant) AS ca_client
    FROM formation_sql.ventes
    GROUP BY id_client
) AS sous_requete_ca;

-- 5. Clients avec CA > moyenne globale client
SELECT 
    id_client,
    SUM(montant) AS ca_total
FROM formation_sql.ventes
GROUP BY id_client
HAVING SUM(montant) > (
    SELECT AVG(ca_client)
    FROM (
        SELECT 
            id_client,
            SUM(montant) AS ca_client
        FROM formation_sql.ventes
        GROUP BY id_client
    ) AS moyenne_clients
);

-- 🔹 Analyse métier

WITH

temps_par_region AS (
    SELECT 
        c.region,
        AVG(d.temps_traitement) AS temps_moyen
    FROM formation_sql.clients AS c
    JOIN formation_sql.demandes AS d
        ON c.id_client = d.id_client
    GROUP BY c.region
),

ca_par_region AS (
    SELECT 
        c.region,
        SUM(v.montant) AS ca_total
    FROM formation_sql.clients AS c
    JOIN formation_sql.ventes AS v
        ON c.id_client = v.id_client
    GROUP BY c.region
)

SELECT 
    t.region,
    t.temps_moyen,
    c.ca_total
FROM temps_par_region AS t
JOIN ca_par_region AS c
    ON t.region = c.region
WHERE t.temps_moyen > (
    SELECT AVG(temps_traitement)
    FROM formation_sql.demandes
)
AND c.ca_total > 400
ORDER BY t.temps_moyen DESC;
