--------------------Question 1:-------------------------------------------------

SET SERVEROUTPUT ON;
DECLARE
V_NOM varchar(20);
V_PRENOM varchar(20);
BEGIN
V_NOM:='&V_NOM';
V_PRENOM:='&PRENOM';
dbms_output.put_line('votre Nom est ' || V_NOM);
dbms_output.put_line('votre Prenom est ' || V_PRENOM);
END; 

--------------------Question 2:------------------------------------------------

SET SERVEROUTPUT ON;
DECLARE
v_var1 int;
BEGIN
select count (*) into v_var1 from OT.EMPLOYEES;
END;

---------------------Question 3:------------------------------------------------

SET SERVEROUTPUT ON;
DECLARE
v_NBR int;
BEGIN
select count (*) into v_NBR from OT.EMPLOYEES where manager_id=1 ;
END; 

----------------------Question 4:-----------------------------------------------

SET SERVEROUTPUT ON;
DECLARE
v_var1 int;
v_var2 int;
v_var3 int;
BEGIN
select count (*) into v_var1 from OT.EMPLOYEES ;
select count (*) into v_var2 from OT.EMPLOYEES where manager_id=1 ;
v_var3 := (v_var2/v_var1)*100;
dbms_output.put_line(' la proportion est ' || v_var3);
END;  

-----------------------Question 5:-------------------------------------------------

SET SERVEROUTPUT ON;
DECLARE
v_id OT.EMPLOYEES.EMPLOYEE_ID%type := '&v_id' ; 
v_last_name OT.EMPLOYEES.LAST_NAME%type ; 
v_first_name OT.EMPLOYEES.FIRST_NAME%type; 
v_hire_date OT.EMPLOYEES.HIRE_DATE%type;
BEGIN
select LAST_NAME,FIRST_NAME,HIRE_DATE into v_last_name,v_first_name,v_hire_date from OT.EMPLOYEES where EMPLOYEE_ID = v_id ;
dbms_output.put_line(' lemployee ' || v_id || ': ');
dbms_output.put_line(' NOM ' || v_last_name);
dbms_output.put_line(' PRENOM ' || v_first_name);
dbms_output.put_line(' DATE ' || v_hire_date);
END; 

------------------------Question 6-----------------------------------------------------

SET SERVEROUTPUT ON;
DECLARE
 v_id OT.EMPLOYEES.EMPLOYEE_ID%type := '&v_id';
type employeinfo
is record 
(
  last_name OT.EMPLOYEES.LAST_NAME%type ,
  first_name OT.EMPLOYEES.FIRST_NAME%type, 
  hire_date OT.EMPLOYEES.HIRE_DATE%type );
employe employeinfo ;
BEGIN
select LAST_NAME,FIRST_NAME,HIRE_DATE into employe from OT.EMPLOYEES where EMPLOYEE_ID = v_id ;
dbms_output.put_line(' lemployee ' || v_id || ': ');
dbms_output.put_line(' NOM ' || employe.last_name);
dbms_output.put_line(' PRENOM ' || employe.first_name);
dbms_output.put_line(' DATE ' || employe.hire_date);
END;

------------------------Question 7:-------------------------------------------------------

SET SERVEROUTPUT ON;
DECLARE
 v_id OT.PRODUCTS.PRODUCT_ID%type := '&v_id';
product OT.PRODUCTS%ROWTYPE;
BEGIN
select * into product from OT.PRODUCTS where PRODUCT_ID = v_id ;
dbms_output.put_line(' PRODUCT ID : ' || v_id);
dbms_output.put_line(' NOM : ' || product.PRODUCT_NAME);
dbms_output.put_line(' DESCRIPTION : ' || product.DESCRIPTION );
dbms_output.put_line(' STANDARD COST : ' || product.STANDARD_COST);
dbms_output.put_line(' LIST PRICE : ' || product.LIST_PRICE);
dbms_output.put_line(' CATEGORY ID : ' || product.CATEGORY_ID);
END;


----------------------------Question 8:---------------------------------------------------

SET SERVEROUTPUT ON;
DECLARE
 v_id OT.PRODUCTS.PRODUCT_ID%type := '&v_id';
 employee OT.EMPLOYEES%ROWTYPE;
 type managerinfo
 is record
 ( 
  manager_id OT.EMPLOYEES.EMPLOYEE_ID%type,
  last_name OT.EMPLOYEES.LAST_NAME%type ,
  first_name OT.EMPLOYEES.FIRST_NAME%type, 
  email OT.EMPLOYEES.EMAIL%type,
  phone OT.EMPLOYEES.PHONE%type,
  hire_date OT.EMPLOYEES.HIRE_DATE%type,
  job_title OT.EMPLOYEES.JOB_TITLE%type );
manager managerinfo;

BEGIN
select * into employee from OT.EMPLOYEES where EMPLOYEE_ID = v_id ;
select EMPLOYEE_ID,LAST_NAME,FIRST_NAME,EMAIL,PHONE,HIRE_DATE,JOB_TITLE into manager from OT.EMPLOYEES where EMPLOYEE_ID = employee.MANAGER_ID  ;
dbms_output.put_line(' EMPLOYEE ID : ' || v_id);
dbms_output.put_line(' NOM : ' || employee.LAST_NAME);
dbms_output.put_line(' PRENOM : ' || employee.FIRST_NAME );
dbms_output.put_line(' EMAIL : ' || employee.EMAIL);
dbms_output.put_line(' PHONE : ' || employee.PHONE);
dbms_output.put_line(' HIRE DATE : ' || employee.HIRE_DATE);
dbms_output.put_line(' JOB TITLE : ' || employee.JOB_TITLE);
dbms_output.put_line(' MANAGER ID : ' || employee.MANAGER_ID);
dbms_output.put_line(' NOM DE MANAGER : ' || manager.last_name);
dbms_output.put_line(' PRENOM DE MANAGER : ' || manager.first_name );
dbms_output.put_line(' EMAIL DE MANAGER : ' || manager.email);
dbms_output.put_line(' PHONE DE MANAGER : ' || manager.phone);
dbms_output.put_line(' HIRE DATE DE MANAGER : ' || manager.hire_date);
dbms_output.put_line(' JOB TITLE DE MANAGER : ' || manager.job_title);
END;