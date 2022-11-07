
  create table Project(ID varchar2(20) not null primary key, Name char(20));

create table Employee(SSN varchar2(20) not null primary key,Name char(20),DeptID varchar2(20));
  
  create table WorksOn(SSN varchar2(20) references Employee(SSN),PID varchar2(20) references Project(ID));

  
  


