--Question 1:
SET SERVEROUTPUT ON;
DECLARE
v_nom VARCHAR(20);
v_prenom VARCHAR(20);
BEGIN
DBMS.OUTPUT.PUT_LINE('Veuillez saisir votre nom et prénom');
v_nom :='&v_nom';
v_prenom :='&v_prenom';
DBMS.OUTPUT.PUT_LINE('Bienvenue'|| v_nom || v_prenom);
END;
-- QUESTION 2 3 4 
SET SERVEROUTPUT ON;

DECLARE

v_total INTEGER;
v_count INTEGER;
v_pro INTEGER;

BEGIN

SELECT COUNT(*) 
INTO v_total
FROM employees;


SELECT COUNT(*)
INTO v_count
FROM employees
WHERE MANAGER_ID = 1;

v_por := (V_count*100)/100;
DBMS.OUTPUT.PUT_LINE(‘La proportion est’|| v_por);
END;
--QUESTION 5
SET SERVEROUTPUT ON;
DECLARE
v_last_name  employees.LAST_NAME%TYPE;
v_first_name  employees. FIRST_NAME%TYPE;
v_hire_date  employees. HIRE_DATE%TYPE;
v_id employees. EMPLOYEE_ID%TYPE;

BEGIN
DBMS.OUTPUT.PUT_LINE('Veuillez saisir l ID d un employee');
v_id := '& v_id';
SELECT LAST_NAME, FIRST_NAME, HIRE_DATE
INTO v_last_name, v_first_name , v_hire_date
FROM employees 
WHERE EMPLOYEE_ID = v_id;
DBMS.OUTPUT.PUT_LINE('LAST NAME : ' || v_last_name ) ;
DBMS.OUTPUT.PUT_LINE('FIRST_NAME : ' || v_first_name) ;
DBMS.OUTPUT.PUT_LINE('HIRE_DATE : ' || v_hire_date) ;

END;
--QUESTION 6
SET SERVEROUTPUT ON;
DECLARE
TYPE r_employee_type IS record (
last_name employees.LAST_NAME%TYPE, 
first_name employees.FIRST_NAME%TYPE,
hire_date employees.HIRE_DATE%TYPE);

r_employee r_employee_type;
BEGIN
SELECT LAST_NAME, FIRST_NAME, HIRE_DATE
INTO r_employee  
FROM employees 
WHERE rownum <= 1;
DBMS.OUTPUT.PUT_LINE('LAST NAME : ' || r_employee. last_name);
DBMS.OUTPUT.PUT_LINE('FIRST_NAME : ' || r_employee. first_name) ;
DBMS.OUTPUT.PUT_LINE('HIRE_DATE : ' || r_employee. hire_date) ;
END;  
--QUESTION 7
SET SERVEROUTPUT ON;
DECLARE
r_produit products%ROWTYPE;
v_id products.PRODUCT_ID%TYPE;
BEGIN
DBMS.OUTPUT.PUT_LINE('Veuillez saisir l ID du  produit');
v_id := '&v_id';
SELECT * INTO r_ produit
FROM products
WHERE PRODUCT_ID  =  v_id;
dbms_output.put_line(PRODUCT_ID: ' || r_ produit. PRODUCT_ID);
dbms_output.put_line(PRODUCT_NAME: ' || r_ produit. PRODUCT_NAME);
dbms_output.put_line(DESCRIPTION: ' || r_ produit. DESCRIPTION);
dbms_output.put_line(STANDARD_COST: ' || r_ produit. STANDARD_COST);
dbms_output.put_line(LIST_PRICE: ' || r_ produit. LIST_PRICE);
dbms_output.put_line(CATEGORY_ID: ' || r_ produit. CATEGORY_ID);
END;
--QUESTION 8
SET SERVEROUTPUT ON;
DECLARE
r_mng employees%ROWTYPE;
r_emp employees%ROWTYPE;
v_id employees. EMPLOYEE_ID%TYPE;

BEGIN
DBMS.OUTPUT.PUT_LINE('Veuillez saisir l ID d un employee');
v_id := '&v_id';
SELECT * INTO r_emp
FROM employees
WHERE EMPLOYEE_ID  =  v_id;
SELECT * FROM managers
WHERE MANAGER_ID  = r_emp. MANAGER_ID ;
END;
--QUESTION 9
SET SERVEROUTPUT ON;
DECLARE
r_cstmr CUSTOMERS%ROWTYPE;
r_ordr ORDERS%ROWTYPE;

TYPE ORD_table IS TABLE OF INTEGER; 
ORD ORD_table; 
total integer;
v_id CUSTOMERS. CUSTOMER_ID%TYPE;
BEGIN
DBMS.OUTPUT.PUT_LINE('Veuillez saisir l ID un customer);
v_id := '&v_id';
SELECT COUNT(*)
INTO  total
FROM ORDERS
WHERE customer_id = v_id;

FOR i IN 1 .. total LOOP
SELECT ORDER_ID INTO  ORD[i]
FROM ORDERS
WHERE customer_id = v_id;

SELECT * INTO r_ordr
FROM ORDERS
WHERE ORDER_ID = ORD[i];
dbms_output.put_line(' ORDER_ID:'|| r_ordr. ORDER_ID ||', STATUS:'  || r_ordr. STATUS ', SALESMAN_ID:'  || r_ordr. SALESMAN_ID ', ORDER_DATE:'  || r_ordr. ORDER_DATE);,
end loop;
END;
