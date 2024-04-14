SELECT 
       header.*,
       detail.purchase_order_detail_key,
       detail.order_qty,
       detail.product_key,
       detail.unit_price,
       detail.line_total,
       detail.received_qty,
       detail.rejected_qty,
       detail.stocked_qty
FROM {{ref('stag_purchase_order_header')}} header
LEFT JOIN {{ref('stag_purchase_order_detail')}} detail ON header.purchase_order_key=detail.purchase_order_key