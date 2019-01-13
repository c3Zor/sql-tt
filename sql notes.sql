### SQL notes
/* 
Wrtiting query that limits the response to only 15 rows annd includes the data,
account_id, and channel fields in the web_events table.
*/
SELECT occount_id, occurred_at, channel
FROM web_events
LIMIT 15;
/*
Write a query to return the 10 earliest orders in the orders table. Include the id, occurred_at, and total_amt_usd.
*/
SELECT id, occurred_at, total_amt_usd
FROM orders
ORDER BY occurred_at
LIMIT 10;

/*
Write a query to return the top 5 orders in terms of largest total_amt_usd. Include the id, account_id, and total_amt_usd.
*/
SELECT  id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC
LIMIT 5;
/*
Write a query to return the lowest 20 orders in terms of smallest total_amt_usd. Include the id, account_id, and total_amt_usd.
*/
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd
LIMIT 20;


/*
Write a query that displays the order ID, account ID,
and total dollar amount for all the orders,
sorted first by the account ID (in ascending order),
and then by the total dollar amount (in descending
order). 
*/
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY account_id, total_amt_usd DESC;



/*
Now write a query that again displays order ID,
account ID, and total dollar amount for each order,
but this time sorted first by total dollar amount
(in descending order), and then by account ID
(in ascending order). 

*/
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC, account_id;

/*
Pulls the first 5 rows and all columns from the 
orders table that have a dollar amount of
 gloss_amt_usd greater than or equal to 1000.
*/
SELECT *
FROM orders
WHERE gloss_amt_usd >=1000
LIMIT 5;

/*
Pulls the first 10 rows and all columns from the
 orders table that have a total_amt_usd less than 500.
*/
SELECT *
FROM orders
WHERE total_amt_usd < 500
LIMIT 10;

/*
Filter the accounts table to include
 the company name, website, and the primary 
 point of contact (primary_poc) just for the 
 Exxon Mobil company in the accounts table.
*/
SELECT name, website, primary_poc
FROM accounts
WHERE name='Exxon Mobil';

/*
Create a column that divides the standard_amt_usd
 by the standard_qty to find the unit price for 
 standard paper for each order. Limit the results to
  the first 10 orders, and include the id and 
  account_id fields. 
*/
SELECT standard_amt_usd/standard_qty AS unit_price_stand, id, account_id
FROM orders
LIMIT 10;
/*
Write a query that finds the percentage of revenue 
that comes from poster paper for each order. You will
need to use only the columns that end with _usd.
 (Try to do this without using the total column.)
Display the id and account_id fields also. NOTE -
you will receive an error with the correct solution
to this question. This occurs because at least
one of the values in the data creates a division
by zero in your formula. You will learn later in the
course how to fully handle this issue. For now, you 
can just limit your calculations to the first 10 orders,
 as we did in question #1, and you'll avoid that set 
 of data that causes the problem. 

*/
SELECT 100*poster_amt_usd/total_amt_usd AS precentage_of_revenue, id, account_id
FROM orders
LIMIT 15;
arba 
SELECT id, account_id, 
   poster_amt_usd/(standard_amt_usd + gloss_amt_usd + poster_amt_usd) AS post_per
FROM orders
LIMIT 10;
/*
All the companies whose names start with 'C'. 
*/
SELECT *
FROM accounts
WHERE  name like'C%'

/*
All companies whose names contain the string 'one'
 somewhere in the name.
*/
SELECT *
FROM accounts
WHERE  name like'%one%'

/*
All companies whose names end with 's'.
*/
SELECT *
FROM accounts
WHERE  name like'%s'

/*
Use the accounts table to find the account name,
primary_poc, and sales_rep_id for Walmart,
Target, and Nordstrom.
*/
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name IN ('Walmart','Target', 'Nordstrom')


/*
Use the web_events table to find all information
 regarding individuals who were contacted via the
  channel of organic or adwords.
*/
SELECT *
FROM web_events
WHERE channel IN ('organic','adwords')

/*
Use the accounts table to find the account name,
primary poc, and sales rep id for all stores except
Walmart, Target, and Nordstrom.
*/
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name NOT IN('Walmart', 'Target', 'Nordstrom');


/*
Use the web_events table to find all information
regarding individuals who were contacted via any
method except using organic or adwords methods.
*/
SELECT *
FROM web_events
WHERE channel NOT IN('organic','adwords');

