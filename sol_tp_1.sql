SET SERVEROUTPUT ON; -- CHABOU SOUFIAN GI2
 
DECLARE
    
    -- Question 1 --
    v_nom VARCHAR2(30);
    v_prenom VARCHAR2(30);
    -- Question 2 --
    v_nombreEMP INT;
    -- QUestion 3
    v_nbrEmpManager_one INT;
    --  Question 4
    v_porcentage NUMERIC(5,2);
    -- Variable question 5 --
    v_first_name VARCHAR2(30);
    v_last_name VARCHAR2(30);
    v_hire_date DATE;
    v_id NUMBER;
    -- record question 6 Methode 1 --
    type informationEMP is 
    record (
         v_first_name VARCHAR2(30),
         v_last_name VARCHAR2(30),
         v_hire_date DATE
    );
    
    EMP informationEMP;
     -- record question 6 Methode 2 --
     EMP2 EMPLOYEES%ROWTYPE;
     
     -- record question 7 --
     PRODUIT PRODUCTS%ROWTYPE;
     v_prduit_id NUMBER;
     
     -- RECORD QUESTION 8 --
     r_mgr EMPLOYEES%ROWTYPE;
     r_emp EMPLOYEES%ROWTYPE;
     id_employees NUMBER;
     
     -- QUESTION 9 --
     
     ID_CUSTOMER NUMBER;
     I INTEGER := 0;
     
      CURSOR C_ORDERS IS
      SELECT order_id FROM ORDERS where CUSTOMER_ID = ID_CUSTOMER ;
     
      TYPE CUSTOMER_ORDER IS TABLE OF ORDERS.order_id%TYPE  INDEX BY BINARY_INTEGER;
      
      TYPE R_CUSTOMER IS 
      RECORD(
            NOM VARCHAR2(100),
            COSTUMER_ORDERS CUSTOMER_ORDER 
      );
      
     cutomer R_CUSTOMER;
