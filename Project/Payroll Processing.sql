-- Creating Payroll Database

create DATABASE payrolldb1;
USE payrolldb1; 

-- Created Sample Payroll Table

create table payrolldata (
Employee_Id INT primary key,
Employee_Name varchar(50),
Country varchar(50),
State_Province varchar(50),
Annual_Salary Decimal (10,2),
federal_tax_rate Decimal (5,4),
federal_tax Decimal (10,2),
State_Provincial_Tax_Rate Decimal (5,4),
State_Provincial_Tax Decimal (10,2),
Benefits_Deductions decimal (10,2),
Net_Pay decimal (10,2)
);

-- Inserting Sample Payroll Data

Insert Into payrolldata (Employee_ID, Employee_Name, Country, State_Province, Annual_Salary, 
                         Federal_Tax_Rate, Federal_Tax, State_Provincial_Tax_Rate, 
                         State_Provincial_Tax, Benefits_Deductions, Net_Pay)
                         
VALUES
(1001, 'Employee_1', 'US', 'Texas', 103335, 0.22, 22733.70, 0.0000, 0.00, 10175.45, 70425.85),
(1002, 'Employee_2', 'Canada', 'Quebec', 50965, 0.26, 13250.90, 0.2575, 13123.49, 3509.39, 21081.22),
(1003, 'Employee_3', 'Canada', 'Alberta', 64538, 0.26, 16779.88, 0.1500, 9680.70, 4329.78, 33747.64),
(1004, 'Employee_4', 'US', 'Texas', 110592, 0.22, 24330.24, 0.0000, 0.00, 6832.42, 79429.34),
(1005, 'Employee_5', 'US', 'Arizona', 48110, 0.22, 10584.20, 0.0450, 2164.95, 3142.23, 32218.62);

-- Let's Check and Retrieve Payroll Data
select * from payrolldata;

-- Lets do some basic Computation
with Calculated_Table as(
select Employee_Name, Country, State_province, Annual_Salary,
(annual_salary * federal_tax_rate) as Federal_tax,
(annual_salary * State_provincial_tax_rate) as State_Tax
from payrolldata
)
select Employee_Name, Country, State_province, Annual_Salary,(annual_salary * federal_tax_rate)
 as Federal_tax,
(annual_salary * State_provincial_tax_rate) as State_Tax, (Annual_Salary -
(Annual_Salary * Federal_Tax_Rate) - (Annual_Salary * State_Provincial_Tax_Rate)
 - Benefits_Deductions) AS Net_Pay
 from payrolldata;
 
 SELECT host FROM mysql.user WHERE user = 'root';


SELECT user, host FROM mysql.user;

CREATE USER 'mithund'@'%' IDENTIFIED BY '@Welcome2024#';
GRANT ALL PRIVILEGES ON payrolldb1.* TO 'mithund'@'%';
FLUSH PRIVILEGES;


