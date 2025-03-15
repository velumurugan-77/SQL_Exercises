-- 1. Retrieve employee names and their department names using INNER JOIN
-- select e.employee_id,d.department_id,e.employee_name 
--     from employees.e
--  inner join departments d on e.department_id = d.department_id;

-- 2. Retrieve all employees and their respective department names (including those without a department) using LEFT JOIN
select e.employee_id,e.employee_name,d.department_id
 from employees e
left join departments d on e.department_id = d.department_id;

-- 3. Retrieve all departments and employees (including departments without employees) using RIGHT JOIN
select e.employee_id.e.employee_name,d.dapartment_id
 from employees e
right join departments on e.department_id = d.department_id;

-- 4. Retrieve all employees and their department names using FULL OUTER JOIN
select d.department_id,e.employee_name,e.employee_id
 from employees e
full outer join departments on e.department_id = d.department.id;

-- 5. Retrieve employees who do not belong to any department using LEFT JOIN with NULL check
select e.employee_id,e.employee_name
 from employees e
left join departments d on e.department_id = d.deprtment_id
where d.department is null;

-- 6. Retrieve departments that have no employees using RIGHT JOIN with NULL check
select d.department_id,d.department_name
 from employees e
right join departments d on e.department_id = d.department_id
where e.employee_id is null;
-- 7. Retrieve employees along with their manager names using SELF JOIN
select e.employee_id,e.employee_name,m.employee_name as manager_name
 from employees e
left join employees m on e.employee_id = m.employee_id;
-- 8. Retrieve employees along with their job title using INNER JOIN
select e.employee_id,e.employee_name,j.job_title
  from employees e
inner join jobs j on e.job_id = j.job_id;
-- 9. Retrieve employees along with the location of their department using INNER JOIN
select e.employee_id,e.employee_name,d.department_id,l.city
 from employees e
inner join department d on e.department_id = d.department_id
inner join location l on d.location_id = l.location_id;
-- 10. Retrieve employees and the projects they are assigned to using INNER JOIN
select e.employee_id,e.employee_name,p.project_name
 from  employees e
inner join projects p on e.employee_id = p.employee_id;
-- 11. Retrieve employees who have not been assigned to any project using LEFT JOIN
select e.employee_id,e.employee_name
 from employees e
left join projects p on e.employee_id = p.employee_id
where p.project_id is null;
-- - 12. Retrieve project names along with the department handling them using INNER JOIN
select  p.project_name, d.department_name
from projects p
inner join  departments d ON p.department_id = d.department_id;
-- 13. Retrieve employees along with the names of their training programs using INNER JOIN
select e.employee_id, e.employee_name, t.training_name
 from employees e
inner join training_programs t on e.training_id = t.training_id;
-- - 14. Retrieve employees who have not attended any training programs using LEFT JOIN
select e.employee_id, e.employee_name
from employees e
left join training_programs t ON e.training_id = t.training_id
where t.training_id is null;

-- 15. Retrieve employee names and their assigned shifts using INNER JOIN
select e.employee_id, e.employee_name, s.shift_timing
from employees e
inner join shifts s on e.shift_id = s.shift_id;

-- 16. Retrieve employees who do not have an assigned shift using LEFT JOIN
select e.employee_id, e.employee_name
from employees e
left join shifts s on e.shift_id = s.shift_id
where s.shift_id is null;

-- 17. Retrieve employees, their department names, and their assigned project names using multiple INNER JOINs
select e.employee_id, e.employee_name, d.department_name, p.project_name
from employees e
inner join departments d on e.department_id = d.department_id
inner join projects p on e.employee_id = p.employee_id;

-- 18. Retrieve employees who have worked on more than one project using INNER JOIN and GROUP BY
select e.employee_id, e.employee_name, count(p.project_id) AS project_count
from employees e
inner join projects p ON e.employee_id = p.employee_id
group by e.employee_id, e.employee_name
having count(p.project_id) > 1;

-- 19. Retrieve employees along with their salaries and their department budget using INNER JOIN
select e.employee_id, e.employee_name, e.salary, d.budget
from employees e
inner join departments d ON e.department_id = d.department_id;

-- 20. Retrieve employees who earn more than their department’s average salary using INNER JOIN and a subquery
select e.employee_id, e.employee_name, e.salary
from employees e
inner join departments d ON e.department_id = d.department_id
where e.salary > (select avg(salary) from employees where department_id = e.department_id);

-- 21. Retrieve employees who have the same job role as another employee using SELF JOIN
select e1.employee_id, e1.employee_name, e2.employee_name AS coworker_name, e1.job_id
from employees e1
inner join  employees e2 ON e1.job_id = e2.job_id AND e1.employee_id <> e2.employee_id;

-- 22. Retrieve employees and their department names, but show "Not Assigned" if an employee has no department using LEFT JOIN and COALESCE
SELECT e.employee_id, e.employee_name, COALESCE(d.department_name, 'Not Assigned') AS department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;

-- 23. Retrieve employees and their assigned projects, including employees who are not assigned to any project using FULL OUTER JOIN
select e.employee_id, e.employee_name, p.project_name
from  employees e
full outer join projects p ON e.employee_id = p.employee_id;

-- 24. Retrieve employees who work in a city where their department is located using INNER JOIN
select e.employee_id, e.employee_name, l.city
from employees e
inner join  departments d ON e.department_id = d.department_id
inner join  locations l ON d.location_id = l.location_id;

-- 25. Retrieve employees and their total bonus amount using INNER JOIN with a bonus table
select e.employee_id, e.employee_name, SUM(b.bonus_amount) AS total_bonus
from employees e
inner join  bonuses b ON e.employee_id = b.employee_id
group by e.employee_id, e.employee_name;

-- 26. Retrieve employees who do not have any recorded bonuses using LEFT JOIN
select e.employee_id, e.employee_name
    from employees e
left join bonuses b ON e.employee_id = b.employee_id
where b.bonus_amount is null;

-- 27. Retrieve employees and their department names where employees belong to a specific region using INNER JOIN
select  e.employee_id, e.employee_name, d.department_name, r.region_name
from  employees e
inner join  departments d on e.department_id = d.department_id
inner join locations l on d.location_id = l.location_id
inner join regions r on l.region_id = r.region_id;

-- 28. Retrieve employees and their project details, even if they are not assigned to a project using LEFT JOIN
select e.employee_id, e.employee_name, p.project_name
from employees e
left join  projects p on e.employee_id = p.employee_id;
-- 29. Retrieve departments and the count of employees in each department using INNER JOIN and GROUP BY
select d.department_id, d.department_name, count(e.employee_id) AS employee_count
from departments d
left join employees e ON d.department_id = e.department_id
group by d.department_id, d.department_name;

-- 30. Retrieve employees who work on projects located in a different city than their department using INNER JOIN
select  e.employee_id, e.employee_name, d.department_name, p.project_name, l.city AS project_city
from employees e
inner join projects p on e.employee_id = p.employee_id
inner join departments d on e.department_id = d.department_id
inner join locations l on p.location_id = l.location_id
where d.location_id <> p.location_id;