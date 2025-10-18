

select mois ,annee ,date_ from rend25.rendement;

alter table rend25.rendement add column date_ varchar;

UPDATE rend25.rendement
SET date_ = concat('01/',mois,'/',annee)
where date_ is null;
;

UPDATE rend25.rendement SET date_ = replace(date_,'MAI','05');
UPDATE rend25.rendement SET date_ = replace(date_, 'JANVIER', '01');
UPDATE rend25.rendement SET date_ = replace(date_, 'FEVRIER', '02');
UPDATE rend25.rendement SET date_ = replace(date_, 'MARS', '03');
UPDATE rend25.rendement SET date_ = replace(date_, 'AVRIL', '04');
UPDATE rend25.rendement SET date_ = replace(date_, 'MAI', '05');
UPDATE rend25.rendement SET date_ = replace(date_, 'JUIN', '06');
UPDATE rend25.rendement SET date_ = replace(date_, 'JUILLET', '07');
UPDATE rend25.rendement SET date_ = replace(date_, 'AOUT', '08');
UPDATE rend25.rendement SET date_ = replace(date_, 'SEPTEMBRE', '09');
UPDATE rend25.rendement SET date_ = replace(date_, 'OCTOBRE', '10');
UPDATE rend25.rendement SET date_ = replace(date_, 'NOVEMBRE', '11');
UPDATE rend25.rendement SET date_ = replace(date_, 'DECEMBRE', '12');



select distinct date_ from rend25.rendement;
select  periode from rend25.rendement;
select  count(periode) from rend25.rendement; --2445
;
ALTER TABLE rend25.rendement ADD COLUMN periode date;

UPDATE rend25.rendement
SET periode = TO_DATE(date_, 'DD/MM/YYYY')
WHERE annee IS NOT NULL AND mois ~ '^[0-9]{2}$';


    to_char(concat(mois, '/', annee), 'YYYY-MM-DD');