select Department.name as Department, Emp.name as Employee, Emp.salary as Salary from 
(select E.departmentId, E.name , E.salary, DENSE_RANK() OVER (PARTITION BY E.departmentId ORDER BY E.salary DESC) as sal_order
from Employee E ) Emp
join Department 
on Emp.departmentId = Department.id
where sal_order =1;