/*
All the companies whose names do not start with 'C'.
*/

SELECT *
FROM accounts
WHERE name NOT LIKE'C%';

/*
All companies whose names do not contain the string 'one'
 somewhere in the name.
*/

SELECT *
FROM accounts
WHERE name NOT LIKE'%one%';

/*
All companies whose names do not end with 's'.
*/

SELECT *
FROM accounts
WHERE name NOT LIKE'%s';

/*
Write a query that returns all the orders where
the standard_qty is over 1000,
the poster_qty is 0, and the gloss_qty is 0.
*/

SELECT *
FROM orders
WHERE standard_qty >1000 and poster_qty = 0 
and gloss_qty = 0;

/*
Using the accounts table, find all the companies whose names
do not start with 'C' and end with 's'.
*/

SELECT *
FROM accounts
WHERE name NOT LIKE 'C%' AND name LIKE'%s';

/*
When you use the BETWEEN operator in SQL,
do the results include the values of your endpoints,
or not? Figure out the answer to this important 
question by writing a query that displays the order
date and gloss_qty data for all orders where
gloss_qty is between 24 and 29. Then look at your
output to see if the BETWEEN operator 
included the begin and end values or not.
*/

SELECT occurred_at, gloss_qty
FROM orders
WHERE gloss_qty BETWEEN 24 AND 29;

/*
Use the web_events table to find all information
regarding individuals who were contacted via the
organic or adwords channels, and started their
account at any point in 2016, sorted from newest to
oldest.
*/

SELECT *
FROM web_events
WHERE channel IN('organic', 'adwords') and occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
ORDER BY occurred_at DESC;

/*
Find list of orders ids where either gloss_qty or poster_qty is greater
 than 4000. Only include the id field in the resulting table.
*/

SELECT id
FROM orders
WHERE gloss_qty > 4000 or poster_qty > 4000;

/*
Write a query that returns a list of orders where the standard_qty
 is zero and either the gloss_qty or poster_qty is over 1000.
*/
SELECT *
FROM orders
WHERE standard_qty = 0
and (gloss_qty >1000 or poster_qty > 1000);
/*
Find all the company names that start with a 'C' or 'W', and the primary contact contains
 'ana' or 'Ana', but it doesn't contain 'eana'.
*/
SELECT *
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE'W%'
AND ((primary_poc like '%ana%' OR primary_poc LIKE '%Ana%')
AND primary_poc NOT LIKE '%eana%');
/*
If we wanted to only pull individual elements from either the orders
 or accounts table, we can do this by using the exact same information
  in the FROM and ON statements. However, in your SELECT statement, you will need
   to know how to specify tables and columns in the SELECT statement:

The table name is always before the period.
The column you want from that table is always after the period.
For example, if we want to pull only the account name and the dates in which
 that account placed an order, but none of the other columns, we can do this
  with the following query:
*/

SELECT accounts.name, orders.occurred_at
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

/*
This query only pulls two columns, not all the information in these two tables.
 Alternatively, the below query pulls all the columns from _ both_ the accounts and orders table.
*/

SELECT *
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

/*
And the first query you ran pull all the information from only the orders table:
*/

SELECT orders.*
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

/*
Try pulling all the data from the accounts table, and all the data from the orders table.
*/
SELECT orders.*, accounts.*
FROM accounts
JOIN orders
ON accounts.id = orders.account_id;
/*
Try pulling standard_qty, gloss_qty, and poster_qty from the orders table,
 and the website and the primary_poc from the accounts table.
*/
SELECT accounts.primary_poc, accounts.website, orders.standard_qty, orders.gloss_qty, orders.poster_qty
FROM accounts
JOIN orders
ON accounts.id = orders.account_id;
/*
Provide a table for all web_events associated with account name of Walmart.
There should be three columns. Be sure to include the primary_poc, time
of the event, and the channel for each event. Additionally, you might 
choose to add a fourth column to assure only Walmart events were chosen
*/

SELECT  a.primary_poc,w.occurred_at, w.channel, a.name
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
WHERE a.name IN ('Walmart');

/*
Provide a table that provides the region for each sales_rep 
along with their associated accounts. Your final table should
include three columns: the region name, the sales rep name,
and the account name. Sort the accounts alphabetically (A-Z)
according to account name. 
*/

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/