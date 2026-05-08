Enter password: ***********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 24
Server version: 8.0.46 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| e_commerce         |
| ecommerce          |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
8 rows in set (0.01 sec)

mysql> use e_commerce
Database changed
mysql> desc e_commerce;
ERROR 1146 (42S02): Table 'e_commerce.e_commerce' doesn't exist
mysql> show tables;
+----------------------+
| Tables_in_e_commerce |
+----------------------+
| customer             |
| demo                 |
| product              |
+----------------------+
3 rows in set (0.00 sec)

mysql> select* from customer;
+-------------+---------+--------+---------------------------+-------------+------------+----------+
| customer_id | name    | city   | email                     | address     | phone_no   | pin_code |
+-------------+---------+--------+---------------------------+-------------+------------+----------+
| c!0!        | Samarth | Mumbai | sdk@gmail.com             | Kalyan_East | 8591546181 |   421306 |
| c!1!        | Sammy   | Mumbai | sammy@gmail.com           | Kalyan_East | 9373744603 |   421306 |
| c!2!        | Sam     | Mumbai | sam@gmail.com             | Kalyan_East | 9930859875 |   421306 |
| C!3!        | Aaditya | Thane  | aaditya@gmail.com         | Amrai       | 6666699999 |   421301 |
| c!4!        | Samarth | Mumbai | samarthkasalkar@gmail.com | Kalyan_East | 9876543210 |   421306 |
| C!5!        | Renuka  | Thane  | renuka@gmail.com          | Ulhasnagar  | 4387914387 |   421302 |
+-------------+---------+--------+---------------------------+-------------+------------+----------+
6 rows in set (0.00 sec)

mysql> update customer set phone_no='9075447054' where customer_id='C!5!';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select* from customer;
+-------------+---------+--------+---------------------------+-------------+------------+----------+
| customer_id | name    | city   | email                     | address     | phone_no   | pin_code |
+-------------+---------+--------+---------------------------+-------------+------------+----------+
| c!0!        | Samarth | Mumbai | sdk@gmail.com             | Kalyan_East | 8591546181 |   421306 |
| c!1!        | Sammy   | Mumbai | sammy@gmail.com           | Kalyan_East | 9373744603 |   421306 |
| c!2!        | Sam     | Mumbai | sam@gmail.com             | Kalyan_East | 9930859875 |   421306 |
| C!3!        | Aaditya | Thane  | aaditya@gmail.com         | Amrai       | 6666699999 |   421301 |
| c!4!        | Samarth | Mumbai | samarthkasalkar@gmail.com | Kalyan_East | 9876543210 |   421306 |
| C!5!        | Renuka  | Thane  | renuka@gmail.com          | Ulhasnagar  | 9075447054 |   421302 |
+-------------+---------+--------+---------------------------+-------------+------------+----------+
6 rows in set (0.00 sec)

mysql> select*from customer where name like'%th';
+-------------+---------+--------+---------------------------+-------------+------------+----------+
| customer_id | name    | city   | email                     | address     | phone_no   | pin_code |
+-------------+---------+--------+---------------------------+-------------+------------+----------+
| c!0!        | Samarth | Mumbai | sdk@gmail.com             | Kalyan_East | 8591546181 |   421306 |
| c!4!        | Samarth | Mumbai | samarthkasalkar@gmail.com | Kalyan_East | 9876543210 |   421306 |
+-------------+---------+--------+---------------------------+-------------+------------+----------+
2 rows in set (0.00 sec)

mysql> select*from customer where name like'%nu%';
+-------------+--------+-------+------------------+------------+------------+----------+
| customer_id | name   | city  | email            | address    | phone_no   | pin_code |
+-------------+--------+-------+------------------+------------+------------+----------+
| C!5!        | Renuka | Thane | renuka@gmail.com | Ulhasnagar | 9075447054 |   421302 |
+-------------+--------+-------+------------------+------------+------------+----------+
1 row in set (0.00 sec)

mysql> select*from customer's____';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''s____'' at line 1
mysql> select*from customer's____';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''s____'' at line 1
mysql> select*from customer'S____';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''S____'' at line 1
mysql> select*from customer where name like 'S____';
+-------------+-------+--------+-----------------+-------------+------------+----------+
| customer_id | name  | city   | email           | address     | phone_no   | pin_code |
+-------------+-------+--------+-----------------+-------------+------------+----------+
| c!1!        | Sammy | Mumbai | sammy@gmail.com | Kalyan_East | 9373744603 |   421306 |
+-------------+-------+--------+-----------------+-------------+------------+----------+
1 row in set (0.00 sec)

