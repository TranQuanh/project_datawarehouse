WITH product_category_source AS(
    SELECT *
    FROM `adventureworks2019.Production.ProductCategory`
),
product_category_rename AS(
    SELECT ProductCategoryID as product_category_key,
    Name as product_category_name
    FROM product_category_source
)
SELECT* 
FROM product_category_rename
UNION ALL
SELECT
    -1  as product_category_key,
    "Invalid" as product_category_name
UNION ALL
SELECT
    0  as product_category_key,
    "Undefined" as product_category_name