WITH sales_person AS(
    SELECT *
    FROM `adventureworks2019.Sales.SalesPerson`
),
sales_person_rename AS(
    SELECT 
         BusinessEntityID as sales_person_key
    From sales_person
)
SELECT *
FROM sales_person_rename
UNION ALL
SELECT
     -1 as sales_person_key
UNION ALL
SELECT
     0 as sales_person_key

     
     