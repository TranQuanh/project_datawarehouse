WITH stag_sales_order_header_groupby_sales_person AS(
    SELECT SalespersonID
    FROM {{ref('stag_sales_orders_header')}}
    GROUP BY SalespersonID
),
stag_sales_order_header_groupby_sales_person_join_person_join_employee AS(
    Select Sales_person.SalespersonID,
           Person.Title,
           Person.FirstName,
           Person.MiddleName,
           Person.LastName,
           Person.Suffix,
           Employee.JobTitle,
           Employee.Gender,
           Employee.HireDate,
           Employee.MaritalStatus
    FROM stag_sales_order_header_groupby_sales_person Sales_person
    LEFT JOIN `adventureworks2019.Person.Person` Person on Sales_person.SalesPersonID=Person.BusinessEntityID
    LEFT JOIN `adventureworks2019.HumanResources.Employee` Employee on Sales_person.SalesPersonID=Employee.BusinessEntityID 
)
SELECt *
FROM stag_sales_order_header_groupby_sales_person_join_person_join_employee