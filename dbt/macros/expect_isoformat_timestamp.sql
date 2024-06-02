{% test expect_isoformat_timestamp(model, column_name) %}

{% set expression %}
{{ dbt_expectations.regexp_instr(column_name, "^\d{4}-[01]\d-[0-3]\dT[0-2]\d:[0-5]\d:[0-5]\d\.\d+([+-][0-2]\d:[0-5]\d|Z)$") }} > 0
{% endset %}

{{ dbt_expectations.expression_is_true(model, expression=expression, group_by_columns=None) }}

{% endtest %}
