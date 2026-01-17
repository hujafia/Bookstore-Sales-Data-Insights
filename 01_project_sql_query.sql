drop table if exists books;

create table if not exists books(
Book_ID	int primary key,
Title	varchar(100),
Author	varchar(50),
Genre	varchar(50),
Published_Year	int,
Price	numeric,
Stock	int
);


drop table if exists customers cascade;

create table if not exists customers(
Customer_ID	int primary key,
Name	varchar(110),
Email	varchar(1000),
Phone	varchar(50),
City	varchar(100),
Country	varchar(100)
);

drop table if exists orders cascade;

create table if not exists orders(
Order_ID	int primary key, 
Customer_ID	int,
Book_ID	int,
Order_Date	date,
Quantity	int,
Total_Amount	numeric(10,2)
);


copy books (Book_ID, Title, Author, Genre, Published_Year, Price, Stock)
from 'C:\Users\User\OneDrive\Documents\Data Analysis All Prctice File\Sql\Sql Project\Books.csv'
delimiter ','
csv header;

copy customers(Customer_ID, Name, Email,Phone, City,Country)
from 'C:\Users\User\OneDrive\Documents\Data Analysis All Prctice File\Sql\Sql Project\Customers.csv'
csv header;

copy orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount)
from 'C:\Users\User\OneDrive\Documents\Data Analysis All Prctice File\Sql\Sql Project\Orders.csv'
csv header

select * from books;
select * from orders; 
select * from customers;

----============== Basic Sql Question =============== 
---1) Retrieve all books in the "Fiction" genre
SELECT
	TITLE,
	GENRE
FROM BOOKS
WHERE GENRE = 'Fiction';

---2) Find books published after the year 1950

select title, published_year
from books 
where published_year > 1950;

---3) List all customers from the Canada

select name, city
from customers
where country= 'Canada';

---4) Show orders placed in November 2023

select order_id, order_date 
from orders
where order_date between '2023-11-01' and '2023-11-30';

---5) Retrieve the total stock of books available

select sum(stock) as "books avilable"
from books;

---6) Find the details of the most expensive book
select title, price 
from books 
order by price desc;

---7) Show all customers who ordered more than 1 quantity of a book

select * from orders
where quantity>1; 

---8) Retrieve all orders where the total amount exceeds $20

select order_id, total_amount
from orders
where total_amount >20
order by total_amount;

---9) List all genres available in the Books table

select distinct genre from books

---10) Find the book with the lowest stock

select title,author, stock 
from books 
order by stock asc;

---11) Calculate the total revenue generated from all orders

select sum(total_amount) as total_revenue from orders;

select * from books 
select * from orders
select * from customers
--===================== Advanced Query ==================== 

---1) Retrieve the total number of books sold for each genre

select b.genre, sum(o.quantity) as total_quantity_sold
from books b
join orders o
on b.book_id= o.order_id
group by genre
order by "total_quantity_sold" desc;

---2) Find the average price of books in the "Fantasy" genre

select avg(price::numeric) as average_price
from books
where genre = 'Fantasy' ;


---3) List customers who have placed at least 2 orders

select c.name,  count(o.order_id) order_count
from customers c
join orders o
on c.customer_id= o.customer_id
group by c.name
having count(o.Order_id) >= 2;

---4) Find the most frequently ordered book

select b.book_id,b.title, count(o.book_id) as order_count
from books b
join orders o
on b.book_id= o.book_id
group by b.book_id,b.title
order by order_count desc;

---5) Show the top 3 most expensive books of 'Fantasy' Genre

select title, genre,price
from books 
where genre='Fantasy'
order by price desc
limit 3;

---6) Retrieve the total quantity of books sold by each author

SELECT
	B.AUTHOR,
	SUM(O.QUANTITY) AS "Total Books Sold"
FROM BOOKS B
	JOIN ORDERS O ON B.BOOK_ID = O.BOOK_ID
GROUP BY B.AUTHOR;

---7) List the cities where customers who spent over $30 are located

SELECT DISTINCT
	C.CITY,
	TOTAL_AMOUNT
FROM ORDERS O
	JOIN CUSTOMERS C ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE
	TOTAL_AMOUNT > 20

---8) Find the customer who spent the most on orders

select c.customer_id,c.name, sum(o.total_amount) as total_spent_money
from orders o
join  customers c
on c.customer_id= o.customer_id
group by c.customer_id
order by  total_spent_money desc;

---9) Calculate the stock remaining after fulfilling all orders

SELECT
	B.BOOK_ID,
	B.TITLE,
	B.STOCK,
	COALESCE(SUM(O.QUANTITY), 0) AS ORDER_QUANTITY,
	B.STOCK - COALESCE(SUM(O.QUANTITY), 0) AS REMAING_QUANTITY
FROM
	BOOKS B
	LEFT JOIN ORDERS O ON B.BOOK_ID = O.BOOK_ID
GROUP BY
	B.BOOK_ID
ORDER BY
	B.BOOK_ID;


