WITH product_model_source AS(
    SELECT *
    FROM `adventureworks2019.Production.ProductModel`
),
product_model_rename AS(
    SELECT ProductModelID as product_model_key,
           Name as product_model_name
    FROM product_model_source
)
SELECT *
FROM product_model_rename
UNION ALL
SELECT  
    -1 as product_model_key,
    "Invalid" as product_model_name
UNION ALL
SELECT
    0 as product_model_key,
    "Undefined" as product_model_name

