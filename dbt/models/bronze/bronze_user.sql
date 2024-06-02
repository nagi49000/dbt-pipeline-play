{{ config(constraints={'unique': ['uuid']}) }}

with source as (
    select
        concat(first_name, ' ', last_name) as full_name,
        gender,
        nationality,
        title,
        first_name,
        last_name,
        dob,
        age,
        uuid,
        concat(street_number, ' ', postcode) as location_id,

    from {{ ref('stg_randomusers') }}
)

select * from source
