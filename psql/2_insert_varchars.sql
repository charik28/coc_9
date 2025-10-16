SET lc_time = 'fr_FR.UTF-8';
/*
INSERT INTO rend25.rendement (
    id, mois, annee, dr, idd, brigade, wilaya, collab,
    loc_e, loc_n, topo, date, heure,
    armes_u, type_armes, mun_u, equip_sens_m, equip_sens_u,
    kif_kg, coc_kg, psy_compr, desc_prod,
    cig_u, tab_kg, alc_l, carb_l, alim_kg, alim_l
)
SELECT
    id::int,
    mois,
    NULLIF(annee, '0')::int,
    dr,
    idd,
    brigade,
    wilaya,
    collab,
    NULLIF(loc_e, '0')::numeric(10,6),
    NULLIF(loc_n, '0')::numeric(10,6),
    topo,
    CASE
        WHEN trim("date") = '' OR "date" IS NULL THEN NULL
        ELSE to_date("date", 'DD TMMonth YYYY')
        END AS date,
    CASE
        WHEN trim(heure) = '' OR heure IS NULL THEN NULL
        ELSE heure::time
        END AS heure,
    NULLIF(armes_u, '0')::int,
    type_armes,
    NULLIF(mun_u, '0')::int,
    NULLIF(equip_sens_m, '0')::numeric(12,2),
    NULLIF(equip_sens_u, '0')::int,
    NULLIF(kif_kg, '0')::numeric(12,3),
    NULLIF(coc_kg, '0')::numeric(12,3),
    NULLIF(psy_compr, '0')::int,
    desc_prod,
    NULLIF(cig_u, '0')::bigint,
    NULLIF(tab_kg, '0')::numeric(12,2),
    NULLIF(alc_l, '0')::numeric(12,2),
    NULLIF(carb_l, '0')::numeric(12,2),
    NULLIF(alim_kg, '0')::numeric(12,2),
    NULLIF(alim_l, '0')::numeric(12,2)
FROM rend25.rendement_;

*/
INSERT INTO rend25.rendement (
    id,
    mois,
    annee,
    dr,
    idd,
    brigade,
    wilaya,
    collab,
    topo,
    type_armes,
    desc_prod
)
SELECT
    id::int,
    mois,
    NULLIF(annee, '0')::int,
    dr,
    idd,
    brigade,
    wilaya,
    collab,
    topo,
    type_armes,
    desc_prod
FROM rend25.rendement_;
-- wadoo [2025-10-15 07:50:09] 2,445 rows affected in 21 ms
--asus   [2025-10-16 05:57:01] 2,445 rows affected in 15 ms


