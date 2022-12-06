#Consider the relations: PART, SUPPLIER and SUPPLY. The Supplier relation holds information
#about suppliers. The attributes SID, SNAME, SADDR describes the supplier. The Part relation holds
#the attributes such as PID, PNAME and PCOLOR. The Shipment relation holds information about
#shipments that include SID and PID attributes identifying the supplier of the shipment and the part
#shipped, respectively. The Shipment relation should contain information on the number of parts
#shipped

Create table supplier(sid varchar2(20) not null primary key,  sname char(20),  saddr varchar2(20));  
Create table part(pid varchar2(20) not null primary key,  pname char(20),  pcolor varchar2(20));  
Create table shipment(sid varchar2(20) references supplier(sid),  pid varchar2(20) references part(pid),no_ship number, primary key(sid,pid));  

insert into supplier values('S1','AA','AAA');
insert into supplier values('S2','AB','BBB');
insert into supplier values('S3','AC','CCC');
insert into supplier values('S4','AD','DDD');

insert into part values('P1','DA','Black');
insert into part values('P2','DB','Blue');
insert into part values('P3','DC','Brown');
insert into part values('P4','DD','Beige');

insert into shipment values('S1','P1',25);
insert into shipment values('S2','P2',26);
insert into shipment values('S3','P3',27);
insert into shipment values('S4','P4',28);
insert into shipment values('S1','P2',29);
insert into shipment values('S1','P3',30);
insert into shipment values('S1','P4',31);

#Obtain the details of parts supplied by supplier 'S1'
select * from part where pid in (select pid from shipment where sid in ('S1'));


PID		     PNAME		  PCOLOR
-------------------- -------------------- --------------------
P1		     DA 		  Black
P2		     DB 		  Blue
P3		     DC 		  Brown
P4		     DD 		  Beige

#Obtain the Names of suppliers who supply 'P2'.
select sname from supplier where sid in (select sid from shipment where pid in ('P2'));

SNAME
--------------------
AA
AB

#Delete the parts which are in 'Brown'
delete from shipment where pid in (select pid from part where pcolor = 'Brown');
2 rows deleted.

#List the suppliers who supplies exactly two parts.
insert into shipment values('S3','P3',2);
insert into shipment values('S3','P4',2);
insert into shipment values('S4','P2',2);
select sid, count(sid) from shipment having count(sid) = 2 group by sid;

SID		     COUNT(SID)
-------------------- ----------
S4			      2

