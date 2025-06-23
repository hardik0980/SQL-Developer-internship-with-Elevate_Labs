# SQL-Developer-internship-with-Elevate_Labs

E-commerce Database Schema Design
📌 Task Overview:
This project demonstrates the design and implementation of a relational E-commerce database schema using SQL. The goal was to structure data efficiently by identifying entities, their relationships, and implementing proper keys to ensure referential integrity.

✅ Key Features:
Domain Chosen: E-commerce

Entities Identified:

Customers

Categories

Products

Orders

Order_Items

Payments

Relationships Defined:

One-to-many between Customers and Orders

One-to-many between Orders and Order_Items

Many-to-one between Order_Items and Products

One-to-many between Products and Categories

One-to-one/many between Orders and Payments

SQL Operations:

CREATE DATABASE ecommerce_db

CREATE TABLE statements for all entities

Proper use of PRIMARY KEY and FOREIGN KEY constraints

🧱 Technologies Used:
SQL (PostgreSQL / MySQL compatible)

Relational Database Design Principles

💾 How to Use:
Clone this repository

Run the ecommerce_schema.sql file in your preferred SQL environment

Explore or extend the schema for advanced features like user authentication, cart, reviews, etc.

