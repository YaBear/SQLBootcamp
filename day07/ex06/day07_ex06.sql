SELECT name, count_of_orders AS count, ROUND(avg_price, 2), max_price, min_price
FROM (
  SELECT pizzeria.name AS name, COUNT(menu_id) AS count_of_orders,
    AVG(menu.price) AS avg_price, MIN(menu.price) AS min_price, MAX(menu.price) AS max_price
  FROM person_order
  JOIN menu ON menu.id = person_order.menu_id
  JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
  GROUP BY pizzeria.name
  ORDER BY count_of_orders DESC
) AS orders
ORDER BY name;