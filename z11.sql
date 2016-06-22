CREATE OR REPLACE PACKAGE pracownicy AS
  PROCEDURE add_emp (
   in_last_name IN VARCHAR2,
   in_first_name IN VARCHAR2,
   in_userid IN VARCHAR2 DEFAULT NULL,
   in_start_date IN DATE DEFAULT NULL,
   in_comments IN VARCHAR2 DEFAULT NULL,
   in_manager_id IN NUMBER DEFAULT NULL,
   in_title IN VARCHAR2 DEFAULT NULL,
   in_dept_id IN NUMBER DEFAULT NULL,
   in_salary IN NUMBER DEFAULT NULL,
   in_commission_pct IN NUMBER DEFAULT NULL); 
  PROCEDURE change_emp(in_id NUMBER, in_value VARCHAR2, in_value2 VARCHAR2);
  PROCEDURE delete_emp(p_id IN VARCHAR2);
  PROCEDURE change_salary(p_id IN VARCHAR2, p_procent IN NUMBER DEFAULT 0);
  PROCEDURE top_n_emp();
  PROCEDURE change_dept(in_id NUMBER,in_did NUMBER);
  FUNCTION stat_emp(in_value VARCHAR) RETURN NUMBER;
END pracownicy;

CREATE OR REPLACE PACKAGE BODY pracownicy AS
--1
    PROCEDURE add_emp(
     in_last_name IN VARCHAR2,
     in_first_name IN VARCHAR2,
     in_userid IN VARCHAR2 DEFAULT NULL,
     in_start_date IN DATE DEFAULT NULL,
     in_comments IN VARCHAR2 DEFAULT NULL,
     in_manager_id IN NUMBER DEFAULT NULL,
     in_title IN VARCHAR2 DEFAULT NULL,
     in_dept_id IN NUMBER DEFAULT NULL,
     in_salary IN NUMBER DEFAULT NULL,
     in_commission_pct IN NUMBER DEFAULT NULL) AS
    uv_max_id NUMBER;
  BEGIN
   SELECT MAX(id) INTO uv_max_id FROM emp;
   INSERT INTO emp
   VALUES (uv_max_id + 1, in_last_name, in_first_name,
   in_userid, in_start_date, in_comments, in_manager_id,
   in_title, in_dept_id, in_salary, in_commission_pct);
   COMMIT;
  END add_emp; 
--2  
  PROCEDURE change_emp(in_id NUMBER, in_value VARCHAR2, in_value2 VARCHAR2);
    BEGIN
    UPDATE emp SET in_value=in_value2
    WHERE id = p_id;
  END change_emp;
--3
  PROCEDURE delete_emp();
    BEGIN
    DELETE FROM emp WHERE id=p_id;
  END delete_emp;
--4  
  PROCEDURE change_salary(p_id IN VARCHAR2, p_procent IN NUMBER DEFAULT 0) IS
    BEGIN
    UPDATE emp SET salary = salary * (1 + p_procent/100)
    WHERE id = p_id; 
  END change_salary;
--5  
      
      
--6 
  PROCEDURE change_dept(in_id NUMBER,in_did NUMBER);
    BEGIN
    UPDATE emp SET dept_id=in_did WHERE id = in_id;
  END change_dept;
--7
  FUNCTION stat_emp(in_value VARCHAR) 
  RETURN NUMBER AS placa emp.salary%TYPE;
    BEGIN
    IF in_value = 'MIN' THEN (
      SELECT MIN(salary) INTO placa
      FROM emp;
      RETURN (placa);
    );
    ELSIF in_value = 'MAX' THEN (
      SELECT MAX(salary) INTO placa
      FROM emp;
      RETURN (placa);
    );
    ELSIF in_value = 'SUM' THEN(
      SELECT SUM(salary) INTO placa
      FROM emp;
      RETURN (placa);
    );
    ELSIF in_value = 'AVG' THEN(
      SELECT AVG(salary) INTO placa
      FROM emp;
      RETURN (placa);
    );
    ELSE RETURN 0;
    
  END stat_emp;
  
END pracownicy;
  
  
  
  