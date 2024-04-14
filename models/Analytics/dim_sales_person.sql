SELECT 
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
UNION ALL
SELECT
     -1 as sales_person_key,
     "Invalid" as title,
     "Invalid" as first_name,
    "Invalid" as middle_name,
    "Invalid" as last_name,
     "Invalid"as suffix,
     NULL as national_ID_number,
     "Invalid" as job_title,
     NULL as birth_date,
     "Invalid" as marital_status,
    NULL as hire_date
UNION ALL
SELECT
     0 as sales_person_key,
     "Undefined" as title,
     "Undefined" as first_name,
    "Undefined" as middle_name,
    "Undefined" as last_name,
    "Undefined"as suffix,
     NULL as national_ID_number,
     "Undefined"as job_title,
     NULL as birth_date,
     "Undefined" as marital_status,
    NULL as hire_date
     