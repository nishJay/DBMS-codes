
CREATE TABLE DEPARTMENT(ID VARCHAR(20) NOT NULL PRIMARY KEY,
                        NAME CHAR(20));
CREATE TABLE EMPLOYEE(SSN VARCHAR(20) NOT NULL PRIMARY KEY,
                      NAME CHAR(20),
                      DEPT_ID REFERENCES DEPARTMENT(ID));
CREATE TABLE PROJECT(ID VARCHAR(20) NOT NULL PRIMARY KEY,
                     DOMAIN CHAR(20),
                     NAME CHAR(20));
CREATE TABLE ASSIGN(ESSN VARCHAR(20) REFERENCES EMPLOYEE(SSN),
                    PID VARCHAR(20) REFERENCES PROJECT(ID),
                    PRIMARY KEY(ESSN,PID);

INSERT INTO DEPARTMENT VALUES('D1','MARKETING');
INSERT INTO DEPARTMENT VALUES('D2','BACKEND');
INSERT INTO DEPARTMENT VALUES('D3','FRONTEND');
INSERT INTO DEPARTMENT VALUES('D4','DATABASE');
INSERT INTO DEPARTMENT VALUES('D5','RESEARCH');

  
insert into employee values('E1','Abhi','D1');
insert into employee values('E2','Bhim','D1');
insert into employee values('E3','Chand','D2');
insert into employee values('E4','Ram','D3');
insert into employee values('E5','Ramya','D4');
insert into employee values('E6','Soumya','D5');

  
  insert into project values('P1','Database','Banking');
  insert into project values('P2','IOT','Sensor');
  insert into project values('P3','ML','MNIST');
  insert into project values('P4','Database','COVID');
  insert into project values('P5','Cloud','Deploy');
  
  insert into assign values('E2','P2');
  insert into assign values('E1','P2');
  insert into assign values('E4','P5');
  insert into assign values('E6','P1');
  insert into assign values('E3','P4');
  insert into assign values('E5','P2');
  
#Obtain the details of employees assigned to “Database” project  
SELECT *
FROM EMPLOYEE
WHERE SSN IN (SELECT ESSN 
              FROM ASSIGN
              WHERE PID IN (SELECT ID FROM PROJECT
                            WHERE DOMAIN = 'Database'));
#Find the number of employees working in each department with department details.
SELECT D.ID,D.NAME,COUNT(E.DEPT_ID) AS "EMPLOYEE COUNT"
FROM DEPARTMENT D JOIN EMPLOYEE E
ON D.ID = E.DEPT_ID
GROUP BY E.DEPT_ID;
  
#Update the Project details of Employee bearing SSN = SSN to ProjectNo = Project_No and display the same.
UPDATE ASSIGN
SET PID = 'P4'
WHERE ESSN = 'E2';
SELECT *
FROM ASSIGN A JOIN PROJECT P
ON A.PID = P.ID
WHERE A.ESSN = 'E2';

#Retrieve the employee who has not been assigned more than two projects 
SELECT E.NAME,COUNT(A.ESSN) AS "PROJECT COUNT"
FROM EMPLOYEE E JOIN ASSIGN A
ON E.SSN = A.ESSN
GROUP BY A.ESSN
HAVING "PROJECT COUNT" <=2;

//edit q1.sql
//write the code below

BEGIN
    UPDATE EMPLOYEE
    SET SALARY=(1.15*SALARY)    
    WHERE DEPT_NO=3;
    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT||'ROWS UPDATED');
END;
/

//"press" Esc
//:wq
//"To run the code:"
//set server output on @q1.sql
//exit
//"To start mongodb"
//mongo

db.createCollection("Employee");

db.Employee.insertMany([
    {"Name":"Radha","SSN":"E1","Dept_Name":"Humanities","Project_No":"1"},
    {"Name":"Krishna","SSN":"E2","Dept_Name":"Humanities","Project_No":"1"},
    {"Name":"Sita","SSN":"E3","Dept_Name":"Marketing","Project_No":"2"},
    {"Name":"Ram","SSN":"E4","Dept_Name":"Marketing","Project_No":"2"},
    {"Name":"Lakshmi","SSN":"E5","Dept_Name":"Finance","Project_No":"3"},
    {"Name":"Narayan","SSN":"E6","Dept_Name":"Finance","Project_No":"3"},
    ]);
    
db.Employee.find({"Dept_Name":"Humanities"},{"_id":0}).pretty();
db.Employee.find({"Project_No":"3"},{"_id":0}).pretty();




  
  


