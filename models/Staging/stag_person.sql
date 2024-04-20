WITH person_source AS(
    SELECT *
    FROM `adventureworks2019.Person.Person`
),
person__rename AS(
    SELECT
        BusinessEntityID as person_key,
        Title as title,
        FirstName as first_name,
        MiddleName as middle_name,
        LastName as last_name,
        Suffix as suffix
    FROM person_source
),
person__excecute_NULL AS(
    SELECT
         person_key,
         title,
         first_name,
         middle_name,
         last_name,
         suffix
    FROM person__rename
),
person__cast_type AS(
    SELECT
        CAST(person_key as integer) as person_key,
        CAST(title as string) as title,
        CAST(first_name as string) as first_name,
        CAST(middle_name as string) as middle_name,
        CAST(last_name as string) as last_name,
        CAST(suffix as string) as suffix 
    FROM person__excecute_NULL
)
SELECT *
FROM person__cast_type
UNION ALL
SELECT
        -1 person_key,
        "Invalid" title,
        "Invalid" first_name,
        "Invalid"middle_name,
        "Invalid"last_name,
        "Invalid" suffix 
UNION ALL
SELECT
        0 person_key,
        "Undefined" title,
        "Undefined" first_name,
        "Undefined"middle_name,
        "Undefined"last_name,
        "Undefined" suffix 