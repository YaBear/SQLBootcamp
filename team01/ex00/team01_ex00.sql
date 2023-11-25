WITH currency_name AS (
    SELECT name, id
    FROM currency
    GROUP BY name, id
),
     last_rate AS (
         SELECT name        AS currency_name,
                rate_to_usd AS last_rate_to_usd
         FROM (
                  SELECT name,
                         rate_to_usd,
                         ROW_NUMBER() OVER (PARTITION BY name ORDER BY updated DESC) AS row_num
                  FROM currency
              ) sub
         WHERE row_num = 1
         GROUP BY name, rate_to_usd
     )
SELECT COALESCE(u.name, 'not defined') AS name,
       COALESCE(u.lastname, 'not defined') AS lastname,
       type,
       SUM(money)                    AS volume,
       MAX(COALESCE(currency_name.name, 'not defined')) AS currency_name,
       MAX(COALESCE(last_rate_to_usd, 1)) AS last_rate_to_usd,
       SUM(money) * MAX(COALESCE(last_rate_to_usd, 1)) AS total_volume_in_usd
FROM balance
         FULL JOIN "user" u on u.id = balance.user_id
         FULL JOIN currency_name on currency_name.id = balance.currency_id
         FULL JOIN last_rate on currency_name.name = last_rate.currency_name
GROUP BY u.name, u.lastname, type
ORDER BY name DESC, lastname ASC, type ASC;

