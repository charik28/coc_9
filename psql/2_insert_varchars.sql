
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
    NULLIF("date", '')::date,
    NULLIF(heure, '')::time,
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
