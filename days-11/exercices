
-- JOUR 11 : Analyse des performances régionales
-- CTE, FULL OUTER JOIN, fonctions de fenêtre et CASE WHEN


-- Exercice 1 : Calcul des indicateurs commerciaux par région

WITH stat_commercial AS (
    SELECT
        c.region,
        SUM(v.montant) AS chiffre_affaire,
        COUNT(v.id_vente) AS nb_vente,
        AVG(v.montant) AS panier_moyen
    FROM `formation_sql.ventes` AS v
    INNER JOIN `formation_sql.clients` AS c
        ON v.id_client = c.id_client
    GROUP BY c.region
)

SELECT *
FROM stat_commercial
ORDER BY region;


-- Exercice 2 : Calcul des indicateurs opérationnels par région

WITH stat_operationnel AS (
    SELECT
        c.region,
        AVG(d.temps_traitement) AS moyen_traitement,
        COUNT(d.id_demande) AS nb_demande,
        COUNT(DISTINCT d.id_client) AS nb_client
    FROM `formation_sql.demandes` AS d
    INNER JOIN `formation_sql.clients` AS c
        ON d.id_client = c.id_client
    GROUP BY c.region
)

SELECT *
FROM stat_operationnel
ORDER BY region;


-- Exercice 3 : Vue d'ensemble des performances régionales
-- Regroupement des indicateurs commerciaux et opérationnels

WITH stat_commercial AS (
    SELECT
        c.region,
        SUM(v.montant) AS chiffre_affaire,
        COUNT(v.id_vente) AS nb_vente,
        AVG(v.montant) AS panier_moyen
    FROM `formation_sql.ventes` AS v
    INNER JOIN `formation_sql.clients` AS c
        ON v.id_client = c.id_client
    GROUP BY c.region
),

stat_operationnel AS (
    SELECT
        c.region,
        AVG(d.temps_traitement) AS moyen_traitement,
        COUNT(d.id_demande) AS nb_demande,
        COUNT(DISTINCT d.id_client) AS nb_client
    FROM `formation_sql.demandes` AS d
    INNER JOIN `formation_sql.clients` AS c
        ON d.id_client = c.id_client
    GROUP BY c.region
),

stat_client AS (
    SELECT
        COALESCE(so.region, sc.region) AS region,
        sc.chiffre_affaire,
        sc.nb_vente,
        sc.panier_moyen,
        so.moyen_traitement,
        so.nb_demande,
        so.nb_client,

        -- Moyenne des temps moyens régionaux
        AVG(so.moyen_traitement) OVER ()
            AS moyen_du_temps_traitement,

        -- Chiffre d'affaires moyen entre les régions
        AVG(sc.chiffre_affaire) OVER ()
            AS ca_moyen,

        -- Écart entre le CA régional et la moyenne
        sc.chiffre_affaire
            - AVG(sc.chiffre_affaire) OVER ()
            AS ecart_moyen_ca

    FROM stat_commercial AS sc
    FULL OUTER JOIN stat_operationnel AS so
        ON sc.region = so.region
)

SELECT
    *,

    -- Catégorie du chiffre d'affaires
    CASE
        WHEN ecart_moyen_ca > 0
            THEN 'supérieur à la moyenne'
        WHEN ecart_moyen_ca < 0
            THEN 'en dessous de la moyenne'
        ELSE 'dans la moyenne'
    END AS categorie_ca,

    -- Identification des régions prioritaires
    CASE
        WHEN ecart_moyen_ca < 0
            AND moyen_traitement > moyen_du_temps_traitement
            THEN 'prioritaire'
        ELSE 'à surveiller ou normale'
    END AS statut_region

FROM stat_client
ORDER BY region;
