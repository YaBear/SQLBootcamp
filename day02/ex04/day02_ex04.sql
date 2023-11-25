SELECT 	pizza_name,
	(SELECT name FROM pizzeria WHERE pizzeria.id = menu.pizzeria_id) AS pizzeria_name, 
		price
FROM menu
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza'
ORDER BY pizza_name ASC, pizzeria_name ASC, price ASC