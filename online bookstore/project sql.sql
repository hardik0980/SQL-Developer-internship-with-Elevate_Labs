select * from books;

select * from customers;

select * from orders;

create table orders(	
	Order_ID int primary key,
	Customer_ID	int references customers(Customer_id),
	Book_ID	int references books(Book_id),
	Order_Date	date,
	Quantity int,
	Total_Amount numeric(10,2)
);


-- 1. Retrieve all books in the 'Fiction' genre --

select book_id, title, genre
from books
where genre ='Fiction';

-- 2. find books published after the year 1950 --

select book_id, title, published_year
from books
where published_year >= 1950;


-- 3. List all customers from the Canada --

select name, country 
from customers
where country ='Canada';

-- 4. Show orders placed in November 2023 --

select * from orders
where order_date between '2023-11-1' and  '2023-11-30'
order by order_date asc;

-- 5. Retrieve the total stock of books available -- 

select  sum(stock) as total_stock 
from books;

-- 6. Find the details of the most expansive books --

select max(price)
from books;

select title, price
from books
order by price desc 
limit 5;

-- 7. Show all customers who ordered more then 1 quantity of a books --

select * from orders
where quantity > 1;


-- 8. Retrieve all orders where the total amount exceeds $20 -- 

select * from orders
where total_amount > 20;

-- 9. List all genre available in the Books table  --

select  distinct genre 
from books;

-- 10. Find the book with lowest stork --

select * from books
order by stock
limit 5;

-- 11. Calculate the total revenue gererated from all orders --

select sum(total_amount) as revenue 
from orders;


-- Advance Questions : --

-- 1. Retrieve the to tal number of books solde for each gerne

select  b.genre ,sum(o.quantity) as total_genre
from books b
join
orders o
on b.book_id = o.book_id
group by b.genre;



-- 2. Find the average price of books in the 'Fantasy' genre --

select avg(price) as avg_price
from books
where genre = 'Fantasy';

-- 3. List customers who have placed at least 2 orders --

select Customer_id, count(Order_id) as order_count
from orders
group by customer_id
having count(Order_id) >= 2;

select c.Customer_id, c.name,count(o.Order_id) as order_count
from orders o
join customers c on o.customer_id = c.customer_id
group by c.customer_id, c.name
having count(o.Order_id) >= 2;


-- 4. Find the most frequently orders book --

select book_id,  count(order_id) as order_count
from orders
group by book_id
order by order_count desc limit 5;

-- 5. Show the top 3 most expensive books of 'Fantasy' genre --
select genre ,price from books
where genre = 'Fantasy' 
order by price des
limit 3;

-- 6. Retrieve the total quantity of books sold by each author --
SELECT
	B.AUTHOR,
	SUM(O.QUANTITY) AS TOTAL_QUANTITY
FROM
	BOOKS B
	JOIN ORDERS O ON B.BOOK_ID = O.BOOK_ID
GROUP BY
	B.AUTHOR;


-- 7. List the cities where customers who spent over $30 are located --

select distinct c.city, o.total_amount
from customers c
join orders o on c.customer_id = o.customer_id
where o.total_amount >30 ;

-- 8. Find the costomer who spent the most on orders --

select c.customer_id ,c.name, sum(o.total_amount) as total
from orders o
join customers c on c.customer_id = o.customer_id
group by c.customer_id,c.name
order by total desc;

-- 9. Calculate the stock remaining after fulfilling all orders--

select b.book_id , b.title, b.stock, coalesce(sum(o.quantity),0) as order_quantity,
		b.stock - coalesce(sum(o.quantity),0) as remaining_quantity
from books b
left join orders o
on b.book_id = o.book_id
group by b.book_id;

