{{ config(materialized='table') }}


SELECT
  country_year,
  country,
  year,
  political_stability

  FROM {{ ref('vf_political_stability') }}