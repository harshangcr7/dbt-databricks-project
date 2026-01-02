{% macro concat(col1, col2) %}
    concat({{ col1 }}, ' ', {{ col2 }})
{% endmacro %}
