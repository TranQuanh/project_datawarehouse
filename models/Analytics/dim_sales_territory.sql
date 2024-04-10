SELECT
      ROW_NUMBER() OVER () as dim_sales_territory, 
      *
FROM {{ref('stag_sales_territory')}}