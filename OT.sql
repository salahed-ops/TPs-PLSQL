----------------- 1--------------------------
SET SERVEROUTPUT ON ;
DECLARE
  v_nom varchar(250);
  v_prenom varchar(250);
BEGIN
  v_nom :=: v_nom; 
  v_prenom :=: v_prenom;
  dbms_output.put_line('votre nom= ' || v_nom) ;
  dbms_output.put_line('votre prenom= ' || v_prenom) ;
END
----------------- 2--------------------------
SET SERVEROUTPUT ON ;
DECLARE
emp_nbr INTEGER ;
BEGIN
SELECT COUNT(*)
into emp_nbr 
FROM EMPLOYEES ;
dbms_output.put_line(emp_nbr);
END;

----------------- 3--------------------------
SET SERVEROUTPUT ON ;
DECLARE
emp_nbr_man INTEGER ;
BEGIN
SELECT COUNT(EMPLOYEE_ID)
into emp_nbr_man 
FROM EMPLOYEES 
WHERE MANAGER_ID = 1 ;
dbms_output.put_line(emp_nbr_man);
END;

----------------- 4 --------------------------
SET SERVEROUTPUT ON ;
DECLARE
emp_nbr INTEGER ;
emp_nbr_man INTEGER ;
prop INTEGER ;
BEGIN
SELECT COUNT(*)
into emp_nbr 
FROM EMPLOYEES ;
SELECT COUNT(EMPLOYEE_ID)
into emp_nbr_man 
FROM EMPLOYEES 
WHERE MANAGER_ID = 1 ;
prop := (emp_nbr_man/emp_nbr)*100 ;
dbms_output.put_line(prop);
END;

----------------- 5 --------------------------
DECLARE
  v_last_name varchar(250);
  v_first_name varchar(250);
  v_hire_date varchar(250);
BEGIN
  SELECT LAST_NAME, FIRST_NAME , HIRE_DATE 
  into v_last_name , v_first_name , v_hire_date
  FROM EMPLOYEES 
  where   EMPLOYEE_ID ='&EMPLOYEE_ID';
  dbms_output.put_line(v_last_name) ;
  dbms_output.put_line(v_first_name) ;
  dbms_output.put_line(v_hire_date) ;
END;
----------------- 6 --------------------------
DECLARE
 type employee 
 is record (
  v_last_name varchar(250) ,
  v_first_name varchar(250),
  v_hire_date varchar(250)
  ) ;
  emp employee ;
  
BEGIN
  SELECT LAST_NAME, FIRST_NAME , HIRE_DATE 
  into emp.v_last_name , emp.v_first_name , emp.v_hire_date
  FROM EMPLOYEES 
  where   EMPLOYEE_ID ='&EMPLOYEE_ID';
  dbms_output.put_line(
  'votre last name =' || emp.v_last_name || 
  ' , votre first name =' || emp.v_first_name ||
  ' , votre Hire Date =' || emp.v_hire_date ) ;
END;
----------------- 7 --------------------------
set serverout on ;
DECLARE
 type produit 
 is record (
  v_PRODUCT_NAME PRODUCTS.PRODUCT_NAME%TYPE ,
  v_DESCRIPTION PRODUCTS.DESCRIPTION%TYPE ,
  v_STANDARD_COST PRODUCTS.STANDARD_COST%TYPE ,
  v_LIST_PRICE PRODUCTS.LIST_PRICE%TYPE ,
  v_CATEGORY_ID PRODUCTS.CATEGORY_ID%TYPE
  ) ;
  emp produit ;
  
BEGIN
  SELECT PRODUCT_NAME,DESCRIPTION,STANDARD_COST,LIST_PRICE,CATEGORY_ID
  into emp.v_PRODUCT_NAME,emp.v_DESCRIPTION,emp.v_STANDARD_COST,emp.v_LIST_PRICE,emp.v_CATEGORY_ID 
  FROM PRODUCTS 
  where   PRODUCT_ID ='&PRODUCT_ID';
  dbms_output.put_line(
  'PRODUCT_NAME EST =' || emp.v_PRODUCT_NAME || 
  'DESCRIPTION EST =' || emp.v_DESCRIPTION || 
  'STANDARD_COST EST ='||emp.v_STANDARD_COST ||
  'LIST_PRICE EST='||emp.v_LIST_PRICE ||
  'CATEGORY_ID '||emp.v_CATEGORY_ID
  );

END;
----------------- 8 --------------------------