mysql> select* from customer limit 3;
+-------------+---------+--------+-----------------+-------------+------------+----------+
| customer_id | name    | city   | email           | address     | phone_no   | pin_code |
+-------------+---------+--------+-----------------+-------------+------------+----------+
| c!0!        | Samarth | Mumbai | sdk@gmail.com   | Kalyan_East | 8591546181 |   421306 |
| c!1!        | Sammy   | Mumbai | sammy@gmail.com | Kalyan_East | 9373744603 |   421306 |
| c!2!        | Sam     | Mumbai | sam@gmail.com   | Kalyan_East | 9930859875 |   421306 |
+-------------+---------+--------+-----------------+-------------+------------+----------+
3 rows in set (0.00 sec)

mysql> select distinct city from customer;
+--------+
| city   |
+--------+
| Mumbai |
| Thane  |
+--------+
2 rows in set (0.00 sec)

mysql> select* from customer where customer_id between 'c!2!' and '!c!5!';
Empty set (0.00 sec)

mysql> select* from customer where customer_id between 'c!2!' and 'c!5!';
+-------------+---------+--------+---------------------------+-------------+------------+----------+
| customer_id | name    | city   | email                     | address     | phone_no   | pin_code |
+-------------+---------+--------+---------------------------+-------------+------------+----------+
| c!2!        | Sam     | Mumbai | sam@gmail.com             | Kalyan_East | 9930859875 |   421306 |
| C!3!        | Aaditya | Thane  | aaditya@gmail.com         | Amrai       | 6666699999 |   421301 |
| c!4!        | Samarth | Mumbai | samarthkasalkar@gmail.com | Kalyan_East | 9876543210 |   421306 |
| C!5!        | Renuka  | Thane  | renuka@gmail.com          | Ulhasnagar  | 9075447054 |   421302 |
+-------------+---------+--------+---------------------------+-------------+------------+----------+
4 rows in set (0.00 sec)

mysql> select* from customer where customer_id not between 'c!2!' and 'c!5!';
+-------------+---------+--------+-----------------+-------------+------------+----------+
| customer_id | name    | city   | email           | address     | phone_no   | pin_code |
+-------------+---------+--------+-----------------+-------------+------------+----------+
| c!0!        | Samarth | Mumbai | sdk@gmail.com   | Kalyan_East | 8591546181 |   421306 |
| c!1!        | Sammy   | Mumbai | sammy@gmail.com | Kalyan_East | 9373744603 |   421306 |
+-------------+---------+--------+-----------------+-------------+------------+----------+
2 rows in set (0.00 sec)

mysql> select* from customer where customer_id not in( 'c!2!','c!3!', 'c!5!');
+-------------+---------+--------+---------------------------+-------------+------------+----------+
| customer_id | name    | city   | email                     | address     | phone_no   | pin_code |
+-------------+---------+--------+---------------------------+-------------+------------+----------+
| c!0!        | Samarth | Mumbai | sdk@gmail.com             | Kalyan_East | 8591546181 |   421306 |
| c!1!        | Sammy   | Mumbai | sammy@gmail.com           | Kalyan_East | 9373744603 |   421306 |
| c!4!        | Samarth | Mumbai | samarthkasalkar@gmail.com | Kalyan_East | 9876543210 |   421306 |
+-------------+---------+--------+---------------------------+-------------+------------+----------+
3 rows in set (0.00 sec)

mysql> select* from customer where customer_id in( 'c!2!','c!3!', 'c!5!');
+-------------+---------+--------+-------------------+-------------+------------+----------+
| customer_id | name    | city   | email             | address     | phone_no   | pin_code |
+-------------+---------+--------+-------------------+-------------+------------+----------+
| c!2!        | Sam     | Mumbai | sam@gmail.com     | Kalyan_East | 9930859875 |   421306 |
| C!3!        | Aaditya | Thane  | aaditya@gmail.com | Amrai       | 6666699999 |   421301 |
| C!5!        | Renuka  | Thane  | renuka@gmail.com  | Ulhasnagar  | 9075447054 |   421302 |
+-------------+---------+--------+-------------------+-------------+------------+----------+
3 rows in set (0.00 sec)

mysql>