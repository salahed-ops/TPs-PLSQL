**********************************************************************************Question 1**************************************************************************************************************************

SET SERVEROUTPUT ON
DECLARE 
    v_nom VARCHAR2(20);
    v_prenom VARCHAR2(20);
BEGIN
    v_nom:='&v_nom';
    v_prenom:='&v_prenom';

    DBMS_OUTPUT.PUT_LINE('Votre nom est: ' ||v_nom);
    DBMS_OUTPUT.PUT_LINE('Votre prenom est: ' ||v_prenom);
END;

*********************************************************************************Question 2 - 3 -4*********************************************************************************************************************

SET SERVEROUTPUT ON
DECLARE 
    n_employee NUMBER;
    n_manager NUMBER;
    proportion NUMBER;
BEGIN
    SELECT COUNT(*) INTO n_employee FROM EMPLOYEES;
    SELECT COUNT(*) INTO n_manager FROM EMPLOYEES WHERE MANAGER_ID = 1;
    proportion := (n_manager/n_employee)*100;
    
    DBMS_OUTPUT.PUT_LINE('Le nombre d employes ayant un manager_id=1 est: ' || proportion || '%');
END;


***********************************************************************************Question 5*******************************************************************************************************************
SET SERVEROUTPUT ON
DECLARE 
    v_last_name VARCHAR2(20);
    v_first_name VARCHAR2(20);
    v_hire_date DATE;
    n_employee NUMBER;
BEGIN
    n_employee:= &n_employee;
    SELECT first_name, last_name, hire_date INTO v_first_name, v_last_name, v_hire_date FROM employees WHERE employee_id = n_employee;
    
    DBMS_OUTPUT.PUT_LINE('Les informations de l id de l employee saisi sont : '||v_last_name||' '||v_first_name||' '||v_hire_date);
END;

*************************************************************************************Question 6******************************************************************************************************************

SET SERVEROUTPUT ON
DECLARE 
    TYPE rd_employee IS RECORD(
        v_first_name VARCHAR2(20),
        v_last_name VARCHAR2(20),
        v_hire_date DATE
    );
    n_employee NUMBER;
    person rd_employee; 
BEGIN
    n_employee:= &n_employee;
    
    SELECT first_name, last_name, hire_date INTO person FROM employees WHERE employee_id = n_employee;
    
    DBMS_OUTPUT.PUT_LINE('Vos informations sont : '||person.v_last_name||' '||person.v_first_name||' '||person.v_hire_date);
END;

*******************************************************************************Question 7******************************************************************************************************************

SET SERVEROUTPUT ON
DECLARE 
    rd_product products%ROWTYPE;
    n_product NUMBER;
BEGIN
    n_product:= &n_product;
    
    SELECT * INTO rd_product FROM products WHERE n_product = product_id;
    
    DBMS_OUTPUT.PUT_LINE('Le produit qui a l id que vous avez saisi est : '|| rd_product.product_id ||' '|| rd_product.product_name ||' '|| rd_product.description || ' ' || rd_product.standard_cost || ' ' || rd_product.list_price || ' ' || rd_product.category_id);
END;

*********************************************************************************Question 8******************************************************************************************************************

SET SERVEROUTPUT ON
DECLARE 
    r_mgr employees%ROWTYPE;
    r_emp employees%ROWTYPE;
    n_employee NUMBER;
BEGIN
    n_employee := &n_employee;
    
        SELECT * INTO r_emp FROM  employees WHERE n_employee = employee_id;
    IF(n_employee>1) THEN
        SELECT * INTO r_mgr FROM  employees WHERE employee_id = r_emp.manager_id;
    END IF;
    IF(n_employee =1) THEN
        DBMS_OUTPUT.PUT_LINE('Les informations de l employee sont : '|| r_emp.employee_id ||' '|| r_emp.first_name ||' '|| r_emp.last_name || ' ' || r_emp.email || ' ' || r_emp.phone || ' ' || r_emp.hire_date || ' ' || r_emp.manager_id || ' ' || r_emp.job_title);
        DBMS_OUTPUT.PUT_LINE('C est le president, il n a pas besoin d un manager.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Les informations de l employee sont : '|| r_emp.employee_id ||' '|| r_emp.first_name ||' '|| r_emp.last_name || ' ' || r_emp.email || ' ' || r_emp.phone || ' ' || r_emp.hire_date || ' ' || r_emp.manager_id || ' ' || r_emp.job_title);
        DBMS_OUTPUT.PUT_LINE('Les informations du manager sont : '|| r_mgr.employee_id ||' '|| r_mgr.first_name ||' '|| r_mgr.last_name || ' ' || r_mgr.email || ' ' || r_mgr.phone || ' ' || r_mgr.hire_date || ' ' || r_mgr.manager_id || ' ' || r_mgr.job_title);
    END IF;
END;







