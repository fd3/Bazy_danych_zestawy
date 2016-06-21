--1
	--COMMIT: zapisuje zmiany dokonane w SQL Developerze na bazie danych ,zapisuje siê i nie da siê ju¿ ich cofn¹æ chyba, ¿e backupem.
	--ROLLBACK: cofa ostatnie zmiany dokonane na bazie danych jeœli nie zosta³e ZCOMMITOWANE.
	--SAVEPOINT: Tworzy punkt kontrolny do którego mo¿emy wróciæ i mieæ bazê danych jak w tym punkcie kontrolnym.

--2
SET AUTOCOMMIT OFF ;

--3
INSERT INTO EMP VALUES (98, 'Lukasz', 'Kalicki', null, null, null, null, null, null, null, null);
COMMIT;

--4
INSERT INTO EMP VALUES (101, 'Jan', 'Nowak', null, '99-09-09', null, null, null, null, '5000', null);
SELECT * FROM emp;
ROLLBACK;
SELECT * FROM emp;

--5
INSERT INTO EMP VALUES (101, 'Jan', 'Nowak', null, '99-09-09', null, null, null, null, '5000', null);
COMMIT;

--6
UPDATE item SET price=price*1.15;
SAVEPOINT s1;
SELECT SUM(price) FROM item;
UPDATE item SET price=price*1.10;
SAVEPOINT s2;
SELECT SUM(price) FROM item;
UPDATE item SET price=price*1.60;
SELECT SUM(price) FROM item;
ROLLBACK s2;
SELECT SUM(price) FROM item;
ROLLBACK s1;
SELECT SUM(price) FROM item;
COMMIT;

--7
SET AUTOCOMMIT ON;

--8
CREATE TABLE REGION_KOPIA
(
 ID NUMBER(7,0),
 NAME VARCHAR2(50 BYTE)
);

INSERT INTO region_kopia SELECT * FROM region;

--9
INSERT INTO dept SELECT id+50, LPAD(name, 4, name), region_id FROM dept;

--10
INSERT INTO region_kopia (name)
SELECT name FROM customer WHERE id IN(
  	SELECT customer.id
   	FROM customer, ord
   	GROUP BY customer.id
   	HAVING customer.id = ord.customer_id
   	AND SUM(ord.total) > 1000
);

--11
UPDATE emp
SET salary=salary*3, start_date=TO_DATE('31/12/2001','DD/MM/YYYY')
WHERE last_name='Nowak';

--12
	--a
	UPDATE product
	SET suggested_whlsl_price=suggested_whlsl_price*0.90
	WHERE id IN (SELECT id FROM product p, item i
	WHERE i.product_id=p.id AND i.product_id<30);

	--b

--13
UPDATE emp
SET salary=salary*1.30
WHERE title LIKE 'VP%';

--14
DELETE FROM emp WHERE last_name LIKE 'Nowak';

--15
DROP TABLE region_kopia;


