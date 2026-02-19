{{ config(materialized='view') }}

WITH new_data AS(
  SELECT
    {{ normalize_country('country') }} AS country,
    year,
    "Total" AS granularity,
    political_stability

FROM `projet10-467016.dataset.src_political_stability_*`

WHERE country IN (SELECT country FROM {{ ref('td_region_country') }})
  AND political_stability IS NOT NULL
),

union_data AS(
  SELECT country, year, granularity, political_stability
  FROM `projet10-467016.dataset.src_political_stability`
  UNION DISTINCT
  SELECT country, year, granularity, political_stability
  FROM new_data
)

SELECT
  {{ concat_country_year() }} as country_year,
  country,
  year,
  granularity,
  political_stability,
  CASE
    WHEN political_stability > 1 THEN 1 -- Pays stable
    WHEN political_stability > 0 THEN 2 -- Pays moyennement stable
    WHEN political_stability > -1 THEN 3 -- Pays instable
    WHEN political_stability > -2 THEN 4 -- Pays très instable
    ELSE 5 -- Pays extrêmement instable
  END AS order_political_stability

FROM union_data