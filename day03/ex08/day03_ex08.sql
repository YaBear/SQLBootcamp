INSERT INTO menu (id, pizza_name, price, pizzeria_id)
SELECT MAX(id) + 1                                      AS id,
       'sicilian pizza'                                 AS pizza_name,
       900                                              AS price,
       (SELECT id FROM pizzeria WHERE name = 'Dominos') AS pizzeria_id
FROM menu;

--SELECT count(*)=1 AS check
--FROM menu
--WHERE id = 20 AND pizzeria_id =2 AND pizza_name = 'sicilian pizza' AND price = 900