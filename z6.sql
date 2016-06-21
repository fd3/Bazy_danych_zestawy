--1
SELECT first_name, last_name
FROM emp
WHERE salary > (SELECT AVG(salary) FROM emp WHERE title='Warehouse Manager');

--2
SELECT first_name, last_name
FROM 
  emp
WHERE 
  salary>1300
ORDER BY last_name;

--3
SELECT
  count(*)
FROM 
  emp
WHERE salary <(SELECT AVG(salary) FROM emp);

--4
SELECT
  last_name, first_name
FROM 
  emp
WHERE ((MONTHS_BETWEEN(TO_DATE('01-03-2015','DD-MM-YYYY'),start_date))/12)>24;

--5
SELECT
  sales_rep_id,SUM(total)
FROM 
  ord 
GROUP BY sales_rep_id;

--6
SELECT
  sales_rep_id,
  SUM(total)
FROM ord
GROUP BY sales_rep_id
HAVING SUM(total) =
  (SELECT MAX(SUM(total)) FROM ord
  GROUP BY sales_rep_id);


--7
SELECT first_name,last_name
FROM emp
WHERE id= (SELECT
  sales_rep_id
FROM ord
GROUP BY sales_rep_id
HAVING SUM(total) =
  (SELECT MAX(SUM(total)) FROM ord
  GROUP BY sales_rep_id));

--8
SELECT
  start_date,
  COUNT(start_date)
FROM 
  emp
GROUP BY start_date
ORDER BY start_date;

--9
SELECT
  p.name
FROM 
  product p, inventory i
WHERE
  i.out_of_stock_explanation   LIKE '%' AND
  p.id=i.product_id;

--10
SELECT
  name
FROM 
  product
WHERE
  500 > 
  (SELECT SUM(amount_in_stock)
  FROM inventory
  WHERE product.id = inventory.product_id
  );

--11
SELECT name FROM product
WHERE length(name) - length(replace(name, ' ', '')) + 1 = 3;

--12
SELECT 
  date_ordered || '  '|| total "Data zamowien i laczna wartosc"
FROM 
  ord;