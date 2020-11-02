
----------------------------------------------------
--question1:
SET SERVEROUTPUT ON;
DECLARE

v_nom char(30) := '&v_nom';
v_prenom char(30) := '&v_prenom';

BEGIN

DBMS_OUTPUT.PUT_LINE('le nom est:' || v_nom );
DBMS_OUTPUT.PUT_LINE('le prenom est:' || v_prenom );

  
END;
------------------------------------------------------


--Question2:
SET SERVEROUTPUT ON;

DECLARE

v_var INT;

BEGIN

SELECT count(*) INTO v_var FROM OT.employees;

END;
-----------------------------------------------------------

--question3:

SET SERVEROUTPUT ON;
DECLARE

v_var INT;

BEGIN

SELECT count(*) INTO v_var FROM OT.employees
where manager_id = 1;

END;
-----------------------------------------------------------

--question4:
SET SERVEROUTPUT ON;
DECLARE
v_total INT;
v_var INT;
v_proportion INT;

BEGIN
SELECT count(*) INTO v_total FROM OT.employees;
SELECT count(*) INTO v_var FROM OT.employees
where manager_id = 1;
v_proportion := (v_var/v_total)*100;

DBMS_OUTPUT.PUT_LINE('la proportion en pourcentage est:' || v_proportion );
END;
----------------------------------------------------------------
--questin5:
SET SERVEROUTPUT ON;
DECLARE

v_id OT.employees.employee_id%type;
v_last_name OT.employees.LAST_NAME%type;
v_first_name OT.employees.FIRST_NAME%type;
v_hire_date OT.employees.HIRE_DATE%type;
 
 BEGIN
 v_id := '&v_id';
   SELECT LAST_NAME,FIRST_NAME,HIRE_DATE into v_last_name,v_first_name,v_hire_date 
     FROM OT.employees where employee_id  = v_id;
     
DBMS_OUTPUT.PUT_LINE('last name  est:' || v_last_name );
DBMS_OUTPUT.PUT_LINE('first name est:' || v_first_name );
DBMS_OUTPUT.PUT_LINE('hire date est:' || v_hire_date );
     
 END;
 ------------------------------------------------------------------------------------
 --question6:
 
 
SET SERVEROUTPUT ON;
DECLARE
v_id OT.employees.employee_id%type;
type personne
 is record(
last_name OT.employees.LAST_NAME%type,
first_name OT.employees.FIRST_NAME%type,
hire_date OT.employees.HIRE_DATE%type
);

per personne;
BEGIN
v_id := '&v_id';
 SELECT LAST_NAME,FIRST_NAME,HIRE_DATE into per
     FROM OT.employees where employee_id   = v_id;

DBMS_OUTPUT.PUT_LINE('last name  est:' || per.last_name );
DBMS_OUTPUT.PUT_LINE('first name est:' || per.first_name );
DBMS_OUTPUT.PUT_LINE('hire date est:' || per.hire_date );
     
 END;
 -----------------------------------------------------------------------------------------
 --question7:
 
 SET SERVEROUTPUT ON;
DECLARE

v_id OT.PRODUCTS.product_id%type;
personne OT.PRODUCTS%rowtype;

 
BEGIN

v_id := '&v_id';

SELECT * into personne FROM  OT.PRODUCTS where product_id   = v_id;

DBMS_OUTPUT.PUT_LINE('Nom de produit  est:' || personne.product_name );
DBMS_OUTPUT.PUT_LINE('description  est:' || personne.description );
DBMS_OUTPUT.PUT_LINE('standard est:' || personne.standard_cost );
DBMS_OUTPUT.PUT_LINE('price est:' || personne.list_price );
DBMS_OUTPUT.PUT_LINE('id de produit  est:' || personne.product_id);
DBMS_OUTPUT.PUT_LINE('la categorie est:' || personne.category_id );

END;

----------------------------------------------------------------------------------------
--question8:


 SET SERVEROUTPUT ON;
DECLARE
v_id OT.employees.employee_id%type;
r_emp OT.employees%rowtype;

type personne
 is record(
last_name OT.employees.LAST_NAME%type,
first_name OT.employees.FIRST_NAME%type,
hire_date OT.employees.HIRE_DATE%type,
tele OT.employees.PHONE%type,
mail OT.employees.EMAIL%type,
job OT.employees.JOB_TITLE%type
);

r_mgr personne;

 
BEGIN
v_id := '&v_id';
 SELECT * into r_emp
     FROM OT.employees where employee_id   = v_id;
     SELECT LAST_NAME,FIRST_NAME,HIRE_DATE,phone,email,job_title into r_mgr   FROM  OT.employees where  employee_id = r_emp.manager_id;
     DBMS_OUTPUT.PUT_LINE('les informations de  EMPLOYESest:' );
     DBMS_OUTPUT.PUT_LINE('last name  est:' || r_emp.last_name );
DBMS_OUTPUT.PUT_LINE('first name est:' || r_emp.first_name );
DBMS_OUTPUT.PUT_LINE('hire date est:' || r_emp.hire_date );
     DBMS_OUTPUT.PUT_LINE('mail  est:' || r_emp.email );
DBMS_OUTPUT.PUT_LINE('phone  est:' || r_emp.phone );
DBMS_OUTPUT.PUT_LINE('job est:' || r_emp.job_title );
DBMS_OUTPUT.PUT_LINE('------------------------------------------------------' );
DBMS_OUTPUT.PUT_LINE('les informations de manager est:' );
 DBMS_OUTPUT.PUT_LINE('last name  est:' || r_mgr.last_name );
DBMS_OUTPUT.PUT_LINE('first name est:' || r_mgr.first_name );
DBMS_OUTPUT.PUT_LINE('hire date est:' || r_mgr.hire_date );
     DBMS_OUTPUT.PUT_LINE('mail est:' || r_mgr.mail );
DBMS_OUTPUT.PUT_LINE('phone  est:' || r_mgr.tele );
DBMS_OUTPUT.PUT_LINE('job est:' || r_mgr.job );

END;








     
     
     



















