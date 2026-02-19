{{ config(materialized='table') }}

-- table centralisant tous les datas pour les tests

WITH country_year AS(
  SELECT
    country,
    year,
    granularity

  FROM {{ ref('td_country_year_granularity') }}
),

stability AS(
  SELECT
    country,
    year,
    granularity,
    political_stability

  FROM {{ ref('vf_political_stability') }}
),

water AS(
  SELECT
    country,
    year,
    granularity,
    popu_use_basic_drinking_water_services,
    popu_use_safely_drinking_water_services

  FROM {{ ref('FAIT_drinking_water_services') }}
),

mortality AS(
  SELECT
    country,
    year,
    granularity,
    mortality_rate_attributed_unsafe_WASH_services,
    WASH_deaths

  FROM {{ ref('FAIT_mortality_rate_water') }}
),

population AS(
  SELECT
    country,
    year,
    granularity,
    population

  FROM {{ ref('FAIT_population') }}
),

alldata AS(SELECT
  country_year.country,
  country_year.year,
  country_year.granularity,
  population.population,
  stability.political_stability,
  water.popu_use_basic_drinking_water_services,
  water.popu_use_safely_drinking_water_services,
  mortality.mortality_rate_attributed_unsafe_WASH_services,
  mortality.WASH_deaths

FROM country_year
LEFT JOIN population
USING (country, year, granularity)
LEFT JOIN stability 
USING (country, year, granularity)
LEFT JOIN mortality
USING (country, year, granularity)
LEFT JOIN water
USING (country, year, granularity)
)

SELECT
  country,
  year,
  granularity,
  population,
  political_stability,
  popu_use_basic_drinking_water_services,
  popu_use_safely_drinking_water_services,
  mortality_rate_attributed_unsafe_WASH_services,
  WASH_deaths

FROM alldata