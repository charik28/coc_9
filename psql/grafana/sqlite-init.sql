


SELECT dr, SUM(kif_kg) AS kif, SUM(tab_kg) AS tabac, SUM(carb_l) AS carburant FROM rend25.rendement GROUP BY dr ORDER BY dr;


CREATE ROLE grafana NOSUPERUSER NOCREATEDB NOCREATEROLE NOINHERIT LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'grafana';
GRANT USAGE ON SCHEMA public TO grafana;
GRANT USAGE ON SCHEMA rend25 TO grafana;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO grafana;
ALTER DEFAULT PRIVILEGES IN SCHEMA rend25 GRANT SELECT ON TABLES TO grafana;


create schema if not exists public;
SELECT collab AS collaboration, COUNT(*) AS total FROM rend25.rendement GROUP BY collab ORDER BY total DESC;




alter table rend25.rendement rename to rend25_rendement;
alter table jhi.rend25_rendement set schema public;
alter table rend25.rend25_rendement set schema public;

alter table rend24.rendement rename to rend24_rendement;
alter table rend25.rend25_rendement set schema public;

select * from rend25_rendement;