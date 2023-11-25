CREATE OR REPLACE FUNCTION func_minimum(VARIADIC numbers NUMERIC[])
RETURNS NUMERIC
AS $$
DECLARE
  min_value NUMERIC;
BEGIN
  SELECT MIN(num) INTO min_value
  FROM UNNEST(numbers) AS num;
  RETURN min_value;
END;
$$ LANGUAGE plpgsql;

SELECT func_minimum(VARIADIC ARRAY[10.0, -1.0, 5.0, 4.4]);

--SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);