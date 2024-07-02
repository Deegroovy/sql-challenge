create table departments(
dept_no int,
dept_name  varchar(30) not null
)
;
select *
from departments d -- alias for departments
;

insert into departments (dept_no, dept_name)

drop table if exists dept_emp;

drop table if exists dept_manager;

drop table if exists employees;

drop table if exists salaries;

drop table if exists titles;

create table dept_emp(
emp_no int,
dept_no int
)
;

-- drop table wrong type for emp_no

drop table dept_emp 
;
 -- create table dept_emp
create table dept_emp(
emp_no int,
dept_no varchar(15)
)
;


create table dept_manager(
dept_no int, 
emp_no int
)
;



create table employees(
emp_no int,
emp_title_id varchar(30) not null,
birth_date date,
first_name varchar(30) not null, 
last_name varchar(30) not null,
sex varchar(3) not null,
hire_date date
)
;

select *
from employees e 
;



create table salaries(
emp_no int,
salary int
)
;

select *
from salaries s 
;

create table titles(
title_id int,
title varchar(30)
)
;

INSERT INTO titles (title_id, title)
VALUES (1, 'Title 1'),
       (2, 'Title 2'),
       (3, 'Title 3')
;
drop table titles
;

select *
from titles t 
;


create table employee_salaries(
emp_no int,
last_name varchar(30) not null,
first_name varchar(30) not null,
sex varchar(3) not null,
salary int not null
)
;
dop table employee_salaries 
;

create table employee_salaries(
emp_no int, 
last_name varchar(30) not null,
first_name varchar (30) not null, 
sex varchar (3) not null,
salary int not null
)
;


select *
from salaries s 
;

select *
from employees e 
;




select s.emp_no, e.last_name, e.first_name, e.sex, s.salary
from salaries s
inner join employees e
on e.emp_no = s.emp_no
;

insert into employee_salaries (emp_no, emp_no, last_name, first_name, sex, salary)
;

INSERT INTO employee_salaries (emp_no, last_name, first_name, sex, salary)
SELECT s.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM salaries s
INNER JOIN employees e
ON e.emp_no = s.emp_no
;

create table employee_hired1986(
last_name varchar(30) not null,
first_name varchar(30) not null, 
hire_date date not null
)
;


select *
from employees e 
;



INSERT INTO employee_hired1986 (last_name, first_name, hire_date)
select last_name, first_name, hire_date
from employees 
where hire_date >= '1986-01-01' and hire_date <= '1986-12-31'
;

create table managers(
dept_manager varchar(30) not null, 
dept_no int not null, 
dept_name varchar(30) not null, 
emp_no int not null, 
last_name varchar(30) not null, 
first_name varchar (30) not null
)
;
drop table managers 
;


create table managers(
title varchar(30) not null, 
dept_no int not null, 
dept_name varchar(30) not null, 
emp_no int not null, 
last_name varchar(30) not null, 
first_name varchar (30) not null
)
;

ALTER TABLE managers 
ADD COLUMN title_id int
;



-- update dept_no to varchar

alter table managers 
add column dept_no_temp varchar(30)
;

update managers 
set dept_no_temp = cast (dept_no as varchar)
;

alter table managers 
drop column dept_no
;

alter table managers 
rename column dept_no_temp to dept_no
;

-- update title_id to varchar

alter table managers 
add column title_id_temp varchar(30)
;

update managers 
set title_id_temp = cast (title_id as varchar)
;

alter table managers 
drop column title_id
;

alter table managers 
rename column title_id_temp to title_id
;

-- update rows with null values to unknown

update managers 
set title = 'unknown'
where title is null  
;


select *
from departments d 
;

select *
from dept_manager dm 
;
select *
from titles t 
;


select * 
from employees e 
;


