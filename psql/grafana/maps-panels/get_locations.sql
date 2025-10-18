select loc_e, loc_n
from rend25_rendement r
where loc_n is not null; -- 97

alter table rend25_rendement
    add column latitude float8(12, 6);
alter table rend25_rendement
    add column latitude numeric(12, 6);


ALTER TABLE rend25_rendement
    ADD COLUMN latitude  NUMERIC(10, 6),
    ADD COLUMN longitude NUMERIC(10, 6);


UPDATE rend25_rendement
SET latitude  = loc_n,
    longitude = loc_e;
---[2025-10-18 10:00:30] 2,445 rows affected in 15 ms


select *
from coc10.brigades;
select *
from coc10.rendement_narcotics;

select brigade, r.wilaya, w.latitude, w.longitude
from rend25_rendement r
         join coc10.wilaya_coords w on r.wilaya like w.wilaya
;



SELECT dr, idd, brigade, r.wilaya, w.latitude, w.longitude
FROM rend25_rendement r
         join coc10.wilaya_coords w on r.wilaya like w.wilaya
ORDER BY dr, idd, brigade;


-- panel  rend25.vw_map_summary AS
SELECT dr,
       idd,
       brigade,
       r.wilaya,
       w.latitude,
       w.longitude,
       SUM(kif_kg)  AS kif_total,
       SUM(coc_kg)  AS coc_total,
       SUM(tab_kg)  AS tabac_total,
       SUM(carb_l)  AS carburant_total,
       SUM(armes_u) AS armes_total,
       saisie_icon,
       saisie_type
FROM rendement r
         left join coc10.wilaya_coords w on r.wilaya = w.wilaya
GROUP BY dr, idd, brigade, r.wilaya, w.latitude, w.longitude, saisie_icon, saisie_type;

----
SELECT dr,
       idd,
       brigade,
       r.wilaya,
       w.latitude,
       w.longitude,
       SUM(kif_kg) AS kif_total
FROM rend25_rendement r
         left join coc10.wilaya_coords w on r.wilaya = w.wilaya
GROUP BY dr, idd, brigade, r.wilaya, w.latitude, w.longitude;


SELECT dr,
       idd,
       brigade,
       r.wilaya,
       w.latitude,
       w.longitude,
       SUM(kif_kg) AS kif_total,
       periode
FROM rendement r
         left join coc10.wilaya_coords w on r.wilaya = w.wilaya
GROUP BY dr, idd, brigade, r.wilaya, w.latitude, w.longitude, periode
having SUM(kif_kg) > 10
order by SUM(kif_kg) desc
;

alter table rendement
    add column saisie_type varchar;

select distinct saisie_type
from rendement;

update rendement
set saisie_type =null;



UPDATE rendement
SET saisie_type = TRIM(BOTH ',' FROM CONCAT_WS(',',
                                               CASE WHEN kif_kg > 0 THEN 'Kiff' END,
                                               CASE WHEN coc_kg > 0 THEN 'Cocaine' END,
                                               CASE WHEN psy_compr > 0 THEN 'Psychotropics' END,
                                               CASE WHEN cig_u > 0 THEN 'Cigarettes' END,
                                               CASE WHEN alc_l > 0 THEN 'Alcohol' END,
                                               CASE WHEN carb_l > 0 THEN 'Carburant' END,
                                               CASE WHEN armes_u > 0 THEN 'Weapons' END,
                                               CASE WHEN alim_l > 0 OR alim_kg > 0 THEN 'Alimentation' END
                                     ));
;

ALTER TABLE rendement ADD COLUMN saisie_icon VARCHAR;
ALTER TABLE rendement ADD COLUMN icon_color VARCHAR;


/*
UPDATE rendement
SET saisie_icon = CASE
                      WHEN kif_kg > 0 THEN 'fa-cannabis'
                      WHEN coc_kg > 0 THEN 'fa-syringe'
                      WHEN psy_compr > 0 THEN 'fa-capsules'
                      WHEN cig_u > 0 THEN 'fa-smoking'
                      WHEN alc_l > 0 THEN 'fa-wine-bottle'
                      WHEN carb_l > 0 THEN 'fa-gas-pump'
                      WHEN armes_u > 0 THEN 'fa-gun'
                      WHEN alim_l > 0 OR alim_kg > 0 THEN 'fa-apple-whole'
                      ELSE 'fa-circle'  -- fallback for no saisie
    END;

*/
--Compute the icon of the “dominant” saisie type
UPDATE rendement r
SET saisie_icon = (SELECT icon
                   FROM (VALUES ('fa-cannabis', kif_kg),
                                ('fa-syringe', coc_kg),
                                ('fa-capsules', psy_compr),
                                ('fa-smoking', cig_u),
                                ('fa-wine-bottle', alc_l),
                                ('fa-gas-pump', carb_l),
                                ('fa-gun', armes_u),
                                ('fa-apple-whole', GREATEST(alim_l, alim_kg))) AS t(icon, val)
                   WHERE val IS NOT NULL
                   ORDER BY val DESC
                   LIMIT 1);

select distinct saisie_icon
from rendement;


