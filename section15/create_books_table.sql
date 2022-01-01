use mysql;

create table books(id int primary key auto_increment,
       	     	   title varchar(50),
		   num int);
insert into books (title, num) values('Prof Smith', 1);
insert into books (title, num) values('Java for Dev', 1);
insert into books (title, num) values('How to become slimmer', 22);
insert into books (title, num) values('Training Cats', 22);
insert into books (title, num) values('Learning German', 333);

commit;
 
 select * from books;
