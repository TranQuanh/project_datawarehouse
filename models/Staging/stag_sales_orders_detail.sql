WITH sales_orders_detail_source AS(
    SELECT 
           *
    FROM `adventureworks2019.Sales.SalesOrderDetail`
),
sales_orders_detail__rename AS(
    SELECT
        SalesOrderID as sales_order_key,
        SalesOrderDetailID as sales_order_detail_key,
        OrderQty as order_qty,
        ProductID as product_key,
        UnitPrice as unit_price,
        UnitPriceDisCount as unit_price_discount,
        LineTotal as line_total
    FROM sales_orders_detail_source
),
sales_orders_detail__excecute_NULL AS(
    SELECT
        sales_order_key,
        sales_order_detail_key,
         order_qty,
         COALESCE(product_key,0) as product_key,
         unit_price,
         unit_price_discount,
         line_total
    FROM sales_orders_detail__rename
),
sales_orders_detail__cast_type AS(
    SELECT
        CAST(sales_order_key as integer) AS sales_order_key,
        CAST(sales_order_detail_key as integer) AS sales_order_detail_key,
         CAST(order_qty as integer) AS order_qty,
         CAST(product_key as integer) AS product_key,
         CAST(unit_price as numeric) AS unit_price,
         CAST(unit_price_discount as numeric) AS unit_price_discount,
         CAST(line_total as numeric) AS line_total
    FROM sales_orders_detail__excecute_NULL
)
SELECT *
FROM sales_orders_detail__cast_type