-- TP1
-- GI2
-- AKHROUF Yassin
---------------------

-- Question 1

SET SERVEROUTPUT ON;
DECLARE
    v_nom varchar(20);
    v_prenom varchar(20);
BEGIN
    v_nom := '&v_nom';
    v_prenom := '&v_prenom';
    dbms_output.put_line('Bienvenue ' || v_nom || ' ' || v_prenom);
END;

-- Question 2
SET SERVEROUTPUT ON;
DECLARE
    v_nbrempl NUMBER(3);
BEGIN
    SELECT count(*) INTO v_nbrempl FROM employees;
END;


-- Question 3
SET SERVEROUTPUT ON;
DECLARE
    v_nbrempl1 NUMBER(3);
BEGIN
    SELECT count(*) INTO v_nbrempl FROM employees WHERE manager_id = 1;
END;


-- Question 4
SET SERVEROUTPUT ON;
DECLARE
   v_nbrempl NUMBER(3);
   v_nbrempl1 NUMBER(3);
   v_proportion NUMBER(3,2);
    
BEGIN
    SELECT count(*) INTO v_nbrempl FROM employees;
    SELECT count(*) INTO v_nbrempl1 FROM employees WHERE MANAGER_ID = 1;
    v_proportion := (v_nbrempl1 / v_nbrempl)* 100;
    dbms_output.put_line(v_proportion || '%');
END;


-- Question 5
SET SERVEROUTPUT ON;
DECLARE
    v_last_name employees.LAST_NAME%TYPE;
    v_first_name employees.FIRST_NAME%TYPE;
    v_hire_date employees.HIRE_DATE%TYPE;
    v_id employees.employee_id%TYPE;
    
BEGIN
    v_id := '&v_id';
    SELECT LAST_NAME INTO v_last_name FROM employees WHERE employee_id = v_id;
    SELECT FIRST_NAME INTO v_first_name FROM employees WHERE employee_id = v_id;
    SELECT HIRE_DATE INTO v_hire_date FROM employees WHERE employee_id = v_id;
    dbms_output.put_line(v_last_name || ' ' || v_last_name || ' ' || v_hire_date);
END;

-- Question 6
SET SERVEROUTPUT ON;
DECLARE

TYPE employe IS RECORD (
    v_last_name employees.LAST_NAME%TYPE,
    v_first_name employees.FIRST_NAME%TYPE,
    v_hire_date employees.HIRE_DATE%TYPE );
    emp employe;

    v_id employees.employee_id%TYPE;
    
BEGIN
    v_id := '&v_id';
    SELECT LAST_NAME INTO employe.v_last_name FROM employees WHERE employee_id = v_id;
    SELECT FIRST_NAME INTO employe.v_first_name FROM employees WHERE employee_id = v_id;
    SELECT HIRE_DATE INTO employe.v_hire_date FROM employees WHERE employee_id = v_id;
    dbms_output.put_line(employe.v_last_name || ' ' || employe.v_last_name || ' ' || employe.v_hire_date);
END;



-- Question 7
SET SERVEROUTPUT ON;
DECLARE

r_pro products%ROWTYPE;
v_id products.product_id%TYPE;
    
BEGIN
    v_id := '&v_id';
    SELECT * INTO r_pro FROM products WHERE product_id = v_id;

    dbms_output.put_line(r_pro.product_name || ' ' || r_pro.description || ' ' || r_pro.standard_cost || ' ' || r_pro.list_price || ' ' || r_pro.category_id);
END;


-- Question 8
SET SERVEROUTPUT ON;
DECLARE

r_emp employees%ROWTYPE;
r_mgr employees%ROWTYPE;
v_id employees.employee_id%TYPE;
    
BEGIN
    v_id := '&v_id';
    SELECT * INTO r_emp FROM Products WHERE employee_id = v_id;
    SELECT * INTO r_mgr FROM Products WHERE employee_id = r_emp.manager_id;
    dbms_output.put_line('Employe :' || r_emp.first_name || ' ' || r_emp.last_name || ' ' || r_emp.email || ' ' || r_emp.phone || ' ' || r_emp.hire_date || ' ' || r_emp.job_title);
    dbms_output.put_line('Manager :' || r_mgr.first_name || ' ' || r_mgr.last_name || ' ' || r_mgr.email || ' ' || r_mgr.phone || ' ' || r_mgr.hire_date || ' ' || r_mgr.job_title);
END;



-- Question 9
SET SERVEROUTPUT ON;
DECLARE

r_cus customers%ROWTYPE;
r_ord orders%ROWTYPE;
v_id customers.customer_id%TYPE;
TYPE all_orders IS TABLE OF r_ord INDEX BY VARCHAR2(50);
    
BEGIN
    v_id := '&v_id';
    SELECT * INTO r_cus FROM customers WHERE customer_id = v_id;
    SELECT * INTO r_ord FROM orders WHERE customer_id = r_cus.customer_id;
    
END;


