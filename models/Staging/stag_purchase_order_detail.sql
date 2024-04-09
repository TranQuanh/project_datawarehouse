WITH purchase_order_detail AS(
    SELECT *
    FROM `adventureworks2019.Purchasing.PurchaseOrderDetail`
),
purchase_order_detail__rename AS(
    SELECT 
         PurchaseOrderID as purchase_order_key,
         PurChaseOrderDetailID as purchase_order_detail_key,
         OrderQty as order_qty,
         ProductID as product_key,
         UnitPrice as unit_price,
         LineTotal as line_total,
         ReceivedQty as received_qty,
         RejectedQty as rejected_qty,
         StockedQty as stocked_qty
    FROM purchase_order_detail
)
SELECT *
FROM purchase_order_detail__rename