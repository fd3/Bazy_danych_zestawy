--1
SELECT 
  E.last_name "NAZWISKO", E.first_name "IMIÊ" , D.id "ID" , D.name "NAZWA DEPARTAMENTU"
FROM 
  dept D ,emp E 
WHERE
  E.dept_id=D.id;

--2
SELECT 
  D.id , D.region_id "NR REGIONU",R.name "NAZWA REGIONU"
FROM 
  dept D ,region R
WHERE
  R.id=D.region_id;

--3
SELECT 
  E.last_name"NAZWISKO", E.first_name"IMIÊ", E.dept_id"NR DEPARTAMENTU", D.name"NAZWA"
FROM 
  dept D ,emp E
WHERE
  E.dept_id=D.id AND 
  E.last_name='Menchu';

--4
SELECT 
  E.last_name"NAZWISKO", R.name"NAZWA", E.commission_pct"PROWIZJA"
FROM 
  emp E, region R, dept D
WHERE
  E.dept_id=D.id AND D.region_id=R.id AND
  E.commission_pct>'0';

--5
SELECT 
  NVL(E.last_name,'-')"NAZWISKO",NVL(TO_CHAR(E.id),'-'), NVL(C.name,'-')"NAZWA KLIENTA"
FROM 
  emp E,customer C
WHERE
  C.sales_rep_id=E.id(+);

--6
SELECT 
  E1.last_name|| ' pracuje dla ' ||E2.last_name"KTO DLA KOGO"
FROM 
  emp E1,emp E2
WHERE
  E1.manager_id=E2.id;

--7
SELECT 
  C.name,E.last_name,O.date_ordered,I.quantity,P.name
FROM 
  emp E, item I, product P, ord O, customer C
WHERE 
  I.ord_id='101' AND
  O.id=I.ord_id AND
  O.sales_rep_id=E.id AND
  I.product_id=p.id AND
  O.customer_id=C.id;
  
--8
SELECT 
  C.id"NR KLIENTA",C.name"NAZWA KLIENTA",NVL(TO_CHAR(O.id),'-')"NR ZAMÓWIENIA"
FROM 
  ord O, customer C
WHERE 
  O.customer_id(+)=C.id;
  


--9
SELECT 
  MAX(salary)"MAKSYMALNA",
  MIN(salary)"MINIMALNA",
  AVG(salary)"ŒREDNIA",
  SUM(salary)"SUMA",
  COUNT(salary)"LICZBA PRACOWNIKOW"
FROM 
  emp;

--10
SELECT 
  MIN(last_name)"PIERWSZE NAZWISKO",
  MAX(last_name)"OSTATNIE NAZWISKO"
FROM 
  emp;

--11
SELECT 
  COUNT(first_name)
FROM 
  emp
WHERE 
  dept_id='31' AND commission_pct>'0';