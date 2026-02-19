{{ config(materialized='table') }}


WITH years AS(
  SELECT DISTINCT country, year, granularity FROM {{ ref('FAIT_population') }}
  UNION DISTINCT
  SELECT DISTINCT country, year, granularity FROM {{ ref('FAIT_mortality_rate_water') }}
  UNION DISTINCT
  SELECT DISTINCT country, year, granularity FROM {{ ref('vf_political_stability') }}
  UNION DISTINCT
  SELECT DISTINCT country, year, granularity FROM {{ ref('FAIT_drinking_water_services') }}
)

SELECT DISTINCT
  years.country,
  years.year,
  years.granularity

FROM years