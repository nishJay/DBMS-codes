# Consider the Book Lending system from the library- BOOKS, STUDENT, BORROWS. The students are allowed to borrow any number of books on a given date from the library. The details of
the book should include ISBN, Title of the Book, author and publisher. All students need not compulsorily borrow books.

Create table books(isbn number not null primary key,  title varchar2(20),  author char(20),  publisher varchar2(20));  
  
Create table students(usn varchar2(20) not null primary key,  name varchar2(20),  sem number(2),  gender char(2),  dept varchar2(20));
 
Create table borrow(isbn number references books(isbn),  usn varchar2(20) references students(usn),  dates date,primary key(isbn,usn));

insert into books values(121,'Om','RR','jj');
insert into books values(122,'Sri','AA','kk');
insert into books values(123,'Jay','DD','ll');
insert into books values(124,'Ray','HH','mm');
insert into books values(125,'Bay','AA','nn');
insert into books values(126,'Database','KK','oo');
insert into books values(127,'Bay','AA','nn');
insert into books values(128,'Bay','AA','nn');
insert into books values(129,'Dax','AA','nn');

insert into books values(130,'Dam','AA','nn');


insert into students values('I1','OO',5,'M','ISE');
insert into students values('I2','O1',4,'F','CVE');
insert into students values('I3','O2',3,'F','CSE');
insert into students values('I4','O3',2,'M','ME');
insert into students values('I5','O4',1,'F','IE');
insert into students values('I6','O5',7,'F','IE');
insert into students values('I7','O6',8,'F','IE');


insert into borrow values(121,'I1','21 Jul 2021');
insert into borrow values(122,'I2','22 Jul 2021');
insert into borrow values(123,'I3','23 Jul 2021');
insert into borrow values(124,'I4','24 Jul 2021');
insert into borrow values(125,'I5','25 Jul 2021');
insert into borrow values(126,'I6','25 Jul 2021');
insert into borrow values(126,'I7','25 Jul 2021');
insert into borrow values(121,'I7','25 Jul 2021');



#Obtain the names of the student who has borrowed either book bearing ISBN ‘123’or ISBN ‘124’

select name from students where usn in (select usn from borrow where isbn in (123,124)));

#Obtain the Names of female students who have borrowed "Database" books.

select name from students where usn in (select usn from borrow where isbn in (select isbn from books where title = 'Database')) and gender = 'F';

#Find the number of books borrowed by each student. Display the student details along with the number of books

select count(b.usn),s.name from borrow b join students s on b.usn = s.usn group by s.name;

#Modification by manav
select count(b.usn) as "Numbers",s.usn,s.name from borrow b join students s on b.usn = s.usn group by s.usn,s.name;

#List the books that begin with the letters “DA” and has never been borrowed by any students.
select title from books where title like 'Da%' and isbn not in (select isbn from borrow);
