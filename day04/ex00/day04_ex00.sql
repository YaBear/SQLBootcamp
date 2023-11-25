CREATE VIEW v_persons_female AS
	SELECT *
	FROM person
	WHERE gender = 'female'
	ORDER BY id

CREATE VIEW v_persons_male AS
	SELECT *
	FROM person
	WHERE gender = 'male'
	ORDER BY id