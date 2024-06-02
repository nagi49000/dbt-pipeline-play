with source as (
    select
        uuid,
        street_number,
        street_name,
        city,
        state,
        country,
        postcode

    from {{ ref('stg_randomusers') }}
)

select * from source
