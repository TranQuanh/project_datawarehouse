WITH stag_sales_order_header_groupby_date AS(
    SELECT OrderDate
    FROM {{ref('stag_sales_orders_header')}}
    GROUP BY OrderDate
)
SELECT OrderDate
FROM stag_sales_order_header_groupby_date