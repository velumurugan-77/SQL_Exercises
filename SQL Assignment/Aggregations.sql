-- 1.count the number of employeees in each department 
-- this query groups employeees by and department_id and count how many employees exist in each
select department_id ,count(*) as total_employees
    from employees
    group by department_id;

 -- 2. Find the average salary in each department
-- This query calculates the average salary for employees in each department.
select department_id,avg(salary) as avg_salaary
 from employees
group by department_id;

-- 3. Find the maximum and minimum salary in each department
-- This query finds the highest and lowest salaries for each department.
select department_id, MAX(salary) as max_salary,min(salary) as min_salary
from hr.employees
group by department_id;

-- 4. Find the total salary paid in each department
-- This query sums up all employee salaries in each department.
select department_id ,sum(salary) as total_salary
from hr.employees
group by department_id;

-- 5. Count the number of employees in each job role
-- This query counts the number of employees who have the same job role.
select job_id,count(*) as total_employees 
    from hr.employees
group by job_id;

-- 6. Find the average salary for each job role
-- This query calculates the average salary for employees in each job role.
select job_id ,avg(salary) as avg_salry
from hr.employees
group  by job_id;

-- 7. Find the maximum salary for each job role
-- This query finds the highest salary assigned to employees for each job role.
select job_id,max(salary) as max_salary 
from hr.employees
group by job_id;

-- 8. Find the minimum salary for each job role
-- This query finds the lowest salary assigned to employees for each job role.
select job_id,min(salary) as min_salary
    from hr.employees
    group by job_id;

 -- 9. Find the total salary paid for each job role
-- This query calculates the total salary payout for employees in each job role.
select sum(salary) as totaal_salary
from hr.employees
group by job_id;

-- 10. Count the number of employees hired in each year
-- This query extracts the year from the hire_date and counts employees hired in each year.
select extract(year from hire_date ) as hire_year,count(*) as total_employees
from hr.employees
group by extract(year from hire_date)
order by hire_year;

-- 11. Find the total salary paid in each location
-- This query sums up the total salary per location by joining employees with department locations.
select d.location_id,sum(e.salary) as total_salary
from hr.employees
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.location_id

-- 12. Find the number of employees in each manager's team
-- This query counts the employees who report to each manager.
select maneger_id,count(*) as team_size
from hr.employees
where manager_id is not null
group by manager_id

-- 13. Find the highest salary for each manager
-- This query finds the highest salary among employees reporting to each manager.
select manager_id, max(salary) as max_salary
from hr.employees
where manager_id is not null 
group by manager_id;

-- 14. Find the average salary for each manager's team
-- This query calculates the average salary of employees reporting to each manager.
select manager_id,avg(salary) as avg(salary)
from hr.employees
where maneger_id is not null
group by maneger_id;
 15. Count the number of employees hired in each month of the year
-- This query extracts the month from hire_date and counts how many employees were hired in each month.
SELECT EXTRACT(MONTH FROM hire_date) AS hire_month, COUNT(*) AS total_hired
FROM employees
GROUP BY EXTRACT(MONTH FROM hire_date)
ORDER BY hire_month;

-- 16. Find the department with the highest total salary
-- This query finds the department that pays the highest total salary by sorting in descending order.
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
ORDER BY total_salary DESC
FETCH FIRST 1 ROW ONLY;

-- 17. Find the job role with the highest average salary
-- This query finds the job role with the highest average salary by sorting in descending order.
SELECT job_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY job_id
ORDER BY avg_salary DESC
FETCH FIRST 1 ROW ONLY;

-- 18. Find the number of employees in each city
-- This query counts the number of employees per city, assuming departments are linked to locations.
SELECT l.city, COUNT(*) AS total_employees
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
GROUP BY l.city;

-- 19. Find the number of employees who have a commission, grouped by department
-- This query counts employees who receive a commission, grouped by department.
SELECT department_id, COUNT(*) AS employees_with_commission
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id;

-- 20. Find the sum of salaries for employees who have a commission, grouped by department
-- This query sums up the salaries of employees who receive a commission, grouped by department.
SELECT department_id, SUM(salary) AS total_salary_with_commission
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id;


----sh.sales------
--1. Count the number of sales transactions for each product.  
SELECT prod_id, COUNT(*) AS transaction_count
FROM sh.sales
GROUP BY prod_id
ORDER BY transaction_count DESC;

.-- 2. Find the average sale amount for each product
SELECT prod_id, AVG(amount_sold) AS avg_sales_amt
FROM sh.sales
GROUP BY prod_id;




-- 3. Find the maximum and minimum sale amount for each product.  
select PROD_ID, min(amount_sold) as min_amt, max(amount_sold) as max_amt
from sh.sales
group by PROD_ID;

-- 4. Find the total revenue generated by each product.  
select PROD_ID, sum(quantity_sold * amount_sold) as total_revenue
from sh.SALES
group by PROD_ID;

-- 5. Count the number of sales transactions for each customer. 
select cust_id, count(*) as Total_Transactions
from sh.SALES
group by cust_ID;

-- 6. Find the average sale amount per customer.  
select cust_id, avg(amount_sold) as avg_sales_amt
from sh.SALES
group by cust_id;


