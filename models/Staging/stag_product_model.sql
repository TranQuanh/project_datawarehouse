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