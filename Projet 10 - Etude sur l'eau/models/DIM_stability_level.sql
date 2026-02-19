{{ config(materialized='table') }}

SELECT DISTINCT
  country_year,
  order_political_stability,
  CASE
    WHEN order_political_stability = 1 THEN "Stable"
    WHEN order_political_stability = 2 THEN "Moyennement stable"
    WHEN order_political_stability = 3 THEN "Instable"
    WHEN order_political_stability = 4 THEN "Très instable"
    WHEN order_political_stability = 5 THEN "Extrêmement instable"
  END AS stability_level,

FROM {{ ref('vf_political_stability') }}
ORDER BY order_political_stability