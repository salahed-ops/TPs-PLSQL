-----Question 1-----

SET serveroutput ON;
DECLARE
v_nom varchar2(30):='&v_nom';
v_prenom varchar2(30) :='&v_prenom';
BEGIN
dbms_output.put_line('Votre nom est :' || v_nom);
dbms_output.put_line('Votre prénom est :' || v_prenom);
END;


-----Question 2-----

SET serveroutput ON;
DECLARE

variable int;

BEGIN

SELECT count(*) INTO variable FROM employees ;
dbms_output.put_line('Le nombre des employés est :' || variable);

END;
---Le nombre des employés est 107---


-----Question 3-----

SET serveroutput ON;
DECLARE

variable_2 int;

BEGIN

SELECT count(*) INTO variable_2 FROM employees WHERE manager_id=1 ;
dbms_output.put_line('Le nombre des employés est :' || variable_2);

END;
---Le nombre des employés est 14---


-----Question 4-----

SET serveroutput ON;
DECLARE

variable int;
variable_2 int;
proportion int;

BEGIN

SELECT count(*) INTO variable FROM employees ;
SELECT count(*) INTO variable_2 FROM employees WHERE manager_id=1 ;
proportion:=(variable_2/variable)*100;
dbms_output.put_line('La proportion est :' || proportion || '%');

END;
---La proportion est 13%---


-----Question 5-----

SET serveroutput ON;
DECLARE

v_last_name employees.last_name%type;
v_first_name employees.first_name%type;
v_hire_date employees.hire_date%type;
v_id employees.employee_id%type;
BEGIN
v_id:=&v_id;
SELECT last_name, first_name, hire_date INTO v_last_name,v_first_name,v_hire_date FROM employees WHERE employee_id=v_id;
dbms_output.put_line('Les informations de l employé sont :  ' || 'ID: ' || v_id || ' , nom complet: ' || v_last_name ||' '|| v_first_name || ' , '|| 'sa date d embauche: ' || v_hire_date);

END;


-----Question 6-----

SET serveroutput ON ;
DECLARE
TYPE Informations
IS
RECORD
(v_last_name employees.last_name%type, v_first_name employees.first_name%type, v_hire_date employees.hire_date%type);
v_id employees.employee_id%type ;
Infos Informations;
BEGIN
v_id:=&v_id;
SELECT last_name, first_name, hire_date INTO Infos.v_last_name, Infos.v_first_name, Infos.v_hire_date 
FROM employees
WHERE employee_id = v_id;
dbms_output.put_line('Les informations de l employé sont :  ' || 'ID: ' || v_id || ' , nom complet: ' ||  Infos.v_last_name ||' '|| Infos.v_first_name || ' , '|| 'sa date d embauche: ' || Infos.v_hire_date);

END;


-----Question 7-----

SET serveroutput ON ;
DECLARE
TYPE Produits
IS
RECORD
(v_product_name products.product_name%type, v_product_description products.description%type, v_standard_cost products.standard_cost%type, v_category_id products.category_id%type, v_list_price products.list_price%type);
v_id products.product_id%type ;
prod Produits;
BEGIN
v_id := &v_id;
SELECT product_name, description, standard_cost, category_id, list_price INTO prod.v_product_name, prod.v_product_description, prod.v_standard_cost, prod.v_category_id, prod.v_list_price
FROM products
WHERE product_id = v_id;
dbms_output.put_line('Les informations de l employé sont :  ' || 'ID: ' || v_id || ' , nom: ' ||  prod.v_product_name ||' , ' || 'description: ' || prod.v_product_description || ' , '|| 'cout standard: ' || prod.v_standard_cost || ' , categorie de l ID: ' || prod.v_category_id || ' , liste de prix: ' || prod.v_list_price );

END;
