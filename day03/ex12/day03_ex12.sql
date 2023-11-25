INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT ((SELECT MAX(id) FROM person_order) + i),
      (i),
       (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
       '2022-02-25'
FROM generate_series((SELECT MIN(id) FROM person), (SELECT MAX(id) FROM person)) AS t(i);

--SELECT count(*)=9 AS check
--FROM person_order
--WHERE order_date = '2022-02-25' AND menu_id = (SELECT id FROM menu WHERE pizza_name = 'greek pizza')