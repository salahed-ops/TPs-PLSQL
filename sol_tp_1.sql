--EXERCICE : 1 
DECLARE
    v_LastName VARCHAR(20);
    v_Name VARCHAR(20);
BEGIN
    v_LastName:='$v_LastName';
    v_Name:='$v_Name';
    dbms_output.put_line(v_Name || ' ' || v_LastName);
END;

--EXERCICE : 2
DECLARE
    v_count INTEGER NOT NULL := 0;
BEGIN
    FOR employee in (SELECT * From EMPLOYEES)
    LOOP
        v_count := v_count + 1;
    END LOOP;
    dbms_output.put_line('Employees number is :' || v_count);
END;
--EXERCICE : 3
DECLARE=
    v_countIdIsOne INTEGER NOT NULL := 0;
BEGIN
    FOR employeeId in (SELECT MANAGER_ID FROM EMPLOYEES)
    LOOP
        IF employeeId.MANAGER_ID = 1 THEN
            v_countIdIsOne := v_countIdIsOne + 1;
        END if;
    END LOOP;
    dbms_output.put_line('Employees with manager id 1 is : ' || v_countIdIsOne);
END;
--EXERCICE : 4
DECLARE
    v_count INTEGER NOT NULL := 0;
    v_countIdIsOne INTEGER NOT NULL := 0;
    v_percentage INTEGER NOT NULL;
BEGIN
    FOR employee in (SELECT * From EMPLOYEES)
    LOOP
        v_count := v_count + 1;
    END LOOP;
    FOR employeeId in (SELECT MANAGER_ID FROM EMPLOYEES)
    LOOP
        IF employeeId.MANAGER_ID = 1 THEN
            v_countIdIsOne := v_countIdIsOne + 1;
        END if;
    END LOOP;
    v_percentage := v_countIdIsOne / v_count;
    dbms_output.put_line('The proportion of manager with id I is : ' || v_percentage)
END;
--EXERCICE : 5
DECLARE
    v_LastName EMPLOYEES.LAST_NAME%TYPE;
    v_FirstName EMPLOYEES.FIRST_NAME%TYPE;
    v_HireDate EMPLOYEES.HIRE_DATE%TYPE;
    v_EmployeeID INTEGER;
BEGIN
    v_EmployeeID:='$v_EmployeeID';
    SELECT LAST_NAME, FIRST_NAME, HIRE_DATE
    INTO v_LastName, v_FirstName, v_HireDate
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = v_EmployeeID
    AND ROWNUM <= 1;

    dbms_output.put_line('Results are : ' || v_LastName || ' ' || v_FirstName || ' ' || v_HireDate);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('There is No employee with Id : ' || v_EmployeeID || ' Present in the database');
END;


--EXERCICE : 6
DECLARE
    TYPE EMPLOYEE_REC IS RECORD (
    	v_LastName EMPLOYEES.LAST_NAME%TYPE;
    	v_FirstName EMPLOYEES.FIRST_NAME%TYPE;
    	v_HireDate EMPLOYEES.HIRE_DATE%TYPE;
    );
    r_Employee EMPLOYEE_REC;
    v_EmplyeeID INTEGER;
BEGIN
    v_EmplyeeID :='$v_EmplyeeID';
    SELECT LAST_NAME, FIRST_NAME, HIRE_DATE
    INTO r_Employee
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = v_EmplyeeID
    AND ROWNUM <= 1;

    dbms_output.put_line('Results are : ' || employeeRecord.v_LastName || ' ' || employeeRecord.v_FirstName || ' ' || employeeRecord.v_HireDate );
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('There is No employee with Id : ' || v_EmplyeeID || ' Present in the database');
END;

--EXERCICE : 7
DECLARE
    r_product PRODUCTS%ROWTYPE;
    v_productId INTEGER;
BEGIN
    v_productId :='$v_productId';
    SELECT *
    INTO r_product
    FROM PRODUCTS
    WHERE PRODUCT_ID = v_productId;

    dbms_output.put_line('Results are : ' || r_product.PRODUCT_NAME || ' ' || r_product.CATEGORY_ID || ' ' || r_product.LIST_PRICE || ' ' || r_product.STANDARD_COST || ' ' || r_product.DESCRIPTION);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Product with Id ' || v_prod_id || ' does not exist');
END;

--EXERCICE : 8
DECLARE
    r_mgr EMPLOYEES%ROWTYPE;
    r_emp EMPLOYEES%ROWTYPE;
    v_EmployeeId EMPLOYEES.EMPLOYEE_ID%TYPE;
BEGIN
    v_EmployeeId := '$v_EmployeeId';
    SELECT *
        INTO r_emp
    FROM EMPLOYEES
        WHERE EMPLOYEE_ID = v_EmployeeId;

    SELECT *
        INTO r_mgr
    FROM EMPLOYEES
        WHERE EMPLOYEE_ID = r_emp.MANAGER_ID;

    dbms_output.put_line('Employee: ' || r_emp.EMPLOYEE_ID || ' ' || r_emp.LAST_NAME || ' ' || r_emp.FIRST_NAME || ' ' || r_emp.EMAIL || ' ' || r_emp.PHONE || ' ' || r_emp.HIRE_DATE || ' ' || r_emp.MANAGER_ID || ' ' || r_emp.JOB_TITLE );
    dbms_output.put_line('	Manager: ' || r_mgr.EMPLOYEE_ID || ' ' || r_mgr.LAST_NAME || ' ' || r_mgr.FIRST_NAME || ' ' || r_mgr.PHONE || ' ' || r_mgr.EMAIL ||  ' ' || r_mgr.HIRE_DATE || ' ' || r_mgr.MANAGER_ID || ' ' || r_mgr.JOB_TITLE );

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('There is No employee with Id : ' || v_EmployeeId || ' Present in the database');
END;