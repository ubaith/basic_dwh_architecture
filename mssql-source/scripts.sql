-- Create the ecommerce database
CREATE DATABASE ecommerce;
GO

-- Use the ecommerce database
USE ecommerce;
GO

-- Create customers table
CREATE TABLE customers (
                           customer_id INT IDENTITY(1,1) PRIMARY KEY,
                           first_name NVARCHAR(50) NOT NULL,
                           last_name NVARCHAR(50) NOT NULL,
                           email NVARCHAR(100) NOT NULL UNIQUE,
                           phone NVARCHAR(15),
                           address NVARCHAR(255),
                           city NVARCHAR(50),
                           state NVARCHAR(50),
                           zip_code NVARCHAR(10),
                           country NVARCHAR(50),
                           created_at DATETIME DEFAULT GETDATE()
);
GO

-- Create products table
CREATE TABLE products (
                          product_id INT IDENTITY(1,1) PRIMARY KEY,
                          product_name NVARCHAR(100) NOT NULL,
                          description NVARCHAR(1000),
                          price DECIMAL(10, 2) NOT NULL,
                          stock INT NOT NULL,
                          created_at DATETIME DEFAULT GETDATE()
);
GO

-- Create orders table
CREATE TABLE orders (
                        order_id INT IDENTITY(1,1) PRIMARY KEY,
                        customer_id INT NOT NULL,
                        order_date DATETIME DEFAULT GETDATE(),
                        status NVARCHAR(50) DEFAULT 'Pending',
                        total DECIMAL(10, 2) NOT NULL,
                        FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
GO

-- Create order_items table
CREATE TABLE order_items (
                             order_item_id INT IDENTITY(1,1) PRIMARY KEY,
                             order_id INT NOT NULL,
                             product_id INT NOT NULL,
                             quantity INT NOT NULL,
                             price DECIMAL(10, 2) NOT NULL,
                             FOREIGN KEY (order_id) REFERENCES orders(order_id),
                             FOREIGN KEY (product_id) REFERENCES products(product_id)
);
GO