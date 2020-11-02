--exo1

DECLARE
    v_nom VARCHAR(15);
    v_prenom VARCHAR(15);
BEGIN
    v_nom:='$v_nom';
    v_prenom:='$v_prenom';
    dbms_output.put_line('Prenom : ' || v_prenom || ' - Nom : ' || v_nom);
END;


--exo2

DECLARE
    v_emp_count INTEGER;
BEGIN
    SELECT COUNT(*) into v_count FROM EMPLOYEES;
    dbms_output.put_line('Nombre total des employees est : ' || v_count);
END;


--exo3

DECLARE
    v_emp_count_man_1 INTEGER;
BEGIN
    SELECT COUNT(*) into v_emp_count_man_1 FROM EMPLOYEES WHERE MANAGER_ID = 1;
    dbms_output.put_line('Resultat : ' || v_emp_count_man_1);
END;


--exo4

DECLARE
	v_emp_count INTEGER;
    v_emp_count_man_1 INTEGER;
	v_proportion INTEGER
BEGIN
	SELECT COUNT(*) into v_count FROM EMPLOYEES;
    SELECT COUNT(*) into v_emp_count_man_1 FROM EMPLOYEES WHERE MANAGER_ID = 1;
	v_proportion := (v_emp_count_man_1/v_emp_count)*100 ;
    dbms_output.put_line('Proportion : ' || v_proportion);
END;
