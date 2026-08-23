-- 📅 DAY 10 — GROUP BY & HAVING
-- Objectif : comprendre la différence entre une analyse ligne par ligne
-- et une analyse groupe par groupe.


-- ============================================================
-- EXERCICE 1
-- Afficher chaque région et le nombre de clients
-- ============================================================

SELECT
    clients.region AS region,
    COUNT(clients.id_client) AS nombre_clients
FROM formation_sql.clients AS clients
GROUP BY
    clients.region;


-- ============================================================
-- EXERCICE 2
-- Afficher chaque région et son temps moyen de traitement
-- ============================================================

SELECT
    clients.region AS region,
    AVG(demandes.temps_traitement) AS temps_moyen_traitement
FROM formation_sql.clients AS clients
JOIN formation_sql.demandes AS demandes
    ON clients.id_client = demandes.id_client
GROUP BY
    clients.region;


-- ============================================================
-- EXERCICE 3
-- Afficher chaque région et son chiffre d'affaires total
-- ============================================================

SELECT
    clients.region AS region,
    SUM(ventes.montant) AS chiffre_affaires_total
FROM formation_sql.clients AS clients
JOIN formation_sql.ventes AS ventes
    ON clients.id_client = ventes.id_client
GROUP BY
    clients.region;


-- ============================================================
-- EXERCICE 4
-- Afficher uniquement les régions dont le chiffre d'affaires
-- total est supérieur à 300 €
-- ============================================================

SELECT
    clients.region AS region,
    SUM(ventes.montant) AS chiffre_affaires_total
FROM formation_sql.clients AS clients
JOIN formation_sql.ventes AS ventes
    ON clients.id_client = ventes.id_client
GROUP BY
    clients.region
HAVING
    SUM(ventes.montant) > 300;


-- ============================================================
-- EXERCICE 5
-- Classer les régions du plus gros chiffre d'affaires
-- au plus petit
-- ============================================================

SELECT
    clients.region AS region,
    SUM(ventes.montant) AS chiffre_affaires_total
FROM formation_sql.clients AS clients
JOIN formation_sql.ventes AS ventes
    ON clients.id_client = ventes.id_client
GROUP BY
    clients.region
ORDER BY
    chiffre_affaires_total DESC;
