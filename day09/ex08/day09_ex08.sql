CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE (fibonacci_number INTEGER)
AS $$
DECLARE
  fib_curr INTEGER := 0;
  fib_next INTEGER := 1;
BEGIN
  WHILE fib_curr < pstop LOOP
    fibonacci_number := fib_curr;
    fib_next := fib_curr + fib_next;
    fib_curr := fib_next - fib_curr;
    RETURN NEXT;
  END LOOP;
  RETURN;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM fnc_fibonacci(10000);

SELECT * FROM fnc_fibonacci(100);

SELECT * FROM fnc_fibonacci();
