create table Department(
  ID varchar2(20) not null primary key,
  Name char(20),
  NEmp number(3),
  MgrSSN varchar2(20));
  
  create table Project(
  ID varchar2(20) not null primary key,
  Name char(20),
  Hours number(10),
  DeptID varchar2(20) references Department(ID));

create table Employee(
  SSN varchar2(20) not null primary key,
  Name char(20),
  DeptID varchar2(20) references Department(ID),
  Gender char(3),
  Age number(3),
  ProjID varchar2(20) references Project(ID));

