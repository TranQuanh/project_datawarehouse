SELECT 
       header.sales_order_key as sales_order_key,
       header.order_date,
       header.sales_order_number,
       COALESCE(header.customer_key,-1) as customer_key,
       COALESCE(header.sales_person_key,-1) as sales_person_key,
       COALESCE(header.territory_key,-1) as territory_key,
       header.status,
       header.total_due,
       detail.sales_order_detail_key as sales_order_detail_key,
       detail.order_qty as order_qty,
       detail.product_key as product_key,
       detail.unit_price as unit_price,
       detail.unit_price_discount as unit_price_discount,
       detail.line_total as line_total
FROM {{ref('stag_sales_orders_detail')}} detail
LEFT JOIN {{ref('stag_sales_orders_header')}} header  
ON detail.sales_order_key=header.sales_order_key
