SQL Challenge
In this challenge, the goal is to create several databases that shows data in a variety of tables that provides a relationship
between employees, their titles, employee numbers, salaries, date hired, department and department title, etc. 

CREATED TABLES:
emp_hired1986 - lists employees who were hired in 1986.
employee_salaries - lists employees number and salary.
managers - XX
deptnos - lists the employees by deptartment number and department name.
hercb - identifies employees with the name Hercules whose lasat name starts with 'B.'
salesdept - identifies all of the employees in the sales department by their firs and last name and their employee number. 
salesdev - lists all of the employees in the sales and development departments by first and last name and employee number. 
frequent - lists the frequency of last names of employees in descending order. The most frequent last name is Baba, which 
appeared 226 times. The least occuring last name is Foolsday, which appeared one time. 


CHALLENGES
Some challenges encountered included difficulty identifying a foreign key for some of the tables. There was something not syncing
from the employees table. Another challenge included a "not null" error with the managers table. After checking the original employees
CSV file and other files, there wasn't a "null" value found for an employee named Margareta Markovitch although a repeated error 
indicated that there was a "not null" error. 


This project can be used to help managers identify the following:
Employees anniversary date
Employees by department
Employees by their title
How many employees have the same name
Employees salaries
Identify which departments have the most employees
Which employees/departments have the hightest and lowest salaries
Can also determine salaries for by the duration of employment
