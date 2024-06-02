with source as (
    select
        uuid,
        email,
        phone,
        cell

    from {{ ref('stg_randomusers') }}
)

select * from source
