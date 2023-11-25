-- Session #1 & Session #2

SHOW TRANSACTION ISOLATION LEVEL;

BEGIN;
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut'; -- В случае с Session 1 ставим рейтинг 4, в Session 2 ставим рейтинг 3.6
COMMIT;
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';

-- Isolation Level = read committed - означает, что данные обновлятся только после коммита в базу
-- Итоговый рейтинг 3.6