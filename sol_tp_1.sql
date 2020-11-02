-----------------------Question 1
ACCEPT var_nom  PROMPT 'Veuillez saisir votre nom :>'
ACCEPT var_prenom  PROMPT 'Veuillez saisir votre prenom :>'
set serveroutput on
 
declare
v_nom VARCHAR2(50);
v_prenom VARCHAR2(50);
begin
v_nom := '&var_nom';
v_prenom := '&var_prenom';
dbms_output.put_line ('Votre nom est :'||v_nom);
dbms_output.put_line ('Votre prenom est :'||v_prenom);
end;
-----------------------Question 2
DECLARE
v_Nombre_Employer NUMBER(5) ;
BEGIN
SELECT COUNT(*) INTO v_Nombre_Employer FROM EMPLOYEES;
DBMS_OUTPUT.PUT_LINE(v_Nombre_Employer);
END;
-----------------------Question 3
DECLARE
v_Qestion3 NUMBER(5) ;
BEGIN
SELECT COUNT(*) INTO v_Qestion3 FROM EMPLOYEES WHERE manager_id=1;
DBMS_OUTPUT.PUT_LINE(v_Qestion3);
END;
-----------------------Question 4
DECLARE
v_Nombre_Employer NUMBER(5) ;
v_Qestion3 NUMBER(5) ;
v_Qestion4 NUMBER(8,2);
BEGIN
SELECT COUNT(*) INTO v_Nombre_Employer FROM EMPLOYEES;
SELECT COUNT(*) INTO v_Qestion3 FROM EMPLOYEES WHERE manager_id=1;
v_Qestion4:=v_Nombre_Employer/v_Qestion3;
DBMS_OUTPUT.PUT_LINE(v_Qestion4);
END;
-----------------------Question 5
ACCEPT var_id PROMPT 'Veuillez saisir ID de l employe :>'
DECLARE
v_id number(5);
v_last_name EMPLOYEES.LAST_NAME%TYPE;
v_first_name EMPLOYEES.FIRST_NAME%TYPE;
v_hire_date EMPLOYEES.HIRE_DATE%TYPE;
BEGIN
v_id := '&var_id';
SELECT LAST_NAME,FIRST_NAME,HIRE_DATE INTO v_last_name,v_first_name,v_hire_date FROM EMPLOYEES WHERE EMPLOYEE_ID=v_id;
dbms_output.put_line ('Voici les informations de cet employe :'||v_last_name||'                     '||v_first_name||'                     '||v_hire_date );
END;
-----------------------Question 6
ACCEPT var_id PROMPT 'Veuillez saisir ID de l employe :>'
DECLARE
v_id number(5);
TYPE employeinfo IS RECORD (
v_last_name VARCHAR2(255);
v_first_name VARCHAR2(255);
v_hire_date DATE;
);
employe employeinfo;
BEGIN
v_id := '&var_id';

SELECT LAST_NAME,FIRST_NAME,HIRE_DATE INTO employe.v_last_name,employe.v_first_name,employe.v_hire_date FROM EMPLOYEES WHERE EMPLOYEE_ID=v_id;
dbms_output.put_line ('Voici les informations de cet employe :'||employe.v_last_name||'                     '||employe.v_first_name||'                     '||employe.v_hire_date );
END;
-----------------------Question 7
ACCEPT var_id PROMPT 'Veuillez saisir ID de l employe :>'
DECLARE
v_id number(5);
employe Products%ROWTYPE;
BEGIN
v_id := '&var_id';
SELECT *
INTO employe
FROM Products WHERE PRODUCT_ID = v_id;
dbms_output.put_line ('Voici les informations de cet employe :'||employe.PRODUCT_ID||' '||employe.PRODUCT_NAME||' '||employe.DESCRIPTION||' '||employe.STANDARD_COST||' '||employe.LIST_PRICE||' '||employe.CATEGORY_ID );
END;
-----------------------Question 8
ACCEPT var_id PROMPT 'Veuillez saisir ID de l employe :>'
DECLARE
v_id number(5);
r_mgr EMPLOYEES%ROWTYPE;
r_emp EMPLOYEES%ROWTYPE;
BEGIN
v_id := '&var_id';
SELECT *
INTO r_emp
FROM EMPLOYEES WHERE EMPLOYEE_ID = v_id;
SELECT *
INTO r_emp
FROM EMPLOYEES WHERE EMPLOYEE_ID = r_emp.MANAGER_ID;
dbms_output.put_line ('Voici les informations de cet employe :'||r_emp.EMPLOYEE_ID||' '||r_emp.FIRST_NAME||' '||r_emp.LAST_NAME||' '||r_emp.EMAIL||' '||r_emp.PHONE||' '||r_emp.HIRE_DATE||' '||r_emp.MANAGER_ID||' '||r_emp.JOB_TITLE );
dbms_output.put_line ('Voici les informations du manager :'||r_emp.EMPLOYEE_ID||' '||r_emp.FIRST_NAME||' '||r_emp.LAST_NAME||' '||r_emp.EMAIL||' '||r_emp.PHONE||' '||r_emp.HIRE_DATE||' '||r_emp.MANAGER_ID||' '||r_emp.JOB_TITLE );

END;
-----------------------Question 9
ACCEPT var_id PROMPT 'Veuillez saisir ID du customer :>'
DECLARE
TYPE vtype IS VARRAY(500) of ORDERS%ROWTYPE;
v_id number(5);
v_customer CUSTOMERS%ROWTYPE;
v_order vtype;
BEGIN
v_id := '&var_id';
select * into v_customer from customers where i customer_id = v_id;
SELECT * BULK COLLECT into v_order from orders where customer_id = v_id ;
dbms_output.put_line ('voici lse informations du customer :'||v_customer.NAME||v_customer.ADDRESS||v_customer.WEBSITE||v_customer.CREDIT_LIMIT);
for i in 1 .. v_id loop
dbms_output.put_line('order numero'||i||' :'||v_order(i).ORDER_ID||v_order(i).STATUS||v_order(i).SALESMAN_ID||v_order(i).ORDER_DATE);
END;

