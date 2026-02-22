{% macro normalize_country(column_name) %}

CASE
    WHEN {{ column_name }} = "Bahamas, The" THEN "Bahamas"
    WHEN {{ column_name }} = "Bolivia, The" THEN "Bolivia (Plurinational State of)"
    WHEN {{ column_name }} = "Congo, Dem. Rep." THEN "Democratic Republic of the Congo"
    WHEN {{ column_name }} = "Congo, Rep." THEN "Congo"
    WHEN {{ column_name }} = "Cote d'Ivoire" THEN "Côte d'Ivoire"
    WHEN {{ column_name }} = "Egypt, Arab Rep." THEN "Egypt"
    WHEN {{ column_name }} = "Gambia, The" THEN "Gambia"
    WHEN {{ column_name }} = "Hong Kong SAR, China" THEN "China, Hong Kong SAR"
    WHEN {{ column_name }} = "Iran, Islamic Rep." THEN "Iran (Islamic Republic of)"
    WHEN {{ column_name }} = "Korea, Dem. People's Rep." THEN "Democratic People's Republic of Korea"
    WHEN {{ column_name }} = "Korea, Rep." THEN "Republic of Korea"
    WHEN {{ column_name }} = "Kyrgyz Republic" THEN "Kyrgyzstan"
    WHEN {{ column_name }} = "Lao PDR" THEN "Lao People's Democratic Republic"
    WHEN {{ column_name }} = "Macao SAR, China" THEN "China, Macao SAR"
    WHEN {{ column_name }} = "Micronesia, Fed. Sts." THEN "Micronesia (Federated States of)"
    WHEN {{ column_name }} = "Moldova" THEN "Republic of Moldova"
    WHEN {{ column_name }} = "North Macedonia" THEN "Republic of North Macedonia"
    WHEN {{ column_name }} = "Puerto Rico (US)" THEN "Puerto Rico"
    WHEN {{ column_name }} = "Slovak Republic" THEN "Slovakia"
    WHEN {{ column_name }} = "St. Kitts and Nevis" THEN "Saint Kitts and Nevis"
    WHEN {{ column_name }} = "St. Lucia" THEN "Saint Lucia"
    WHEN {{ column_name }} = "St. Vincent and the Grenadines" THEN "Saint Vincent and the Grenadines"
    WHEN {{ column_name }} = "Tanzania" THEN "United Republic of Tanzania"
    WHEN {{ column_name }} = "Turkiye" THEN "Turkey"
    WHEN {{ column_name }} = "United Kingdom" THEN "United Kingdom of Great Britain and Northern Ireland"
    WHEN {{ column_name }} = "United States" THEN "United States of America"
    WHEN {{ column_name }} = "Venezuela, RB" THEN "Venezuela (Bolivarian Republic of)"
    WHEN {{ column_name }} = "Virgin Islands (U.S.)" THEN "United States Virgin Islands"
    WHEN {{ column_name }} = "West Bank and Gaza" THEN "Palestine"
    WHEN {{ column_name }} = "Yemen, Rep." THEN "Yemen"
    WHEN {{ column_name }} = "Curacao" THEN "Curaçao"
    WHEN {{ column_name }} = "St. Martin (French part)" THEN "Saint-Martin (French part)"
    ELSE {{ column_name }}
END

{% endmacro %}
