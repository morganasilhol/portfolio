{{ config(materialized='table') }}

SELECT DISTINCT
  year

FROM {{ ref('td_country_year_granularity') }}