-- Для начала на обоих сессиях изменим уровень изоляции на READ COMMITTED

BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Session #1

SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #2

UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';


-- Мы видим, что в случае первого селекта на сессии 1 было 4 значение, в случае второго данные обновились и стало 3.6