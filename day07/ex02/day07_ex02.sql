SELECT name, count_of_visits AS count, 'visit' AS action_type
FROM (
  SELECT pizzeria.name AS name, COUNT(pizzeria_id) AS count_of_visits
  FROM person_visits
  JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
  GROUP BY pizzeria.name
  ORDER BY count_of_visits DESC
  LIMIT 3
) AS visits
UNION ALL
SELECT name, count_of_orders AS count, 'order' AS action_type
FROM (
  SELECT pizzeria.name AS name, COUNT(menu_id) AS count_of_orders
  FROM person_order
  JOIN menu ON menu.id = person_order.menu_id
  JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
  GROUP BY pizzeria.name
  ORDER BY count_of_orders DESC
  LIMIT 3
) AS orders
ORDER BY action_type ASC, count DESC;