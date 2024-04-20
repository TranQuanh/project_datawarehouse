WITH product_source AS(
    SELECT *
    FROM `adventureworks2019.Production.Product`
),
product_rename AS(
    SELECT
        ProductID as product_key,
        Name as product_name,
        ProductNumber as product_number,
        MakeFlag as make_flag,
        FinishedGoodsFlag as finish_goods_flag,
        Color as color,
        Size as size,
        SizeUnitMeasureCode as size_unit_measure_code,
        Weight as weight,
        WeightUnitMeasureCode as weight_unit_measure_code,
        ProductLine as product_line,
        Class as class,
        Style as style,
        ProductSubcategoryID as product_subcategory_key,
        ProductModelID as product_model_key,
        SellStartDate as sell_start_date,
        SellEndDate as sell_end_date
    FROM product_source
),
product_excecute_NULL AS(
    SELECT
        product_key,
        product_name,
        product_number,
        make_flag,
        finish_goods_flag,
        color,
        size,
        size_unit_measure_code,
        weight,
        weight_unit_measure_code,
        product_line,
        class,
        style,
        REPLACE(product_subcategory_key,"NULL","0") as product_subcategory_key,
        REPLACE(product_model_key,"NULL","0") as product_model_key,
        sell_start_date,
        REPLACE(sell_end_date,"NULL",'9999-12-31') as sell_end_date
    FROM product_rename
),
product_cast_type AS(
    SELECT
        CAST(product_key AS integer) as product_key,
        CAST(product_name AS string) as product_name,
        CAST(product_number AS string) as product_number,
        CAST(make_flag AS boolean) as make_flag,
        CAST(finish_goods_flag as boolean) as finish_goods_flag,
        CAST(color as String) as color,
        CAST(size as string) as size,
        CAST(size_unit_measure_code as string) as size_unit_measure_code,
        CAST(weight as string) as weight,
        CAST(weight_unit_measure_code as string) as weight_unit_measure_code,
        CAST(product_line as string) as product_line,
        CAST(class as string) as class,
        CAST(style as string) as style,
        CAST(product_subcategory_key as integer) as product_subcategory_key,
        CAST(product_model_key as integer) as product_model_key,
        CAST(sell_start_date as date) as sell_start_date,
        sell_end_date  as sell_end_date
    FROM product_excecute_NULL
)
SELECT *
FROM product_cast_type
UNION ALL
SELECT
      -1 AS product_key,
      "Invalid" AS product_name,
      "Invalid" AS product_number,
      NULL AS make_flag,
      NULL as finish_goods_flag,
      "Invalid" AS color,
      "Invalid" AS size,
      "Invalid" AS size_unit_measure_code,
      "Invalid" AS weight,
      "Invalid" AS weight_unit_measure_code,
      "Invalid" AS product_line,
      "Invalid" AS class,
      "Invalid"AS style,
       -1 as product_subcategory_key,
        -1 as product_model_key,
      NULL AS sell_start_date,
      NULL AS sell_end_date
UNION ALL
SELECT
      0 AS product_key,
      "Undefined" AS product_name,
      "Undefined" AS product_number,
      NULL AS make_flag,
      NULL as finish_goods_flag,
      "Undefined" AS color,
      "Undefined" AS size,
      "Undefined" AS size_unit_measure_code,
      "Undefined" AS weight,
      "Undefined" AS weight_unit_measure_code,
      "Undefined" AS product_line,
      "Undefined" AS class,
      "Undefined"AS style,
       0 as product_subcategory_key,
        0 as product_model_key,
      NULL AS sell_start_date,
      NULL AS sell_end_date


