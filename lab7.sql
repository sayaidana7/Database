--2
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
--4
create domain ddd as varchar(3);
ALTER TABLE accounts ALTER COLUMN currency TYPE ddd;
--5
create unique index index1 on accounts (customer_id,currency);
insert into accounts values ('RS12345',201,'KZT',5000,0);
delete from accounts where account_id = 'RS12345';
--6

do
$$
begin
    insert into transactions values (5,now(),'AB10203','NK90123',50,'init');
    begin
        update accounts set balance = balance - 50 where account_id = 'AB10203';
        update transactions set status = 'commited' where id = 5;
        exception
            when others then
                update transactions set status = 'rollback' where id = 5;
    end;
end
$$;

ALTER TABLE accounts ADD CONSTRAINT limit_check CHECK (balance > "limit");