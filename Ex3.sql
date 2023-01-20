CREATE TABLE boat(
Boat_id varchar2(20),
BoatName varchar2(20),
Boat_colour varchar2(20),
primary key(Boat_id));

CREATE TABLE sailor(
Sailor_id varchar2(20),
Sailor_name varchar2(20),
Age number(5),
Rating varchar(4),
primary key(Sailor_id));

CREATE TABLE Reserves(
Boat_id varchar2(20),
Sailor_id varchar2(20),
Day varchar(10),
foreign key(Sailor_id) references sailor(Sailor_id) on delete cascade,
foreign key(Boat_id) references boat(Boat_id) on delete cascade);

insert into boat values('B1','Big','Black');
insert into boat values('B2','Small','Blue'); 
insert into boat values('B3','Bigger','White');
insert into boat values('B4','Biggest','Yellow');
insert into boat values('B5','Tiny','Orange');

insert into sailor values('S1','Ram',35,'3');
insert into sailor values('S2','Shyam',34,'4');
insert into sailor values('S3','Jam',25,'2');
insert into sailor values('S4','Nam',25,'1');
insert into sailor values('S5','Dam',30,'4');
insert into sailor values('S6','Tiny',30,'4');

insert into Reserves values('B1','S2','MON');
insert into Reserves values('B2','S4','TUE');
insert into Reserves values('B3','S3','WED');
insert into Reserves values('B4','S1','MON');
insert into Reserves values('B5','S5','MON');
insert into Reserves values('B5','S6','MON');

# Obtain the details of the boats reserved by ‘Shyam’.
SELECT *
FROM BOAT
WHERE Boat_id IN ( SELECT Boat_id 
                   FROM RESERVES
                   WHERE SAILOR_ID IN ( SELECT SAILOR_ID 
                                        FROM SAILOR
                                        WHERE SAILOR_NAME = 'Ram'));

# Retrieve the BID of the boats reserved necessarily by all the sailors
SELECT BOATNAME,BOAT_ID
FROM BOAT B
WHERE NOT EXISTS (SELECT *
                  FROM SAILOR S
                  WHERE NOT EXISTS (SELECT * 
                                    FROM RESERVES R
                                    WHERE R.SAILOR_ID=S.SAILOR_ID AND R.BOAT_ID=B.BOAT_ID)) ;


# Find the number of boats reserved by each sailor. Display the Sailor_Name along with the number of boats reserved
SELECT S.SAILOR_NAME, COUNT(R.BOAT_ID) AS "NO OF BOATS RESERVED"
FROM SAILOR S JOIN RESERVES R
ON S.SAILOR_ID = R.SAILOR_ID
GROUP BY S.SAILOR_NAME;

# Identify which boats have the same name as their sailor.
SELECT B.BOAT_ID, B.BOATNAME
FROM BOAT B
WHERE B.BOAT_ID IN ( SELECT R.BOAT_ID 
                     FROM RESERVES R
                     WHERE R.SAILOR_ID IN ( SELECT S.SAILOR_ID
                                            FROM SAILOR S
                                            WHERE S.SAILOR_NAME = B.BOATNAME));

//edit q3.sql
//"Write code"
DECLARE
    N NUMBER :=&N;
    J NUMBER :=2;
    FLAG NUMBER :=0;
BEGIN
    WHILE J<=N/2 LOOP
        IF MOD(N,J)=0 THEN
            DBMS_OUTPUT.PUT_LINE(N||' IS NOT A PRIME NUMBER');
            FLAG:=1;
            EXIT;
        ELSE
            J:=J+1;
        END IF;
    END LOOP;
    IF FLAG=0 THEN
        DBMS_OUTPUT.PUT_LINE(N||' IS A PRIME NUMBER');
    END IF;
END;
/
//ESC
//:wq
//set server output on @q3.sql
//exit
//mongo
db.createCollection("Marine");

db.Marine.insertMany([{"BID":"B1","BNAME":"TINY","BCOLOR":"BLACK","SID":"S1","SNAME":"RK"}])

db.Marine.find({"SNAME":"RK"}).count()

db.Marine.find({"BCOLOR":"BLACK"}).pretty()







