WITH info AS (
    SELECT menu.pizza_name, menu.id, pizzeria.id AS pizzeria_id, price, pizzeria.name AS pizzeria_name
    FROM pizzeria
             JOIN menu ON pizzeria.id = menu.pizzeria_id)
SELECT p1.pizza_name    AS pizza_name,
       p1.pizzeria_name AS pizzeria_name_1,
       p2.pizzeria_name AS pizzeria_name_2,
       p1.price         AS price
FROM info p1
         JOIN info p2 ON p1.pizza_name = p2.pizza_name
WHERE p1.price = p2.price
  AND p1.pizzeria_id != p2.pizzeria_id
  AND p1.pizzeria_id > p2.pizzeria_id
ORDER BY pizza_name;