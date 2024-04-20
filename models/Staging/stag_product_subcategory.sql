WITH product_subcategory_source AS(
    SELECT *
    FROM `adventureworks2019.Production.ProductSubcategory`
),
product_subcategory_rename AS(
    SELECT
         ProductSubcategoryID as product_subcategory_key,
         ProductCategoryID as product_category_key,
         Name as product_subcategory_name
    FROM product_subcategory_source
),
product_subcategory_excecute_NULL AS(
    SELECT product_subcategory_key,
           product_category_key as product_category_key,
           product_subcategory_name
    FROM product_subcategory_rename
)
SELECT *
FROM product_subcategory_excecute_NULL  
UNION ALL
SELECT
    -1 product_subcategory_key,
    -1 as product_category_key,
    "Invalid" product_subcategory_name
UNION ALL
SELECT
    0 product_subcategory_key,
    0 as product_category_key,
    "Undefined" product_subcategory_name
    