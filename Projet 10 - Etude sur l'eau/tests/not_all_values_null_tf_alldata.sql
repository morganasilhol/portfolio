SELECT *
FROM {{ ref('tf_alldata') }}
WHERE
    population IS NULL
    AND political_stability IS NULL
    AND popu_use_basic_drinking_water_services IS NULL
    AND popu_use_safely_drinking_water_services IS NULL
    AND mortality_rate_attributed_unsafe_WASH_services IS NULL
    AND WASH_deaths IS NULL