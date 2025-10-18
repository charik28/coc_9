-- A ::gun-solid.svg
SELECT dr,
       idd,
       brigade,
       r.wilaya,
       latitude,
       longitude,
       SUM(kif_kg)  AS kif_total,
       SUM(coc_kg)  AS coc_total,
       SUM(tab_kg)  AS tabac_total,
       SUM(carb_l)  AS carburant_total,
       SUM(armes_u) AS armes_total,
       concat('img/icons/marker/',saisie_icon) as icon,
       icon_color
FROM rendement r
where saisie_icon='gun-solid.svg'
GROUP BY dr, idd, brigade, r.wilaya, latitude, longitude, saisie_icon, saisie_type,icon_color
having SUM(armes_u) > 100
;