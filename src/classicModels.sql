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
