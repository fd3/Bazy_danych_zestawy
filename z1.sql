--1 
SELECT * FROM DEPT;
--2
SELECT dept_id, last_name, manager_id FROM emp;
--3
SELECT salary*12, last_name FROM emp;
--4
SELECT first_name "Imi�", last_name "Nazwisko",salary "Zarobki miesi�czne",salary*12+1000 "Roczne z premi�" FROM emp;
--5
SELECT first_name "Imi�",last_name "Nazwisko",salary "Zarobki miesi�czne",salary*12*1.08 "Zarobki roczne" FROM emp;
--6
SELECT last_name, salary*12+salary*0.05 "ROCZNY DOCH�D" FROM emp;
--7
SELECT first_name||last_name "Imi� i Nazwisko" FROM emp;
--8
SELECT first_name||' '||last_name|| ' - '||title "Super Pracownicy" FROM emp;
--9
SELECT last_name, salary, title,salary*commission_pct/100 "PROWIZJA" FROM emp; 
/*Niekt�re rekordy maj� warto�� 0 poniewa� warto�ci w  polu commission_pct maj� warto�� NULL */
--10
SELECT last_name, salary, title,NVL(salary*commission_pct/100,0) "PROWIZJA" FROM emp;
--11
SELECT  DISTINCT  name FROM dept;
--12
SELECT last_name, dept_id, start_date FROM emp ORDER BY start_date ASC; /*rosn�co*/
SELECT last_name, dept_id, start_date FROM emp ORDER BY start_date DESC; /*malej�co*/
--13
SELECT last_name, dept_id, salary, start_date FROM emp ORDER BY dept_id ASC, salary DESC;
--14
SELECT first_name, last_name, title FROM emp WHERE last_name='Patel';
--15
SELECT first_name,last_name, start_date FROM emp WHERE   start_date BETWEEN '1991/05/15' AND '1991/06/15'; 
--16
SELECT id, name,  region_id FROM dept WHERE region_id=1 OR region_id=3;
--17
SELECT * FROM emp WHERE last_name LIKE 'M%';
--18
SELECT * FROM emp WHERE last_name NOT LIKE '%a%';
--19
SELECT last_name, start_date FROM emp WHERE start_date BETWEEN '1991/01/01' AND '1991/12/31';
--20
SELECT last_name FROM emp WHERE last_name LIKE '_a%';
--21
SELECT name FROM customer where name LIKE '%s_o%';