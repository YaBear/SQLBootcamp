-- Для начала на обоих сессиях изменим уровень изоляции на READ COMMITTED

BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Session #1

SELECT SUM(rating) FROM pizzeria;
SELECT SUM(rating) FROM pizzeria;
COMMIT;
SELECT SUM(rating) FROM pizzeria;

-- Session #2

UPDATE pizzeria SET rating = 1.0 WHERE name = 'Pizza Hut';
COMMIT;
SELECT SUM(rating) FROM pizzeria;


-- Мы видим, что данные обновились в Сессии 1 сразу после коммита в Сессии 2 как в ex03