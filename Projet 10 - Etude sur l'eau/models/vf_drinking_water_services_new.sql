{{ config(materialized='view') }}

WITH raw AS(
  SELECT
    year,
    country,
    serie,
    value
  FROM `projet10-467016.dataset.raw_drinking_water_services_*`

  WHERE country IN (SELECT country FROM `projet10-467016.dataset.src_region_country_code`)
  AND value IS NOT NULL
),

Total_b AS(
  SELECT
    year,
    country,
    "Total" AS granularity,
    CASE
      WHEN serie = "People using at least basic drinking water services (% of population)"
    THEN value END AS popu_use_basic_drinking_water_services
  FROM raw
  WHERE serie = "People using at least basic drinking water services (% of population)"
),

Total_m AS(
  SELECT
    year,
    country,
    "Total" AS granularity,
    CASE
      WHEN serie = "People using safely managed drinking water services (% of population)"
    THEN value END AS popu_use_safely_drinking_water_services
  FROM raw
  WHERE serie = "People using safely managed drinking water services (% of population)"
),

Rural_b AS(
  SELECT
    year,
    country,
    "Rural" AS granularity,
    CASE
      WHEN serie = "People using at least basic drinking water services, rural (% of rural population)"
    THEN value END AS popu_use_basic_drinking_water_services,
  FROM raw
  WHERE serie = "People using at least basic drinking water services, rural (% of rural population)"
),

Rural_m AS(
  SELECT
    year,
    country,
    "Rural" AS granularity,
    CASE
      WHEN serie = "People using safely managed drinking water services, rural (% of rural population)"
    THEN value END AS popu_use_safely_drinking_water_services
  FROM raw
  WHERE serie = "People using safely managed drinking water services, rural (% of rural population)"
),

Urban_b AS(
  SELECT
    year,
    country,
    "Urban" AS granularity,
    CASE
      WHEN serie = "People using at least basic drinking water services, urban (% of urban population)"
    THEN value END AS popu_use_basic_drinking_water_services,
  FROM raw
  WHERE serie = "People using at least basic drinking water services, urban (% of urban population)"
),

Urban_m AS(
  SELECT
    year,
    country,
    "Urban" AS granularity,
    CASE
      WHEN serie = "People using safely managed drinking water services, urban (% of urban population)"
    THEN value END AS popu_use_safely_drinking_water_services
  FROM raw
  WHERE serie = "People using safely managed drinking water services, urban (% of urban population)"
),

Total AS(
    SELECT
    tb.year,
    tb.country,
    tb.granularity,
    popu_use_basic_drinking_water_services,
    popu_use_safely_drinking_water_services
    FROM Total_b tb
    LEFT JOIN Total_m tm
    ON tb.year = tm.year AND tb.country = tm.country AND tb.granularity = tm.granularity
),

Rural AS(
    SELECT
    rb.year,
    rb.country,
    rb.granularity,
    popu_use_basic_drinking_water_services,
    popu_use_safely_drinking_water_services
    FROM Rural_b rb
    LEFT JOIN Rural_m rm
    ON rb.year = rm.year AND rb.country = rm.country AND rb.granularity = rm.granularity
),

Urban AS(
    SELECT
    ub.year,
    ub.country,
    ub.granularity,
    popu_use_basic_drinking_water_services,
    popu_use_safely_drinking_water_services
    FROM Urban_b ub
    LEFT JOIN Urban_m um
    ON ub.year = um.year AND ub.country = um.country AND ub.granularity = um.granularity
)

SELECT * FROM Total
UNION ALL
SELECT * FROM Rural
UNION ALL
SELECT * FROM Urban