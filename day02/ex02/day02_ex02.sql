SELECT 	COALESCE(person.name, '-') AS person_name,
		COALESCE(visit_date, null) AS visit_date,
		COALESCE(pz.name, '-') AS pizzeria_name
FROM person
FULL OUTER JOIN (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03')
	AS visit_date_temp
	ON visit_date_temp.person_id = person.id
FULL OUTER JOIN (SELECT id, name FROM pizzeria) AS pz
	ON visit_date_temp.pizzeria_id = pz.id
ORDER BY person_name ASC, visit_date ASC, pizzeria_name ASC