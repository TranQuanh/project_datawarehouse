SELECT 
      ROW_NUMBER() OVER () as dim_customer_key,
      customer.customer_key as customer_key,
      customer.person_key as person_key,
      person.title as title,
      person.first_name as first_name,
      person.middle_name as middle_name,
      person.last_name as last_name,
      person.suffix as suffix,
      storeID.store_key as store_key,
      storeID.store_name as store_name,
      customer.account_number as account_number
FROM {{ref("stag_customer")}} customer
LEFT JOIN {{ref("stag_person")}} person on customer.person_key=person.person_key
LEFT JOIN {{ref("stag_storeID")}} storeID on customer.customer_key=storeID.customer_key