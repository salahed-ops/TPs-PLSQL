
/************************** question 1 *******************************/

SET SERVEROUTPUT ON;
DECLARE
v_nom_prenom varchar2(25):='&v_nom_prenom';
BEGIN
DBMS_OUTPUT.PUT_LINE('votre nom est : '|| v_nom_prenom);
END;


/*************************** question 2 ******************************/

SET SERVEROUTPUT ON;
DECLARE 
v_nombre INT;
BEGIN
SELECT COUNT(*) INTO v_nombre FROM EMPLOYEES;
DBMS_OUTPUT.PUT_LINE('le nombre total des employés : '||v_nombre);
END;


/***************************** question 3 *******************************/

SET SERVEROUTPUT ON;
DECLARE 
v_nombre INT;
BEGIN
SELECT COUNT(*) INTO v_nombre FROM EMPLOYEES where manager_id=1;
DBMS_OUTPUT.PUT_LINE('le nombre total des employés : '||v_nombre);
END;


/***************************** question 4 ******************************/

SET SERVEROUTPUT ON;
DECLARE 
v_total INT;
v_nombre INT;
v_proportion NUMBER(8,6);
BEGIN
SELECT COUNT(*) INTO v_total FROM EMPLOYEES ;
SELECT COUNT(*) INTO v_nombre FROM EMPLOYEES where manager_id=1;
v_proportion:=(v_nombre/v_total)*100;
DBMS_OUTPUT.PUT_LINE('la proportion : '||v_proportion);
END;


/***************************** question 5 *****************************/

SET SERVEROUTPUT ON;
DECLARE 
v_id employees.employee_id%TYPE;
v_last_name employees.last_name%TYPE;
v_first_name employees.first_name%TYPE;
v_hire_date employees.hire_date%TYPE;

BEGIN

v_id := &v_id;
SELECT employees.FIRST_NAME,employees.LAST_NAME,employees.hire_date 
INTO v_first_name,v_last_name,v_hire_date 
FROM employees
where employees.employee_id = v_id;
DBMS_OUTPUT.PUT_LINE('le nom de lemployé est : '|| v_first_name || v_last_name||'  sa date est '||v_hire_date);

END;



/*************************** question 6 ***************************/

SET SERVEROUTPUT ON;
DECLARE 
a INT;
type employe_rec is RECORD(
    e_id employees.employee_id%TYPE,
    e_last_name employees.last_name%TYPE,
    e_first_name employees.first_name%TYPE,
    e_hire_date employees.hire_date%TYPE
);
emp employe_rec;
BEGIN
emp.e_id := &a;
SELECT employee_id,last_name,first_name,hire_date INTO emp FROM EMPLOYEES where employee_id = emp.e_id;
DBMS_OUTPUT.PUT_LINE('le nom de lemployé est ' || emp.e_first_name ||' ' || emp.e_last_name||'  sa date est '||emp.e_hire_date);

END; 


/******************************* question 7 ********************************/

SET SERVEROUTPUT ON;
DECLARE 
a INT;
type pro_rec is RECORD(
    p_id products.product_id%TYPE,
    p_name products.product_name%TYPE,
    p_desc products.description%TYPE,
    p_st_cost products.standard_cost%TYPE,
    p_price products.list_price%type,
    p_cat products.category_id%type
);
pr pro_rec;
BEGIN
pr.p_id := &a;
SELECT * INTO pr FROM products where product_id = pr.p_id;
DBMS_OUTPUT.PUT_LINE('le nom du produit est  ' ||pr.p_name|| 'sa description : '|| pr.p_desc ||' son standard_cost est ' ||pr.p_st_cost ||' list_price : '|| pr.p_price|| 'category_id : '||pr.p_cat);

END; 




/******************************* question 8 ********************************/

SET SERVEROUTPUT ON;
DECLARE

r_mgr EMPLOYEES%rowtype;
r_emp EMPLOYEES%rowtype;
v_id EMPLOYEES.employee_id%type;

BEGIN
v_id := &v_id;
 
SELECT * into r_emp from EMPLOYEES where EMPLOYEES.employee_id=v_id;
DBMS_OUTPUT.PUT_LINE('les informations de lemploye sont : '|| r_emp.first_name ||' '||r_emp.last_name||' '||r_emp.email||' '|| r_emp.phone||' '||r_emp.hire_date||' '||r_emp.job_title );
SELECT * into r_mgr from EMPLOYEES where EMPLOYEES.employee_id = r_emp.manager_id;
DBMS_OUTPUT.PUT_LINE('les informations du manager sont : '|| r_mgr.first_name ||' '||r_mgr.last_name||' '||r_mgr.email||' '|| r_mgr.phone||' '||r_mgr.hire_date||' '||r_mgr.job_title );
END;

