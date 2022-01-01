-- source test-account-balance-stored-proc.sql ;
use mysql;

-- drop stored proc
drop procedure test_balance;

-- set delimiter for stored proc
delimiter $$
-- create stored proc
create procedure test_balance(in id_in int,
       		              in min_amount_in numeric(7,2),
			      out result bool)
begin
  DECLARE cur_balance NUMERIC(7, 2) DEFAULT 0.0;
  DECLARE cur_balanceDec DEC(7, 2) DEFAULT 0.0;

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



  select id_in, min_amount_in;
  -- get current balance
  select balance into cur_balance
    from account where id=id_in;
  -- test currrent balance 
  if cur_balance >= min_amount_in then
    -- select 'ok';
    set result = true;
  else
    -- select 'false';
    set result = false;
  end if;
end$$

delimiter ;

-- call stored proc
call test_balance(2, 10, @success);
select @success;

call test_balance(2, 111, @success);
select @success;


