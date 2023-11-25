SELECT gs::date
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS gs
LEFT JOIN (SELECT * FROM person_visits WHERE person_visits.person_id < 3) AS pv ON pv.visit_date = gs::date
WHERE pv is NULL