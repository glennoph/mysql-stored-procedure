-- source loop-random-data-stored-proc.sql;
use mysql;

-- drop stored proc
drop procedure if exists loop_random_data;

drop table if exists randusers;

create table randusers (id int auto_increment primary key,
  email varchar(50) not null,
  regdate date not null,
  actflag boolean default false);
  

-- set delimiter for stored proc
delimiter $$
-- create stored proc
create procedure loop_random_data(in numrows_in int)
begin
  declare emailval varchar(50) default null;
  declare regdateval date default null;
  declare actflagval boolean default false;
  declare count int default 1;

  -- exit handler sqlexception errors
  declare exit handler for sqlexception
  begin
    show errors;
  end;

  -- exit handler sqlwarning warnings
  declare exit handler for sqlwarning
  begin
    show warnings;
  end;

  while count < numrows_in do

    set regdateval = date(now()) - interval floor(1000*rand()) day; -- now to row-1000 days
    set actflagval = round(rand()); -- true or false
    set emailval = concat('user',
      lpad(count,4,'0'), -- lpad left pad count with zeros
      '@org');

    insert into randusers (email, regdate, actflag)
      values(emailval, regdateval, actflagval);

    set count := count + 1;

  end while;
end$$

delimiter ;

-- call stored proc
call loop_random_data(200);

select * from randusers limit 10;






