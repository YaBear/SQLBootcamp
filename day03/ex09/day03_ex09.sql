INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT MAX(id) + 1 FROM person_visits),
       (SELECT id FROM person WHERE name = 'Denis'),
       (SELECT id FROM pizzeria WHERE name = 'Dominos'),
       '2022-02-24'
), ((SELECT MAX(id) + 2 FROM person_visits),
       (SELECT id FROM person WHERE name = 'Irina'),
       (SELECT id FROM pizzeria WHERE name = 'Dominos'),
       '2022-02-24');
       
--SELECT count(*)=2 AS check
--FROM person_visits
--WHERE visit_date = '2022-02-24' AND person_id in (6, 4) AND pizzeria_id = 2