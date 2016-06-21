--1 
SELECT * FROM DEPT;
--2
SELECT dept_id, last_name, manager_id FROM emp;
--3
SELECT salary*12, last_name FROM emp;
--4
SELECT first_name "Imiê", last_name "Nazwisko",salary "Zarobki miesiêczne",salary*12+1000 "Roczne z premi¹" FROM emp;
--5
SELECT first_name "Imiê",last_name "Nazwisko",salary "Zarobki miesiêczne",salary*12*1.08 "Zarobki roczne" FROM emp;
--6
SELECT last_name, salary*12+salary*0.05 "ROCZNY DOCHÓD" FROM emp;
--7
SELECT first_name||last_name "Imiê i Nazwisko" FROM emp;
--8
SELECT first_name||' '||last_name|| ' - '||title "Super Pracownicy" FROM emp;
--9
SELECT last_name, salary, title,salary*commission_pct/100 "PROWIZJA" FROM emp; 
/*Niektóre rekordy maj¹ wartoœæ 0 poniewa¿ wartoœci w  polu commission_pct maj¹ wartoœæ NULL */
--10
SELECT last_name, salary, title,NVL(salary*commission_pct/100,0) "PROWIZJA" FROM emp;
--11
SELECT  DISTINCT  name FROM dept;
--12
SELECT last_name, dept_id, start_date FROM emp ORDER BY start_date ASC; /*rosn¹co*/
SELECT last_name, dept_id, start_date FROM emp ORDER BY start_date DESC; /*malej¹co*/
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