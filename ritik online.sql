-- Create Database
create database OnlineBookStore;

-- Create Tables
Drop table if exists Books;
create table Books
(
  Book_ID serial primary key,
  Title	varchar(100) ,
  Author varchar(100),
  Genre varchar(50),
  Published_Year int,
  Price numeric(10,2),
  Stock numeric
);

-- Create table Orders
 create table orders
 (
  Order_ID serial primary key,
  Customer_ID int,
  Book_ID int,
  Order_Date date,
  Quantity int,
  Total_Amount numeric(10,2)

 );

 -- create table 

 create table customers
 (
   Customer_ID serial primary key,
   Name varchar(100),
   Email varchar(150),
   Phone numeric,
   City	varchar(100),
   Country varchar(100)

 );

select * from Books
select * from orders
select * from customers

-- Now Solve all the business related problem

-- 1) Retrieve all books in the "Fiction" genre:

select * from Books
select count(genre) from Books
where genre='Fiction';

select * from Books
where genre='Fiction';

-- 2) Find books published after the year 1950:

select * from Books
select * from Books
where published_year>1950;


-- 3) List all customers from the Canada:

select * from customers
select * from customers
where country='Canada';


-- 4) Show orders placed in November 2023:

select * from orders
select * from orders
where order_date between '2023-11-01' and '2023-11-30';

-- 5) Retrieve the total stock of books available:

select * from Books
select sum(stock) as total_stock from Books

-- 6) Find the details of the most expensive book:

select * from Books
select max(price) as most_expensive_book from Books
select * from books
order by price desc
limit 1;

-- 7) Show all customers who ordered more than 1 quantity of a book:

select * from Books
select * from customers
select * from orders
select customer_id,quantity from orders
where quantity>1;

select * from orders
where quantity>1;



-- 8) Retrieve all orders where the total amount exceeds $20:

select * from orders
select * from orders
where total_amount>'20';

-- 9) List all genres available in the Books table:

select distinct(genre) from Books

-- 10) Find the book with the lowest stock:

select * from Books
order by stock asc
limit 1;

-- 11) Calculate the total revenue generated from all orders:

-- Advance Questions : 

select * from orders
select sum(total_amount) as total_revenue_generated
from orders


-- 1) Retrieve the total number of books sold for each genre:

select * from Books
select * from orders
select 	B.genre,sum(O.quantity) as total_book_sold
from Books B
inner join orders O
on B.book_id=O.order_id
group by B.genre;

select b.genre,sum(o.quantity) as total_book_sold
from Books b
inner join orders o
on b.book_id=o.order_id
group by b.genre;


-- 2) Find the average price of books in the "Fantasy" genre:

select * from Books
select avg(price) as Average_price ,genre from Books
where genre='Fantasy'
group by price,genre;
select avg(price) from Books
where genre='Fantasy';

-- 3) List customers who have placed at least 2 orders:

select * from orders 
select * from customers
select o.customer_id,c.name,count(o.order_id) as order_count
from orders o
join customers c
on o.customer_id=c.customer_id
group by o.customer_id,c.name
having count(order_id)>=2;


-- 4) Find the most frequently ordered book:

select * from orders
select * from books
select o.book_id,b.title,count(order_id) as order_count
from orders o
join books b
on o.order_id=b.book_id
group by b.book_id,b.title
order by order_count desc
limit 1;



-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :

select * from Books
select * from Books
where genre='Fantasy'
order by price desc
limit 3;

-- 6) Retrieve the total quantity of books sold by each author:

select * from books
select * from orders
select sum(o.quantity) as total_quantity,b.author
from orders o
join Books b
on o.order_id=b.Book_id
group by b.author;


-- 7) List the cities where customers who spent over $30 are located:

select * from customers
select * from orders
select distinct c.city,total_amount
from orders o
join customers c
on o.customer_id=c.customer_id
where o.total_amount>30;

-- 8) Find the customer who spent the most on orders:


select * from orders 
select * from customers
select c.customer_id,c.name,sum(o.total_amount) as total_spent
from orders o
join customers c
on o.customer_id=c.customer_id
group by c.customer_id,c.name
order by total_spent desc;



