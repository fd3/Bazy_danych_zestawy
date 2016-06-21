
--1
DECLARE
  a CONSTANT NUMBER := 777;
  b VARCHAR2(20) := 'TEKST';
  c DATE := '2016-02-02';
BEGIN
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(a));
  DBMS_OUTPUT.PUT_LINE(b);
  DBMS_OUTPUT.PUT_LINE(TO_DATE(c));
END;

--2
DECLARE
 dzis DATE := SYSDATE;
 moje DATE := '1995-07-05';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Dni: ' || ROUND(dzis - moje));
  DBMS_OUTPUT.PUT_LINE('Tygodnie: ' || ROUND((dzis - moje)/7));
  DBMS_OUTPUT.PUT_LINE('Miesiace: ' || ROUND(MONTHS_BETWEEN(dzis, moje), 0));
END;

--3
DECLARE
  maxVN VARCHAR2(25);
  maxVL VARCHAR2(25);
  
  minVN VARCHAR2(25);
  minVL VARCHAR2(25);
  
  x INTEGER;
BEGIN
  SELECT first_name, last_name
  INTO maxVN, maxVL
  FROM emp
  WHERE salary = (
    SELECT MAX(salary) FROM emp
  );
   DBMS_OUTPUT.PUT_LINE('Max zarobki: ' || maxVN || ' ' || maxVL);
   
  SELECT first_name, last_name
  INTO minVN, minVL
  FROM emp
  WHERE salary = (
    SELECT MIN(salary) FROM emp
  );
  DBMS_OUTPUT.PUT_LINE('Min zarobki: ' || minVN || ' ' || minVL);
END;

--4

--a
DECLARE
nazw VARCHAR2(25);
imie VARCHAR2(25);
CURSOR c IS
SELECT first_name, last_name
FROM emp;
BEGIN
OPEN c;
LOOP
  FETCH c INTO imie,nazw;
  EXIT WHEN c%NOTFOUND;  
  DBMS_OUTPUT.PUT_LINE('imie: '||imie || ' , nazwisko: '|| nazw); 
END LOOP;
CLOSE c;
END;

--b
DECLARE
 fn VARCHAR2(25);
 ln VARCHAR2(25);
BEGIN
  FOR i IN 1..25 LOOP
  SELECT first_name, last_name
  INTO fn, ln
  FROM emp
  WHERE id=i;
  DBMS_OUTPUT.PUT_LINE(fn || '  ' || ln);
  END LOOP;
END;

--5
DECLARE
  CURSOR kursor(date1 DATE, date2 DATE) IS
  SELECT id, total, customer_id, sales_rep_id
  FROM ord
  WHERE date_ordered >= date1
  AND date_ordered <= date2;
  customer_id1 INTEGER;
  sales_rep_id1 INTEGER;
  id1 INTEGER;
  total1 INTEGER;
BEGIN
  OPEN kursor('92/09/01', '92/09/04');
  LOOP
    FETCH kursor INTO id1, total1, customer_id1, sales_rep_id1;
    EXIT WHEN kursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(' ID Pracownika: ' || sales_rep_id1||' ID Zamówienia: ' || id1 || ' Wartoœæ: ' || total1 || ' ID Klienta: ' || customer_id1 );
  END LOOP;
  CLOSE kursor;
END;

--6

--a
DECLARE
x INTEGER;
BEGIN
  SELECT AVG(salary)
  INTO x
  FROM emp_new;
  UPDATE emp_new SET salary = salary*1.20
  WHERE salary < 0.5*x;
END;

--b
DECLARE
x INTEGER;
BEGIN
  SELECT AVG(salary)
  INTO x
  FROM emp_new;
  UPDATE emp_new SET salary = salary*1.1
  WHERE salary < 0.8*x AND salary > 0.5*x;
END;

--c
DECLARE
x INTEGER;
BEGIN
  SELECT AVG(salary)
  INTO x
  FROM emp_new;
  UPDATE emp_new SET salary = salary*1.05
  WHERE salary > 0.8*x;
END;

