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

select distinct saisie_icon,icon_color
from rendement;
/*
update rendement
set saisie_type =null;
*/


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

-- Add the color column if not exists
ALTER TABLE rendement ADD COLUMN IF NOT EXISTS icon_color VARCHAR;

-- Update saisie_icon and icon_color based on the max-value saisie type
UPDATE rendement
SET
    saisie_icon = sub.icon,
    icon_color = sub.color
FROM (
         SELECT
             id,
             CASE
                 WHEN kif_kg = GREATEST(kif_kg, coc_kg, psy_compr, cig_u, alc_l, carb_l, armes_u, alim_l, alim_kg) THEN 'cannabis-solid.svg'
                 WHEN coc_kg = GREATEST(kif_kg, coc_kg, psy_compr, cig_u, alc_l, carb_l, armes_u, alim_l, alim_kg) THEN 'syringe-solid.svg'
                 WHEN psy_compr = GREATEST(kif_kg, coc_kg, psy_compr, cig_u, alc_l, carb_l, armes_u, alim_l, alim_kg) THEN 'capsules-solid.svg'
                 WHEN cig_u = GREATEST(kif_kg, coc_kg, psy_compr, cig_u, alc_l, carb_l, armes_u, alim_l, alim_kg) THEN 'smoking-solid.svg'
                 WHEN alc_l = GREATEST(kif_kg, coc_kg, psy_compr, cig_u, alc_l, carb_l, armes_u, alim_l, alim_kg) THEN 'wine-bottle-solid.svg'
                 WHEN carb_l = GREATEST(kif_kg, coc_kg, psy_compr, cig_u, alc_l, carb_l, armes_u, alim_l, alim_kg) THEN 'gas-pump-solid.svg'
                 WHEN armes_u = GREATEST(kif_kg, coc_kg, psy_compr, cig_u, alc_l, carb_l, armes_u, alim_l, alim_kg) THEN 'gun-solid.svg'
                 WHEN alim_l = GREATEST(kif_kg, coc_kg, psy_compr, cig_u, alc_l, carb_l, armes_u, alim_l, alim_kg)
                     OR alim_kg = GREATEST(kif_kg, coc_kg, psy_compr, cig_u, alc_l, carb_l, armes_u, alim_l, alim_kg)
                     THEN 'Huiles-Cevital-Elio-5L.svg'
                 ELSE NULL
                 END AS icon,

             CASE
                 WHEN kif_kg = GREATEST(kif_kg, coc_kg, psy_compr, cig_u, alc_l, carb_l, armes_u, alim_l, alim_kg) THEN '#27ae60'   -- green
                 WHEN coc_kg = GREATEST(kif_kg, coc_kg, psy_compr, cig_u, alc_l, carb_l, armes_u, alim_l, alim_kg) THEN '#8e44ad'   -- purple
                 WHEN psy_compr = GREATEST(kif_kg, coc_kg, psy_compr, cig_u, alc_l, carb_l, armes_u, alim_l, alim_kg) THEN '#3498db' -- blue
                 WHEN cig_u = GREATEST(kif_kg, coc_kg, psy_compr, cig_u, alc_l, carb_l, armes_u, alim_l, alim_kg) THEN '#d35400'   -- orange
                 WHEN alc_l = GREATEST(kif_kg, coc_kg, psy_compr, cig_u, alc_l, carb_l, armes_u, alim_l, alim_kg) THEN '#c0392b'   -- red wine
                 WHEN carb_l = GREATEST(kif_kg, coc_kg, psy_compr, cig_u, alc_l, carb_l, armes_u, alim_l, alim_kg) THEN '#f1c40f'   -- yellow
                 WHEN armes_u = GREATEST(kif_kg, coc_kg, psy_compr, cig_u, alc_l, carb_l, armes_u, alim_l, alim_kg) THEN '#2c3e50'  -- dark grey
                 WHEN alim_l = GREATEST(kif_kg, coc_kg, psy_compr, cig_u, alc_l, carb_l, armes_u, alim_l, alim_kg)
                     OR alim_kg = GREATEST(kif_kg, coc_kg, psy_compr, cig_u, alc_l, carb_l, armes_u, alim_l, alim_kg)
                     THEN '#f39c12' -- golden oil
                 ELSE '#bdc3c7' -- default grey
                 END AS color
         FROM rendement
     ) AS sub
WHERE rendement.id = sub.id;

select distinct saisie_icon,icon_color
from rendement;

SELECT dr,
       idd,
       brigade,
       latitude,
       longitude,
       SUM(psy_compr)  AS psy_compr_total,
       SUM(kif_kg)  AS kif_total,
       SUM(coc_kg)  AS coc_total,
       SUM(tab_kg)  AS tabac_total,
       SUM(carb_l)  AS carburant_total,
       SUM(armes_u) AS armes_total,
       concat('img/icons/marker/',saisie_icon) as saisie_icon,
       icon_color
FROM rendement r
where saisie_icon='capsules-solid.svg'
GROUP BY dr, idd, brigade,  latitude, longitude, saisie_icon, icon_color
;