SELECT pizzeria.name
FROM pizzeria
INNER JOIN (SELECT * FROM person_visits WHERE visit_date = '2022-01-08') AS pv on pizzeria.id = pv.pizzeria_id
INNER JOIN (SELECT * FROM person WHERE name = 'Dmitriy') AS p on pv.person_id = p.id
INNER JOIN (SELECT * FROM menu WHERE price < 800) AS m on pizzeria.id = m.pizzeria_id