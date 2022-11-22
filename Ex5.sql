# Consider the Book Lending system from the library- BOOKS, STUDENT, BORROWS. The students are allowed to borrow any number of books on a given date from the library. The details of
the book should include ISBN, Title of the Book, author and publisher. All students need not compulsorily borrow books.

Create table Books(
  isbn varchar2(20) not null primary key,
  title varchar2(20),
  author char2(20),
  publisher varchar2(20));
  
  

Create table Students(
  usn varchar2(20) not null primary key,
  name varchar2(20),
  sem number(2),
  gender char(2),
  dept varchar2(20));
 
 
 
Create table Borrow(
  isbn varchar2(20) references Books(isbn),
  usn varchar2(20) references Students(usn),
  dates date
primary key(isbn,usn));
  
  
