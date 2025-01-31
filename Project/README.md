# **Payroll Processing System Using PxPlus, MySQL, C++, Python & Power BI**
This project automates payroll processing for **US & Canadian payroll systems** by integrating **PxPlus, MySQL, C++, Python, and Power BI**. The system processes salaries, computes taxes, and generates payroll reports.

---

## **🔹 Why These Tools?**
| **Tool**    | **Purpose** |
|------------|------------|
| **PxPlus** | Used for payroll automation, processing salary deductions, and executing business logic. |
| **MySQL**  | Stores payroll records, tax calculations, and processed employee salary data. |
| **C++**    | Performs fast, optimized tax computations and complex payroll logic. |
| **Python** | Automates payroll data handling, uploads data to cloud storage, and integrates with analytics. |
| **Power BI** | Creates payroll dashboards, visualizes employee salary trends, and tax deductions. |

---

## **🔹 Step 1: Installed and Configured MySQL ODBC for PxPlus**
1. **Installed MySQL Server**
   - Download from [MySQL Community Downloads](https://dev.mysql.com/downloads/)
   - Install MySQL Workbench & MySQL Server.

2. **Installed MySQL ODBC Driver**
   - Download [MySQL ODBC Connector](https://dev.mysql.com/downloads/connector/odbc/)
   - Choose **Typical Installation**.

3. **Configured ODBC Connection for PxPlus**
   - Open **ODBC Data Source Administrator (64-bit)**.
   - Click **Add** → Select **MySQL ODBC Driver**.
   - Enter:
     - **DSN Name:** `MySQL_Payroll`
     - **Server:** `localhost`
     - **Database:** `PayrollDB`
     - **Username:** `root`
     - **Password:** `[Your Password]`
   - Click **Test Connection**.

---

## **🔹 Step 2: Created Payroll Database in MySQL**
```sql
CREATE DATABASE PayrollDB;
USE PayrollDB;

CREATE TABLE EmployeePayroll (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary DECIMAL(10,2),
    Tax DECIMAL(10,2),
    NetPay DECIMAL(10,2)
);

```

## Inserted Sample Payroll Data:

```sql
INSERT INTO EmployeePayroll (EmpID, Name, Salary, Tax, NetPay)
VALUES 
(1, 'John Doe', 5000, 500, 4500),
(2, 'Jane Smith', 6000, 600, 5400);

```

## **🔹 Step 3 Connected PxPlus to MySQL & Process Payroll:

```pxplus
! Define Payroll Processing in PxPlus
DIM EmpID, Name$, Salary, Tax, NetPay
TAX_RATE = 0.10  ! 10% tax deduction

PRINT "Enter Employee ID: ";
INPUT EmpID
PRINT "Enter Name: ";
INPUT Name$
PRINT "Enter Salary: ";
INPUT Salary

! Compute Payroll
Tax = Salary * TAX_RATE
NetPay = Salary - Tax

! Insert Payroll Data into MySQL
SQL$ = "INSERT INTO EmployeePayroll (EmpID, Name, Salary, Tax, NetPay) VALUES (?, ?, ?, ?, ?)"
OPEN (1) "DB:PayrollDB;DSN=MySQL_Payroll"
EXECUTE (1, SQL$, EmpID, Name$, Salary, Tax, NetPay)
CLOSE (1)

PRINT "Payroll data saved successfully!"

```
- This PxPlus script computes payroll and stores it in MySQL.

---

## **🔹 Step 4 Automated Payroll Processing with C++

```cpp
#include <iostream>
using namespace std;

double computePayroll(double salary) {
    double taxRate = 0.10;
    double tax = salary * taxRate;
    return salary - tax;
}

int main() {
    double salary;
    cout << "Enter Salary: ";
    cin >> salary;
    
    double netPay = computePayroll(salary);
    cout << "Net Pay after tax: $" << netPay << endl;

    return 0;
}

```

---

## **🔹 Step 5 Used Python to Automate Payroll Data Processing

```python
import mysql.connector

# Connect to MySQL
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="yourpassword",
    database="PayrollDB"
)

cursor = conn.cursor()

# Fetch Payroll Data
cursor.execute("SELECT * FROM EmployeePayroll")
rows = cursor.fetchall()

print("Payroll Data:")
for row in rows:
    print(row)

conn.close()

```

- Python automates payroll data retrieval from MySQL.

---

## **🔹 Step 6 Generated Payroll Reports in Power BI:

- **1. Opened Power BI Desktop**
- **2. Connected to MySQL**
     - Select **Get Data** → **MySQL Database**.
     - Enter **server** = **localhost** and **database** = **PayrollDB**.
- **3. Create Payroll Reports**
     - Add **Employee Salary, Tax Deductions**, and **Net Pay Trends**.
     - Use **bar charts and tables** to analyze payroll data.

---

## **🔹 Step 7  Store Payroll Data in Azure Data Lake (Optional)

```python
from azure.storage.blob import BlobServiceClient

connection_string = "YOUR_AZURE_ADLS_CONNECTION_STRING"
blob_service_client = BlobServiceClient.from_connection_string(connection_string)
container_client = blob_service_client.get_container_client("payroll-data")

file_name = "payroll_data.csv"
blob_client = container_client.get_blob_client(file_name)

with open(file_name, "rb") as data:
    blob_client.upload_blob(data, overwrite=True)

print("Payroll data uploaded to Azure Data Lake!")

```

- Python uploads payroll data to the cloud for further processing.

---

## **🔹 Step 8 Automate Payroll Jobs Using Azure DevOps

- 1. Set up an Azure DevOps Pipeline
        - Automate payroll script execution.
        - Trigger Power BI Reports after payroll processing.
- 2. Define CI/CD Pipeline in **azure-pipelines.yml**

```yaml
trigger:
  - main

jobs:
  - job: PayrollProcessing
    steps:
      - script: |
          python process_payroll.py
        displayName: "Run Payroll Processing"

```
- Azure DevOps schedules and runs payroll jobs.


---
