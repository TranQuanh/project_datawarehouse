WITH stag_sales_order_header AS(
    SELECT *
    FROM `adventureworks2019.Sales.SalesOrderHeader`
),
stag_sales_order_header_cast AS(
   SELECT salesOrderID,
          CAST(OrderDate AS DATETIME) AS OrderDate,
          SalesOrderNumber,
          CustomerID,
          CAST(SalesPersonID AS INT) AS SalesPersonID,
          TerritoryID,
          Status,
          TotalDue
   FROM stag_sales_order_header
),
stag_sales_order_header_excecute_NULL AS(
   SELECT salesOrderID,
          COALESCE(OrderDate,"9999-12-31")  AS OrderDate,
          SalesOrderNumber,
          CustomerID,
          COALESCE(SalesPersonID,-1) as SalesPersonID,
          COALESCE(TerritoryID,-1) as TerritoryID,
          Status,
          TotalDue
   FROM stag_sales_order_header_cast
)
SELECT *
FROM stag_sales_order_header_excecute_NULL
