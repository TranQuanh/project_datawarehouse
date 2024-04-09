WITH vendor AS(
    SELECT *
    FROM `adventureworks2019.Purchasing.Vendor`
),
vendor_rename AS(
    SELECT 
         BusinessEntityID as vendor_id,
         AccountNumber  as account_number,
         Name as vendor_name,
         CreditRating as credit_rating,
         PreferredVendorStatus as preferred_vendor,
    FROM vendor
),
vendor_cast_type AS(
    SELECT 
         vendor_id,
         account_number,
         vendor_name,
         credit_rating,
         CAST(preferred_vendor as boolean) as preferred_vendor
    FROM vendor_rename
)
SELECT *
FROM vendor_cast_type