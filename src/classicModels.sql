use classicmodels;

select *
from customers where customerName = 'Land of Toys Inc.';
explain select * from customers where customerName ='Land of Toys Inc.';

alter table  customers add index idx_customerName(customerName);
explain select * from customers where customerName ='Land of Toys Inc.';

alter table customers add index idx_full_name(contactFirstName,contactLastName);
explain select * from customers where contactFirstName = 'Jean' or contactFirstName = 'King';

create procedure fillAllCustomers()
begin
    select * from customers;
end;


call fillAllCustomers();

drop procedure if exists `fillAllCustomers`;

create procedure fillAllCustomer()
begin
    select * from customers where customerNumber = 175;
end;

call fillAllCustomer();

create procedure getCusById
(IN  cusNum int(11))
begin
    select * from customers where customerNumber = cusNum;
end;

call getCusById(175);

create procedure GetCustomersCountByCity(
in in_city varchar(50),
out total int
)
begin
select count(customerNumber)
into total
from customers
where city = in_city;
end;

call GetCustomersCountByCity('Lyon', @total);
select @total;

create procedure SetCounter(
inout counter int ,
in inc int
)
begin
    set counter = counter + inc;
end;

set @counter =1;
call SetCounter(@counter,1);
call SetCounter(@counter,3);
call SetCounter(@counter,5);
select @counter;

create view customer_view as
    select customerNumber, customerName, phone
from customers;

select * from customer_view;

create or replace view customer_view as
    select customerNumber, customerName, contactFirstName, contactLastName, phone
from customers
where city = 'Nantes';

drop view customer_view;

