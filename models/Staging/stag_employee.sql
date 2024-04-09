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