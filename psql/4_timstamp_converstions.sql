

select distinct mois ,annee ,date_,periode from public.rend24_rendement;

-- alter table public.rend24_rendement add column date_ varchar;

UPDATE public.rend24_rendement
SET date_ = concat('01/',mois,'/',annee)
where date_ is null;
;
UPDATE public.rend24_rendement
SET date_ = replace(date_,'//','/')
where date_ like '%//%';
;

UPDATE public.rend24_rendement SET date_ = replace(date_,'MAI','05');
UPDATE public.rend24_rendement SET date_ = replace(date_, 'JANVIER', '01');
UPDATE public.rend24_rendement SET date_ = replace(date_, 'FEVRIER', '02');
UPDATE public.rend24_rendement SET date_ = replace(date_, 'MARS', '03');
UPDATE public.rend24_rendement SET date_ = replace(date_, 'AVRIL', '04');
UPDATE public.rend24_rendement SET date_ = replace(date_, 'MAI', '05');
UPDATE public.rend24_rendement SET date_ = replace(date_, 'JUIN', '06');
UPDATE public.rend24_rendement SET date_ = replace(date_, 'JUILLET', '07');
UPDATE public.rend24_rendement SET date_ = replace(date_, 'AOUT', '08');
UPDATE public.rend24_rendement SET date_ = replace(date_, 'SEPTEMBRE', '09');
UPDATE public.rend24_rendement SET date_ = replace(date_, 'OCTOBRE', '10');
UPDATE public.rend24_rendement SET date_ = replace(date_, 'NOVEMBRE', '11');
UPDATE public.rend24_rendement SET date_ = replace(date_, 'DECEMBRE', '12');



select distinct date_ from public.rend24_rendement;
select  periode from public.rend24_rendement;
select  count(periode) from public.rend24_rendement; --2445
;
ALTER TABLE public.rend24_rendement ADD COLUMN periode timestamp;
ALTER TABLE public.rend24_rendement alter COLUMN periode type timestamp;

UPDATE public.rend24_rendement
SET periode = to_timestamp(date_, 'DD/MM/YYYY')
-- WHERE annee IS NOT NULL AND mois ~ '^[0-9]{2}$';
;