BEGIN

     DBMS_OUTPUT.PUT_LINE('****************************************************************************** ');
    DBMS_OUTPUT.PUT_LINE('|**************        AFFICHAGE DES RESULTATS                   **************| ');
    DBMS_OUTPUT.PUT_LINE('****************************************************************************** ');
    DBMS_OUTPUT.PUT_LINE('1) ------ Nom et Prenom -------  : ');

    v_nom:='&v_nom';
   
    v_prenom:='&v_prenom';
    DBMS_OUTPUT.PUT_LINE('le Nom :' || v_nom);
    DBMS_OUTPUT.PUT_LINE('Le Prenom : ' || v_prenom);
    DBMS_OUTPUT.PUT_LINE('----------------------------  ');
    
    DBMS_OUTPUT.PUT_LINE('****************************************************************************** ');
    DBMS_OUTPUT.PUT_LINE('2) ------ LE NOMBRE DES EMPLOYEES -------  : ');

    SELECT COUNT(EMPLOYEE_ID) INTO v_nombreEMP FROM EMPLOYEES;
    DBMS_OUTPUT.PUT_LINE('    LE NOMBRE DES EMPLOYEES : '|| v_nombreEMP);
    DBMS_OUTPUT.PUT_LINE('----------------------------------  ');
   
    DBMS_OUTPUT.PUT_LINE('****************************************************************************** ');
    DBMS_OUTPUT.PUT_LINE('3) ------ LE NOMBRE DES EMPLOYEES dont Manager_ID = 1 -------  : ');

    SELECT COUNT(EMPLOYEE_ID) INTO v_nbrEmpManager_one FROM EMPLOYEES WHERE manager_id = 1;
    DBMS_OUTPUT.PUT_LINE('   LE NOMBRE DES EMPLOYEES : '||v_nbrEmpManager_one );
    DBMS_OUTPUT.PUT_LINE('----------------------------------  ');
    
    DBMS_OUTPUT.PUT_LINE('****************************************************************************** ');
    DBMS_OUTPUT.PUT_LINE('4) ------ LE PORCENTAGE % -------  :');

    v_porcentage := (v_nbrEmpManager_one/v_nombreEMP)*100;
    DBMS_OUTPUT.PUT_LINE('  le Porcentage est : '||  v_porcentage ||'%');
    DBMS_OUTPUT.PUT_LINE('----------------------------------  ');
    
    DBMS_OUTPUT.PUT_LINE('****************************************************************************** ');
      DBMS_OUTPUT.PUT_LINE('5) ------ Information d''employees -------  :');
    DBMS_OUTPUT.PUT_LINE('****************************************************************************** ');
    
    v_id:='&v_id';
    DBMS_OUTPUT.PUT_LINE('id de l''employee :'||v_id);
    SELECT EMPLOYEES.FIRST_NAME, EMPLOYEES.LAST_NAME, EMPLOYEES.HIRE_DATE INTO v_first_name, v_last_name , v_hire_date FROM EMPLOYEES WHERE employee_id = v_id;
    
    DBMS_OUTPUT.PUT_LINE('le Nom :' || v_last_name );
    DBMS_OUTPUT.PUT_LINE('Le Prenom : ' || v_first_name);
    DBMS_OUTPUT.PUT_LINE('HIRE DATE :' || v_hire_date );
    
    DBMS_OUTPUT.PUT_LINE('****************************************************************************** ');
    
    DBMS_OUTPUT.PUT_LINE('6) ------ Information d''employees  RECORDS Methode 1 -------  :');
     
     v_id:='&v_id';
      DBMS_OUTPUT.PUT_LINE('id de l''employee :'||v_id);
    SELECT EMPLOYEES.FIRST_NAME, EMPLOYEES.LAST_NAME, EMPLOYEES.HIRE_DATE INTO EMP.v_first_name, EMP.v_last_name , EMP.v_hire_date FROM EMPLOYEES WHERE employee_id = v_id;
       DBMS_OUTPUT.PUT_LINE('le Nom :' || EMP.v_last_name );
       DBMS_OUTPUT.PUT_LINE('Le Prenom : ' || EMP.v_first_name);
       DBMS_OUTPUT.PUT_LINE('HIRE DATE :' || EMP.v_hire_date );
       
    DBMS_OUTPUT.PUT_LINE('****************************************************************************** ');
    
    
    DBMS_OUTPUT.PUT_LINE('6) ------ Information d''employees  RECORDS  Methode  2-------  :');
      
       v_id:='&v_id';
        DBMS_OUTPUT.PUT_LINE('id de l''employee :'||v_id);
       SELECT EMPLOYEES.FIRST_NAME, EMPLOYEES.LAST_NAME, EMPLOYEES.HIRE_DATE INTO EMP2.FIRST_NAME, EMP2.LAST_NAME , EMP2.HIRE_DATE  FROM EMPLOYEES WHERE employee_id = v_id;
       DBMS_OUTPUT.PUT_LINE('le Nom :' ||  EMP2.LAST_NAME );
       DBMS_OUTPUT.PUT_LINE('Le Prenom : ' ||EMP2.FIRST_NAME );
       DBMS_OUTPUT.PUT_LINE('HIRE DATE :' || EMP2.HIRE_DATE );
       
    DBMS_OUTPUT.PUT_LINE('****************************************************************************** ');
    DBMS_OUTPUT.PUT_LINE('7) ------------ PRODUCTS ------------ ');
    DBMS_OUTPUT.PUT_LINE('****************************************************************************** ');

    v_prduit_id:='&v_prduit_id';
    DBMS_OUTPUT.PUT_LINE('id du produit est :'||v_prduit_id);
    SELECT PRODUCTS.PRODUCT_NAME,PRODUCTS.DESCRIPTION , PRODUCTS.STANDARD_COST, PRODUCTS.LIST_PRICE, PRODUCTS.CATEGORY_ID  INTO PRODUIT.PRODUCT_NAME, PRODUIT.DESCRIPTION, PRODUIT.STANDARD_COST, PRODUIT.LIST_PRICE, PRODUIT.CATEGORY_ID FROM PRODUCTS WHERE PRODUCT_ID = v_prduit_id;
      DBMS_OUTPUT.PUT_LINE('PRODUCT_NAME :' ||  PRODUIT.PRODUCT_NAME );
      DBMS_OUTPUT.PUT_LINE('DESCRIPTION : ' || PRODUIT.DESCRIPTION);
      DBMS_OUTPUT.PUT_LINE('STANDARD_COST :' || PRODUIT.STANDARD_COST );
      DBMS_OUTPUT.PUT_LINE('LIST_PRICE :' || PRODUIT.LIST_PRICE );
      DBMS_OUTPUT.PUT_LINE('CATEGORY_ID :' || PRODUIT.CATEGORY_ID );
    
    
     DBMS_OUTPUT.PUT_LINE('****************************************************************************** ');
     DBMS_OUTPUT.PUT_LINE('8) ------------ EMPLOYEES R_EMP & R_MGR ------------ ');
     DBMS_OUTPUT.PUT_LINE('****************************************************************************** ');

     id_employees:='&id_employees';

     SELECT EMPLOYEES.EMPLOYEE_ID,  EMPLOYEES.FIRST_NAME, EMPLOYEES.LAST_NAME,EMPLOYEES.EMAIL, EMPLOYEES.PHONE ,EMPLOYEES.HIRE_DATE , EMPLOYEES.MANAGER_ID , EMPLOYEES.JOB_TITLE INTO r_emp.EMPLOYEE_ID,  r_emp.FIRST_NAME, r_emp.LAST_NAME,r_emp.EMAIL, r_emp.PHONE ,r_emp.HIRE_DATE , r_emp.MANAGER_ID , r_emp.JOB_TITLE FROM EMPLOYEES WHERE EMPLOYEE_ID = id_employees;
     SELECT EMPLOYEES.EMPLOYEE_ID,  EMPLOYEES.FIRST_NAME, EMPLOYEES.LAST_NAME,EMPLOYEES.EMAIL, EMPLOYEES.PHONE ,EMPLOYEES.HIRE_DATE , EMPLOYEES.MANAGER_ID , EMPLOYEES.JOB_TITLE INTO r_mgr.EMPLOYEE_ID,  r_mgr.FIRST_NAME, r_mgr.LAST_NAME,r_mgr.EMAIL, r_mgr.PHONE ,r_mgr.HIRE_DATE , r_mgr.MANAGER_ID , r_mgr.JOB_TITLE FROM EMPLOYEES WHERE EMPLOYEE_ID = r_emp.MANAGER_ID ;
     DBMS_OUTPUT.PUT_LINE('les information de l''employee avec ID = '||id_employees ||' est :');
     DBMS_OUTPUT.PUT_LINE('EMPLOYEE_ID :'|| r_emp.EMPLOYEE_ID);
     DBMS_OUTPUT.PUT_LINE('FIRST_NAME :'|| r_emp.FIRST_NAME);
     DBMS_OUTPUT.PUT_LINE('LAST_NAME :'|| r_emp.LAST_NAME);
     DBMS_OUTPUT.PUT_LINE('EMAIL :'|| r_emp.EMAIL);
     DBMS_OUTPUT.PUT_LINE('PHONE :'|| r_emp.PHONE);
     DBMS_OUTPUT.PUT_LINE('HIRE_DATE :'|| r_emp.HIRE_DATE);
     DBMS_OUTPUT.PUT_LINE('MANAGER_ID : '|| r_emp.MANAGER_ID);
     DBMS_OUTPUT.PUT_LINE('JOB_TITLE : '|| r_emp.JOB_TITLE);
     DBMS_OUTPUT.PUT_LINE('les information du manager l''employee avec ID = '||id_employees ||' est :');
     
     DBMS_OUTPUT.PUT_LINE('EMPLOYEE_ID :'|| r_mgr.EMPLOYEE_ID);
     DBMS_OUTPUT.PUT_LINE('FIRST_NAME :'|| r_mgr.FIRST_NAME);
     DBMS_OUTPUT.PUT_LINE('LAST_NAME :'|| r_mgr.LAST_NAME);
     DBMS_OUTPUT.PUT_LINE('EMAIL :'|| r_mgr.EMAIL);
     DBMS_OUTPUT.PUT_LINE('PHONE :'|| r_mgr.PHONE);
     DBMS_OUTPUT.PUT_LINE('HIRE_DATE :'|| r_mgr.HIRE_DATE);
     DBMS_OUTPUT.PUT_LINE('MANAGER_ID : '|| r_mgr.MANAGER_ID);
     DBMS_OUTPUT.PUT_LINE('JOB_TITLE : '|| r_mgr.JOB_TITLE);
  
     
     DBMS_OUTPUT.PUT_LINE('****************************************************************************** ');
     DBMS_OUTPUT.PUT_LINE('9) ------------ Afficher tous les Orders d’un Customer ------------ ');
     DBMS_OUTPUT.PUT_LINE('****************************************************************************** ');
     
     ID_CUSTOMER :='&ID_CUSTOMER';
     DBMS_OUTPUT.PUT_LINE('ID_CUSTOMER : '||  ID_CUSTOMER);
     SELECT customers.name INTO cutomer.nom FROM customers WHERE CUSTOMER_ID = ID_CUSTOMER;
     DBMS_OUTPUT.PUT_LINE('CUSTOMER NAME : '||  cutomer.NOM);
      FOR n IN C_ORDERS LOOP 
        I := I+1;
        cutomer.COSTUMER_ORDERS(I) := n.order_id;
        DBMS_OUTPUT.PUT_LINE('ORDER '||I||' : '|| cutomer.COSTUMER_ORDERS(I));
       
     END LOOP;
     
            
    
     DBMS_OUTPUT.PUT_LINE('********************************  FIN  ******************************************** ');
     

END;
/



