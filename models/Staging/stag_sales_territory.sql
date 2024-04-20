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
UNION ALL
SELECT
    -1 as territory_key,
    "Invalid" as territory_name,
    "Invalid" as country_region_code,
    "Invalid" as group_name
UNION ALL
SELECT
    0 as territory_key,
    "Undefined" as territory_name,
    "Undefined" as country_region_code,
    "Undefined" as group_name