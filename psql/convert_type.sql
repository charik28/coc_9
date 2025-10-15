
UPDATE rend25.rendement_
SET loc_e = (
    split_part(regexp_replace(loc_e, '[^0-9° ]', '', 'g'), '°', 1)::numeric +
    split_part(trim(split_part(loc_e, '°', 2)), ' ', 1)::numeric / 60 +
    split_part(trim(split_part(loc_e, '°', 2)), ' ', 2)::numeric / 3600
    )
WHERE loc_e ~ '°';
--97 rows affected in 7 ms
UPDATE rend25.rendement_
SET loc_n = (
    split_part(regexp_replace(loc_n, '[^0-9° ]', '', 'g'), '°', 1)::numeric +
    split_part(trim(split_part(loc_n, '°', 2)), ' ', 1)::numeric / 60 +
    split_part(trim(split_part(loc_n, '°', 2)), ' ', 2)::numeric / 3600
    )
WHERE loc_n ~ '°';
-----------------[2025-10-15 07:56:59] 97 rows affected in 5 ms


select loc_e
FROM rend25.rendement_ r_
where loc_e in (' ', '');

update rend25.rendement_ r_
set loc_e = null,loc_n=null
where
    loc_e in (' ', '')
or    loc_n in (' ', '')

;-----------------[2025-10-15 07:53:00] 299 rows affected in 6 ms

UPDATE rend25.rendement
SET loc_e = NULLIF(r_.loc_e, '0')::numeric(10,6)
FROM rend25.rendement_ r_
WHERE r_.id = rendement.id and r_.loc_e is not null;
-----------------[2025-10-15 07:58:59] 2,146 rows affected in 26 ms


UPDATE rend25.rendement
SET loc_n = NULLIF(r_.loc_n, '0')::numeric(10,6)
FROM rend25.rendement_ r_
WHERE r_.id = rendement.id and r_.loc_n is not null;
-----------------[2025-10-15 07:58:31] 2,146 rows affected in 9 ms

select loc_e,loc_n from rend25.rendement
where  loc_n is not null;-- 97 row only;

UPDATE rend25.rendement
SET topo = null where topo='0';-----------------[2025-10-15 08:01:29] 1,473 rows affected in 6 ms

select distinct armes_u from rend25.rendement_ r_
    where r_.armes_u in (0,1,2,3,4)
    --where r_.armes_u not in (null,'',' ')

;

UPDATE rend25.rendement
SET armes_u = r_.armes_u::int4
FROM rend25.rendement_ r_
WHERE r_.id = rendement.id
and r_.armes_u in (0,1,2,3,4)
-----------------[2025-10-15 08:09:34] 2,145 rows affected in 14 ms

--and r_.armes_u not in (null,'',' ') -- error
;
select distinct mun_u from rend25.rendement_ r_
--where r_.armes_u in (0,1,2,3,4)
--where r_.armes_u not in (null,'',' ')

;
update rend25.rendement_ r_
    set mun_u = replace(mun_u,'.','');

UPDATE rend25.rendement
SET mun_u = r_.mun_u::int4
FROM rend25.rendement_ r_
WHERE r_.id = rendement.id
  and r_.mun_u not in ('',' ');-----------------[2025-10-15 08:14:51] 2,147 rows affected in 15 ms

select distinct equip_sens_m from rend25.rendement_ r_;
select distinct equip_sens_m from rend25.rendement r
;
update rend25.rendement_ r_
set equip_sens_m = replace(mun_u,',00','.')
where equip_sens_m like '%,00'-----------------[2025-10-15 08:21:49] 2,143 rows affected in 14 ms
;

UPDATE rend25.rendement
SET equip_sens_m = replace(r_.equip_sens_m,',' , '.')::numeric(12, 2)
FROM rend25.rendement_ r_
WHERE r_.id = rendement.id
  and r_.equip_sens_m not in ('');-----------------[2025-10-15 08:22:19] 2,144 rows affected in 11 ms

UPDATE rend25.rendement
SET equip_sens_m =null
where equip_sens_m =0;-----------------[2025-10-15 08:23:23] 2,130 rows affected in 12 ms


alter table rend25.rendement add column equip_sens_info varchar;

UPDATE rend25.rendement
SET equip_sens_info = r_.equip_sens_u
FROM rend25.rendement_ r_
WHERE r_.id = rendement.id
  and r_.equip_sens_u not in ('');-----------------[2025-10-15 08:29:42] 2,149 rows affected in 17 ms


--

select distinct equip_sens_u,left(r_.equip_sens_u,3 )::int4 FROM rend25.rendement_ r_
where substr(r_.equip_sens_u,3,1)=' '
;

