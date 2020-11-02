--							************ Cours Administration de BD ************

--								********** RAPPORT DU TP:1 **********
--***********************
--* Nom :HARRASS	    *
--* Prénom : Yassmina   *
--*********************** 

--************ question 1 : ************

SET SERVEROUTPUT ON;
DECLARE
v_nom  VARCHAR2(50) := '&var_name ';
v_prenom VARCHAR2(50) := '&var_prenom ';
--erreur VARCHAR2(50) := 'LA taille est très longe';
BEGIN
DBMS_OUTPUT.PUT_LINE('Your last name is  :'|| v_nom);
DBMS_OUTPUT.PUT_LINE('Your first name is :'|| v_prenom);
--EXCEPTION
--      WHEN VALUE_ERROR THEN
--            DBMS_OUTPUT.PUT_LINE(erreur); 
END;

--************ question 2 : ************

--*****Méthode 1:

SET SERVEROUTPUT ON;
DECLARE
v_total NUMBER;
BEGIN
SELECT count(*) INTO v_total FROM employees;
IF SQL%FOUND THEN 
DBMS_OUTPUT.PUT_LINE('Le nombre des employées dans la table est  :' || v_total);
END IF;
EXCEPTION 
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('Le nombre des employées dans la table est  :');
END;

--*****Méthode 2:

SET SERVEROUTPUT ON ;
DECLARE
CURSOR c_employees IS  SELECT * FROM employees;
v_total NUMBER :=0 ;
emp c_employees%ROWTYPE;
BEGIN
FOR emp IN c_employees LOOP
v_total:=v_total+1;
END LOOP;
DBMS_OUTPUT.PUT_LINE('Le nombre des employées dans la table est  :' || v_total);
END;

--************ question 3 : ************

--*****Méthode 1:

SET SERVEROUTPUT ON;
DECLARE
v_total NUMBER;
BEGIN
SELECT count(*) INTO v_total FROM employees WHERE MANAGER_ID = 1;
DBMS_OUTPUT.PUT_LINE('Le nombres des emlpyées est :' || v_total);
END;

--*****Méthode 2:

SET SERVEROUTPUT ON;
DECLARE
v_total NUMBER :=0 ;
CURSOR c_emp IS SELECT *  FROM employees WHERE MANAGER_ID = 1;
emp c_emp%ROWTYPE;
BEGIN
FOR emp IN c_emp LOOP
v_total := v_total +1 ;
END LOOP;
DBMS_OUTPUT.PUT_LINE('Le nombres des emlpyées est :' || v_total);
END;

--************ question 4 : ************


SET SERVEROUTPUT ON;
DECLARE
v_employee_total NUMBER ;
v_employee_manager_id_1 NUMBER ;
v_proportion NUMBER ;
BEGIN
SELECT count(*) INTO v_employee_total  FROM employees;
SELECT count(*) INTO v_employee_manager_id_1   FROM employees WHERE manager_id = 1;
v_proportion := (( v_employee_manager_id_1 * 100)/(v_employee_total));
DBMS_OUTPUT.PUT_LINE( v_proportion||'%');
END;

--************ question 5 : ************

SET SERVEROUTPUT ON;
DECLARE
v_last_name employees.last_name%TYPE;
v_first_name employees.first_name%TYPE;
v_hire_date employees.hire_date%TYPE;
emp_id NUMBER := '&id';
BEGIN
SELECT last_name,first_name,hire_date INTO v_last_name,v_first_name,v_hire_date FROM  employees WHERE employee_id=emp_id;
DBMS_OUTPUT.PUT_LINE( v_last_name || ',' || v_first_name || ',' || v_hire_date  );
EXCEPTION 
WHEN no_data_found THEN
DBMS_OUTPUT.PUT_LINE('EMPLOYER NOT FOUND !!!!!!');
END;


--************ question 6 : ************

--*****Méthode 1:

SET SERVEROUTPUT ON;
DECLARE
v_last_name employees.last_name%TYPE;
v_first_name employees.first_name%TYPE;
v_hire_date employees.hire_date%TYPE;
employee_id NUMBER := '&id';
CURSOR c_employee(id NUMBER) IS SELECT * FROM employees WHERE  employee_id=id ;
emp employees%ROWTYPE;
BEGIN
FOR emp IN c_employee(employee_id) LOOP
v_last_name := emp.last_name;
v_first_name:=emp.first_name;
v_hire_date :=emp.hire_date;
DBMS_OUTPUT.PUT_LINE( v_last_name || ',' || v_first_name || ',' || v_hire_date  );
END LOOP;
--EXCEPTION 
--WHEN no_data_found THEN
--DBMS_OUTPUT.PUT_LINE('EMPLOYER NOT FOUND !!!!!!');
END;

--*****Méthode 2:

SET SERVEROUTPUT ON;
DECLARE
TYPE emp IS RECORD (
v_last_name VARCHAR( 255 ),
v_first_name VARCHAR( 255 ),
v_hire_date  DATE );
employer emp;
CURSOR c_emp IS SELECT last_name,first_name,hire_date FROM employees WHERE employee_id = '&id';
empl c_emp%ROWTYPE;
BEGIN
FOR empl IN c_emp LOOP
employer.v_last_name:= empl.last_name;
employer.v_first_name:= empl.first_name;
employer.v_hire_date:= empl.hire_date;
DBMS_OUTPUT.PUT_LINE( employer.v_last_name || ',' || employer.v_first_name || ',' || employer.v_hire_date  );
END LOOP;
--EXCEPTION 
--WHEN no_data_found THEN
--DBMS_OUTPUT.PUT_LINE('EMPLOYER NOT FOUND !!!!!!');
END;


