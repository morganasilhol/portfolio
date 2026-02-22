{% macro concat_country_year(country='country', year='year') %}
  CONCAT({{ country }}, " - ", {{ year }}){% endmacro %}