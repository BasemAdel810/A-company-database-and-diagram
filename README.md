# A-company-database-and-diagram
# 📊 Company Database Management System

This repository contains a **Company Database** project implemented in SQL.  
It models employees, departments, projects, and dependents, along with their relationships.  
The database is designed for practicing SQL queries, constraints, and ER modeling.

---

## 🚀 Features
- Store and manage **employee records** with hierarchical supervision.  
- Track **departments** and their managers.  
- Manage **projects** and assign employees to them.  
- Record **dependents** of employees.  
- Ensure referential integrity with **foreign keys and constraints**.  

---

## 🗂 Database Schema

### **Departments**
- `dnumber` (PK)  
- `dname`  
- `mgrssn` (FK → Employee.ssn)  
- `mgrstartdate`  

### **Employee**
- `ssn` (PK)  
- `fname`, `lname`  
- `Bdate`, `EMPaddress`, `sex`, `salary`  
- `superssn` (FK → Employee.ssn)  
- `dno` (FK → Departments.dnumber)  

### **Project**
- `pnumber` (PK)  
- `pname`  
- `plocation`  
- `dnum` (FK → Departments.dnumber)  

### **Works_On**
- `ssn` (FK → Employee.ssn)  
- `pnumber` (FK → Project.pnumber)  
- `hours`  

### **Dependent**
- `essn` (FK → Employee.ssn)  
- `dependent_name`  
- `sex`, `Bdate`, `relationship`  

---

## 📐 ER Diagram

- **Employees → Departments**: Each employee works in one department.  
- **Departments → Employees**: Each department is managed by one employee.  
- **Employees (Self-Reference)**: Employees can supervise other employees.  
- **Employees → Projects (via Works_On)**: Many-to-many relationship.  
- **Employees → Dependents**: Each employee may have multiple dependents.  

![ER Diagram](diagram.png) <!-- replace with generated ERD image -->

---

## ⚡ Usage
1. Import the SQL schema (`company DB.sql`) into your database (MySQL, SQL Server, PostgreSQL).  
2. Run queries to explore employees, projects, and dependencies.  
3. Extend the schema with additional constraints or features.  

---

## 🛠 Tech Stack
- **Database**: SQL (SQL Server / MySQL / PostgreSQL)  
- **Diagram**: Draw.io / Lucidchart / ERD Tool  

---

## 📄 License
This project is licensed under the MIT License – feel free to use and modify it.
