WITH employee_source AS(
    SELECT *
    FROM `adventureworks2019.HumanResources.Employee`
),
employee__rename AS(
    SELECT
    BusinessEntityID as employee_key,
    NationalIDNumber as national_ID_number,
    JobTitle as job_title,
    BirthDate as birth_date,
    MaritalStatus as marital_status,
    HireDate as hire_date
    FROM employee_source
)
SELECT *
FROM employee__rename
UNION ALL
SELECT
    -1 as employee_key,
     NULL as national_ID_number,
    "Invalid" as job_title,
    NULL as birth_date,
    NULL as marital_status,
    NULL as hire_date
UNION ALL
SELECT
    0 as employee_key,
   NULL as national_ID_number,
    "Undefined" as job_title,
    NULL as birth_date,
    NULL as marital_status,
    NULL as hire_date