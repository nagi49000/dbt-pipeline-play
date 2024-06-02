{% test expect_valid_phone_number(model, column_name) %}

{% set expression %}
{{ dbt_expectations.regexp_instr(column_name, "^\d+$") }} > 0
{% endset %}

{{ dbt_expectations.expression_is_true(model, expression=expression, group_by_columns=None) }}

{% endtest %}
