WITH cte AS (
	SELECT generate_series('2022-01-01', '2022-01-10', interval '1 day')::date AS gs
)
SELECT gs::date AS missing_date
FROM cte
LEFT JOIN (SELECT * FROM person_visits WHERE person_visits.person_id < 3) AS pv ON gs::date = pv.visit_date
WHERE pv is NULL