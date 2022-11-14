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
select Boat_id, BoatName,Boat_colour from boat where Boat_id in (select Boat_id from Reserves where Sailor_id in (select Sailor_id from sailor where Sailor_name = 'Shyam'));

# Retrieve the BID of the boats reserved necessarily by all the sailors
select Boat_id from reserves;

# Find the number of boats reserved by each sailor. Display the Sailor_Name along with the number of boats reserved
select count(Boat_id), sailor.Sailor_name from Reserves join sailor on Reserves.Sailor_id = sailor.Sailor_id group by sailor.Sailor_Name;

# Identify which boats have the same name as their sailor.
select Boat







