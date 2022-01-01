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
