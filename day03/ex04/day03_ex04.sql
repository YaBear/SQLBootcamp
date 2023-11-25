WITH male_order AS (SELECT pizzeria.name
                    FROM person_order
                             JOIN menu ON menu_id = menu.id
                             JOIN person ON person_order.person_id = person.id
                             JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
                    WHERE gender = 'male'),
     female_order AS (
         SELECT pizzeria.name
         FROM person_order
                  JOIN menu ON menu_id = menu.id
                  JOIN person ON person_order.person_id = person.id
                  JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
         WHERE gender = 'female')
    (SELECT name AS pizzeria_name FROM male_order EXCEPT SELECT * FROM female_order)
UNION
(SELECT name AS pizzeria_name FROM female_order EXCEPT SELECT * FROM male_order)
ORDER BY pizzeria_name;