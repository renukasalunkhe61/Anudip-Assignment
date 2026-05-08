Enter password: ***********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 23
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
| ecommerce          |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
7 rows in set (0.02 sec)

mysql> create database e_commerce;
Query OK, 1 row affected (0.01 sec)

mysql> use e_commerce;
Database changed
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
8 rows in set (0.00 sec)

mysql> create table customer(customer_id varchar(5) not null primary key, name varchar(10) not null, city varchar(10) not null, email varchar(20) not null, address varchar(100) not null, phone_no varchar(10) not null, pin_code int not null);
Query OK, 0 rows affected (0.09 sec)

mysql> show tables;
+----------------------+
| Tables_in_e_commerce |
+----------------------+
| customer             |
+----------------------+
1 row in set (0.01 sec)

mysql> desc customer;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| customer_id | varchar(5)   | NO   | PRI | NULL    |       |
| name        | varchar(10)  | NO   |     | NULL    |       |
| city        | varchar(10)  | NO   |     | NULL    |       |
| email       | varchar(20)  | NO   |     | NULL    |       |
| address     | varchar(100) | NO   |     | NULL    |       |
| phone_no    | varchar(10)  | NO   |     | NULL    |       |
| pin_code    | int          | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> ^C
mysql> create table product(product_id varchar(10) not null primary key, product_name varchar(20) not null, category varchar(10) not null, sub_category varchar(10) not null, original_price double not null, selling_price double not null, stock int not null);
Query OK, 0 rows affected (0.06 sec)

mysql> show tables;
+----------------------+
| Tables_in_e_commerce |
+----------------------+
| customer             |
| product              |
+----------------------+
2 rows in set (0.00 sec)

mysql> desc product;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| product_id     | varchar(10) | NO   | PRI | NULL    |       |
| product_name   | varchar(20) | NO   |     | NULL    |       |
| category       | varchar(10) | NO   |     | NULL    |       |
| sub_category   | varchar(10) | NO   |     | NULL    |       |
| original_price | double      | NO   |     | NULL    |       |
| selling_price  | double      | NO   |     | NULL    |       |
| stock          | int         | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> create table orders(order_id int(5) not null primary key auto_increment, customer_id varchar(5) not null, product_id varchar(10) not null,quantity int(10) not null, total_price double not null, payment_mode varchar(20) not null, order_date date not null, order_status varchar(20) not null, foreign key (customer_id) references customer (customer_id), foreign key (product_id) references product (product_id) );
Query OK, 0 rows affected, 2 warnings (0.09 sec)

mysql> desc orders;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| order_id     | int         | NO   | PRI | NULL    | auto_increment |
| customer_id  | varchar(5)  | NO   | MUL | NULL    |                |
| product_id   | varchar(10) | NO   | MUL | NULL    |                |
| quantity     | int         | NO   |     | NULL    |                |
| total_price  | double      | NO   |     | NULL    |                |
| payment_mode | varchar(20) | NO   |     | NULL    |                |
| order_date   | date        | NO   |     | NULL    |                |
| order_status | varchar(20) | NO   |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
8 rows in set (0.00 sec)

mysql> show tables;
+----------------------+
| Tables_in_e_commerce |
+----------------------+
| customer             |
| orders               |
| product              |
+----------------------+
3 rows in set (0.00 sec)

mysql> insert into customer(customer_id,name, city, email, address, phone_no, pin_code)values('c!0!','Samarth','Mumbai','sdk@gmail.com','Kalyan_East','8591546181','421306');
Query OK, 1 row affected (0.01 sec)

mysql> select*from customer;
+-------------+---------+--------+---------------+-------------+------------+----------+
| customer_id | name    | city   | email         | address     | phone_no   | pin_code |
+-------------+---------+--------+---------------+-------------+------------+----------+
| c!0!        | Samarth | Mumbai | sdk@gmail.com | Kalyan_East | 8591546181 |   421306 |
+-------------+---------+--------+---------------+-------------+------------+----------+
1 row in set (0.00 sec)

mysql> select customer_id, name from customer;
+-------------+---------+
| customer_id | name    |
+-------------+---------+
| c!0!        | Samarth |
+-------------+---------+
1 row in set (0.00 sec)

mysql> desc customer;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| customer_id | varchar(5)   | NO   | PRI | NULL    |       |
| name        | varchar(10)  | NO   |     | NULL    |       |
| city        | varchar(10)  | NO   |     | NULL    |       |
| email       | varchar(20)  | NO   |     | NULL    |       |
| address     | varchar(100) | NO   |     | NULL    |       |
| phone_no    | varchar(10)  | NO   |     | NULL    |       |
| pin_code    | int          | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> insert into customer(customer_id,name, city, email, address, phone_no, pin_code)values('c!1!','Sammy','Mumbai','sammy@gmail.com','Kalyan_East','9373744603','421306');
Query OK, 1 row affected (0.01 sec)

