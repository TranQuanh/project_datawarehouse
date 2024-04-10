SELECT
      ROW_NUMBER() OVER () as dim_product_key,
      product.product_key AS product_key,
      product.product_name AS product_name,
      product.product_number AS product_number,
      product.make_flag AS make_flag,
      product.finish_goods_flag as finish_goods_flag,
      product.color AS color,
      product.size AS size,
      product.size_unit_measure_code AS size_unit_measure_code,
      product.weight AS weight,
      product.weight_unit_measure_code AS weight_unit_measure_code,
      product.product_line AS product_line,
      product.class AS class,
      product.style AS style,
      product.product_subcategory_key AS product_subcategory_key,
      product_subcategory.product_subcategory_name AS product_subcategory_name,
      product_subcategory.product_category_key AS product_category_key,
      product_category.product_category_name AS product_category_name,
      product.product_model_key AS product_model_key,
      product_model.product_model_name AS product_model_name,
      product.sell_start_date AS sell_start_date,
      product.sell_end_date AS sell_end_date
FROM {{ref('stag_product')}} product
LEFT JOIN {{ref('stag_product_subcategory')}} product_subcategory ON product.product_subcategory_key=product_subcategory.product_subcategory_key
LEFT JOIN {{ref('stag_product_category')}} product_category ON product_subcategory.product_category_key=product_category.product_category_key
LEFT JOIN {{ref('stag_product_model')}} product_model ON product.product_model_key=product_model.product_model_key


