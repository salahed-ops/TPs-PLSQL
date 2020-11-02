/*QUESTION 1 */
SET SERVEROUTPUT ON ;
DECLARE
  v_nom varchar(250);
  v_prenom varchar(250);
BEGIN
  v_nom := '&v_nom'; 
  v_prenom := '&v_prenom';
  dbms_output.put_line('votre nom= ' || v_nom) ;
  dbms_output.put_line('votre prenom= ' || v_prenom) ;
END;

/*QUESTION 2 */
SET SERVEROUTPUT ON ;
DECLARE
nbr_empl INTEGER ;
BEGIN
SELECT COUNT(*)
into nbr_empl 
FROM EMPLOYEES ;
dbms_output.put_line('le nombre total des employ�s dans la table Employees est  :' || nbr_empl );
END;

/*QUESTION 3 */
SET SERVEROUTPUT ON ;
DECLARE
nbr_empl_id INTEGER ;
BEGIN
SELECT COUNT(EMPLOYEE_ID)
into nbr_empl_id 
FROM EMPLOYEES 
WHERE MANAGER_ID = 1 ;
dbms_output.put_line('le nombre d�employ�s dont MANAGER_ID = 1 est :' || nbr_empl_id);
END;

/*QUESTION 4 */
SET SERVEROUTPUT ON ;
DECLARE
nbr_empl  INTEGER ;
nbr_empl_id  INTEGER ;
proportion INTEGER ;
BEGIN
SELECT COUNT(*)
into nbr_empl 
FROM EMPLOYEES ;
SELECT COUNT(EMPLOYEE_ID)
into nbr_empl_id 
FROM EMPLOYEES 
WHERE MANAGER_ID = 1 ;
proportion := ( nbr_empl_id /nbr_empl )*100 ;
dbms_output.put_line('la proportion est : ' || proportion);
END;

/*QUESTION 5*/
SET SERVEROUTPUT ON ;
DECLARE
  v_last_name employees.last_name%TYPE ;
  v_first_name employees.first_name%TYPE;
  v_hire_date employees.hire_date%TYPE;
BEGIN
SELECT LAST_NAME, FIRST_NAME , HIRE_DATE 
into v_last_name , v_first_name , v_hire_date
FROM EMPLOYEES 
where   EMPLOYEE_ID = '&EMPLOYEE_ID' ;
 
dbms_output.put_line('last name : '|| v_last_name || ' // first name :' || v_first_name || ' // hire date :' || v_hire_date ) ; 
END;



/*QUESTION 6*/
SET SERVEROUTPUT ON ;
DECLARE
type employes
is record (
v_last_name employees.last_name%TYPE,
v_first_name employees.first_name%TYPE,      
v_hire_date employees.hire_date%TYPE
);
att employes ;
BEGIN
SELECT LAST_NAME, FIRST_NAME , HIRE_DATE 
into att.v_last_name , att.v_first_name , att.v_hire_date
FROM EMPLOYEES 
where   EMPLOYEE_ID = '&EMPLOYEE_ID' ;
 
 dbms_output.put_line('last name : '|| att.v_last_name || ' // first name :' || att.v_first_name || ' // hire date :' || att.v_hire_date ) ; 
END;

/*QUESTION 7*/

SET SERVEROUTPUT ON ;
DECLARE
type produit
is record (
v_PRODUCT_NAME PRODUCTS.PRODUCT_NAME%TYPE,
v_DESCRIPTION PRODUCTS.DESCRIPTION%TYPE,      
v_STANDARD_COST PRODUCTS.STANDARD_COST%TYPE,
v_LIST_PRICE PRODUCTS.LIST_PRICE%TYPE
);
att produit ;
BEGIN
SELECT PRODUCT_NAME, DESCRIPTION, STANDARD_COST, LIST_PRICE
into att.v_PRODUCT_NAME , att.v_DESCRIPTION , att.v_STANDARD_COST, att.v_LIST_PRICE
FROM PRODUCTS 
where   PRODUCT_ID = '&PRODUCT_ID' ;

dbms_output.put_line(' PRODUCT NAME : ' || att.v_PRODUCT_NAME || ' //  DESCRIPTION :' || att.v_DESCRIPTION ) ; 
dbms_output.put_line(' STANDARD COST :' || att.v_STANDARD_COST || ' //  LIST PRICE : ' || att.v_LIST_PRICE) ; 
END;

/*QUESTION 8*/
SET SERVEROUTPUT ON ;
DECLARE 
type managerr
is RECORD 
(
v_m_first_name EMPLOYEES.FIRST_NAME%TYPE,
v_m_last_name EMPLOYEES.LAST_NAME%TYPE,
v_m_email EMPLOYEES.EMAIL%TYPE,
v_m_phone EMPLOYEES.PHONE%TYPE,
v_m_hire_date EMPLOYEES.HIRE_DATE%TYPE,
v_m_job_title EMPLOYEES.JOB_TITLE%TYPE
) ;
mgr managerr;
type employee
is RECORD 
(
v_MANAGER_ID EMPLOYEES.MANAGER_ID%TYPE,
v_first_name EMPLOYEES.FIRST_NAME%TYPE,
v_last_name EMPLOYEES.LAST_NAME%TYPE,
v_email EMPLOYEES.EMAIL%TYPE,
v_phone EMPLOYEES.PHONE%TYPE,
v_hire_date EMPLOYEES.HIRE_DATE%TYPE,
v_job_title EMPLOYEES.JOB_TITLE%TYPE
) ;
emp employee;
BEGIN
  SELECT FIRST_NAME, LAST_NAME, EMAIL, PHONE, HIRE_DATE, JOB_TITLE
  into emp.v_first_name , emp.v_last_name ,emp.v_email , emp.v_phone, emp.v_hire_date, emp.v_job_title
  FROM EMPLOYEES
  where   EMPLOYEE_ID ='&EMPLOYEE_ID';
  dbms_output.put_line(
  ' first name =' || emp.v_first_name ||
  '  // last name =' || emp.v_last_name ||
  ' //  email =' ||  emp.v_email ||
  ' //  phone =' || emp.v_phone ||
  ' //  hire_date =' || emp.v_hire_date  ||
  ' //  job title =' || emp.v_job_title  ) ;
  
  SELECT FIRST_NAME, LAST_NAME, EMAIL, PHONE, HIRE_DATE, JOB_TITLE
  into mgr.v_first_name , mgr.v_last_name ,mgr.v_email , mgr.v_phone, mgr.v_hire_date, mgr.v_job_title
  FROM EMPLOYEES
  where   MANAGER_ID = employee.v_MANAGER_ID;
  dbms_output.put_line(
  ' first name =' || mgr.v_first_name ||
  '  // last name =' || mgr.v_last_name ||
  ' //  email =' ||  mgr.v_email ||
  ' //  phone =' || mgr.v_phone ||
  ' //  hire_date =' || mgr.v_hire_date  ||
  ' //  job title =' || mgr.v_job_title  ) ;

END ;