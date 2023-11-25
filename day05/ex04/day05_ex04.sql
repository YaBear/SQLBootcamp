CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);

SET enable_seqscan = off

EXPLAIN ANALYZE
SELECT pizzeria_id
FROM menu
WHERE pizza_name = 'pepperoni pizza';