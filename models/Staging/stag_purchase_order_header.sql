WITH purchase_order_header_source AS(
    SELECT *
    FROM `adventureworks2019.Purchasing.PurchaseOrderHeader`
),
purchase_order_header_rename AS(
    SELECT
         PurchaseOrderID as purchase_order_key,
         VendorID as vendor_key,
         OrderDate as order_date,
         ShipDate as ship_date
    FROM purchase_order_header_source
),
purchase_order_header_excecution_NULL AS(
    SELECT
         purchase_order_key,
         COALESCE(vendor_key,-1) as vendor_key,
         order_date,
         ship_date,
    FROM purchase_order_header_rename
),
purchase_order_header_cast_type AS(
    SELECT 
        CAST(purchase_order_key as integer) as purchase_order_key,
        CAST(vendor_key as integer) as vendor_key,
        CAST(order_date as date) as order_date,
        CAST(ship_date as date) as ship_date
    FROM purchase_order_header_excecution_NULL 
)
SELECT *
FROM purchase_order_header_cast_type