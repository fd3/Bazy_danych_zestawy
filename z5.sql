--1
SELECT 
  id, total 
FROM
  ord
WHERE 
  total= (SELECT MAX(total) FROM ord);

--2
SELECT 
  id, date_ordered, date_shipped,total 
FROM
  ord
WHERE 
  total= (SELECT MIN(total) FROM ord WHERE payment_type='CASH');

--3
SELECT 
  id, date_ordered, date_shipped,total 
FROM
  ord
WHERE 
  total > (SELECT AVG(total) FROM ord );

--4
SELECT 
  name, suggested_whlsl_price 
FROM
  product
WHERE 
  suggested_whlsl_price < 
  (SELECT AVG(suggested_whlsl_price) FROM product
  WHERE name like 'Prostar%');

--5
SELECT 
  warehouse_id,product_id,amount_in_stock
FROM
  inventory
WHERE 
  (warehouse_id, amount_in_stock) IN
  (SELECT warehouse_id, MAX(amount_in_stock) FROM inventory
  GROUP BY WAREHOUSE_ID);
-- ODP: Informacja o magazynie 301 pojawia siê dwa razy poniewa¿ dwa producty maj¹ po tyle samo towaru

--6
SELECT 
  warehouse_id,product_id,amount_in_stock
FROM
  inventory I1
WHERE 
  (warehouse_id, amount_in_stock) IN
  (SELECT I1.warehouse_id, MAX(I2.amount_in_stock) 
  FROM inventory I2
  GROUP BY I2.warehouse_id
  HAVING I1.warehouse_id=I2.warehouse_id);
--ODP: G³ówne podzapytanie przekierowujemy do podzapytania, a w g³ównym zapytaniu wyniki s¹ u³o¿one wzglêdem WHEREHOUSE_ID dopier póŸniej nastêpujê filtrtrowanie  i grupowanie.

--7
SELECT
  warehouse.city miasto,
  product.name "NAZWA PRODUKTU",
  amount_in_stock "LICZBA PRODUKTÓW"
FROM inventory inv1, product, warehouse
WHERE amount_in_stock IN
  (SELECT MAX(amount_in_stock)
  FROM inventory inv2
  WHERE inv1.warehouse_id = inv2.warehouse_id)
AND warehouse.id = inv1.warehouse_id
AND product.id = inv1.product_id;

--8
SELECT
  c.name
FROM customer c
  WHERE  NOT EXISTS (SELECT *  
  FROM ord o
  WHERE c.id=o.customer_id);

--9
SELECT
  o.customer_id,c.name,o.id
FROM customer c, ord o
  WHERE   EXISTS (SELECT *  
  FROM ord o
  WHERE c.id=o.customer_id)AND c.id=o.customer_id;

--10
Nie zrozumiea³em za bardzo polecenia i nie wiem czy trzeba zrobiæ to w taki prosty sposób.

SELECT
  customer_id,id
FROM ord 
  ORDER BY customer_id ;

--11
SELECT 
  last_name
FROM
  emp
WHERE last_name IN 
(SELECT e.last_name 
FROM ord o, emp e WHERE o.sales_rep_id=e.id AND 
o.id <100
);

--12
SELECT 
  e.last_name
FROM
  emp e, ord o
WHERE 
o.sales_rep_id=e.id AND 
o.id <100;
--ODP: Nale¿y u¿yæ funkcji DISTINCT która nie wyœwietla duplikatów, lub u¿yæ GROUP BY

--13
SELECT 
  first_name, last_name
FROM emp
WHERE 4<=(SELECT COUNT(ord.sales_rep_id) 
FROM ord
WHERE ord.sales_rep_id=emp.id);  