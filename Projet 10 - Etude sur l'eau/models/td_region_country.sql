{{ config(materialized='table') }}

SELECT DISTINCT
  region,
  country

FROM projet10-467016.dataset.src_region_country_code