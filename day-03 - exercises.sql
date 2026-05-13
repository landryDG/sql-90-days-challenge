-- 📅 DAY 3 — SQL Exercises

-- 1. Clients distincts ayant fait une demande
SELECT COUNT(DISTINCT id_client) AS nb_clients_distincts
FROM formation_sql.demandes;

-- 2. Nombre de demandes par client
SELECT 
    id_client,
    COUNT(*) AS nb_demandes
FROM formation_sql.demandes
GROUP BY id_client
ORDER BY nb_demandes DESC;

-- 3. Clients ayant fait plus d’une demande
SELECT 
    id_client,
    COUNT(*) AS nb_demandes
FROM formation_sql.demandes
GROUP BY id_client
HAVING COUNT(*) > 1;

-- 4. Chiffre d’affaires total par région
SELECT 
    c.region,
    SUM(v.montant) AS ca_total
FROM formation_sql.clients c
JOIN formation_sql.ventes v
    ON c.id_client = v.id_client
GROUP BY c.region
ORDER BY ca_total DESC;

-- 5. Nombre de demandes par région
SELECT 
    c.region,
    COUNT(d.id_demande) AS nb_demandes
FROM formation_sql.clients c
JOIN formation_sql.demandes d
    ON c.id_client = d.id_client
GROUP BY c.region
ORDER BY nb_demandes DESC;

-- 🔹 Analyse métier

WITH demandes_par_region AS (
    SELECT 
        c.region,
        COUNT(d.id_demande) AS volume_demandes
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
)

SELECT 
    d.region,
    d.volume_demandes,
    c.ca_total
FROM demandes_par_region d
JOIN ca_par_region c
    ON d.region = c.region
ORDER BY c.ca_total DESC;
