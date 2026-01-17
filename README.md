# 📚 Online Bookstore Database Analysis Project

## 📖 Project Overview
This project involves setting up a **relational database** for an online bookstore and performing various data analysis tasks using **SQL**. It covers database creation, data ingestion (CSV imports), and solving real-world business problems through basic to advanced SQL queries.

---

## 🏗️ Database Schema
The project utilizes three primary tables:

* **Books:** Contains book details including title, author, genre, price, and stock levels.
* **Customers:** Stores customer information such as name, email, and location.
* **Orders:** Records transaction details, linking customers and books with order dates and quantities.

---

## 🚀 Key Features & Analysis
The SQL script addresses several business questions, categorized by complexity:

### 🔍 Basic Analysis
* **Filtering:** Books by genre (e.g., "Fiction") and publication year.
* **Targeting:** Identifying customers from specific countries.
* **Tracking:** Orders within specific timeframes (e.g., November 2023).
* **Inventory:** Calculating total stock and identifying the most expensive/least stocked books.

### 💡 Advanced Insights
* **Sales Performance:** Total quantity sold per genre and author.
* **Customer Behavior:** Identifying frequent buyers and top spenders.
* **Inventory Management:** Calculating remaining stock after fulfilling all orders using `LEFT JOIN` and `COALESCE`.
* **Revenue Analysis:** Calculating total revenue and average book prices.

---

## 🛠️ Technologies Used
* **SQL** (PostgreSQL / Standard SQL)
* **RDBMS** (Relational Database Management System)

  ## 🛠️ How to Use This Project
1. **Database Setup:** Run the provided SQL scripts to create the `Books`, `Customers`, and `Orders` tables.
2. **Data Import:** Use the `COPY` command or the import wizard to load the CSV data into the tables.
3. **Run Queries:** Execute the SQL scripts in your PostgreSQL tool (like pgAdmin) to see the analysis results.

## 📊 Business Logic Implemented
* **Stock Updates:** Logic to manage inventory levels after each purchase.
* **Revenue Tracking:** Real-time calculation of sales to monitor business growth.
* **Customer Segmentation:** Grouping customers based on their purchase history.
