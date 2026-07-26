select Department, count(*) as totalemployee
from Employees
group by Department  ;


select Department , avg(salary) as avgsalary
from Employees
group by Department;


select department , max(salary) as maxsa
from Employees
group by Department;



select   City , sum(salary) as sumsalary
from Employees
group by City;




select Department , count(*)
from Employees
group by Department 
having count(*)>3;


select Department , avg(salary) as avgsalary
from Employees
group by Department
having avg(salary) >5000;


select Department , min(salary) as countsalary
from Employees
group by Department
having min(salary)>3000 ;
 



SELECT *
FROM Employees
ORDER BY Salary DESC;
 
SELECT *
FROM Employees
ORDER BY Salary asc;



SELECT *
FROM Employees
ORDER BY Age DESC;


SELECT *
FROM Employees
ORDER BY Department ASC, Salary DESC;



select Department,count(*) as EmployeeCount
from Employees
Group By Department
having Count(*)>2
order by EmployeeCount desc ;


select Department,avg(salary) as avgsalary
from Employees
group by Department
having avg(salary)>4000
order by avgsalary asc 

SELECT City, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY City
HAVING SUM(Salary) > 10000
ORDER BY City ASC;


Select Department,Count(*),Avg(Salary),Max(Salary)
from Employees
Group by Department
having Avg(Salary)>5000
order by Max(Salary )asc 