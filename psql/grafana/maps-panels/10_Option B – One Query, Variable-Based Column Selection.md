Splitting that `vw_map_summary` view into **multiple heatmap layers** in Grafana is the fun kind of pain — the “map-glows-but-everyone’s-yelling-about-performance” kind. Let’s go step-by-step before your dashboards become spaghetti.

---

### 1. Your Data Source (PostgreSQL)

You’ve already got a clean aggregated view:

```sql
SELECT
    dr,
    idd,
    brigade,
    r.wilaya,
    w.latitude,
    w.longitude,
    SUM(kif_kg) AS kif_total,
    SUM(coc_kg) AS coc_total,
    SUM(tab_kg) AS tabac_total,
    SUM(carb_l) AS carburant_total,
    SUM(armes_u) AS armes_total
FROM rend25_rendement r
LEFT JOIN coc10.wilaya_coords w ON r.wilaya = w.wilaya
GROUP BY dr, idd, brigade, r.wilaya, w.latitude, w.longitude
having (kif_total+coc_total)>1

```

You’ll use this as your main query in Grafana.

---

### 2. Creating Grafana **Variables**

Variables let you dynamically filter and control which layer(s) appear.
Go to **Dashboard → Settings → Variables → New variable**.

Here’s what you should define:

| Name     | Type       | Query Example                                                        | Purpose                              |
| -------- | ---------- | -------------------------------------------------------------------- | ------------------------------------ |
| `layer`  | **Custom** | `kif,coc,tabac,carburant,armes`                                      | To select which product to visualize |
| `dr`     | **Query**  | `SELECT DISTINCT dr FROM rend25.vw_map_summary ORDER BY dr;`         | Filter by regional direction         |
| `wilaya` | **Query**  | `SELECT DISTINCT wilaya FROM rend25.vw_map_summary ORDER BY wilaya;` | Filter by wilaya                     |

---

### 3. Splitting Layers in Grafana

You’ve got **five logical layers** here:

* kif (cannabis)
* coc (cocaine)
* tabac (tobacco)
* carburant (fuel)
* armes (weapons)

Each one can be a **separate heatmap layer** in the same map panel.

#### Option A – Multiple Queries in the Same Panel

1. Create one **Map panel** (e.g., “Rendement Heatmap”).
2. Add a query per product, like:

```sql
-- Query A: kif
SELECT latitude, longitude, kif_total AS intensity
FROM rend25.vw_map_summary
WHERE kif_total > 0
  AND (${dr:sql-condition}) 
  AND (${wilaya:sql-condition});

-- Query B: coc
SELECT latitude, longitude, coc_total AS intensity
FROM rend25.vw_map_summary
WHERE coc_total > 0
  AND (${dr:sql-condition}) 
  AND (${wilaya:sql-condition})
```

Each query → its own **layer** in the Map panel:

* Under “Visualization → Layers”, click “Add layer”.
* Set each layer’s **color gradient** (e.g. green for kif, red for coc, etc.).
* Make sure **“Intensity”** uses the numeric column (e.g. `kif_total`).

---

#### Option B – One Query, Variable-Based Column Selection

If you prefer a **single dynamic layer** controlled by the `layer` variable:

```sql
SELECT
    latitude,
    longitude,
    CASE
        WHEN '${layer}' = 'kif' THEN kif_total
        WHEN '${layer}' = 'coc' THEN coc_total
        WHEN '${layer}' = 'tabac' THEN tabac_total
        WHEN '${layer}' = 'carburant' THEN carburant_total
        WHEN '${layer}' = 'armes' THEN armes_total
    END AS intensity
FROM rend25.vw_map_summary
WHERE (${dr:sql-condition})
  AND (${wilaya:sql-condition})
```

Then use `${layer}` as a dropdown to switch layers dynamically.

---

### 4. Configuring the Map Visualization

In **Grafana → Panel editor → Visualization → Geomap**:

* **Layer type:** Heatmap
* **Data mapping:**

    * Latitude field → `latitude`
    * Longitude field → `longitude`
    * Intensity → `intensity`
* Adjust **radius**, **blur**, and **color gradient** per dataset scale.
* Optionally, add **Tooltips** to show details like `wilaya`, `brigade`, etc.

---

### 5. Optional: Auto-Scaling per Layer

To make each layer visually balanced (because weapons counts ≠ fuel liters), normalize intensity:

```sql
SELECT
  latitude,
  longitude,
  CASE
    WHEN '${layer}' = 'kif' THEN kif_total / MAX(kif_total) OVER ()
    WHEN '${layer}' = 'coc' THEN coc_total / MAX(coc_total) OVER ()
    WHEN '${layer}' = 'tabac' THEN tabac_total / MAX(tabac_total) OVER ()
    WHEN '${layer}' = 'carburant' THEN carburant_total / MAX(carburant_total) OVER ()
    WHEN '${layer}' = 'armes' THEN armes_total / MAX(armes_total) OVER ()
  END AS intensity
FROM rend25.vw_map_summary
```

This avoids one huge dataset overshadowing smaller ones.

---

### 6. Optional Bonus: Combined Overlay

If you want all layers visible together, create **five sub-panels**, each filtered for one product, and put them in a single **Geomap Dashboard Group**. Grafana will merge the visuals at runtime.

---

You’ll end up with a clean map that can:

* Switch focus via dropdown (`${layer}`),
* Filter by `dr` or `wilaya`,
* Display density per type, each in its own heat color.

---

Would you like me to give you an example of the exact **Grafana panel JSON** (with variable bindings and layer setup) to import directly into your dashboard?
