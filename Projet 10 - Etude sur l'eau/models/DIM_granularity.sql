{{ config(materialized='table') }}

SELECT DISTINCT
  granularity,
CASE
  WHEN granularity = 'Total' THEN 1
  WHEN granularity = 'Urban' THEN 2
  WHEN granularity = 'Rural' THEN 3
  WHEN granularity = 'Female' THEN 4
  WHEN granularity = 'Male' THEN 5
END AS granularity_order

FROM {{ ref('td_country_year_granularity') }}