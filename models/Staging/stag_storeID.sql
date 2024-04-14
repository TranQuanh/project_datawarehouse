WITH storeID_source AS(
    SELECT *
    FROM `adventureworks2019.Sales.StoreID`
),
storeID_rename AS(
    SELECT 
         CustomerID as customer_key,
         StoreID as store_key,
         Name as store_name
    FROM `adventureworks2019.Sales.StoreID`
),
storeID_excecute_NULL AS(
    SELECT 
         customer_key as customer_key,
         store_key as store_key,
         store_name
    FROM storeID_rename
),
storeID_cast_type AS(
    SELECT
        CAST(customer_key as integer) as customer_key,
        CAST(store_key as integer) as store_key,
        CAST(store_name as string) as store_name
    FROM storeID_excecute_NULL
)
SELECT *
FROM storeID_cast_type