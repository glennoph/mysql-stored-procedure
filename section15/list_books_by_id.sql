use mydb;

-- set delimiter for stored proc
delimiter $$
-- create stored proc
create procedure list_books(in idin int)
begin
select * from books where id = idin;
end$$

delimiter ;
-- call stored proc
call list_books(2);

-- drop stored proc
drop procedure list_books;



-- set delimiter for stored proc
delimiter $$
-- create stored proc
create procedure list_books_title(in idin int, in titlein varchar(50))
begin
select * from books where id = idin and title = titlein;
end$$

delimiter ;
-- call stored proc
call list_books_title(4, 'Training Cats');


drop procedure list_books_title;

