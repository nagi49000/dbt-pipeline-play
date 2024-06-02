{{ config(constraints={'unique': ['location_id']}) }}

with source as (
    select
        concat(street_number, ' ', postcode) as location_id,
        street_number,
        street_name,
        city,
        state,
        country,
        postcode

    from {{ ref('stg_randomusers') }}
)

select * from source
