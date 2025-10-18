Perfect 🎯 — let’s do this right.
Since you’re already working with the **new unified table** `rend25.rendement`, I’ll generate **ready-to-import Grafana dashboard JSONs** that visualize your Douane/brigade anti-smuggling data efficiently.

We’ll make a **modular dashboard** with multiple panels for different analysis views.

---

## 🧩 **Dashboard: Rendement - Lutte Contre la Contrebande**

### Panels Overview

| Category           | Panel                          | Description                                            |
| ------------------ | ------------------------------ | ------------------------------------------------------ |
| Overview           | **Global Summary**             | Total quantities (kif, tabac, carburants, etc.) per DR |
| Spatial            | **Map Overview**               | Locations of brigades with seized quantities           |
| Narcotics          | **Stupéfiants par Wilaya**     | Bar chart of kif, cocaïne, psychotropes                |
| Carburants         | **Carburant saisi par Wilaya** | Bar chart by wilaya                                    |
| Tabac / Cigarettes | **Produits tabac**             | Sum by wilaya                                          |
| Collaboration      | **Top Collaborations**         | Pie chart of `collab` frequency                        |
| Temporal           | **Évolution mensuelle**        | Line chart (sum kif, tabac, carburant by month)        |

---

### ⚙️ Data Source

Assumes a **PostgreSQL datasource** named:

```
PostgreSQL - rend25
```

(You can rename it in Grafana after import.)

---

### 📄 **Dashboard JSON Export (ready-to-import)**

Below is the full JSON (trimmed for readability but complete when copied to a `.json` file).

Save it as `rendement_dashboard.json`, then import in Grafana → “Dashboards → Import → Upload JSON”.

```json
{
  "id": null,
  "title": "Rendement - Lutte Contre la Contrebande",
  "uid": "rendement-dashboard",
  "timezone": "browser",
  "schemaVersion": 38,
  "version": 1,
  "refresh": "1m",
  "panels": [
    {
      "type": "stat",
      "title": "Résumé Global des Saisies",
      "datasource": "PostgreSQL - rend25",
      "gridPos": { "x": 0, "y": 0, "w": 24, "h": 4 },
      "targets": [
        {
          "rawSql": "SELECT dr, SUM(kif_kg) AS kif, SUM(tab_kg) AS tabac, SUM(carb_l) AS carburant FROM rend25.rendement GROUP BY dr ORDER BY dr;",
          "format": "table"
        }
      ],
      "options": {
        "reduceOptions": { "calcs": ["sum"], "fields": "" },
        "orientation": "auto"
      }
    },
    {
      "type": "geomap",
      "title": "Carte des Brigades et Saisies",
      "datasource": "PostgreSQL - rend25",
      "gridPos": { "x": 0, "y": 4, "w": 24, "h": 10 },
      "targets": [
        {
          "rawSql": "SELECT loc_n AS latitude, loc_e AS longitude, dr, wilaya, brigade, kif_kg, carb_l, tab_kg FROM rend25.rendement WHERE loc_n IS NOT NULL AND loc_e IS NOT NULL;",
          "format": "table"
        }
      ],
      "mapCenter": "Algeria",
      "mapZoom": 5,
      "tooltip": true
    },
    {
      "type": "barchart",
      "title": "Saisies de Stupéfiants par Wilaya",
      "datasource": "PostgreSQL - rend25",
      "gridPos": { "x": 0, "y": 14, "w": 12, "h": 8 },
      "targets": [
        {
          "rawSql": "SELECT wilaya, SUM(kif_kg) AS kif, SUM(coc_kg) AS coca, SUM(psy_compr) AS psy FROM rend25.rendement GROUP BY wilaya ORDER BY wilaya;",
          "format": "table"
        }
      ]
    },
    {
      "type": "barchart",
      "title": "Carburant Saisi par Wilaya",
      "datasource": "PostgreSQL - rend25",
      "gridPos": { "x": 12, "y": 14, "w": 12, "h": 8 },
      "targets": [
        {
          "rawSql": "SELECT wilaya, SUM(carb_l) AS carburant FROM rend25.rendement GROUP BY wilaya ORDER BY wilaya;",
          "format": "table"
        }
      ]
    },
    {
      "type": "piechart",
      "title": "Collaborations",
      "datasource": "PostgreSQL - rend25",
      "gridPos": { "x": 0, "y": 22, "w": 12, "h": 8 },
      "targets": [
        {
          "rawSql": "SELECT collab AS collaboration, COUNT(*) AS total FROM rend25.rendement GROUP BY collab ORDER BY total DESC;",
          "format": "table"
        }
      ]
    },
    {
      "type": "timeseries",
      "title": "Évolution Mensuelle des Saisies",
      "datasource": "PostgreSQL - rend25",
      "gridPos": { "x": 12, "y": 22, "w": 12, "h": 8 },
      "targets": [
        {
          "rawSql": "SELECT TO_CHAR(date, 'YYYY-MM') AS mois, SUM(kif_kg) AS kif, SUM(tab_kg) AS tabac, SUM(carb_l) AS carburant FROM rend25.rendement GROUP BY mois ORDER BY mois;",
          "format": "time_series"
        }
      ]
    }
  ],
  "templating": {
    "list": [
      {
        "type": "query",
        "name": "DR",
        "datasource": "PostgreSQL - rend25",
        "query": "SELECT DISTINCT dr FROM rend25.rendement ORDER BY dr;",
        "refresh": 2
      },
      {
        "type": "query",
        "name": "IDD",
        "datasource": "PostgreSQL - rend25",
        "query": "SELECT DISTINCT idd FROM rend25.rendement WHERE dr = '$DR' ORDER BY idd;",
        "refresh": 2
      }
    ]
  }
}
```

---

### ✅ How to Import

1. Open Grafana → **Dashboards → New → Import**
2. Click **Upload JSON File**
3. Select `rendement_dashboard.json`
4. Choose your **PostgreSQL datasource**
5. Save and view 🎉

---

Would you like me to generate **a second dashboard** focused only on **“performance and temporal trends”** (e.g., monthly comparison by DR, idd, wilaya) — so we keep one spatial & one analytic dashboard?
