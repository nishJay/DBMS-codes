#Consider the relations: PART, SUPPLIER and SUPPLY. The Supplier relation holds information
#about suppliers. The attributes SID, SNAME, SADDR describes the supplier. The Part relation holds
#the attributes such as PID, PNAME and PCOLOR. The Shipment relation holds information about
#shipments that include SID and PID attributes identifying the supplier of the shipment and the part
#shipped, respectively. The Shipment relation should contain information on the number of parts
#shipped

CREATE TABLE PART( 
  PID VARCHAR(20) NOT NULL PRIMARY KEY,
  PNAME CHAR(20),
  PCOLOR CHAR(20));

CREATE TABLE SUPPLIER(
  SID VARCHAR(20) NOT NULL PRIMARY KEY,
  SNAME CHAR(20),
  SADDR VARCHAR(50));
  
  CREATE TABLE SUPPLY(
    PID VARCHAR(20) REFERENCES PART(PID),
    SID VARCHAR(20) REFERENCES SUPPLIER(SID),
    QUANT INTEGER,
  PRIMARY KEY(PID,SID));
    
insert into supplier values('S1','AA','AAA');
insert into supplier values('S2','AB','BBB');
insert into supplier values('S3','AC','CCC');
insert into supplier values('S4','AD','DDD');

insert into part values('P1','DA','Black');
insert into part values('P2','DB','Blue');
insert into part values('P3','DC','Brown');
insert into part values('P4','DD','Beige');

insert into supply values('P1','S1',25);
insert into supply values('P2','S2',26);
insert into supply values('P3','S3',27);
insert into supply values('P4','S4',28);
insert into supply values('P1','S2',29);
insert into supply values('P1','S3',30);
insert into supply values('P1','S4',31);


#Obtain the details of parts supplied by supplier 'AA'
SELECT *
FROM PART
WHERE PID IN ( SELECT PID
               FROM SUPPLY
               WHERE SID IN ( SELECT SID 
                              FROM SUPPLIER
                              WHERE SNAME = 'AA'));



#Obtain the Names of suppliers who supply 'P2'.
SELECT SNAME
FROM SUPPLIER 
WHERE SID IN ( SELECT SID 
               FROM SUPPLY
               WHERE PID IN ( SELECT PID 
                              FROM PART
                              WHERE PNAME = 'DA'));


#Delete the parts which are in 'Brown'
DELETE 
FROM SUPPLY
WHERE PID IN ( SELECT PID 
               FROM PART 
               WHERE PCOLOR = 'Beige');
DELETE
FROM PART
WHERE PCOLOR = 'Beige';

SELECT *
FROM PART;

#List the suppliers who supplies exactly two parts.
SELECT S.SID, S.SNAME, COUNT(SU.SID) AS "NO. OF KINDS OF PARTS SUPPLIED"
FROM SUPPLIER S JOIN SUPPLY SU
ON S.SID = SU.SID
GROUP BY SU.SID
HAVING "NO. OF KINDS OF PARTS SUPPLIED" = 2;

CREATE TABLE SHIPMENT AS
(SELECT * FROM SUPPLY
WHERE 1 = 2);

//edit q2.sql
//"Pl SQL Code"
DECLARE 
	CURSOR C1 IS SELECT * FROM SUPPLY
        WHERE P_ID IN (101,102,103,104); --PUT PART NUMBER WHICH WE ARE INTERESTED IN HERE
	V_REC SUPPLY%ROWTYPE;
BEGIN
	OPEN C1;
	LOOP
	    FETCH C1 INTO V_REC;
	    EXIT WHEN C1%NOTFOUND;
        INSERT INTO SHIPMENT VALUES(V_REC.P_ID, V_REC.S_ID, V_REC.QUANTITY);
    END LOOP;
    CLOSE C1;
END;
/


