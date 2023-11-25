SELECT menu.id AS menu_id
FROM menu
WHERE menu.id NOT IN (SELECT person_order.menu_id
                      FROM person_order)
ORDER BY menu_id;