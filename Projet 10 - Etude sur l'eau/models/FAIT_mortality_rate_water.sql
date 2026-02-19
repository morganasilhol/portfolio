{{ config(materialized='table') }}

WITH m AS(
  SELECT 
    year,
    {{ normalize_country('country') }} AS country,
    granularity,
    mortality_rate_attributed_unsafe_WASH_services,
    WASH_deaths
  FROM `projet10-467016.dataset.src_mortality_rate_water`

  UNION ALL

  SELECT
  year,
  {{ normalize_country('country') }} AS country,
  granularity,
  mortality_rate_attributed_unsafe_WASH_services,
  CAST(NULL AS FLOAT64) AS WASH_deaths
  FROM `projet10-467016.dataset.src_mortality_rate_water_*`
),

p AS(
  SELECT 
    year,
    country,
    granularity,
    population,
  FROM {{ ref('FAIT_population') }}

  WHERE year IN(SELECT year FROM m)
)

SELECT
  CONCAT(m.country, " - ", m.year) as country_year,
  m.year,
  m.country,
  m.granularity,
  m.mortality_rate_attributed_unsafe_WASH_services,
  CAST(
    ROUND(
      CASE
    WHEN WASH_deaths IS NOT NULL THEN WASH_deaths
    WHEN WASH_deaths IS NULL AND p.population IS NOT NULL AND mortality_rate_attributed_unsafe_WASH_services IS NOT NULL
      THEN mortality_rate_attributed_unsafe_WASH_services / 100000 * p.population
  END
    ) AS INT64
  ) AS WASH_deaths,
  population

  FROM m
  LEFT JOIN p 
  ON p.country = m.country AND p.year = m.year AND p.granularity = m.granularity