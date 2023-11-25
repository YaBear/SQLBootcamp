SELECT person.address, pizzeria.name AS name, COUNT(person_order.person_id) AS order_count
FROM person_order
JOIN person ON person.id = person_order.person_id
JOIN menu ON menu.id = person_order.menu_id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
GROUP BY person.address, pizzeria.name
ORDER BY address, pizzeria.name;