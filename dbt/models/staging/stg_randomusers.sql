with source as (
    select * from raw_random_user
),

renamed as  (
    select
        gender,
        email,
        phone,
        cell,
        nat as nationality,
        name__title as title,
        name__first as first_name,
        name__last as last_name,
        location__street__number as street_number,
        location__street__name as street_name,
        location__city as city,
        location__state as state,
        location__country as country,
        location__postcode as postcode,
        dob__date as dob,
        dob__age as age

    from source
)

select * from renamed
