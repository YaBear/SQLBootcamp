-- Для начала на обоих сессиях изменим уровень изоляции на REPEATABLE READ

BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Затем выполним поочередно скрипт как в ex01

SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';  -- В случае с Session 1 ставим рейтинг 4, в Session 2 ставим рейтинг 3.6
COMMIT;
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';

-- Isolation Level = repeatable read - означает, что данные обновлятся постоянно
-- Итоговый рейтинг 4, т.к. апдейт сессии 2 отменился, произошел откат (Rollback) т.к. в сессии 1 мы изменили базу данных