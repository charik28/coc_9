
select loc_e,loc_n from rend25_rendement r
where loc_n is not null; -- 97

alter table rend25_rendement add column latitude float8(12,6);
alter table rend25_rendement add column latitude numeric(12,6);


ALTER TABLE rend25_rendement
    ADD COLUMN latitude NUMERIC(10,6),
    ADD COLUMN longitude NUMERIC(10,6);


UPDATE rend25_rendement
SET latitude = loc_n,
    longitude = loc_e;
---[2025-10-18 10:00:30] 2,445 rows affected in 15 ms


select * from coc10.brigades;
select * from coc10.rendement_narcotics;

select brigade, r.wilaya,w.latitude,w.longitude
from rend25_rendement r
join coc10.wilaya_coords w on r.wilaya like w.wilaya
;



SELECT dr, idd, brigade, r.wilaya,w.latitude,w.longitude
FROM rend25_rendement r
         join coc10.wilaya_coords w on r.wilaya like w.wilaya
ORDER BY dr, idd, brigade;


-- panel  rend25.vw_map_summary AS
SELECT
    dr,
    idd,
    brigade,
    r.wilaya,w.latitude,w.longitude,
    SUM(kif_kg) AS kif_total,
    SUM(coc_kg) AS coc_total,
    SUM(tab_kg) AS tabac_total,
    SUM(carb_l) AS carburant_total,
    SUM(armes_u) AS armes_total
FROM rend25_rendement r
         left join coc10.wilaya_coords w on r.wilaya = w.wilaya
GROUP BY dr, idd, brigade, r.wilaya, w.latitude, w.longitude;

----
SELECT
    dr,
    idd,
    brigade,
    r.wilaya,w.latitude,w.longitude,
    SUM(kif_kg) AS kif_total
FROM rend25_rendement r
         left join coc10.wilaya_coords w on r.wilaya = w.wilaya
GROUP BY dr, idd, brigade, r.wilaya, w.latitude, w.longitude;


SELECT
    dr,
    idd,
    brigade,
    r.wilaya,w.latitude,w.longitude,
    SUM(kif_kg) AS kif_total,
    periode
FROM rendement r
         left join coc10.wilaya_coords w on r.wilaya = w.wilaya
GROUP BY dr, idd, brigade, r.wilaya, w.latitude, w.longitude,periode
having SUM(kif_kg)> 10
order by SUM(kif_kg) desc
;

alter table rendement add column saisie_type varchar;

select distinct saisie_type from rendement;

update rendement set saisie_type =null;
update rendement set saisie_type =concat(saisie_type,',', 'Kiff' ) where kif_kg >0;
update rendement set saisie_type =concat(saisie_type,',', 'Cocaine' ) where coc_kg >0;
update rendement set saisie_type =concat(saisie_type,',', 'Psychotropics' ) where psy_compr >0;
update rendement set saisie_type =concat(saisie_type,',', 'Cigarettes' ) where cig_u >0;
update rendement set saisie_type =concat(saisie_type,',', 'Alcohol' ) where alc_l >0;
update rendement set saisie_type =concat(saisie_type,',', 'Carburant' ) where carb_l >0;
update rendement set saisie_type =concat(saisie_type,',', 'Weapons' ) where armes_u >0;
update rendement set saisie_type =concat(saisie_type,',', 'Alimentation' ) where alim_l >0 or alim_kg>0 ;

;
