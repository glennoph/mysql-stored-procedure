/**

source 122_Exercises6-a.sql ;

Tips:

Order by rand().
Will need to use two cursors at one point in these exercise!
Build up step by step.
Test sql outside of procedure (don't forget to remove @ from variable names)

1. Manually create a table containing two columns and a primary key, one column
a list of nouns and one column a list of adjectives
e.g.

1 hot dog
2 fast banana
3 orange cloud
4 charming curtain
.....

Write a procedure that returns data in two "out" variables. One will contain
all the nouns joined with commas, the other will contain all the adjectives
joined by commas.

Optional: modify the procedure so that there is no stray extra comma before or after
the start of the lists.
**/

use mysql;

drop table if exists words;

create table words(id int primary key auto_increment,
       	     	   adj varchar(50),
		   noun varchar(50));
insert into words(adj,noun) values('different', 'afternoon');
insert into words(adj,noun) values('great', 'airport');
insert into words(adj,noun) values('another', 'hair');
insert into words(adj,noun) values('same', 'piano');
insert into words(adj,noun) values('few', 'plastic');
insert into words(adj,noun) values('able', 'rain');
insert into words(adj,noun) values('basic', 'banana');
insert into words(adj,noun) values('red',   'baby');
insert into words(adj,noun) values('green', 'boy');
insert into words(adj,noun) values('blue',  'bath');

-- select * from words;

drop procedure if exists list_words;
delimiter $$
create procedure list_words(out adj_out varchar(90),
       		 	    out noun_out varchar(90))
begin
  declare done boolean default false;
  declare adjfetch varchar(50) default null;
  declare nounfetch varchar(50) default null;
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

    if adj_out is null then
      set adj_out := adjfetch;
    else
      set adj_out := concat(adj_out, ', ', adjfetch);
    end if;
    -- select adj_out;

    if noun_out is null then
      set noun_out := nounfetch;
    else
      set noun_out := concat(noun_out, ', ', nounfetch);
    end if;
    -- select noun_out;


  end loop;
  close cur_words;
	  
end$$
delimiter ;

call list_words(@adjwords, @nounwords);

select @adjwords;
select @nounwords;

