WITH RECURSIVE table_path AS (
    SELECT point1 AS path, point1, point2, cost, cost AS full_price
    FROM tsp
    WHERE point1 = 'A'
    UNION ALL
    SELECT path || ',' || child.point1, child.point1, child.point2, child.cost, parent.full_price + child.cost
    FROM tsp AS child
             JOIN table_path AS parent ON child.point1 = parent.point2
    WHERE path NOT LIKE '%' || child.point1 || '%'
)
SELECT full_price AS total_cost, '{' || lower(path) || ',' || lower(table_path.point2) || '}' AS tour
FROM table_path
WHERE length(path) = 7
  AND point2 = 'A'
ORDER BY 1 ASC, 2 ASC;