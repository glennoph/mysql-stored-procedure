use mysql;

-- set delimiter for stored proc
delimiter $$
-- create stored proc
create procedure HelloWorld()
begin
select 'hello world...';
end$$

delimiter ;
-- call stored proc
call HelloWorld();

-- drop stored proc
drop procedure HelloWorld;


