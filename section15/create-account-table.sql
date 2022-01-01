-- source create-account-table.sql ;

use mysql;

create table account(id int primary key auto_increment,
       	     	     balance numeric(7,2),
		   num int);
insert into account (balance, num) values( 0, 1);
insert into account (balance, num) values( 100, 1);
insert into account (balance, num) values( 500, 22);
insert into account (balance, num) values( 1000, 22);

commit;
 
select * from account;