mysql> insert into customer(customer_id,name, city, email, address, phone_no, pin_code)values('c!2!','Sam','Mumbai','sam@gmail.com','Kalyan_East','9930859875','421306');
Query OK, 1 row affected (0.00 sec)

mysql> select*from customer;
+-------------+---------+--------+-----------------+-------------+------------+----------+
| customer_id | name    | city   | email           | address     | phone_no   | pin_code |
+-------------+---------+--------+-----------------+-------------+------------+----------+
| c!0!        | Samarth | Mumbai | sdk@gmail.com   | Kalyan_East | 8591546181 |   421306 |
| c!1!        | Sammy   | Mumbai | sammy@gmail.com | Kalyan_East | 9373744603 |   421306 |
| c!2!        | Sam     | Mumbai | sam@gmail.com   | Kalyan_East | 9930859875 |   421306 |
+-------------+---------+--------+-----------------+-------------+------------+----------+
3 rows in set (0.00 sec)

mysql> desc customer;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| customer_id | varchar(5)   | NO   | PRI | NULL    |       |
| name        | varchar(10)  | NO   |     | NULL    |       |
| city        | varchar(10)  | NO   |     | NULL    |       |
| email       | varchar(20)  | NO   |     | NULL    |       |
| address     | varchar(100) | NO   |     | NULL    |       |
| phone_no    | varchar(10)  | NO   |     | NULL    |       |
| pin_code    | int          | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> alter table customer change column email email varchar(25) not null;
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc customer;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| customer_id | varchar(5)   | NO   | PRI | NULL    |       |
| name        | varchar(10)  | NO   |     | NULL    |       |
| city        | varchar(10)  | NO   |     | NULL    |       |
| email       | varchar(25)  | NO   |     | NULL    |       |
| address     | varchar(100) | NO   |     | NULL    |       |
| phone_no    | varchar(10)  | NO   |     | NULL    |       |
| pin_code    | int          | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> create table demo(id varchar(5) not null primary key,name varchar(20) not null);
Query OK, 0 rows affected (0.04 sec)

mysql>  desc demo;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | varchar(5)  | NO   | PRI | NULL    |       |
| name  | varchar(20) | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> alter table demo drop primary key;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc demo;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | varchar(5)  | NO   |     | NULL    |       |
| name  | varchar(20) | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> alter table demo add primary key(id);
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>  desc demo;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | varchar(5)  | NO   | PRI | NULL    |       |
| name  | varchar(20) | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> select * from customer;
+-------------+---------+--------+-----------------+-------------+------------+----------+
| customer_id | name    | city   | email           | address     | phone_no   | pin_code |
+-------------+---------+--------+-----------------+-------------+------------+----------+
| c!0!        | Samarth | Mumbai | sdk@gmail.com   | Kalyan_East | 8591546181 |   421306 |
| c!1!        | Sammy   | Mumbai | sammy@gmail.com | Kalyan_East | 9373744603 |   421306 |
| c!2!        | Sam     | Mumbai | sam@gmail.com   | Kalyan_East | 9930859875 |   421306 |
+-------------+---------+--------+-----------------+-------------+------------+----------+
3 rows in set (0.00 sec)

mysql> delete from customer where customer_id='c!1!;
    '> ^C
mysql> delete from customer where customer_id='c!1!';
Query OK, 1 row affected (0.01 sec)

mysql> select * from customer;
+-------------+---------+--------+---------------+-------------+------------+----------+
| customer_id | name    | city   | email         | address     | phone_no   | pin_code |
+-------------+---------+--------+---------------+-------------+------------+----------+
| c!0!        | Samarth | Mumbai | sdk@gmail.com | Kalyan_East | 8591546181 |   421306 |
| c!2!        | Sam     | Mumbai | sam@gmail.com | Kalyan_East | 9930859875 |   421306 |
+-------------+---------+--------+---------------+-------------+------------+----------+
2 rows in set (0.00 sec)

mysql> insert into customer(customer_id,name, city, email, address, phone_no, pin_code)values('c!1!','Sammy','Mumbai','sammy@gmail.com','Kalyan_East','9373744603','421306');
Query OK, 1 row affected (0.01 sec)

