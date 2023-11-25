-- Session #1

BEGIN;
SHOW TRANSACTION ISOLATION LEVEL;
UPDATE pizzeria SET rating = 3 WHERE id = 1;
UPDATE pizzeria SET rating = 4 WHERE id = 2;
COMMIT;

-- Session #2

BEGIN;
SHOW TRANSACTION ISOLATION LEVEL;
UPDATE pizzeria SET rating = 3 WHERE id = 2;
UPDATE pizzeria SET rating = 4 WHERE id = 1;
COMMIT;

-- Deadlock произошел после того, как мы запустили вторые апдейты, т.к. оба ждут изменения после коммита (Делалось на  READ COMMITTED)