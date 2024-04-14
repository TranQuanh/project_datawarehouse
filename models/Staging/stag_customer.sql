WITH stag_customer_source AS(
    SELECT *
    FROM `adventureworks2019.Sales.Customer`
),
stag_customer__rename AS(
    SELECT
         CustomerID as customer_key,
         PersonID as person_key,
         StoreID as store_key,
         AccountNumber as account_number
    FROM stag_customer_source
),
stag_customer__excecute_NULL AS (
    SELECT
         customer_key,
         REPLACE(person_key,"NULL","0") as person_key,
         REPLACE(store_key,"NULL","0") as store_key,
         account_number,
    FROM stag_customer__rename
),
stag_customer__cast_type AS(
    SELECT
        CAST(customer_key as integer) as customer_key,
        CAST(person_key as integer) as person_key,
        CAST(store_key as integer) as store_key,
        CAST(account_number as string) as account_number
    FROM stag_customer__excecute_NULL
)
SELECT *
FROM stag_customer__cast_type