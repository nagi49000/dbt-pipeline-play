{{ config(constraints={'unique': ['uuid']}) }}

with source as (
    select
        uuid,
        email,
        phone,
        cell

    from {{ ref('stg_randomusers') }}
)

select * from source
