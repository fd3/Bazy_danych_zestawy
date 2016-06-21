--1
SELECT credit_rating, COUNT(credit_rating)
FROM customer
GROUP BY credit_rating;

--2
SELECT title, SUM(salary) as zarobki
FROM emp
WHERE title NOT LIKE 'VP%'
GROUP BY title
ORDER BY zarobki;

--3
SELECT title, MAX(salary) as zarobki
FROM emp
GROUP BY title;

--4
SELECT d.name, AVG(e.salary) 
FROM dept d, emp e
WHERE e.dept_id=d.id 
GROUP BY d.name
HAVING AVG(e.salary)>'1499';

--5
SELECT 
  o.id,C.name, P.name,O.payment_type,O.date_shipped,I.price,I.quantity
FROM ord O, customer C, product P, item I
WHERE 
  O.payment_type='CASH' AND
  to_char(O.date_ordered,'mm/yyyy') = '09/1992' AND
  O.id=I.ord_id AND
  I.product_id=P.id AND
  o.sales_rep_id=c.sales_rep_id AND 
  o.customer_id=c.id
ORDER BY o.id, p.name ;

--6
SELECT 
  O.id,C.name,O.payment_type,O.date_ordered, SUM(I.price*I.quantity)
FROM ord O, customer C, product P, item I
WHERE 
  O.payment_type='CASH' AND
  to_char(O.date_ordered,'mm/yyyy') = '09/1992' AND
  O.id=I.ord_id AND
  I.product_id=P.id AND
  O.sales_rep_id=c.sales_rep_id AND 
  O.customer_id=c.id
GROUP BY O.id,C.name,O.payment_type,O.date_ordered
ORDER BY o.id;

--7
SELECT
  e1.last_name
FROM 
  emp e1, emp e2
WHERE 
  e1.last_name=e2.last_name
  GROUP BY e1.last_name
HAVING 
  (COUNT(e1.last_name)>'1');

--7a
SELECT last_name, first_name
FROM 
  emp
WHERE 
  last_name  
  IN    (SELECT
         e1.last_name
        FROM 
         emp e1, emp e2
        WHERE 
          e1.last_name=e2.last_name
          GROUP BY e1.last_name
        HAVING 
         (COUNT(e1.last_name)>'1'))
;

--8
SELECT 
  first_name,last_name,title,manager_id,level
FROM 
  emp
WHERE
  level=1 OR level=2 OR level=3 OR level=4
  start with title='President'
  connect by prior id=manager_id
  ORDER BY level;
  
--9
SELECT 
  first_name,last_name,title,manager_id,level
FROM 
  emp
WHERE
  level=1 OR level=2 OR level=3
  start with title='VP, Operations'
  connect by prior id=manager_id
  ORDER BY level;

--10
SELECT 
  region_id,name
FROM dept
UNION
SELECT 
  id,name
FROM 
  region
ORDER BY 
  name;

--11
SELECT 
  name
FROM dept
UNION
SELECT 
  name
FROM 
  region
ORDER BY 
  name;

--12
SELECT 
  name
FROM dept
UNION ALL
SELECT 
  name
FROM 
  region;

--13
SELECT 
  dept_id,last_name
FROM 
  emp
UNION ALL
SELECT 
  id,name
FROM 
  region
ORDER BY 
  last_name;

--14
SELECT 
  id
FROM 
  customer
INTERSECT
SELECT 
  customer_id
FROM 
  ord;

--15
SELECT 
  id
FROM 
  customer
MINUS
SELECT 
  customer_id
FROM 
  ord;


