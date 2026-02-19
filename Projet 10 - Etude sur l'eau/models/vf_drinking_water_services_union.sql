{{ config(materialized='view') }}

WITH water AS(
SELECT
  {{ normalize_country('country') }} AS country,
  year,
  granularity,
  popu_use_basic_drinking_water_services,
  popu_use_safely_drinking_water_services

FROM `projet10-467016.dataset.src_drinking_water_services`
),

new_water AS(
SELECT
  {{ normalize_country('country') }} AS country,
  year,
  granularity,
  popu_use_basic_drinking_water_services,
  popu_use_safely_drinking_water_services

FROM {{ ref('vf_drinking_water_services_new') }}
)

SELECT * FROM water
UNION DISTINCT
SELECT * FROM new_water