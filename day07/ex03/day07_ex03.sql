SELECT name, SUM(count) AS total_count
FROM (
  SELECT pizzeria.name AS name, COUNT(pizzeria_id) AS count
  FROM person_visits
  JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
  GROUP BY pizzeria.name
  UNION ALL
  SELECT pizzeria.name AS name, COUNT(menu_id) AS count
  FROM person_order
  JOIN menu ON menu.id = person_order.menu_id
  JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
  GROUP BY pizzeria.name
) AS visits_orders
GROUP BY name
ORDER BY total_count DESC;