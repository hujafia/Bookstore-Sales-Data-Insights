Online Bookstore Database Analysis
Project Overview
This project involves setting up a relational database for an online bookstore and performing various data analysis tasks using SQL. It covers database creation, data ingestion (CSV imports), and solving real-world business problems through basic to advanced SQL queries.

Database Schema
The project utilizes three primary tables:

Books: Contains book details including title, author, genre, price, and stock levels.

Customers: Stores customer information such as name, email, and location.

Orders: Records transaction details, linking customers and books with order dates and quantities.

Key Features & Analysis
The SQL script addresses several business questions, categorized by complexity:

Basic Analysis:
Filtering books by genre (e.g., "Fiction") and publication year.

Identifying customers from specific countries.

Tracking orders within specific timeframes (e.g., November 2023).

Calculating total stock and identifying the most expensive/least stocked books.

Advanced Insights:
Sales Performance: Total quantity sold per genre and author.

Customer Behavior: Identifying frequent buyers and top spenders.

Inventory Management: Calculating remaining stock after fulfilling all orders using LEFT JOIN and COALESCE.

Revenue Analysis: Calculating total revenue and average book prices.

Technologies Used
SQL (PostgreSQL/Standard SQL)

Relational Database Management System (RDBMS)
