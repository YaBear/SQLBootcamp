CREATE OR REPLACE FUNCTION fnc_persons_female()
RETURNS SETOF person AS
$$
    SELECT *
    FROM v_persons_female;
$$
LANGUAGE SQL;

CREATE OR REPLACE FUNCTION fnc_persons_male()
RETURNS SETOF person AS
$$
    SELECT *
    FROM v_persons_male;
$$
LANGUAGE SQL;

SELECT *
FROM fnc_persons_male();

SELECT *
FROM fnc_persons_female();
