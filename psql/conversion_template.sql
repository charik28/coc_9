
select distinct equip_sens_u from rend25.rendement_ r_;

select id, equip_sens_u from rend25.rendement_ r_
where equip_sens_u ilike '%157%'
;

select distinct equip_sens_u from rend25.rendement r
;
update rend25.rendement_ r_
set equip_sens_u = replace(mun_u,',00','.')
where equip_sens_u like '%,00'--[2025-10-15 08:21:49] 2,143 rows affected in 14 ms
;

select distinct equip_sens_u,left(r_.equip_sens_u,3 )::int4 FROM rend25.rendement_ r_
where substr(r_.equip_sens_u,3,1)=' '
;

UPDATE rend25.rendement
SET equip_sens_u = left(r_.equip_sens_u,3 )::int4
FROM rend25.rendement_ r_
WHERE r_.id = rendement.id
 and (substr(r_.equip_sens_u,3,1)= ' ');--[2025-10-15 08:35:21] 20 rows affected in 4 ms

UPDATE rend25.rendement
SET equip_sens_u = left(r_.equip_sens_u,4 )::int4
FROM rend25.rendement_ r_
WHERE r_.id = rendement.id
  and (length(r_.equip_sens_u)=3);-- 1row (val=400)

UPDATE rend25.rendement
SET equip_sens_u =null
where equip_sens_u =0;--[2025-10-15 08:23:23] 2,130 rows affected in 12 ms

UPDATE rend25.rendement
SET equip_sens_u = equip_sens_m+ 157
where id=5;