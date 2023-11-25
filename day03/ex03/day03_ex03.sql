WITH males_visit AS (
    SELECT pizzeria.name
    FROM person_visits
             JOIN person ON person.id = person_visits.person_id
             JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    WHERE gender = 'male'),
     females_visit AS (
         SELECT pizzeria.name
         FROM person_visits
                  JOIN person on person.id = person_visits.person_id
                  JOIN pizzeria on person_visits.pizzeria_id = pizzeria.id
         WHERE gender = 'female')
    (SELECT name AS pizzeria_name FROM males_visit EXCEPT ALL SELECT * FROM females_visit)
UNION ALL
(SELECT name AS pizzeria_name FROM females_visit EXCEPT ALL SELECT * FROM males_visit)
ORDER BY pizzeria_name;