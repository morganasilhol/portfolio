{% test between_min_max(model, column_name, min_val=0, max_val=2000000000) %}


SELECT *
FROM {{ model }}
WHERE NOT (
    {{ column_name }} BETWEEN {{ min_val }} AND {{ max_val }}
    OR {{ column_name }} IS NULL
)

{% endtest %}