UPDATE rend25.rendement
SET equip_sens_u = left(r_.equip_sens_u,3 )::int4
FROM rend25.rendement_ r_
WHERE r_.id = rendement.id
  and (substr(r_.equip_sens_u,3,1)= ' ');-----------------[2025-10-15 08:35:21] 20 rows affected in 4 ms

UPDATE rend25.rendement
SET equip_sens_u = left(r_.equip_sens_u,4 )::int4
FROM rend25.rendement_ r_
WHERE r_.id = rendement.id
  and (length(r_.equip_sens_u)=3);-- 1 row (val=400)

UPDATE rend25.rendement
SET equip_sens_u =null
where equip_sens_u =0;-----------------[2025-10-15 08:23:23] 2,130 rows affected in 12 ms

UPDATE rend25.rendement
SET equip_sens_u = equip_sens_m+ 157
where id=5;

-------------- kif
UPDATE rend25.rendement
SET kif_kg = replace(r_.kif_kg,',','.')::numeric(12, 3)
FROM rend25.rendement_ r_
WHERE r_.id = rendement.id
  and r_.kif_kg not in ('');-----------------[2025-10-15 08:47:58] 2,156 rows affected in 11 ms


-----------------------
UPDATE rend25.rendement
SET coc_kg = replace(r_.coc_kg,',','.')::numeric(12, 3)
FROM rend25.rendement_ r_
WHERE r_.id = rendement.id
  and r_.coc_kg not in ('');-----------------[2025-10-15 08:49:15] 2,150 rows affected in 19 ms
---


-- psy_compr
select distinct psy_compr from rend25.rendement_ r_
where psy_compr like '%.%'
;
select distinct psy_compr from rend25.rendement r;

UPDATE rend25.rendement
SET psy_compr = replace(r_.psy_compr,'.','')::numeric(12, 3)
FROM rend25.rendement_ r_
WHERE r_.id = rendement.id
  and r_.psy_compr not in (''); -----------------[2025-10-15 13:29:55] 2,176 rows affected in 18 ms


--- cig_u Cigaretttes
select distinct cig_u from rend25.rendement_ r_;
select distinct cig_u from rend25.rendement r;


UPDATE rend25.rendement
SET cig_u = replace(r_.cig_u,'.','')::int8
FROM rend25.rendement_ r_
WHERE r_.id = rendement.id
  and r_.cig_u not in ('',0);-----------------[2025-10-15 13:33:42] 26 rows affected in 5 ms


-------- tab_kg


UPDATE rend25.rendement
 SET tab_kg = replace(replace(r_.tab_kg,',',''),'.','')::numeric(12, 3)
 FROM rend25.rendement_ r_
 WHERE r_.id = rendement.id
   and r_.tab_kg not in ('');-----------------[2025-10-15 13:38:58] 2,145 rows affected in 19 ms

;


select distinct tab_kg from rend25.rendement_ r_;
select distinct tab_kg from rend25.rendement r;


--------------------- alc_l

select distinct alc_l from rend25.rendement_ r_;
select distinct alc_l from rend25.rendement r;


UPDATE rend25.rendement
SET alc_l = replace(replace(r_.alc_l,',',''),'.','')::numeric(12, 3)
FROM rend25.rendement_ r_
WHERE r_.id = rendement.id
  and r_.alc_l not in ('');
-----------------[2025-10-15 13:39:51] 2,154 rows affected in 21 ms

--------------------- carb_l

select distinct carb_l from rend25.rendement_ r_;
select distinct carb_l from rend25.rendement r;


UPDATE rend25.rendement
SET carb_l = replace(replace(r_.carb_l,',',''),'.','')::numeric(12, 3)
FROM rend25.rendement_ r_
WHERE r_.id = rendement.id
  and r_.carb_l not in ('');
-- [2025-10-15 13:40:23] 2,150 rows affected in 9 ms

--------------------- alim_kg

select distinct alim_kg from rend25.rendement_ r_;
select distinct alim_kg from rend25.rendement r;


UPDATE rend25.rendement
SET alim_kg = replace(replace(r_.alim_kg,',',''),'.','')::numeric(12, 3)
FROM rend25.rendement_ r_
WHERE r_.id = rendement.id
  and r_.alim_kg not in ('');
-----------------[2025-10-15 13:40:49] 2,146 rows affected in 19 ms

--------------------- alim_l

select distinct alim_l from rend25.rendement_ r_;
select distinct alim_l from rend25.rendement r;


UPDATE rend25.rendement
SET alim_l = replace(replace(r_.alim_l,',',''),'.','')::numeric(12, 3)
FROM rend25.rendement_ r_
WHERE r_.id = rendement.id
  and r_.alim_l not in ('');
-----------------[2025-10-15 13:41:47] 2,146 rows affected in 18 ms





