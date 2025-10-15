--------------------- alim_l

select distinct alim_l from rend25.rendement_ r_;
select distinct alim_l from rend25.rendement r;


UPDATE rend25.rendement
SET alim_l = replace(replace(r_.alim_l,',',''),'.','')::numeric(12, 3)
FROM rend25.rendement_ r_
WHERE r_.id = rendement.id
  and r_.alim_l not in ('');
-----------------


