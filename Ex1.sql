
  create table Project(ID varchar2(20) not null primary key, Name char(20));

  create table Employee(SSN varchar2(20) not null primary key,Name char(20),DeptID varchar2(20));
  
  create table WorksOn(SSN varchar2(20) references Employee(SSN),PID varchar2(20) references Project(ID));
  
  insert into employee values('E1','Abhi','D1');
  insert into employee values('E2','Bhim','D1');
  insert into employee values('E3','Chand','D2');
  insert into employee values('E4','Ram','D2');
  insert into employee values('E5','Ramya','D3');
  insert into employee values('E6','Soumya','D3');
  
  insert into project values('P1','Data');
  insert into project values('P2','IOT');
  insert into project values('P3','ML');
  insert into project values('P4','SE');
  insert into project values('P5','Cloud');
  
  insert into workson values('E1','P2');
  insert into workson values('E1','P2');
  insert into workson values('E4','P5');
  insert into workson values('E6','P1');
  insert into workson values('E3','P4');
  insert into workson values('E5','P2');
  
  #Obtain the details of employees assigned to “Database” project
  
  select ssn, name from employee where ssn in (select ssn from workson where PID in (select ID from project where Name = 'Data'));
  
  #Find the number of employees working in each department with department details.
  select count(ssn),deptid  from employee group by deptid;
  
  #Update the Project details of Employee bearing SSN = SSN to ProjectNo = Project_No and display the same.
  update workson set PID = 'P4' where SSN = 'E5';
  
  #Retrieve the employee who has not been assigned more than two projects
  
 




  
  


