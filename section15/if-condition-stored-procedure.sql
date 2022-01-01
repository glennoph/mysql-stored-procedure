-- wource if-condition-stored-procedure.sql ;

use mysql;

-- drop stored proc
drop procedure testparm;

-- set delimiter for stored proc
delimiter $$
-- create stored proc
create procedure testparm(in flag bool)
begin
if flag = true then
  select 'flag is true';
else
  select 'flag is false';
end if;
end$$

delimiter ;
-- call stored proc
call testparm(true);

call testparm(false);



