CREATE DATABASE LAB7;
create table customers (
    id integer primary key,
    name varchar(255),
    birth_date date
);

create table accounts(
    account_id varchar(40) primary key ,
    customer_id integer references customers(id),
    currency varchar(3),
    balance float,
    "limit" float
);

create table transactions (
    id serial primary key ,
    date timestamp,
    src_account varchar(40) references accounts(account_id),
    dst_account varchar(40) references accounts(account_id),
    amount float,
    status varchar(20)
);

INSERT INTO customers VALUES (201, 'John', '2021-11-05');
INSERT INTO customers VALUES (202, 'Anny', '2021-11-02');
INSERT INTO customers VALUES (203, 'Rick', '2021-11-24');

INSERT INTO accounts VALUES ('NT10204', 201, 'KZT', 1000, null);
INSERT INTO accounts VALUES ('AB10203', 202, 'USD', 100, 0);
INSERT INTO accounts VALUES ('DK12000', 203, 'EUR', 500, 200);
INSERT INTO accounts VALUES ('NK90123', 201, 'USD', 400, 0);
INSERT INTO accounts VALUES ('RS88012', 203, 'KZT', 5000, -100);

INSERT INTO transactions VALUES (1, '2021-11-05 18:00:34.000000', 'NT10204', 'RS88012', 1000, 'commited');
INSERT INTO transactions VALUES (2, '2021-11-05 18:01:19.000000', 'NK90123', 'AB10203', 500, 'rollback');
INSERT INTO transactions VALUES (3, '2021-06-05 18:02:45.000000', 'RS88012', 'NT10204', 400, 'init');


--1
-- Large objects (photos, videos, CAD files, etc.) are stored as a large object:
-- a)blob: binary large object -- object is a large collection of uninterpreted
-- binary data (whose interpretation is left to an application outside of the database system)
-- b) clob: character large object -- object is a large collection of character data
-- When a query returns a large object, a pointer is returned rather than the large object itself.

--2
--GRANT — define access privileges
--CREATE ROLE — define a new database role
--CREATE USER — define a new database role. CREATE USER is now an alias for CREATE ROLE. The only difference is that when
-- the command is spelled CREATE USER, LOGIN is assumed by default, whereas NOLOGIN is assumed when the command is spelled CREATE ROLE.

create role accountant;
grant insert,update,delete on accounts,transactions to accountant;

create user administrator;

grant accountant,support to administrator with admin option;

create role support;
grant select on accounts,customers,transactions to support,accountant;

create user user1 with login password '123';
grant accountant to user1;

create user user2 with login password '123';
grant administrator to user2;

create user user3 with login password '123';
grant support to user3;
grant update on accounts to user3;
revoke update on accounts from user3

create user user4 with login password '123';
grant support to user4;

--3
alter table transactions alter column amount SET NOT NULL;
alter table transactions alter column date SET NOT NULL;
alter table transactions alter column status SET NOT NULL;
insert into transactions values (4,now(),'RS88012','NT10204',null,'init');

update accounts set "limit" = 0 where "limit" is null;
alter table accounts alter column currency SET NOT NULL;
alter table accounts alter column balance SET NOT NULL;
alter table accounts alter column "limit" SET NOT NULL;
insert into accounts values ('RS12345',205,null,100,0);

alter table customers alter column name SET NOT NULL;
alter table customers alter column birth_date SET NOT NULL;
insert into customers values (204,null,null);

--5
create unique index index1 on accounts (customer_id,currency);
insert into accounts values ('RS12345',201,'KZT',5000,0);

create index find_accounts on accounts(currency,balance);
create index find_by_sender on transactions(src_account);
create index find_by_recipient on transactions(dst_account);

--6
do
$$
begin
    insert into transactions values (5,now(),'AB10203','NK90123',50,'init');
    begin
        update accounts set balance = balance - 50 where account_id = 'AB10203';
        update accounts set balance = balance + 50 where account_id = 'NK90123';
        update transactions set status = 'commited' where id = 5;
        exception
            when others then
                update transactions set status = 'rollback' where id = 5;
    end;
end
$$;

ALTER TABLE accounts ADD CONSTRAINT limit_check CHECK (balance > "limit");