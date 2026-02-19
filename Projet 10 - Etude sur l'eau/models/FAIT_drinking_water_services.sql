{{ config(materialized='table') }}

WITH p AS(
  SELECT 
    year,
    country,
    granularity,
    population
  FROM {{ ref('FAIT_population') }}

  WHERE granularity IN('Urban', 'Rural', 'Total')
),

water AS(
SELECT
  CASE
    WHEN country = 'North Macedonia' THEN 'Republic of North Macedonia'
    ELSE country
  END AS country,
  year,
  granularity,
  CASE
    WHEN popu_use_basic_drinking_water_services > 100 THEN 100
    ELSE popu_use_basic_drinking_water_services
  END AS popu_use_basic_drinking_water_services,
  popu_use_safely_drinking_water_services

FROM {{ ref('vf_drinking_water_services_union') }}
),

w AS (
SELECT 
  {{ concat_country_year() }} as country_year,
  *

  FROM water
  )

SELECT
  w.*,
  p.population

FROM w
LEFT JOIN p
ON p.country = w.country AND p.year = w.year AND p.granularity = w.granularity

WHERE 
  NOT (popu_use_basic_drinking_water_services IS NULL AND popu_use_safely_drinking_water_services IS NULL)