SELECT person.name AS person_name, COUNT(*) AS count_of_visits
FROM person_visits
JOIN person ON person_visits.person_id = person.id
GROUP BY person.name
ORDER BY count_of_visits DESC, person_name ASC
LIMIT 4;