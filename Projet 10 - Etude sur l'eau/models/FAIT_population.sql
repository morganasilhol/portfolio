{{ config(materialized='table') }}

WITH population AS(
  SELECT
    {{ normalize_country('country') }} AS country,
    year,
    granularity,
    CAST(population * 1000 AS INT64) AS population
  FROM `projet10-467016.dataset.src_population*`
  )

SELECT 
  {{ concat_country_year() }} as country_year,
  *

FROM population