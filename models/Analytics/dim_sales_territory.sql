SELECT
      *
FROM {{ref('stag_sales_territory')}}
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