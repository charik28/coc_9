Good question 👍

Since your data already contains geographic coordinates (`loc_n`, `loc_e`), and you want to add a clean, standardized `latitude` column (and maybe `longitude` too), here are your best options depending on what you plan to do:

---

### ✅ **Option 1 — Simple numeric storage (recommended for dashboards and filtering)**

```sql
ALTER TABLE rend25.rendement
ADD COLUMN latitude NUMERIC(10,6),
ADD COLUMN longitude NUMERIC(10,6);
```

Then you can populate them easily:

```sql
UPDATE rend25.rendement
SET latitude = loc_n,
    longitude = loc_e;
```

➡️ This is the **simplest and fastest** option for Grafana, Leaflet, or REST APIs — because those tools read numeric lat/lng columns directly.

---

### 🌍 **Option 2 — Geospatial (PostGIS) storage (for advanced spatial analysis)**

If your PostgreSQL has **PostGIS** enabled:

```sql
ALTER TABLE rend25.rendement
ADD COLUMN geom geometry(Point, 4326);
```

Populate it:

```sql
UPDATE rend25.rendement
SET geom = ST_SetSRID(ST_MakePoint(loc_e, loc_n), 4326);
```

➡️ This allows spatial queries such as:

```sql
SELECT * FROM rend25.rendement
WHERE ST_DWithin(geom, ST_SetSRID(ST_MakePoint(3.05, 36.75), 4326), 0.1);
```

---

### ⚙️ **Summary**

| Purpose              | Column Type             | Example                       |
| -------------------- | ----------------------- | ----------------------------- |
| Simple visualization | `NUMERIC(10,6)`         | Grafana, Leaflet              |
| Spatial analysis     | `geometry(Point, 4326)` | GeoServer, QGIS, advanced SQL |

---

Would you like me to create a **materialized view** that includes the lat/lng plus summarized stats (e.g. total seized per wilaya, brigade, or DR) for use in your new spatial dashboards?
