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



