SELECT DISTINCT person.name AS person_name
FROM person_order
JOIN person ON person_order.person_id = person.id
ORDER BY person_name;