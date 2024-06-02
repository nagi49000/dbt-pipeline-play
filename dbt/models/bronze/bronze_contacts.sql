{{ config(constraints={'unique': ['uuid']}) }}

with source as (
    select
        uuid,
        email,
        {{ make_phone_number_numeric('phone') }} as phone_numeric,
        {{ make_phone_number_numeric('cell') }} as cell_numeric,

    from {{ ref('stg_randomusers') }}
)

select * from source
