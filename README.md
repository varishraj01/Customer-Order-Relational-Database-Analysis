# Customer Order Relational Database Analysis

A practical **PostgreSQL SQL project** focused on analyzing relationships between customers and orders using SQL JOINs, aggregation, and data-quality checks.

## 📌 Project Overview

This project demonstrates how relational databases can be used to connect customer and order information and answer common business questions.

The analysis uses two related tables:

- **customers** — customer profile, location, signup, and referral information
- **orders** — order date, product category, quantity, price, and order status

The project focuses particularly on understanding different types of SQL JOINs and how they can be applied to real business scenarios.

### Workflow

`Customer Data + Order Data → Relational Tables → SQL JOINs → Aggregation → Business Insights`

## 🎯 Business Objectives

- Combine customer and order information
- Identify valid and unmatched customer-order relationships
- Find customers who have never placed an order
- Calculate customer-level order counts and spending
- Analyze revenue by product category
- Understand customer referral relationships
- Demonstrate practical SQL JOIN techniques

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| **PostgreSQL** | Relational database and query execution |
| **SQL** | Data analysis and business queries |
| **pgAdmin** | Database management and SQL execution |

## 🗃️ Database Schema

### Customers Table

| Column | Description |
|---|---|
| `customer_id` | Unique customer identifier |
| `first_name` | Customer first name |
| `last_name` | Customer last name |
| `email` | Customer email |
| `city` | Customer city |
| `state` | Customer state |
| `signup_date` | Customer registration date |
| `referred_by` | ID of the customer who referred them |

### Orders Table

| Column | Description |
|---|---|
| `order_id` | Unique order identifier |
| `customer_id` | Customer associated with the order |
| `order_date` | Date of the order |
| `product_category` | Product category |
| `quantity` | Number of products ordered |
| `unit_price` | Price per unit |
| `status` | Order status |

### Relationship

```text
customers
   │
   │ customer_id
   │
   ▼
orders
```

The `customer_id` field connects customers with their orders. The `referred_by` field creates a self-referencing relationship within the customers table.

## 📊 SQL Analysis Performed

### 1. INNER JOIN

Combines customers and orders where a valid customer relationship exists.

**Business use:** View order details together with customer information.

### 2. LEFT JOIN

Returns every order, including orders whose `customer_id` does not exist in the customers table.

**Business use:** Detect incomplete or inconsistent customer information.

### 3. LEFT JOIN + NULL Filtering

Finds orders containing invalid customer IDs.

**Business use:** Data-quality and referential-integrity analysis.

### 4. Customers With No Orders

Uses a LEFT JOIN and `IS NULL` filter to identify customers who have never placed an order.

**Business use:** Identify inactive customers for potential marketing or retention campaigns.

### 5. Customer Revenue Analysis

Calculates the number of non-cancelled orders and total spending for each customer.

**Business use:** Identify high-value customers.

### 6. SELF JOIN

Matches customers with the customers who referred them.

**Business use:** Analyze referral relationships and referral-based customer acquisition.

### 7. Product Category Revenue

Calculates order volume and revenue for each product category while excluding cancelled orders.

**Business use:** Identify high-performing product categories.

## 🧠 SQL Concepts Demonstrated

- `INNER JOIN`
- `LEFT JOIN`
- Self Join
- Anti Join pattern
- `WHERE`
- `GROUP BY`
- `ORDER BY`
- `COUNT()`
- `SUM()`
- `ROUND()`
- `LIMIT`
- `IS NULL`
- `CASE`-style business logic
- String concatenation using `||`
- Calculated columns
- Relational data modeling
- Data-quality analysis

## 💡 Key Business Questions

The project answers questions such as:

1. Which orders are associated with valid customers?
2. Which orders contain invalid customer IDs?
3. Which customers have never ordered?
4. Who are the highest-spending customers?
5. How many orders and how much revenue does each customer generate?
6. Who referred each customer?
7. Which product categories generate the most revenue?
8. How can SQL JOINs be used to identify data-quality issues?

## 🔍 Why This Project Matters

JOINs are one of the most important SQL concepts used in real-world analytics. Business data is rarely stored in one table, so analysts need to combine information from multiple relational tables before calculating meaningful metrics.

This project demonstrates that process using a simple customer-order database while also showing how JOINs can be used for **business analysis and data-quality checks**, not just for retrieving records.

## ▶️ How to Run the Project

1. Install PostgreSQL and open **pgAdmin** or another PostgreSQL client.
2. Create a new database.
3. Open `joins project.sql`.
4. Execute the `CREATE TABLE` statements.
5. Load customer and order data into the respective tables.
6. Run the analysis queries section by section.

> The uploaded SQL file contains the table definitions and analysis queries. A separate dataset can be inserted into the tables before executing the analysis queries.

## 📁 Repository Structure

```text
Customer-Order-Relational-Database-Analysis/
│
├── README.md
└── joins project.sql
```

## 🚀 Future Improvements

- Add sample customer and order datasets
- Add foreign-key constraints between customers and orders
- Add indexes for frequently joined columns
- Add monthly revenue and order-trend analysis
- Add customer segmentation using spending and order frequency
- Add repeat-customer analysis
- Add cohort and retention analysis
- Add Power BI dashboard for visual reporting

## 👤 Author

**Varish Raj**  
Data Analytics Enthusiast | SQL | Power BI | PostgreSQL

GitHub: [@varishraj01](https://github.com/varishraj01)

---

⭐ If you find this project useful, consider giving the repository a star!
