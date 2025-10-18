select max(id)from rend25_rendement;-- 2445
select min(id)from rend25_rendement;-- 2445
select max(id) from rend24_rendement;-- 6655
select min(id) from rend24_rendement;-- 6655

select distinct annee from rend25_rendement r;
select distinct annee from rend24_rendement r;

update rend25_rendement set id= 20250000 + id where annee = 2025;
update rend24_rendement set id= 20240000 + id where annee = 2024;-- 2718
update rend24_rendement set id= 20240000 + id where annee = 2024;-- 2718
update rend24_rendement set id= 20230000 + id where annee = 2023;-- 2035
update rend24_rendement set id= 20220000 + id where annee = 2022;-- 1902


INSERT INTO rendement
(id,mois, annee, dr, idd, brigade, wilaya, collab, loc_e, loc_n, topo, "date", heure, armes_u, type_armes, mun_u, equip_sens_m, equip_sens_u, kif_kg, coc_kg, psy_compr, desc_prod, cig_u, tab_kg, alc_l, carb_l, alim_kg, alim_l, equip_sens_info, date_, periode, latitude, longitude)
SELECT id, mois, annee, dr, idd, brigade, wilaya, collab, loc_e, loc_n, topo, "date", heure, armes_u, type_armes, mun_u, equip_sens_m, equip_sens_u, kif_kg, coc_kg, psy_compr, desc_prod, cig_u, tab_kg, alc_l, carb_l, alim_kg, alim_l, equip_sens_info, date_, periode, latitude, longitude
FROM rend25_rendement
order by id
;

select * from rendement;--9100
select distinct periode from rendement;--9100
select count(*) from rendement;--9100

select distinct dr,r.brigade from rendement r
where brigade not like '%/%'
limit 50 offset 0
;

ALTER TABLE public.rendement DROP COLUMN mois;
ALTER TABLE public.rendement DROP COLUMN annee;
ALTER TABLE public.rendement DROP COLUMN loc_e;
ALTER TABLE public.rendement DROP COLUMN loc_n;
ALTER TABLE public.rendement DROP COLUMN date_;
ALTER TABLE public.rendement DROP COLUMN date;
ALTER TABLE public.rendement DROP COLUMN heure;
