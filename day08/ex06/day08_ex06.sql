-- Для начала на обоих сессиях изменим уровень изоляции на REPEATABLE READ

BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Session #1

SELECT SUM(rating) FROM pizzeria;
SELECT SUM(rating) FROM pizzeria;
COMMIT;
SELECT SUM(rating) FROM pizzeria;

-- Session #2

UPDATE pizzeria SET rating = 5.0 WHERE name = 'Pizza Hut';
COMMIT;
SELECT SUM(rating) FROM pizzeria;


-- Мы видим, что данные обновились только после завершения активной транзакции в Session 1