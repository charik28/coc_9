/**
  Then identify strategic materialized or analytic views that can extract new insights — useful for map visualization, dashboards, trend detection, and alerts.

  🧭 2️⃣ What This Data Represents

Each row = one incident / operation / seizure report made by a brigade under a given IDD and DR.

So this table captures quantitative seizures and contextual info:

📍 Geographic location

🧍 Organizational hierarchy (DR → IDD → Brigade)

🕒 Temporal data (month, year, date, hour)

⚖️ Quantities of goods seized

🔫 Weapons, drugs, fuel, etc.
 */
-- todo: create spring OrgnSservice
CREATE MATERIALIZED VIEW rend25.vw_org_filters AS
SELECT DISTINCT dr, idd, brigade
FROM rend25.rendement
WHERE dr IS NOT NULL AND idd IS NOT NULL AND brigade IS NOT NULL
ORDER BY dr, idd, brigade;

/**
  🗺️ B. Geographic Intelligence
2️⃣ vw_map_summary

Summarize each brigade’s total seizures + location.
 */

CREATE MATERIALIZED VIEW rend25.vw_map_summary AS
SELECT
    dr,
    idd,
    brigade,
    wilaya,
    AVG(loc_n) AS lat,
    AVG(loc_e) AS lng,
    SUM(kif_kg) AS kif_total,
    SUM(coc_kg) AS coc_total,
    SUM(tab_kg) AS tabac_total,
    SUM(carb_l) AS carburant_total,
    SUM(armes_u) AS armes_total
FROM rend25.rendement
GROUP BY dr, idd, brigade, wilaya;

/**
  📈 C. Temporal Trends
3️⃣ vw_monthly_trends

Aggregated per month/year & DR.
 */
CREATE MATERIALIZED VIEW rend25.vw_monthly_trends AS
SELECT
    annee,
    mois,
    dr,
    SUM(kif_kg) AS kif_total,
    SUM(coc_kg) AS coc_total,
    SUM(psy_compr) AS psychotropes_total,
    SUM(carb_l) AS carburant_total,
    SUM(armes_u) AS armes_total
FROM rend25.rendement
GROUP BY annee, mois, dr
ORDER BY annee, mois, dr;
