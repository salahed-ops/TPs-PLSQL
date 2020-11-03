
1)

(Questions a et b)

DECLARE
v_nom VARCHAR(50)
v_prenom VARCHAR(50)

BEGIN
dbms.output.put_line(‘Saisissez le nom’)
v_nom := ‘$v_nom’
dbms.output.put_line(‘Saisissez le prenom’)
v_prenom := ‘$v_prenom’
END;

2) 3) et 4)

DECLARE
n_employees INT ;
n_employees1 INT;
pourcentage INT;
BEGIN
SELECT COUNT(*) INTO n_employees FROM employees
SELECT COUNT(*) INTO n_employees1 FROM employees WHERE MANAGER_ID = 1
pourcentage := n_employees1/n_employees
dbms.output.put_line(‘Le pourcentage est : ’ || pourcentage)
END;

5)

DECLARE
v_last_name VARCHAR(50)
v_first_name VARCHAR(50)
v_hire_date DATE
v_id_employee employees.empoyee_id%type
BEGIN
dbms.output.put_line(‘Saisissez l’ID a rechercher’)
v_id_employee := ‘$v_id_employee’
SELECT (LAST_NAME, FIRST_NAME, HIRE_DATE)
INTO (v_last_name,v_first_name,v_hire_date)
FROM employees
WHERE employee_id = v_id_employee

dbms.output.put_line(‘Le prenom de l’id recherché est : ’ || v_last_name)
dbms.output.put_line(‘Le nom de l’id recherché est : ’ || v_first_name)
dbms.output.put_line(‘La date d’embauche de l’id recherché est : ’ || v_hire_date)
END;
6)

7)

DECLARE
v_id_produit products.product_id%type
records products%ROWTYPE;
BEGIN
dbms.output.put_line(‘Saisissez l’ID du produit a rechercher’)
v_id_produit := ‘$v_id_produit’
SELECT * INTO records FROM products WHERE v_id_produit = product_id
dbms.output.put_line(‘Le produit est : ‘ || records )
END;

8)
DECLARE
v_id_employee employees.empoyee_id%type
r_emp employees%ROWTYPE;
BEGIN
dbms.output.put_line(‘Saisissez l’ID de l’employee a rechercher’)
v_id_employee := ‘$v_id_employee’
SELECT * INTO r_emp FROM employees WHERE employee_id = v_id_employee
dbms.output.put_line(‘Les informations de l’employee recherché sont : ’ || r_emp)
END;

