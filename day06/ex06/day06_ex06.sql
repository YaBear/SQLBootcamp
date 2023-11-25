CREATE SEQUENCE seq_person_discounts START 1;

ALTER TABLE person_discounts ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');

SELECT setval('seq_person_discounts', (SELECT COUNT(*) + 1 FROM person_discounts), false);

--INSERT INTO person_discounts (person_id, pizzeria_id, discount)
--VALUES (9, 2, 20);