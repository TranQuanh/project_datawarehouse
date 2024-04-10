WITH sales_person AS(
    SELECT *
    FROM `adventureworks2019.Sales.SalesPerson`
),
sales_peson_rename AS(
    SELECT 
         BusinessEntityID as sales_person_key
    From sales_person
)
SELECT *
FROM sales_peson_rename
