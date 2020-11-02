****  QUESTION 1 ***
SET.SERVEROUTPUT ON;
DECLARE
v_nom varchar2(20):='&v_nom';
v_prenom varchar2(20):='&v_prenom';
BEGIN
dbms_output.put_line('le nom est :' || v_nom) ;
dbms_output.put_line('le prenom est :' || v_prenom) ;
END;


**** QUESTION 2 / 3 / 4 *****

DECLARE

v_nombre_employe INT;
v_nombre_employe_id INT;
v_nombre_employe_prtg INT;

BEGIN

SELECT COUNT(*) INTO v_nombre_employe FROM EMPLOYEES ;
dbms_output.put_line('le nombre des employees est :' || v_nombre_employe) ;

SELECT COUNT(*) INTO v_nombre_employe_id FROM EMPLOYEES WHERE MANAGER_ID = 1 ;
dbms_output.put_line('le nombre des employees est :' || v_nombre_employe_id) ;


v_nombre_employe_prtg := v_nombre_employe_id/v_nombre_employe * 100;
dbms_output.put_line('la proportion est :' || v_nombre_employe_prtg) ;

END;

***** QUESTION 5 ********

SET.SERVEROUTPUT ON;

DECLARE

v_last_name employees.last_name%TYPE;
v_first_name employees.first_name%TYPE;
v_hire_date employees.hire_date%TYPE;
v_id employees.employee_id%TYPE;

BEGIN
v_id:='&v_id';

SELECT employees.last_name,employees.first_name,employees.hire_date 
INTO v_last_name,v_first_name,v_hire_date 
FROM employees 
WHERE employees.employee_id = v_id;

dbms_output.put_line('le nom complete de ce id est :' || v_last_name || v_first_name ||' sa date est '||v_hire_date);


END;

***** QUESTION 6 ************

DECLARE

TYPE info_employe
IS 
RECORD
(v_last_name employees.last_name%TYPE,
v_first_name employees.first_name%TYPE),
v_hire_date employees.hire_date%TYPE,
v_id employees.employee_id%TYPE );

employee info_employe;

BEGIN

employee.v_id:='&employee.v_id';

SELECT *last_name,first_name,hire_date 
INTO employee 
FROM employees 
WHERE employee_id = employee.v_id;

dbms_output.put_line(employee);

END;


******   QUESTION 7  *********

DECLARE


TYPE str_product
IS 
RECORD
(
 pro PRODUCTS%ROWTYPE 
)
; 

v_product str_product;


BEGIN

dbms_output.put_line ('entrez l id du produit');

v_product.PRODUCT_ID := '&v_product.PRODUCT_ID';
SELECT * INTO v_product  
FROM PRODUCTS 
WHERE PRODUCT_ID = v_product.PRODUCT_ID ;

dbms_output.put_line (v_product);

END;

******   QUESTION 8  *********

DECLARE
TYPE r_mgr
IS RECORD(
 manager employees%ROWTYPE;
);
TYPE r_emp
IS RECORD(
 employee employees%ROWTYPE;
);
 v_manager r_mgr;
 v_employee r_emp;

BEGIN

 dbms_output.put_line ('entrez l id de l employee ');
 
 v_employee.EMPLOYEE_ID:= '&v_employee.EMPLOYEE_ID';
 v_manager.MANAGER_ID := v_employee.MANAGER_ID

SELECT * INTO v_manager FROM employees WHERE EMPLOYEE_ID= v_manager.MANAGER_ID ; 
SELECT * INTO v_employee FROM employees WHERE EMPLOYEE_ID= v_employee.EMPLOYEE_ID ;

 dbms_output.put_line (v_manager);
 dbms_output.put_line (v_employee);
END;

