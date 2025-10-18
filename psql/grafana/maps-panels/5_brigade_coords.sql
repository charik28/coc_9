
CREATE TABLE coc10.brigade_coords (
                                      dr varchar(100) NOT NULL,
                                      brigade varchar(100) NOT NULL,
                                      latitude float4 NULL,
                                      longitude float4 NULL
);
alter table coc10.brigade_coords add constraint brigade_coords_pkey primary key (dr, brigade);

/*
 map those new brigades to approximate coordinates
 */

select distinct r.dr ,r.brigade from rendement r
where r.brigade not like '%/%' and concat(r.dr,r.brigade) not in
(select concat(b.dr,b.brigade) from coc10.brigade_coords b)
order by r.dr,r.brigade
limit 40 offset 2
;

select count(distinct(r.dr ,r.brigade)) from rendement r;
select count(distinct(r.dr ,r.brigade)) from coc10.brigade_coords r;--81
select count(distinct(r.dr ,r.brigade)) from rendement r
where r.brigade not like '%/%' and concat(r.dr,r.brigade) not in
(select concat(b.dr,b.brigade) from coc10.brigade_coords b)
order by r.dr,r.brigade
limit 40 offset 2
;