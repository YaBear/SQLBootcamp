CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
	SELECT pizzeria.name
	FROM person_visits
	JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
	JOIN menu ON menu.pizzeria_id = person_visits.pizzeria_id
	WHERE person_visits.visit_date = '2022-01-08' AND menu.price < 800
	WITH NO DATA
	
--REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats
