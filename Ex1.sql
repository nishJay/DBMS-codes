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
  
  create table WorksOn(
  SSN varchar2(20) references Employee(SSN),
  PID varchar2(20) references Project(ID));

  
  insert into Department values('D1','Database',45,'S1');
  insert into Department values('D2','Cloud',55,'S2');
  insert into Department values('D3','Full Stack',40,'S4');
  insert into Department values('D4','ML',50,'S6');
  insert into Department values('D5','Support',40,'S7');
  insert into Department values('D6','Managing',14,'S8');
  select * from Department;


