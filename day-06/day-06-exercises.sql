-- 📅 DAY 6 — SQL Exercises (Analyse temporelle)

-- 1. Chiffre d'affaires total global

SELECT
    SUM(montant) AS chiffre_affaires_total_global
FROM formation_sql.ventes;


-- 2. Chiffre d'affaires par mois

SELECT
    DATE_TRUNC(date_vente, MONTH) AS mois_vente,
    SUM(montant) AS chiffre_affaires_mensuel
FROM formation_sql.ventes
GROUP BY mois_vente;


-- 3. Chiffre d'affaires par mois trié chronologiquement

SELECT
    DATE_TRUNC(date_vente, MONTH) AS mois_vente,
    SUM(montant) AS chiffre_affaires_mensuel
FROM formation_sql.ventes
GROUP BY mois_vente
ORDER BY mois_vente;


-- 4. Nombre de ventes par mois

SELECT
    DATE_TRUNC(date_vente, MONTH) AS mois_vente,
    COUNT(*) AS nombre_ventes_mensuel
FROM formation_sql.ventes
GROUP BY mois_vente
ORDER BY mois_vente;


-- 5. Chiffre d'affaires mensuel par région

SELECT
    c.region,
    DATE_TRUNC(v.date_vente, MONTH) AS mois_vente,
    SUM(v.montant) AS chiffre_affaires_mensuel
FROM formation_sql.ventes AS v
JOIN formation_sql.clients AS c
    ON v.id_client = c.id_client
GROUP BY
    c.region,
    mois_vente
ORDER BY
    mois_vente,
    chiffre_affaires_mensuel DESC;


-- 🔹 Analyse métier

WITH stat_mois AS (
  SELECT date_trunc(date_vente, MONTH) AS mois,
         SUM(montant) AS ca_maxmin_mois
  FROM `formation_sql.ventes` AS v
  GROUP BY mois
)

SELECT mois, ca_maxmin_mois
FROM stat_mois AS s
WHERE ca_maxmin_mois = (SELECT MAX(ca_maxmin_mois) FROM stat_mois)
   OR ca_maxmin_mois = (SELECT MIN(ca_maxmin_mois) FROM stat_mois);