insert into managers (dept_name, dept_no, emp_no, last_name, first_name, title_id)
select d.dept_name, d.dept_no, e.emp_no, e.last_name, e.first_name, t.title_id
from employees e
inner join titles t on e.emp_title_id = t.title_id
inner join dept_manager dm on e.emp_no = dm.emp_no
inner join departments d on dm.dept_no = d.dept_no
;



-- dept no, emp no, last name, first name and department name

create table deptnos(
dept_no int not null, 
dept_name varchar(30) not null, 
emp_no int not null, 
last_name varchar(30) not null, 
first_name varchar (30) not null
)
;

-- alter table dept_no to varchar

alter table deptnos 
add column dept_no_temp varchar(20)
;

update deptnos 
set dept_no_temp = cast (dept_no as varchar)
;

alter table deptnos 
drop column dept_no
;

alter table deptnos 
rename column dept_no_temp to dept_no
;



select *
from departments d 
;

select *
from employees e 
;

insert into deptnos (dept_name, dept_no, emp_no, last_name, first_name)
select d.dept_no, d.dept_name, e.emp_no , e.last_name , e.first_name 
from departments d
left join employees e on e.emp_no = e.emp_no
;



select d.dept_name, d.dept_no, e.emp_no, e.last_name, e.first_name, t.title_id
from employees e
inner join titles t on e.emp_title_id = t.title_id
inner join dept_manager dm on e.emp_no = dm.emp_no
inner join departments d on dm.dept_no = d.dept_no
;


--- alter deptnos table to fix error on the dept_no and dept_name colums
alter table deptnos 
add column dept_no_temp varchar(30)
;

update deptnos 
set dept_no_temp = dept_no 
;

update deptnos 
set dept_no = dept_name
;

update deptnos 
set dept_name = dept_no_temp
;

alter table deptnos 
drop column dept_no_temp
;


-- DROP DEPTNOS TABLE
drop table deptnos 
;

create table deptnos(
dept_no varchar(15) not null, 
dept_name varchar(30) not null, 
emp_no int not null, 
last_name varchar(30) not null, 
first_name varchar (30) not null
)
;

select *
from departments d
;

select *
from employees e
;

select *
from dept_emp de
;

insert into deptnos (dept_no, dept_name, emp_no, last_name, first_name)
select de.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
from dept_emp de
inner join employees e on de.emp_no = e.emp_no 
inner join departments d on de.dept_no = d.dept_no 
;


create table hercb (
last_name varchar(30),
first_name varchar(30),
sex varchar(3)
)
;

select *
from employees e 
;

insert into hercb (last_name, first_name, sex)
select e.last_name, e.first_name, e.sex
from employees e
where e.first_name = 'Hercules'
and e.last_name like 'B%'
;

create table salesdept(
emp_no varchar(30),
last_name varchar(30),
first_name varchar(30)
)
;

-- drop table salesdept because emp_no is not varchar
drop table salesdept 
;

-- recreate table salesdept
create table salesdept (
emp_no int,
last_name varchar(30),
first_name varchar(30)
)
;

select *
from deptnos d 
;

select *
from employees e 
;

insert into salesdept (emp_no, last_name, first_name)
select d.emp_no, d.last_name, d.first_name
from deptnos d
where d.dept_name = 'Sales'
;

create table salesdev(
emp_no int,
last_name varchar(30),
first_name varchar(30),
dept_no varchar(15)
)
;

select *
from deptnos d 
;

select *
from employees e 
;

insert into salesdev (emp_no, last_name, first_name, dept_no)
select d.emp_no, d.last_name, d.first_name, d.dept_no
from deptnos d
where d.dept_name in ('Sales', 'Development')
;


create table frequent (
last_name varchar (30),
frequency int
)
;

select * 
from employees e 
;

select *
from deptnos d 
;

insert into frequent (last_name, frequency)
select e.last_name, count (*) as frequency
from employees e 
group by last_name 
;


select last_name, frequency
from frequent 
order by frequency desc 
;


