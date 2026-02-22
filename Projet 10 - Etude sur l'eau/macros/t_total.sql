val1{% test total(model, column_name, total, val1, val2) %}

WITH alldata AS(
  SELECT country, year, {{ column_name }}, granularity
  FROM {{ model }}
  WHERE granularity IN('{{ total }}', '{{ val1 }}', '{{ val2 }}')
),

tot AS(
  SELECT SUM({{ column_name }}) AS t, country, year
  FROM alldata
  WHERE granularity = '{{ total }}'
  GROUP BY country, year
),

value_1 AS(
  SELECT SUM({{ column_name }}) AS v1, country, year
  FROM alldata
  WHERE granularity = '{{ val1 }}'
  GROUP BY country, year
),

value_2 AS(
  SELECT SUM({{ column_name }}) AS v2, country, year
  FROM alldata
  WHERE granularity = '{{ val2 }}'
  GROUP BY country, year
)

SELECT tot.year, tot.country, tot.t, value_1.v1, value_2.v2 FROM tot
LEFT JOIN value_1 ON tot.country = value_1.country AND tot.year = value_1.year
LEFT JOIN value_2 ON tot.country = value_2.country AND tot.year = value_2.year
WHERE NOT (
  t = v1 + v2
)

{% endtest %}