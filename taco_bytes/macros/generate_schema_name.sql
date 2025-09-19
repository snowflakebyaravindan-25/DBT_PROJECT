{% macro generate_schema_name(custom_schema_name, node) -%}
    {% if target.name == 'dev' %}
        {{ custom_schema_name }}
    {% else %}
        {{ target.schema }}_{{ custom_schema_name }}
    {% endif %}
{% endmacro %}