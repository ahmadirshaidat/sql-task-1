--create table customer (ID int primary key , Name varchar(50) not null , phone varchar (20) ,
--email varchar (50) unique );
--insert into customer (ID , Name , phone , email) values (1 ,'ahmad','123456789' ,'ahmad@gmail.com'); 
--select * from customer;

--create table orders (id int primary key , order_number varchar(50) unique , order_name varchar(50) not null);
--insert into orders (id , oreder_num ,order_name) values (1 , '1' , 'mouse');
--select * from orders;

--create table product ( id int primary key , product_name varchar(50) not null );
--insert into product ( id , product_name ) values (1 , 'desk')
update Product set  product_name = 'disk'; 
select * from product;

--create table employee (id int primary key , deparment varchar(50) , salary decimal(10,2) not null );
--insert into employee (id , deparment , salary) values (1 , 'it' , 1000.00);
select * from employee;




