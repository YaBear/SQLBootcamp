SELECT
  address,
  ROUND((MAX(age) - (CAST(MIN(age) AS numeric) / MAX(age))), 2) AS formula,
  ROUND(AVG(age), 2) AS average,
  (MAX(age) - (MIN(age) / MAX(age))) > AVG(age) AS comparison
FROM
  person
GROUP BY
  address
ORDER BY
  address;