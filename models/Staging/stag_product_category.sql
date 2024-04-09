WITH product_category_source AS(
    SELECT *
    FROM `adventureworks2019.Production.ProductCategory`
),
product_category_rename AS(
    SELECT ProductCategoryID as product_category_key,
    Name as product_category_rename
    FROM product_category_source
)
SELECT* 
FROM product_category_rename