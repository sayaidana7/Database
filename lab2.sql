--1
We use DDL to define schemas in a database, 
and DML is designed to manipulate data stored in databases.
1)create, alter, drop
2)select,insert,delete,update

--2
create database lab22
 with owner postgres;


create table customers
(
    id integer primary key,
    full_name varchar(50) not null,
    timestamp timestamp not null,
    delivery_address text not null

);

create table products
(
    id varchar primary key,
    name varchar unique not null,
    description text,
    price double precision not null  check(price>0)

);

create table orders
(
    code integer primary key ,
    customer_id integer unique ,
    total_sum double precision not null check(total_sum>0),
    is_paid boolean not null,
    foreign key(customer_id) references customers(id)

);


create table order_items
(
    order_code integer not null unique,
    product_id varchar not null unique,
    quantity integer not null check(quantity>0),
    primary key(order_code,product_id),
    foreign key(product_id) references products(id),
    foreign key(order_code) references orders(code)


);
-- drop table orders;
-- drop table products;
-- drop table order_items;
-- drop table customers;


-- 3

create database lab23
  with owner postgres ;

create table student
(
    full_name text primary key ,
    age integer not null,
    birth_date date not null,
    gender varchar not null,
    average_grade double precision not null,
    inf_about_you text not null,
    dormitory boolean not null,
    additional_info text not null

);
create table instructor
(
    full_name text primary key ,
    speaking_lang varchar not null,
    work_experience integer not null,
    poss_rem_less boolean not null
);
create table lesson
(
    lesson_title text not null,
    teaching_instructor text not null,
    room_number integer not null,
    student_name text not null,
    primary key (lesson_title,teaching_instructor),
    foreign key (student_name) references student(full_name),
    foreign key (teaching_instructor) references instructor(full_name)
);
create table lesson_participants(
    lesson_title text not null,
    teaching_instructor varchar not null,
    studying_students integer not null ,
    primary key (lesson_title,teaching_instructor),
    foreign key(lesson_title,teaching_instructor) references lesson(lesson_title, teaching_instructor)
);
-- drop database lab23;

-- 4


insert into customers(id, full_name, timestamp, delivery_address) values (123,'aidana','2002-07-25','pavlodar');
insert into products(id, name, description, price) values('111','tvorog','kislyi',444);
insert into products(id, name, description, price) values('999','moloko','hol',444);
insert into orders(code, customer_id, total_sum, is_paid) values(111,123,6666,true);
insert into order_items(order_code, product_id, quantity) values ('111','111','500');

update customers set delivery_address='almaty' where delivery_address='pavlodar';
update products set price=777 where price=444;
-- select *from products;
-- select *from customers;

delete from products where description='hol';
-- select *from products;