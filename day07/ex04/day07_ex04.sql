SELECT name, count_of_visits AS count
FROM (
  SELECT person.name AS name, COUNT(person_id) AS count_of_visits
  FROM person_visits
  JOIN person ON person_visits.person_id = person.id
  GROUP BY person.name
  HAVING COUNT(person_id) > 3
  ORDER BY count_of_visits DESC
) AS visits;