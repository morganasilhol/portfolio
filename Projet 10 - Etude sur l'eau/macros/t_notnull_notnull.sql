{% test notnull_notnull(model, column_name, col2, col3=None) %}


SELECT *
FROM {{ model }}
WHERE {{ column_name }} IS NULL
  AND {{ col2 }} IS NOT NULL
  {% if col3 %}
    AND {{ col3 }} IS NOT NULL
  {% endif %}

{% endtest %}