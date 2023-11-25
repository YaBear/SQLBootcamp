CREATE TABLE tsp
(
    point1 VARCHAR,
    point2 VARCHAR,
    cost   INT
);

INSERT INTO tsp (point1, point2, cost)
VALUES ('A', 'B', 10),
       ('B', 'A', 10),
       ('A', 'C', 15),
       ('C', 'A', 15),
       ('A', 'D', 20),
       ('D', 'A', 20),
       ('C', 'B', 35),
       ('B', 'C', 35),
       ('D', 'B', 25),
       ('B', 'D', 25),
       ('C', 'D', 30),
       ('D', 'C', 30);



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
  AND full_price = (SELECT MIN(full_price) FROM table_path WHERE length(path) = 7 AND point2 = 'A')
ORDER BY 1 ASC, 2 ASC;