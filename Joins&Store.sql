Enter password: ***********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 34
Server version: 8.0.46 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database joints;
Query OK, 1 row affected (0.03 sec)

mysql> use joints;
Database changed
mysql> create table department(dept_id int primary key not null, dept_name varchar(30) not null);
Query OK, 0 rows affected (0.09 sec)

mysql> desc department;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_id   | int         | NO   | PRI | NULL    |       |
| dept_name | varchar(30) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
2 rows in set (0.02 sec)

mysql> insert into department values((1,'HR'),(2,'IT'),(3,'FINANCE'),,(4,'MARKETING');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',(4,'MARKETING')' at line 1
mysql> insert into department values((1,'HR'),(2,'IT'),(3,'FINANCE'),(4,'MARKETING');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> insert into department values(1,'HR'),(2,'IT'),(3,'FINANCE'),(4,'MARKETING');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> SELECT*FROM DEPARTMENT;
+---------+-----------+
| dept_id | dept_name |
+---------+-----------+
|       1 | HR        |
|       2 | IT        |
|       3 | FINANCE   |
|       4 | MARKETING |
+---------+-----------+
4 rows in set (0.00 sec)

mysql> create table employee(emp_id int primary key not null, emp_name varchar(20) not null, dept_id int_id);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'int_id)' at line 1
mysql> create table employee( emp_id int primary key not null, emp_name varchar(20) not null, dept_id int_id);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'int_id)' at line 1
mysql> create table employee(
    ->     emp_id int primary key not null,
    ->     emp_name varchar(20) not null,
    ->     dept_id int
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> show tables;
+------------------+
| Tables_in_joints |
+------------------+
| department       |
| employee         |
+------------------+
2 rows in set (0.01 sec)

mysql> desc employee;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| emp_id   | int         | NO   | PRI | NULL    |       |
| emp_name | varchar(20) | NO   |     | NULL    |       |
| dept_id  | int         | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into employee values( 1,'amit',1),(2,'ajay',2),(3,'aayush',1),(4,'ankit',null),(5,'aandy',4);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+--------+----------+---------+
| emp_id | emp_name | dept_id |
+--------+----------+---------+
|      1 | amit     |       1 |
|      2 | ajay     |       2 |
|      3 | aayush   |       1 |
|      4 | ankit    |    NULL |
|      5 | aandy    |       4 |
+--------+----------+---------+
5 rows in set (0.00 sec)

mysql> select*from department;
+---------+-----------+
| dept_id | dept_name |
+---------+-----------+
|       1 | HR        |
|       2 | IT        |
|       3 | FINANCE   |
|       4 | MARKETING |
+---------+-----------+
4 rows in set (0.00 sec)

mysql> select emp_name, dept_name from employee inner join department on employee.dept_id=department.dept_id;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| amit     | HR        |
| ajay     | IT        |
| aayush   | HR        |
| aandy    | MARKETING |
+----------+-----------+
4 rows in set (0.00 sec)

mysql> select emp_name, dept_name from employee left join department on employee.dept_id=department.dept_id;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| amit     | HR        |
| ajay     | IT        |
| aayush   | HR        |
| ankit    | NULL      |
| aandy    | MARKETING |
+----------+-----------+
5 rows in set (0.00 sec)

mysql> select emp_name, dept_name from employee right join department on employee.dept_id=department.dept_id;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| aayush   | HR        |
| amit     | HR        |
| ajay     | IT        |
| NULL     | FINANCE   |
| aandy    | MARKETING |
+----------+-----------+
5 rows in set (0.00 sec)

mysql> select emp_name, dept_name from employee full join department;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| amit     | MARKETING |
| amit     | FINANCE   |
| amit     | IT        |
| amit     | HR        |
| ajay     | MARKETING |
| ajay     | FINANCE   |
| ajay     | IT        |
| ajay     | HR        |
| aayush   | MARKETING |
| aayush   | FINANCE   |
| aayush   | IT        |
| aayush   | HR        |
| ankit    | MARKETING |
| ankit    | FINANCE   |
| ankit    | IT        |
| ankit    | HR        |
| aandy    | MARKETING |
| aandy    | FINANCE   |
| aandy    | IT        |
| aandy    | HR        |
+----------+-----------+
20 rows in set, 1 warning (0.00 sec)

mysql> create database store_procedure_example;
Query OK, 1 row affected (0.01 sec)

mysql> use store_procedure_example;
Database changed
mysql> create table employee(id int primary key not null, name varchar(20) not null, dept varchar(20) not null, salary int);
Query OK, 0 rows affected (0.04 sec)

mysql> desc employee;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| id     | int         | NO   | PRI | NULL    |       |
| name   | varchar(20) | NO   |     | NULL    |       |
| dept   | varchar(20) | NO   |     | NULL    |       |
| salary | int         | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> insert into employee values(1,'Renuka','HR',10000);
Query OK, 1 row affected (0.01 sec)

mysql> select * from employee;
+----+--------+------+--------+
| id | name   | dept | salary |
+----+--------+------+--------+
|  1 | Renuka | HR   |  10000 |
+----+--------+------+--------+
1 row in set (0.00 sec)

mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE GetEmployees()
    -> BEGIN
    ->     SELECT * FROM Employee;
    -> END //
Query OK, 0 rows affected (0.04 sec)

mysql>
mysql> DELIMITER ;
mysql> ^C
mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE GetEmployees()
    -> BEGIN
    ->     SELECT * FROM Employee;
    -> END //
ERROR 1304 (42000): PROCEDURE GetEmployees already exists
mysql>
mysql> DELIMITER ;^C
mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE GetEmployees()
    -> BEGIN
    ->     SELECT * FROM Employee;
    -> END //
ERROR 1304 (42000): PROCEDURE GetEmployees already exists
mysql>
mysql> DELIMITER ;
mysql> call GetEmployees;
+----+--------+------+--------+
| id | name   | dept | salary |
+----+--------+------+--------+
|  1 | Renuka | HR   |  10000 |
+----+--------+------+--------+
1 row in set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE GetEmployeeByDept(IN dept_name VARCHAR(50))
    -> BEGIN
    ->     SELECT *
    ->     FROM Employees
    ->     WHERE department = dept_name;
    -> END //
Query OK, 0 rows affected (0.02 sec)

mysql>
mysql> DELIMITER ;
mysql> call GetEmployeesByDept('HR');
ERROR 1305 (42000): PROCEDURE store_procedure_example.GetEmployeesByDept does not exist
mysql> call GetEmployeeByDept('HR');
ERROR 1146 (42S02): Table 'store_procedure_example.employees' doesn't exist
mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE GetEmployeeByDept(IN dept_name VARCHAR(50))
    -> BEGIN
    ->     SELECT *
    ->     FROM employee
    ->     WHERE department = dept_name;
    -> END //
ERROR 1304 (42000): PROCEDURE GetEmployeeByDept already exists
mysql>
mysql> DELIMITER ;
mysql> DROP PROCEDURE GetEmployeeByDept;
Query OK, 0 rows affected (0.03 sec)

mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE GetEmployeeByDept(IN dept_name VARCHAR(50))
    -> BEGIN
    ->     SELECT *
    ->     FROM employee
    ->     WHERE department = dept_name;
    -> END //
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER ;
mysql> CALL GetEmployeeByDept('HR');
ERROR 1054 (42S22): Unknown column 'department' in 'where clause'
mysql> DESC employee;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| id     | int         | NO   | PRI | NULL    |       |
| name   | varchar(20) | NO   |     | NULL    |       |
| dept   | varchar(20) | NO   |     | NULL    |       |
| salary | int         | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> DROP PROCEDURE GetEmployeeByDept;
Query OK, 0 rows affected (0.01 sec)

mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE GetEmployeeByDept(IN dept_name VARCHAR(50))
    -> BEGIN
    ->     SELECT *
    ->     FROM employee
    ->     WHERE dept = dept_name;
    -> END //
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER ;
mysql> CALL GetEmployeeByDept('HR');
+----+--------+------+--------+
| id | name   | dept | salary |
+----+--------+------+--------+
|  1 | Renuka | HR   |  10000 |
+----+--------+------+--------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> CALL GetEmployeeByDept('IT');
Empty set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE AddEmployee(
    ->     IN emp_id INT,
    ->     IN emp_name VARCHAR(50),
    ->     IN emp_dept VARCHAR(50),
    ->     IN emp_salary INT
    -> )
    -> BEGIN
    ->     INSERT INTO employee(id, name, dept, salary)
    ->     VALUES(emp_id, emp_name, emp_dept, emp_salary);
    -> END //
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER ;
mysql>  CALL AddEmployee(2, 'Rahul', 'IT', 25000);
Query OK, 1 row affected (0.01 sec)

mysql> select * from employee;
+----+--------+------+--------+
| id | name   | dept | salary |
+----+--------+------+--------+
|  1 | Renuka | HR   |  10000 |
|  2 | Rahul  | IT   |  25000 |
+----+--------+------+--------+
2 rows in set (0.00 sec)

mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE GetEmployeeCount(OUT total INT)
    -> BEGIN
    ->     SELECT COUNT(*) INTO total
    ->     FROM Employee;
    -> END //
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER ;
mysql> CALL GetEmployeeCount(@total);
Query OK, 1 row affected (0.04 sec)

mysql> SELECT @total;
+--------+
| @total |
+--------+
|      2 |
+--------+
1 row in set (0.00 sec)

mysql>