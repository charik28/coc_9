
-- Adds subtle coordinate variation to unstack markers
UPDATE rendement
SET
    latitude = w.latitude + (random() - 0.5) * 0.04,  -- ±0.02° offset
    longitude = w.longitude + (random() - 0.5) * 0.04
FROM coc10.wilaya_coords w
WHERE rendement.wilaya = w.wilaya
  AND (rendement.latitude IS NULL OR rendement.longitude IS NULL); -- 9100


  select distinct rendement.latitude , rendement.longitude from rendement;
