with source as (
    select
        uuid,
        username,
        password

    from {{ ref('stg_randomusers') }}
)

select * from source
