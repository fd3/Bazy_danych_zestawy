 --1
SELECT LOWER(first_name)"IMIÊ", LOWER(last_name)"NAZWISKO",INITCAP(userid)"IDENTYFIKATOR",UPPER(title)"STANOWISKO" FROM emp WHERE title LIKE 'VP%';
--2
SELECT first_name"IMIÊ", last_name"NAZWISKO" FROM emp WHERE last_name=INITCAP('PATEL');
--3
SELECT name||' '||country"NAZWA I PANSTWO" FROM customer WHERE credit_rating='GOOD';
--4
SELECT name"NAZWA",LENGTH(name)"LICZBA ZNAKOW"  FROM product WHERE name LIKE 'Ace%';
--5
SELECT ROUND(41.5843,2)"SETNE", ROUND(41.5843)"CA£KOWITE", ROUND(41.5843,-1)"DZIESIATKI" FROM dual;
--6
SELECT TRUNC(41.5843,2)"SETNE", TRUNC(41.5843)"CA£KOWITE", TRUNC(41.5843,-1)"DZIESIATKI" FROM dual;
--7
SELECT last_name"NAZWISKO" ,MOD(salary,commission_pct)"RESZTA"FROM emp;
--8
SELECT TO_DATE('4 marzec 2015','dd month YYYY','NLS_DATE_LANGUAGE = Polish')"DATA" FROM dual;
--9
SELECT last_name"NAZWISKO",ROUND(MONTHS_BETWEEN('16/03/10',start_date)*4)"LICZBA TYGODNI" FROM emp;
--10
SELECT dept_id"ID",ROUND(MONTHS_BETWEEN('16/03/10',start_date))"LICZBA MIESIECY",TO_DATE(ADD_MONTHS(start_date,3))"DATA KONCA PROBNEGO" FROM emp WHERE MONTHS_BETWEEN('16/03/10',start_date)<284;
--11
SELECT product_id"PRODUKT", restock_date"DOSTAWA",NEXT_DAY(restock_date,'PI¥TEK')"PI¥TEK PO DOSTAWIE",LAST_DAY(restock_date)"OSTATNI DZIEN MIESIACA" FROM inventory WHERE restock_date NOT LIKE 'NULL' ORDER BY product_id ASC ;
--12
SELECT id"ID",start_date"DATA",EXTRACT(month FROM start_date)"MIESI¥C" FROM emp WHERE start_date BETWEEN '1991/01/01' AND '1991/12/30';
--13
SELECT id"ID",TO_CHAR(date_ordered,'mm/YY')"MM/RR" FROM ord WHERE sales_rep_id=11;
--14
SELECT last_name"NAZWISKO", TO_CHAR(start_date,'dd month yyyy')||' roku'"DATA"  FROM emp WHERE start_date>'1991/01/01';