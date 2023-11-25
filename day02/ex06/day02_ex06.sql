SELECT
	(SELECT pizza_name FROM menu WHERE menu.id = person_order.menu_id) AS pizza_name,
	(SELECT name FROM pizzeria WHERE pizzeria.id = menu.pizzeria_id) AS pizzeria_name
FROM person_order
JOIN menu ON menu.id = person_order.menu_id
WHERE person_order.person_id = 1 OR person_order.person_id = 4
ORDER BY pizza_name ASC, pizzeria_name ASC