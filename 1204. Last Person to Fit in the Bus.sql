#Learned prefixSum using window function
WITH CTE AS(
    SELECT person_name , SUM(Weight) OVER (ORDER BY Turn) AS prefixSum 
    FROM Queue
    ORDER BY prefixSum DESC
)

SELECT person_name 
FROM CTE 
WHERE prefixSum <= 1000 
LIMIT 1

