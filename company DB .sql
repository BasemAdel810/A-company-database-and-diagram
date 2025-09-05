create table departments(dname varchar(50) not null,
dnumber int primary key IDENTITY(1,1),mgrssn int null,
mgrstartdate date);

CREATE TABLE Employee (
    fname      VARCHAR(50) NOT NULL,
    lname      VARCHAR(50) NOT NULL,
    ssn        INT PRIMARY KEY IDENTITY(1,1),
    Bdate      DATE,
    EMPaddress VARCHAR(100),
    sex        CHAR(1),
    salary     DECIMAL(10,2),
    superssn   INT NULL,
    dno        INT NULL,
    CONSTRAINT fk_supervisor FOREIGN KEY (superssn) REFERENCES Employee(ssn),
    CONSTRAINT fk_emp_dept FOREIGN KEY (dno) REFERENCES departments(dnumber)
);

ALTER TABLE departments
ADD CONSTRAINT fk_dept_mgr FOREIGN KEY (mgrssn) REFERENCES Employee(ssn);

create table project (pname varchar(50) not null,pnumber int primary key identity(1,1),
plocation VARCHAR(50), dnum  INT,
CONSTRAINT fk_proj_dept FOREIGN KEY (dnum) REFERENCES departments(dnumber)
   
)

CREATE TABLE Works_On (
    essn   INT,
    pno    INT,
    w_hours  DECIMAL(5,2),
    PRIMARY KEY (essn, pno),
    CONSTRAINT fk_work_emp FOREIGN KEY (essn) REFERENCES Employee(ssn),
    CONSTRAINT fk_work_proj FOREIGN KEY (pno) REFERENCES Project(pnumber)
);

CREATE TABLE  Dependent (
    depid      INT PRIMARY KEY,
    dependent_name VARCHAR(50),
    sex        CHAR(1),
    bdate      DATE,
    relationship VARCHAR(50),
    essn       INT,
    CONSTRAINT fk_dependent_emp FOREIGN KEY (essn) REFERENCES Employee(ssn)
);
CREATE TABLE Dept_Locations (
    dnumber INT,
    dlocation VARCHAR(50),
    PRIMARY KEY (dnumber, dlocation),
    CONSTRAINT fk_deptloc_dept FOREIGN KEY (dnumber) REFERENCES departments(dnumber));

   INSERT INTO departments (dname, mgrssn, mgrstartdate)
VALUES ('IT', NULL, '2020-01-01'),
       ('HR', NULL, '2021-05-10');

       INSERT INTO Employee (fname, lname, Bdate, EMPaddress, sex, salary, superssn, dno)
VALUES ('Hossam','Khaled','1985-02-14','Cairo','M',6000,NULL,1),
       ('Mona','Ibrahim','1990-07-22','Alexandria','F',4500,1,2);

       INSERT INTO Dept_Locations (dnumber, dlocation)
VALUES (1, 'Cairo'),
       (2, 'Alexandria');

       
       INSERT INTO Works_On (essn, pno, w_hours)
VALUES (1, 1, 20),   -- Hossam on ERP
       (2, 2, 15),   -- Mona on Recruitment
       (1, 3, 10);   -- Hossam on Security Upgrade


       INSERT INTO Dependent (depid, dependent_name, sex, bdate, relationship, essn)
VALUES (1, 'Omar', 'M', '2015-06-15', 'Son', 1),
       (2, 'Laila','F', '2018-09-05', 'Daughter', 2);


    
    SELECT * FROM Employee;

    SELECT fname, lname, salary, dno FROM Employee;

    SELECT pname, plocation, dnum FROM Project;


    SELECT fname + ' ' + lname AS FullName,
       (salary * 12 * 0.10) AS ANNUAL_COMM
FROM Employee;


SELECT ssn, fname, lname
FROM Employee
WHERE salary > 1000;


SELECT ssn, fname, lname
FROM Employee
WHERE (salary * 12) > 10000;


SELECT fname, lname, salary
FROM Employee
WHERE sex = 'F';

SELECT dnumber, dname
FROM Departments
WHERE mgrssn = 1;


SELECT pnumber, pname, plocation
FROM Project
WHERE dnum = 1;

SELECT dnumber, dname
FROM Departments
WHERE mgrssn = 968574;

SELECT pnumber, pname, plocation
FROM Project
WHERE dnum = 10;
