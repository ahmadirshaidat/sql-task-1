create table department ( id_department int primary key , departement_name varchar(50) not null );

create table employees (name varchar(50) not null , birthdates date  not null , phone varchar(20) unique,
id int primary key , nationalities varchar(50) not null , marital_statuses varchar(50) not null,
personal_photo VARBINARY(MAX) , entry_dates date ,  password VARCHAR(255) , national_id int unique,id_department int not null,
constraint  FK_emp_Department foreign key(id_department) REFERENCES department(id_department)
);


create table tasks(id int primary key , title varchar(50) not null , start_date date not null , due_date date not null, description varchar(255) not null,
important varchar(20) not null , id_employee int not null,
constraint fk_task_employee foreign key (id_employee) REFERENCES employees (id));



create table feedback(id int primary key , send_name varchar(50) not null , send_email varchar(100) not null , message varchar(500) not null,
receive_date datetime not null default getdate());

insert into department (id_department , departement_name) values (1 , 'it');
insert into employees (id, name, birthdates, phone, national_id, nationalities, marital_statuses, entry_dates, password, id_department) 
values (1, 'Ahmad', '2003-12-01', '0772637247', '2000000000', 'Jordanian', 'Single', '2026-06-15', 'ahmad123', 1);
select * from employees where name like '%a%';
select * from feedback order by receive_date desc;
