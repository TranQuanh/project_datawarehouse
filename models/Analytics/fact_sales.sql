SELECT 
       ROW_NUMBER() OVER () as fact_sales_key,
       header.*,
       detail.sales_order_detail_key as sales_order_detail_key,
       detail.order_qty as order_qty,
       detail.product_key as product_key,
       detail.unit_price as unit_price,
       detail.unit_price_discount as unit_price_discount,
       detail.line_total as line_total
FROM {{ref('stag_sales_orders_header')}} header 
LEFT JOIN {{ref('stag_sales_orders_detail')}} detail ON header.sales_order_key=detail.sales_order_key
