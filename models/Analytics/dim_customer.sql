SELECT 
      customer.customer_key as customer_key,
      COALESCE(customer.person_key,-1) as person_key,
      person.title as title,
      person.first_name as first_name,
      person.middle_name as middle_name,
      person.last_name as last_name,
      person.suffix as suffix,
      COALESCE(storeID.store_key,-1) as store_key,
      storeID.store_name as store_name,
      customer.account_number as account_number
FROM {{ref("stag_customer")}} customer
LEFT JOIN {{ref("stag_person")}} person on customer.person_key=person.person_key
LEFT JOIN {{ref("stag_storeID")}} storeID on customer.customer_key=storeID.customer_key
UNION ALL 
SELECT
      -1 as customer_key,
      -1 as person_key,
      "Invalid" as title,
      "Invalid" as first_name,
      "Invalid" as middle_name,
      "Invalid" as last_name,
      "Invalid" as suffix,
      -1 as store_key,
      "Invalid" as store_name,
      "Invalid" as account_number
UNION ALL 
SELECT
      0 as customer_key,
      0 as person_key,
      "Undefined" as title,
      "Undefined" as first_name,
      "Undefined" as middle_name,
      "Undefined" as last_name,
      "Undefined" as suffix,
      0 as store_key,
      "Undefined" as store_name,
      "Undefined" as account_number
        