WITH stag_sales_order_header_groupby_teritory AS(
    SELECT TerritoryID
    FROM {{ref('stag_sales_orders_header')}}
    GROUP BY TerritoryID
),
stag_dim_territory AS(
    SELECT sales_territory.TerritoryID AS TerritoryID,
           territory.Name,
           territory.CountryRegionCode,
           territory.Group
    FROM stag_sales_order_header_groupby_teritory sales_territory
    LEFT JOIN `adventureworks2019.Sales.SalesTerritory` territory ON sales_territory.TerritoryID=territory.TerritoryID 
)
SELECT *
FROM stag_dim_territory