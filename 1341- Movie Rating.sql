WITH UserRating AS(
    SELECT U.name AS results
    FROM MovieRating MR JOIN Users U
    ON MR.user_id = U.user_id
    GROUP BY MR.user_id
    ORDER BY COUNT(U.user_id) DESC , U.name ASC
    LIMIT 1
),

MovieAvg AS(
    SELECT M.title AS results
    FROM MovieRating MR JOIN Movies M
    ON MR.movie_id = M.movie_id 
    WHERE DATE_FORMAT(MR.created_at , '%Y-%m') = '2020-02'
    GROUP BY MR.movie_id
    ORDER BY AVG(MR.rating) DESC , M.title
    LIMIT 1 
)

SELECT results FROM UserRating
UNION ALL
SELECT results FROM MovieAvg
