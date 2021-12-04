create table customers(
    customer_id serial primary key,
    customer_name varchar(30) not null,
    city varchar(30) not null,
    street varchar(30) not null,
    house_number varchar(30) not null,
    phone varchar(20) not null,
    amount_owed integer not null,
    -- frequent_cus boolean not null
);
create table package(
    package_id serial primary key,
    customer_id integer references customers(customer_id),
    amount integer not null,
    type varchar(20) not null,
    weight numeric not null ,
    timelines_of_deliv date
);
create table invoices(
    invoice_id serial primary key,
    package_id integer references package(package_id),
    invoice_date date,
    total numeric not null
);
create table payment(
    payment_id serial primary key,
    invoice_id integer references invoices(invoice_id),
    payment_method varchar(30) not null ,
    payment_cost numeric not null
);
create table delivery(
    delivery_id serial primary key,
    package_id integer references package(package_id),
    delivery_status varchar(20) not null,
    delivered_time datetime
    truck_id integer references truck(truck_id)
create table warehouse(
    warehouse_id serial primary key ,
    warehouse_address varchar not null,
);
create table truck(
    truck_id serial primary key,
    truck_number integer not null,
);

insert into customers(customer_name, city, street, house_number, phone, amount_owed) values ('Lucy', 'Almaty', 'Bayzakova', '1280', '87777777777' , 1350);
insert into customers(customer_name, city, street, house_number, phone, amount_owed) values ('Royan', 'Almaty', 'Bayzakova', '4532','8778778778' , 0);
insert into customers(customer_name, city, street, house_number, phone, amount_owed) values ('Salmon', 'Almaty', 'Zhandosova', '7653','87077077070' , 1200);
insert into customers(customer_name, city, street, house_number, phone, amount_owed) values ('Dayne', 'Nur-Sultan', 'Abay', '8542','87717717717' , 550);
insert into customers(customer_name, city, street, house_number, phone, amount_owed) values ('Cameron', 'Atyrau', 'Dostyk', '2468', '87027027027' , 900);
insert into customers(customer_name, city, street, house_number, phone, amount_owed) values ('Warren', 'Turkestan', 'Al-Farabi', '9345','87057057057', 0 );
insert into customers(customer_name, city, street, house_number, phone, amount_owed) values ('William', 'Shymkent', 'Altynsarina', '1584','87017017017' , 0);
insert into customers(customer_name, city, street, house_number, phone, amount_owed) values ('Julia', 'Aktobe', 'Satpaeva', '1685', '87007007007' , 0);
insert into customers(customer_name, city, street, house_number, phone, amount_owed) values ('Roberts', 'Almaty', 'Tole-bi', '7532', '87477477477' , 0);
insert into customers(customer_name, city, street, house_number, phone, amount_owed) values ('Sharon', 'Karagandy', 'Aiteke-Bi', '8532', '87037037037' , 100);

insert into package (customer_id, amount, type, weight, timelines_of_deliv) values (4, 1000, 'large box', 5.6, '10-1-2020');
insert into package (customer_id, amount, type, weight, timelines_of_deliv) values (5, 2100, 'large box', 7.8 , '9-2-2020');
insert into package (customer_id, amount, type, weight, timelines_of_deliv) values (1, 750, 'small box',3.5, '9-2-2020');
insert into package (customer_id, amount, type, weight, timelines_of_deliv) values (6, 430, 'small box',1.3, '12-3-2020');
insert into package (customer_id, amount, type, weight, timelines_of_deliv) values (3, 2000,'large box', 7.6, '12-3-2020');
insert into package (customer_id, amount, type, weight, timelines_of_deliv) values (1, 1200, 'large box', 6.2, '12-3-2020');
insert into package (customer_id, amount, type, weight, timelines_of_deliv) values (8, 900, 'small box', 2.3, '15-3-2020');
insert into package (customer_id, amount, type, weight, timelines_of_deliv) values (9, 570, 'small box', 1.9, '19-3-2020');
insert into package (customer_id, amount, type, weight, timelines_of_deliv) values (10, 890,'small box', 2.4, '13-4-2020');
insert into package (customer_id, amount, type, weight, timelines_of_deliv) values (1, 1200, 'large box', 6.2, '21-4-2020');
insert into package (customer_id, amount, type, weight, timelines_of_deliv) values (4, 670, 'small box', 19.8, '8-5-2020');
insert into package (customer_id, amount, type, weight, timelines_of_deliv) values (7, 835, 'small box', 1.6, '23-6-2020');
insert into package (customer_id, amount, type, weight, timelines_of_deliv) values (1, 450, 'small box', 5.3, '23-7-2020');
insert into package (customer_id, amount, type, weight, timelines_of_deliv) values (5, 1200,'large box', 6.4, '1-1-2021');
insert into package (customer_id, amount, type, weight, timelines_of_deliv) values (2, 450, 'small box', 2.9, '3-4-2021');
insert into package (customer_id, amount, type, weight, timelines_of_deliv) values (7, 650, 'small box', 2.8, '4-6-2021');
insert into package (customer_id, amount, type, weight, timelines_of_deliv) values (3, 770, 'small box', 1.4, '8-9-2021');
insert into package (customer_id, amount, type, weight, timelines_of_deliv) values (5, 880, 'small box', 1.5, '5-12-2021');
insert into package (customer_id, amount, type, weight, timelines_of_deliv) values (1, 1550, 'large box', 6.9, '5-12-2021');
insert into package (customer_id, amount, type, weight, timelines_of_deliv) values (3, 440,'small box', 2.4, '5-12-2021');

insert into invoices (package_id, total, invoice_date) values (1 , 1000, '7-1-2020');
insert into invoices (package_id, total, invoice_date) values (2, 2100, '5-2-2020');
insert into invoices (package_id, total, invoice_date) values (3, 750, '6-2-2020');
insert into invoices (package_id, total, invoice_date) values (4, 430, '9-3-2020');
insert into invoices (package_id, total, invoice_date) values (5, 2000, '8-3-2020');
insert into invoices (package_id, total, invoice_date) values (6, 1200, '10-3-2020');
insert into invoices (package_id, total, invoice_date) values (7, 900,  '12-3-2020');
insert into invoices (package_id, total, invoice_date) values (8, 570,  '18-3-2020');
insert into invoices (package_id, total, invoice_date) values (9, 890, '11-4-2020');
insert into invoices (package_id, total, invoice_date) values (10, 1200, '11-4-2020');
insert into invoices (package_id, total, invoice_date) values (11, 670, '3-5-2020');
insert into invoices (package_id, total, invoice_date) values (12, 835, '20-6-2020');
insert into invoices (package_id, total, invoice_date) values (13, 450, '19-7-2020');
insert into invoices (package_id, total, invoice_date) values (14, 1200, '29-12-2020');
insert into invoices (package_id, total, invoice_date) values (15, 450, '1-4-2021');
insert into invoices (package_id, total, invoice_date) values (16, 650, '1-6-2021');
insert into invoices (package_id, total, invoice_date) values (17, 770, '4-9-2021');
insert into invoices (package_id, total, invoice_date) values (18, 880, '30-11-2021');
insert into invoices (package_id, total, invoice_date) values (19, 1550, '28-11-2021');
insert into invoices (package_id, total, invoice_date) values (20, 440, '1-12-2021');

insert into payment (invoice_id, payment_method, payment_cost) values (1, 'cash', 580);
insert into payment (invoice_id, payment_method, payment_cost) values (2, 'credit card', 803);
insert into payment (invoice_id, payment_method, payment_cost) values (3, 'cash', 579);
insert into payment (invoice_id, payment_method, payment_cost) values (4, 'credit card', 1180);
insert into payment (invoice_id, payment_method, payment_cost) values (5, 'credit card', 320);
insert into payment (invoice_id, payment_method, payment_cost) values (6, 'credit card', 26);
insert into payment (invoice_id, payment_method, payment_cost) values (7,'cash', 1619);
insert into payment (invoice_id, payment_method, payment_cost) values (8,'credit', 235);
insert into payment (invoice_id, payment_method, payment_cost) values (9,'credit', 1642);
insert into payment (invoice_id, payment_method, payment_cost) values (10,'credit card', 1457);
insert into payment (invoice_id, payment_method, payment_cost) values (11,'credit card', 1276);
insert into payment (invoice_id, payment_method, payment_cost) values (12,'credit card', 144);
insert into payment (invoice_id, payment_method, payment_cost) values (13,'cash', 851);
insert into payment (invoice_id, payment_method, payment_cost) values (14, 'cash', 1921);
insert into payment (invoice_id, payment_method, payment_cost) values (15, 'credit card', 508);
insert into payment (invoice_id, payment_method, payment_cost) values (16, 'cash', 1178);
insert into payment (invoice_id, payment_method, payment_cost) values (17, 'credit card', 1426);
insert into payment (invoice_id, payment_method, payment_cost) values (18, 'credit card', 856);
insert into payment (invoice_id, payment_method, payment_cost) values (19, 'credit card', 335);
insert into payment (invoice_id, payment_method, payment_cost) values (20, 'credit card', 1837);

insert into delivery (package_id, delivery_status , delivered_time, truck_id) values (1 , 'done' , '10-1-2020' , 1);
insert into delivery (package_id, delivery_status , delivered_time, truck_id) values (3, 'done', '6-2-2020', 2);
insert into delivery (package_id, delivery_status , delivered_time, truck_id) values (4, 'done', '9-3-2020', 3);
insert into delivery (package_id, delivery_status , delivered_time, truck_id) values (5, 'done', '8-3-2020', 4);
insert into delivery (package_id, delivery_status , delivered_time, truck_id) values (6, 'done', '10-3-2020', 1);
insert into delivery (package_id, delivery_status , delivered_time, truck_id) values (7, 'done',  '12-3-2020', 3);
insert into delivery (package_id, delivery_status , delivered_time, truck_id) values (8, 'done',  '18-3-2020', 4);
insert into delivery (package_id, delivery_status , delivered_time, truck_id) values (9, 'done', '11-4-2020', 1);
insert into delivery (package_id, delivery_status , delivered_time, truck_id) values (10, 'done', '11-4-2020', 2);
insert into delivery (package_id, delivery_status , delivered_time, truck_id) values (11, 'done', '3-5-2020', 3);
insert into delivery (package_id, delivery_status , delivered_time, truck_id) values (12, 'done', '20-6-2020', 4);
insert into delivery (package_id, delivery_status , delivered_time, truck_id) values (13, 'done', '19-7-2020', 1);
insert into delivery (package_id, delivery_status , delivered_time, truck_id) values (14, 'done', '29-12-2020', 2);
insert into delivery (package_id, delivery_status , delivered_time, truck_id) values (15, 'done', '1-4-2021', 3);
insert into delivery (package_id, delivery_status , delivered_time, truck_id) values (16, 'done', '1-6-2021', 4);
insert into delivery (package_id, delivery_status , delivered_time, truck_id) values (17, 'done', '4-9-2021', 1);
insert into delivery (package_id, delivery_status , delivered_time, truck_id) values (18, 'in proccess', '1-12-2021', 2);
insert into delivery (package_id, delivery_status , delivered_time, truck_id) values (19, 'done', '13-12-2021', 1);
insert into delivery (package_id, delivery_status , delivered_time, truck_id) values (20, 'in proccess', '13-12-2021', 1);
insert into delivery (package_id, delivery_status , delivered_time, truck_id) values (20, 'in proccess', '13-12-2021', 1);
insert into delivery (package_id, delivery_status , delivered_time, truck_id) values (20, 'in proccess', '23-12-2021', 3);

insert into warehouse (warehouse_address) values('First Street');
insert into warehouse (warehouse_address) values('Second Street');
insert into warehouse (warehouse_address) values('Third Street');

insert into truck (truck_number) values(1721);
insert into truck (truck_number) values(1432);
insert into truck (truck_number) values(1937);
insert into truck (truck_number) values(5670);

-- queries
-- Task 1
SELECT customers.customer_name FROM customers , delivery, truck 
WHERE trucks_number = 1721 AND delivery.truck_id = truck.truck_id;

SELECT package.package_id FROM package, delivery, truk 
WHERE id=(SELECT max(id) FROM delivery WHERE trucks_id=1721 AND delivery_status='done');
 
-- Task 2
SELECT MAX(t.mycount), t.customer_id 
FROM (SELECT COUNT(p.customer_id) AS mycount, p.customer_id FROM package 
WHERE date BETWEEN '2020-01-01' AND '2020-12-31' GROUP BY p.customer_id ORDER BY mycount DESC) as t;

--Task 3
CREATE view total_sum AS SELECT customer_id, customer_name, SUM(total) AS summa 
FROM customers, package, invoices WHERE package.customers_id = customer.customer_id AND package.package_id = invoices.package_id GROUP BY customer_id, customer_name;
SELECT customer_id, customer_name, summa FROM total_sum AS sc, invoices, package 
WHERE summa = (select max(summa) from total_sum AS cins) AND customer_id=package.customer_id 
AND invoices.package_id = package.package_id AND package.timelines_of_deliv 
BETWEEN '2020-01-01' AND '2020-12-31' GROUP BY customer_id, customer_name;

--Task 4
SELECT * FROM (SELECT street, count(customer_id) AS count_cust FROM customers GROUP BY street) AS 
WHERE count_street=(SELECT MAX(count_cust) FROM (SELECT street, COUNT(customer_id) AS count_cust 
FROM customers GROUP BY street) AS count_street) ORDER BY count_cust DESC;

--Task 5
SELECT customer_name, package.package_id FROM customers, package, delivery 
WHERE (date_part('day' , delivery.delivered_time) > date_part('day',package.timelines_of_deliv)) OR (date_part('month' , delivery.delivered_time) > date_part('month',package.timelines_of_deliv))  AND delivery.package_id=package.package_id;

--Task 6
--Part 1
SELECT customers.customer_id, customers.customer_name ,customers.amount_owed,package.package_id,payment.payment_id,payment.payment_cost
FROM INNER JOIN invoices ON invoices.invoice_id =customers.customer_id 
INNER JOIN package ON package.package_id =invoice.package_id
INNER JOIN payment ON payment.payment_id =invoice.invoice_id
WHERE month(invoices.Date) = month(NOW() - INTERVAL 1 MONTH)

--Part 2
SELECT package.package_id,payment.payment_id,payment.payment_cost,payment.payment_method,invoice.total
FROM INNER JOIN package ON package.package_id =payment.payment_id
WHERE package.package_id=invoice.invoice_id

--Part 3
SELECT * FROM
INNER JOIN invoice ON invoice.invoice_id =customers.customer_id 
INNER JOIN package ON package.package_id =invoice.invoice_id
INNER JOIN payment ON payment.payment_id =invoice.invoice_id
INNER JOIN delivery ON payment.payment_id =delivery.delivery_id

