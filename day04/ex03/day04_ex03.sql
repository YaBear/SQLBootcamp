SELECT date
FROM v_generated_dates AS vgd
LEFT JOIN person_visits AS pv ON vgd.date = pv.visit_date
WHERE pv.visit_date IS NULL