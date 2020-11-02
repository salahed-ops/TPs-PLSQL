/* Q1
SET SERVEROUTPUT ON;
DECLARE
  v_nom varchar(250);
  v_prenom varchar(250);
BEGIN
  v_nom := '&v_nom'; 
  v_prenom := '&v_prenom';
  dbms_output.put_line('Nom : ' || v_nom);
  dbms_output.put_line('Prenom: ' || v_prenom);
END; */
/*
SET SERVEROUTPUT ON;
DECLARE
    v_resultat2 integer;
    v_resultat3 integer;
    v_resultat4 integer;
    v_first_name varchar(250);
    v_last_name varchar(250);
    v_hire_date date;
    v_ID_employe integer;
BEGIN
    select COUNT(*) into v_resultat2 from employees;
    dbms_output.put_line('Nombre total des employés est : ' || v_resultat2);
    select COUNT(*) into v_resultat3 from employees where manager_id=1;
    dbms_output.put_line('Nombre d''employés dont MANAGER_ID=1 est : ' || v_resultat3);
    v_resultat4 := (v_resultat3/v_resultat2)*100;
    dbms_output.put_line('la proposrtion est : ' || v_resultat4 || '%');
    
    v_ID_employe := '&v_ID_employe';
    select first_name,last_name,hire_date into v_first_name,v_last_name,v_hire_date from employees where employee_id=v_ID_employe;
    dbms_output.put_line('les infos de l''employe:');
    dbms_output.put_line('First name: '|| v_first_name) ;
    dbms_output.put_line('Last name: '|| v_last_name) ;
    dbms_output.put_line('Hire date: '|| v_hire_date) ;
END;*/
/* 
SET SERVEROUTPUT ON;
DECLARE
    type emp is record (
    v_last_name employees.last_name%TYPE,
    v_first_name employees.first_name%TYPE,      
    v_hire_date employees.hire_date%TYPE
    );
    v_ID_employe integer;
    empl emp;
BEGIN
    v_ID_employe := '&v_ID_employe';
    select first_name,last_name,hire_date into empl.v_last_name, empl.v_first_name, empl.v_hire_date from employees where employee_id = v_ID_employe;
    dbms_output.put_line('les infos de l''employe:');
    dbms_output.put_line('First name: '|| empl.v_first_name) ;
    dbms_output.put_line('Last name: '|| empl.v_last_name) ;
    dbms_output.put_line('Hire date: '|| empl.v_hire_date) ;
END;*/
/*
SET SERVEROUTPUT ON;
DECLARE
    type produit
    is record (
    v_product_name products.product_name%TYPE,
    v_description products.description%TYPE,      
    v_standard_cost products.standard_cost%TYPE,
    v_list_price products.list_price%TYPE
    );
    v_ID_produit integer;
    prod produit ;
BEGIN
    v_ID_produit := '&v_ID_produit';
    select product_name, description, standard_cost, list_price into prod.v_product_name , prod.v_description , prod.v_standard_cost, prod.v_list_price from products 
    where product_id = v_ID_produit ;
    dbms_output.put_line('les infos du produit:');
    dbms_output.put_line('Name: '|| prod.v_product_name) ;
    dbms_output.put_line('description: '|| prod.v_description) ;
    dbms_output.put_line('standard_cost: '|| prod.v_standard_cost) ;
    dbms_output.put_line('list_price : ' || prod.v_list_price ) ; 
END;*/
SET SERVEROUTPUT ON;
DECLARE 
    type emp is record (
    v_last_name employees.last_name%TYPE,
    v_first_name employees.first_name%TYPE,      
    v_hire_date employees.hire_date%TYPE,
    v_email employees.email%TYPE,
    v_phone employees.phone%TYPE,
    v_manager_id employees.manager_id%TYPE,
    v_job_title employees.job_title%TYPE
    );
    v_employee_id integer;
    r_emp emp;
    type mgr is record (
    v_employee_id employees.employee_id%TYPE,
    v_last_name employees.last_name%TYPE,
    v_first_name employees.first_name%TYPE,      
    v_hire_date employees.hire_date%TYPE,
    v_email employees.email%TYPE,
    v_phone employees.phone%TYPE
    );
    r_mgr mgr;
BEGIN
    v_employee_id := '&v_employee_id';
    select  first_name,last_name,hire_date,email,phone,manager_id,job_title into r_emp.v_first_name ,r_emp.v_last_name , r_emp.v_email, r_emp.v_phone, r_emp.v_hire_date , r_emp.v_manager_id ,r_emp.v_job_title 
    FROM employees where   employee_id = v_employee_id;
    dbms_output.put_line('les infos de l''employe:');
    dbms_output.put_line('First name: '|| r_emp.v_first_name) ;
    dbms_output.put_line('Last name: '|| r_emp.v_last_name) ;
    dbms_output.put_line('Hire date: '|| r_emp.v_hire_date) ;
    dbms_output.put_line('email: '|| r_emp.v_email) ;
    dbms_output.put_line('phone: '|| r_emp.v_phone) ;
    select last_name, first_name,hire_date,email,phone into  r_mgr.v_last_name , r_mgr.v_first_name ,r_mgr.v_hire_date ,r_mgr.v_email, r_mgr.v_phone
    FROM employees where   employee_id = r_emp.v_manager_id;
    dbms_output.put_line('les infos du manager:');
    dbms_output.put_line('First name: '|| r_mgr.v_first_name) ;
    dbms_output.put_line('Last name: '|| r_mgr.v_last_name) ;
    dbms_output.put_line('Hire date: '|| r_mgr.v_hire_date) ;
    dbms_output.put_line('email: '|| r_mgr.v_email) ;
    dbms_output.put_line('phone: '|| r_mgr.v_phone) ;
end ;

