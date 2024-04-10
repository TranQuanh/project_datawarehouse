SELECT 
     ROW_NUMBER() OVER () as dim_sales_person_key,
     sales_person.sales_person_key as sales_person_key,
     person.title as title,
     person.first_name as first_name,
     person.middle_name as middle_name,
     person.last_name as last_name,
     person.suffix as suffix,
     employee.national_ID_number as national_ID_number,
     employee.job_title as job_title,
     employee.birth_date,
     employee.marital_status,
     employee.hire_date as hire_date
FROM {{ref('stag_sales_person')}} sales_person
LEFT JOIN {{ref('stag_person')}} person ON sales_person.sales_person_key=person.person_key
LEFT JOIN {{ref('stag_employee')}} employee ON sales_person.sales_person_key=employee.employee_key
