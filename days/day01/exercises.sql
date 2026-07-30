-- 📅 DAY 1 — SQL Exercises

-- 1. Demandes avec un temps de traitement > 30 jours
SELECT id_demande
FROM formation_sql.demandes
WHERE temps_traitement > 30;

-- 2. Nombre total de demandes
SELECT COUNT(*) AS nb_demandes
FROM formation_sql.demandes;

-- 3. Temps moyen par région
SELECT 
    c.region,
    AVG(d.temps_traitement) AS temps_moyen
FROM formation_sql.clients c
JOIN formation_sql.demandes d
    ON c.id_client = d.id_client
GROUP BY c.region;

-- 4. Régions au-dessus de la moyenne globale
SELECT 
    c.region,
    AVG(d.temps_traitement) AS temps_moyen
FROM formation_sql.clients c
JOIN formation_sql.demandes d
    ON c.id_client = d.id_client
GROUP BY c.region
HAVING AVG(d.temps_traitement) > (
    SELECT AVG(temps_traitement)
    FROM formation_sql.demandes
);

-- 5. Chiffre d’affaires total par client
SELECT 
    id_client,
    SUM(montant) AS ca_total
FROM formation_sql.ventes
GROUP BY id_client;

-- 🔹 Analyse métier avec CTE

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
    t.region,
    t.temps_moyen,
    c.ca_total
FROM temps_par_region t
JOIN ca_par_region c 
    ON t.region = c.region
ORDER BY t.temps_moyen DESC, c.ca_total DESC;
