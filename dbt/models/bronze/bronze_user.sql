with source as (
    select
        gender,
        nationality,
        title,
        first_name,
        last_name,
        dob,
        age,
        uuid,

    from {{ ref('stg_randomusers') }}
)

select * from source
