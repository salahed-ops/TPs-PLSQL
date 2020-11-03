1.
DECLARE
v_nom  VARCHAR(20) ;
v_prenom  VARCHAR(20) ;
BEGIN
v_nom  :=  ‘$v_nom’ ;
v_prenom  :=  ‘$v_prenom’ ;
DBMS_OUTPUT.PUT_LINE(‘le nom est : ‘ || v_nom ) ;
DBMS_OUTPUT.PUT_LINE(‘le prenom est : ‘ || v_prenom ) ;
END ;
2.
DECLARE
v_count   INT ;
BEGIN
SELECT  COUNT(*) INTO v_count   FROM  EMPLOYEES ;
DBMS_OUTPUT.PUT_LINE(‘le nombre totale  est : ‘ || v_count ) ;
END ;
3.
DECLARE
v_idcount   INT ;
BEGIN
SELECT  COUNT(*) INTO v_idcount   FROM  EMPLOYEES   WHERE  MANAGER_ID =  1;
DBMS_OUTPUT.PUT_LINE(‘le nombre d’employés dont MANAGER_ID =  1  est : ‘ || v_idcount ) ;
END ;



4. 
DECLARE
v_count   INT ;
v_idcount   INT ;
v_proportion   INT ;
BEGIN
SELECT  COUNT(*) INTO v_count   FROM  EMPLOYEES ;
SELECT  COUNT(*) INTO v_idcount   FROM  EMPLOYEES   WHERE  MANAGER_ID =  1;
v_proportion  =  (v_idcount/v_count)*100 ;
DBMS_OUTPUT.PUT_LINE(‘la proportion est  est : ‘ || v_count ) ;
END ;
5.
DECLARE
v_first_name  VARCHAR(20) ;
v_last_name  VARCHAR(20) ;
v_hire_date DATE ;
v_id  INT ;
BEGIN
SELECT  FIRST_NAME, FIRST_NAME, HIDE_DATE  INTO v_ first_name , v_ last_name , v_ hire_date FROM  EMPLOYEES  WHERE MANAGER_ID :=  $v_id ;
DBMS_OUTPUT.PUT_LINE(‘first_name est  est : ‘ || v_ first_name ) ;
DBMS_OUTPUT.PUT_LINE(‘last_name est  est : ‘ || v_ last_name ) ;
DBMS_OUTPUT.PUT_LINE(‘hire_date est  est : ‘ || v_ hire_date ) ;
END ;




6.
DECLARE
TYPE  EMPLOY  is  RECORD
(v_first_name.FIRST_NAME%TYPE ;
v_last_name .LAST_NAME%TYPE;
v_hire_date.HERE_DATE%TYPE );
emp  EMPLOY
BEGIN
SELECT  FIRST_NAME, FIRST_NAME, HIDE_DATE  INTO emp FROM  EMPLOYEES  WHERE MANAGER_ID :=  $v_id ;
DBMS_OUTPUT.PUT_LINE(‘first_name est  est : ‘ || emp.v_ first_name ) ;
DBMS_OUTPUT.PUT_LINE(‘last_name est  est : ‘ || emp.v_ last_name ) ;
DBMS_OUTPUT.PUT_LINE(‘hire_date est  est : ‘ || emp.v_ hire_date ) ;
END ;
