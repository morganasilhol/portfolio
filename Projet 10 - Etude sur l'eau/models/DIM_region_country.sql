{{ config(materialized='table') }}

SELECT DISTINCT
  region,
  country,
  country_code_alpha2,
  country_code_alpha3

FROM projet10-467016.dataset.src_region_country_code