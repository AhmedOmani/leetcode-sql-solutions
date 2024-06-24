SELECT e.employee_id 
FROM Employees e 
WHERE e.salary < 30000 AND e.manager_id 
IN(
    SELECT DISTINCT(e2.manager_id) 
    FROM Employees e2
    WHERE e2.manager_id NOT IN (SELECT e.employee_id FROM Employees e) 
    AND e2.manager_id IS NOT NULL
)
ORDER BY employee_id
