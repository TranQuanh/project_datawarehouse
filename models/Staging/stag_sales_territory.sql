WITH sales_territory_source AS(
    SELECT  
           TerritoryID as territoy_key,
           Name AS territory_name,
        CountryRegionCode as country_region_code, 
        `Group` as group_name 
    FROM `adventureworks2019.Sales.SalesTerritory`  
)
SELECT *
FROM sales_territory_source