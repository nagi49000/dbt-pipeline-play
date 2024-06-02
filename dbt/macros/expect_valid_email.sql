{% test expect_valid_email(model, column_name) %}

{% set expression %}
{{ dbt_expectations.regexp_instr(column_name, "^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$") }} > 0
{% endset %}

{{ dbt_expectations.expression_is_true(model, expression=expression, group_by_columns=None) }}

{% endtest %}