mysql> select * from customer;
+-------------+---------+--------+-----------------+-------------+------------+----------+
| customer_id | name    | city   | email           | address     | phone_no   | pin_code |
+-------------+---------+--------+-----------------+-------------+------------+----------+
| c!0!        | Samarth | Mumbai | sdk@gmail.com   | Kalyan_East | 8591546181 |   421306 |
| c!1!        | Sammy   | Mumbai | sammy@gmail.com | Kalyan_East | 9373744603 |   421306 |
| c!2!        | Sam     | Mumbai | sam@gmail.com   | Kalyan_East | 9930859875 |   421306 |
+-------------+---------+--------+-----------------+-------------+------------+----------+
3 rows in set (0.00 sec)

mysql> mysql> insert into customer values ('C!3!','Aaditya','Thane','aaditya@gmail.com','Amrai','6666699999','421301');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'mysql> insert into customer values ('C!3!','Aaditya','Thane','aaditya@gmail.com'' at line 1
mysql> Query OK, 1 row affected (0.01 sec)
    ->
    -> mysql> insert into customer values ('C!5!','Renuka','Thane','renuka@gmail.com','Ulhasnagar','4387914387','421302');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Query OK, 1 row affected (0.01 sec)

mysql> insert into customer values ('C!5!',' at line 1
mysql> Query OK, 1 row affected (0.02 sec)
    ->
    -> mysql> insert into customer values ('C!6!','Mahendra','Thane','mahendra@gmail.com','Mumbra','1209348756','421309');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Query OK, 1 row affected (0.02 sec)

mysql> insert into customer values ('C!6!',' at line 1
mysql> insert into customer values ('C!3!','Aaditya','Thane','aaditya@gmail.com','Amrai','6666699999','421301');
Query OK, 1 row affected (0.01 sec)

mysql> insert into customer values ('C!5!','Renuka','Thane','renuka@gmail.com','Ulhasnagar','4387914387','421302');
Query OK, 1 row affected (0.01 sec)

mysql> ('C!6!','Mahendra','Thane','mahendra@gmail.com','Mumbra','1209348756','421309');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''C!6!','Mahendra','Thane','mahendra@gmail.com','Mumbra','1209348756','421309')' at line 1
mysql> select * from customer;
+-------------+---------+--------+-------------------+-------------+------------+----------+
| customer_id | name    | city   | email             | address     | phone_no   | pin_code |
+-------------+---------+--------+-------------------+-------------+------------+----------+
| c!0!        | Samarth | Mumbai | sdk@gmail.com     | Kalyan_East | 8591546181 |   421306 |
| c!1!        | Sammy   | Mumbai | sammy@gmail.com   | Kalyan_East | 9373744603 |   421306 |
| c!2!        | Sam     | Mumbai | sam@gmail.com     | Kalyan_East | 9930859875 |   421306 |
| C!3!        | Aaditya | Thane  | aaditya@gmail.com | Amrai       | 6666699999 |   421301 |
| C!5!        | Renuka  | Thane  | renuka@gmail.com  | Ulhasnagar  | 4387914387 |   421302 |
+-------------+---------+--------+-------------------+-------------+------------+----------+
5 rows in set (0.00 sec)

mysql> desc customer;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| customer_id | varchar(5)   | NO   | PRI | NULL    |       |
| name        | varchar(10)  | NO   |     | NULL    |       |
| city        | varchar(10)  | NO   |     | NULL    |       |
| email       | varchar(25)  | NO   |     | NULL    |       |
| address     | varchar(100) | NO   |     | NULL    |       |
| phone_no    | varchar(10)  | NO   |     | NULL    |       |
| pin_code    | int          | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> alter table customer change column email email varchar(25) not null;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc customer;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| customer_id | varchar(5)   | NO   | PRI | NULL    |       |
| name        | varchar(10)  | NO   |     | NULL    |       |
| city        | varchar(10)  | NO   |     | NULL    |       |
| email       | varchar(25)  | NO   |     | NULL    |       |
| address     | varchar(100) | NO   |     | NULL    |       |
| phone_no    | varchar(10)  | NO   |     | NULL    |       |
| pin_code    | int          | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> desc demo;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | varchar(5)  | NO   | PRI | NULL    |       |
| name  | varchar(20) | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql>  alter table demo drop primary key;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc demo;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | varchar(5)  | NO   |     | NULL    |       |
| name  | varchar(20) | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> alter table demo add primary key(id);
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc demo;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | varchar(5)  | NO   | PRI | NULL    |       |
| name  | varchar(20) | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> select * from customer;
+-------------+---------+--------+-------------------+-------------+------------+----------+
| customer_id | name    | city   | email             | address     | phone_no   | pin_code |
+-------------+---------+--------+-------------------+-------------+------------+----------+
| c!0!        | Samarth | Mumbai | sdk@gmail.com     | Kalyan_East | 8591546181 |   421306 |
| c!1!        | Sammy   | Mumbai | sammy@gmail.com   | Kalyan_East | 9373744603 |   421306 |
| c!2!        | Sam     | Mumbai | sam@gmail.com     | Kalyan_East | 9930859875 |   421306 |
| C!3!        | Aaditya | Thane  | aaditya@gmail.com | Amrai       | 6666699999 |   421301 |
| C!5!        | Renuka  | Thane  | renuka@gmail.com  | Ulhasnagar  | 4387914387 |   421302 |
+-------------+---------+--------+-------------------+-------------+------------+----------+
5 rows in set (0.00 sec)

mysql> delete from customer where customer_id='c!1!';
Query OK, 1 row affected (0.00 sec)

mysql> select * from customer;
+-------------+---------+--------+-------------------+-------------+------------+----------+
| customer_id | name    | city   | email             | address     | phone_no   | pin_code |
+-------------+---------+--------+-------------------+-------------+------------+----------+
| c!0!        | Samarth | Mumbai | sdk@gmail.com     | Kalyan_East | 8591546181 |   421306 |
| c!2!        | Sam     | Mumbai | sam@gmail.com     | Kalyan_East | 9930859875 |   421306 |
| C!3!        | Aaditya | Thane  | aaditya@gmail.com | Amrai       | 6666699999 |   421301 |
| C!5!        | Renuka  | Thane  | renuka@gmail.com  | Ulhasnagar  | 4387914387 |   421302 |
+-------------+---------+--------+-------------------+-------------+------------+----------+
4 rows in set (0.00 sec)

mysql> insert into customer(customer_id,name, city, email, address, phone_no, pin_code)values('c!1!','Sammy','Mumbai','sammy@gmail.com','Kalyan_East','9373744603','421306');
Query OK, 1 row affected (0.01 sec)

mysql> select * from customer;
+-------------+---------+--------+-------------------+-------------+------------+----------+
| customer_id | name    | city   | email             | address     | phone_no   | pin_code |
+-------------+---------+--------+-------------------+-------------+------------+----------+
| c!0!        | Samarth | Mumbai | sdk@gmail.com     | Kalyan_East | 8591546181 |   421306 |
| c!1!        | Sammy   | Mumbai | sammy@gmail.com   | Kalyan_East | 9373744603 |   421306 |
| c!2!        | Sam     | Mumbai | sam@gmail.com     | Kalyan_East | 9930859875 |   421306 |
| C!3!        | Aaditya | Thane  | aaditya@gmail.com | Amrai       | 6666699999 |   421301 |
| C!5!        | Renuka  | Thane  | renuka@gmail.com  | Ulhasnagar  | 4387914387 |   421302 |
+-------------+---------+--------+-------------------+-------------+------------+----------+
5 rows in set (0.00 sec)

mysql> insert into customer(customer_id,name, city, email, address, phone_no, pin_code)values('c!4!','Samarth','Mumbai','samarthkasalkar@gmail.com','Kalyan_East','9876543210','421306');
Query OK, 1 row affected (0.01 sec)

mysql> select * from customer;
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

mysql> select * from demo;
Empty set (0.00 sec)

mysql> desc demo;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | varchar(5)  | NO   | PRI | NULL    |       |
| name  | varchar(20) | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> truncate table orders;
Query OK, 0 rows affected (0.07 sec)

mysql> desc orders;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| order_id     | int         | NO   | PRI | NULL    | auto_increment |
| customer_id  | varchar(5)  | NO   | MUL | NULL    |                |
| product_id   | varchar(10) | NO   | MUL | NULL    |                |
| quantity     | int         | NO   |     | NULL    |                |
| total_price  | double      | NO   |     | NULL    |                |
| payment_mode | varchar(20) | NO   |     | NULL    |                |
| order_date   | date        | NO   |     | NULL    |                |
| order_status | varchar(20) | NO   |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
8 rows in set (0.00 sec)

mysql> truncate table customer;
ERROR 1701 (42000): Cannot truncate a table referenced in a foreign key constraint (`e_commerce`.`orders`, CONSTRAINT `orders_ibfk_1`)
mysql>  select * from demo;
Empty set (0.00 sec)

mysql> truncate table demo;
Query OK, 0 rows affected (0.03 sec)

mysql>  desc demo;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | varchar(5)  | NO   | PRI | NULL    |       |
| name  | varchar(20) | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> drop table orders;
Query OK, 0 rows affected (0.03 sec)

mysql> desc orders;
ERROR 1146 (42S02): Table 'e_commerce.orders' doesn't exist
mysql>