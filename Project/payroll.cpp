#include <iostream>
using namespace std;

class Employee {
public:
    string name;
    double baseSalary;
    double taxRate;

    Employee(string empName, double salary, double tax) {
        name = empName;
        baseSalary = salary;
        taxRate = tax;
    }

    void calculateSalary() {
        double taxAmount = baseSalary * (taxRate / 100);
        double netSalary = baseSalary - taxAmount;

        cout << "Employee: " << name << endl;
        cout << "Base Salary: $" << baseSalary << endl;
        cout << "Tax Deducted: $" << taxAmount << endl;
        cout << "Net Salary: $" << netSalary << endl;
    }
};

int main() {
    Employee emp1("John Doe", 5000, 15);  // Name, Salary, Tax Rate (15%)
    emp1.calculateSalary();

    return 0;
}

3296