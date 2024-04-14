WITH sales_order_header__source AS(
    SELECT *   
    FROM `adventureworks2019.Sales.SalesOrderHeader` sale_header

),

  sales_order_header__rename AS( 
    SELECT 
      SalesOrderID AS sales_order_key,
      OrderDate as order_date,
      SalesOrderNumber as sales_order_number,
      CustomerID as customer_key,
      SalesPersonID as sales_person_key,
      TerritoryID as territory_key,
      status as status,
      TotalDue as total_due
    FROM sales_order_header__source
  ),

sales_order_header__excecute_NULL AS(
   SELECT  
          sales_order_key,
          COALESCE(order_date,'9999-12-31') as order_date,
          sales_order_number,
          COALESCE(customer_key,0) as customer_key,
          REPLACE(sales_person_key, 'NULL', '0') as sales_person_key,
          COALESCE(territory_key,0) as territory_key,
          status,
          total_due,
    FROM sales_order_header__rename

),
  sales_order_header__cast_type  AS (    
  SELECT
    cast(sales_order_key as integer) as sales_order_key,
    cast(order_date as date) AS order_date,
    cast(sales_order_number as string) AS sales_order_number,
    cast(customer_key as integer) as customer_key,
    cast(sales_person_key as integer) as sales_person_key,
    cast(territory_key as integer) as territory_key,
    cast(status as integer) status,
    cast(total_due as numeric) total_due 
  FROM sales_order_header__excecute_NULL
    ) 


  SELECT
      *
  FROM sales_order_header__cast_type