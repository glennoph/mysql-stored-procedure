/**
source 122_Exercises6-c.sql;

2. Write a stored procedure that creates a table called "stars" containing a column of type text.
Make the procedure populate the table by selecting an adjective at random and
a noun at random and joining them together with a space between them.

Hot Cloud
Charming Dog
etc.

Optional: upper case the first letters of the two words.

3. Modify this procedure so that it create the table with a birth date and death date
column. Make the procedure fill in the birth and death dates in the following way.

The birth date should be random between 20 and 80 years ago.
The death date should be random between 19 years after the birth date and today.

4. Modify this procedure so that the death date is only filled in 40% of the time, at random.
**/

use mysql;

drop table if exists stars;
create table stars (id int primary key not null auto_increment,
		   name varchar(50) not null,
                   dobirth date not null,
                   dodeath date
		   );
                   
drop procedure if exists populate_stars;
delimiter $$
create procedure populate_stars()
begin
  declare done boolean default false;
  declare adjfetch varchar(50) default null;
  declare nounfetch varchar(50) default null;
  declare adjuppercase varchar(50) default null;
  declare nounuppercase varchar(50) default null;
  declare birth date default null;
  declare birthtonow int default null;
  declare death date default null;
  declare deathrate decimal(4,2) default 0.40;

  declare cur_words cursor for
  	  select adj, noun from words order by rand();

  declare continue handler for not found set done = true;

  open cur_words;

  read_loop: loop
    fetch cur_words into adjfetch, nounfetch;
    -- select adjfetch;
    if done = true then
       leave read_loop;
    end if;

    set adjuppercase := concat(ucase(left(adjfetch, 1)), substr(adjfetch, 2));
    set nounuppercase := concat(ucase(left(nounfetch, 1)), substr(nounfetch, 2));
    -- select adjuppercase, nounuppercase;

    set birth := date(now()) - interval floor(rand()*60*365 -(20*365)) day;
    set birthtonow := datediff( now() , birth);

    set death := null;
    if rand() < deathrate then
      set death := birth + interval (19*365 + floor(rand()*birthtonow-(19*365))) day;
      if death > date(now()) then
        set death := date(now());
      end if;
    end if;


    insert into stars(name, dobirth, dodeath)
    values ( concat(adjuppercase, ' ', nounuppercase),
             birth, death
    ); 

  end loop;
  close cur_words;

end$$

delimiter ;

call populate_stars();

select * from stars;