--************ question 7 : ************

SET SERVEROUTPUT ON;
DECLARE
TYPE product IS RECORD (
    v_product_id NUMBER,       
    v_product_name  VARCHAR2( 255 ),
    v_description   VARCHAR2( 2000 ),  
    v_standard_cost NUMBER,
    v_list_price    NUMBER,
    v_category_id   NUMBER
 );
prod product;
prod_id NUMBER := '&product_id';
CURSOR c_product IS SELECT * FROM products WHERE product_id = prod_id;
pr c_product%ROWTYPE;
BEGIN
FOR pr IN c_product LOOP
prod.v_product_id :=pr.product_id;
prod.v_product_name :=pr.product_name;
prod.v_description :=pr.description;
prod.v_standard_cost :=pr.standard_cost;
prod.v_list_price :=pr.list_price;
prod.v_category_id :=pr.category_id;
DBMS_OUTPUT.PUT_LINE(   prod.v_product_id || ',' || prod.v_product_name || ',' || prod.v_description || ',' || prod.v_standard_cost || ',' || prod.v_list_price || ',' || prod.v_category_id);


END LOOP;

END;


--************ question 8 : ************


SET SERVEROUTPUT ON;
DECLARE
r_mgr employees%ROWTYPE;
r_emp employees%ROWTYPE;
id NUMBER :='&id';
CURSOR c_emp IS SELECT * FROM employees WHERE employee_id =id;
emp c_emp%ROWTYPE;
CURSOR c_mgr(managerid NUMBER ) IS SELECT * FROM employees WHERE employee_id =managerid;
mgr employees%ROWTYPE;
BEGIN
FOR emp IN c_emp LOOP
r_emp.employee_id := emp.employee_id;
r_emp.first_name := emp.first_name;
r_emp.last_name := emp.last_name;
r_emp.email:= emp.email;
r_emp.phone := emp.phone;
r_emp.manager_id := emp.manager_id;
r_emp.job_title :=emp.job_title;
FOR mgr IN c_mgr(emp.manager_id) LOOP
r_mgr.employee_id := mgr.employee_id;
r_mgr.first_name := mgr.first_name;
r_mgr.last_name := mgr.last_name;
r_mgr.email:= mgr.email;
r_mgr.phone := mgr.phone;
r_mgr.manager_id := mgr.manager_id;
r_mgr.job_title :=mgr.job_title;
DBMS_OUTPUT.PUT_LINE('The employer is :');

DBMS_OUTPUT.PUT_LINE(   r_emp.employee_id || ',' || r_emp.first_name || ',' || r_emp.last_name || ',' || r_emp.email  || ',' ||
r_emp.phone || ',' || r_emp.manager_id || ',' || r_emp.job_title );
DBMS_OUTPUT.PUT_LINE('The manager is :');

DBMS_OUTPUT.PUT_LINE(   r_mgr.employee_id || ',' || r_mgr.first_name || ',' || r_mgr.last_name || ',' || r_mgr.email  || ',' ||
r_mgr.phone || ',' || r_mgr.manager_id || ',' || r_mgr.job_title );


END LOOP;
END LOOP;
END;


--************ question 9 : ************

SET SERVEROUTPUT ON
DECLARE
CURSOR c_customers IS SELECT * FROM customers;
customer customers%ROWTYPE;
CURSOR c_orders(idcustomer NUMBER)IS SELECT * FROM orders WHERE customer_id=idcustomer;
ordr orders%ROWTYPE;
TYPE cust_list IS TABLE OF customers%ROWTYPE ;
TYPE ord_list IS TABLE OF orders%ROWTYPE ;
cust cust_list := cust_list();
ord ord_list := ord_list();
counter INTEGER :=0;
counter2 INTEGER :=0;
BEGIN
FOR customer  IN c_customers LOOP
counter := counter +1;
cust.extend;
cust(counter).customer_id :=customer.customer_id;
cust(counter).name :=customer.name;
cust(counter).address := customer.address;
cust(counter).website :=customer.website;
cust(counter).credit_limit :=customer.credit_limit;
DBMS_OUTPUT.PUT_LINE('The customer id is :' || cust(counter).customer_id || '--the customer name is :' || cust(counter).name  || '--the customer addres is :' ||  
cust(counter).address || '--the customer website is :' || cust(counter).website || '--the customer credit limit is :' || cust(counter).credit_limit );
FOR ordr IN c_orders( customer.customer_id) LOOP
counter2 := counter2 +1;
ord.extend;
ord(counter2).order_id := ordr.order_id;
ord(counter2).customer_id := ordr.customer_id;
ord(counter2).status := ordr.status;
ord(counter2).salesman_id := ordr.salesman_id ;
ord(counter2).order_date := ordr.order_date;
DBMS_OUTPUT.PUT_LINE('Orders are :');

DBMS_OUTPUT.PUT_LINE('***************************************************************  The order id is :' || ord(counter2).order_id || '--the customer id of order  is :' || ord(counter2).customer_id || '--the order status is :' ||  
ord(counter2).status || '--the order salesman_id is :' || ord(counter2).salesman_id || '--the order date  is :' || ord(counter2).order_date );
END LOOP;
DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------------------------------------------------------------');
END LOOP;
END;























