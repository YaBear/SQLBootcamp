-- Для начала на обоих сессиях изменим уровень изоляции на SERIALIZABLE

BEGIN;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Session #1

SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #2

UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';
COMMIT;
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';


-- Мы видим, что в случае первой сессии, рейтинг обновился только после выхода из транзакции