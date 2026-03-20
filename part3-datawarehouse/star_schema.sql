-- Dimension: Date
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    day INT,
    month INT,
    year INT
);

-- Dimension: Store
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    store_city VARCHAR(100)
);

-- Dimension: Product
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- Fact Table: Sales
CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    customer_id VARCHAR(50),
    units_sold INT,
    unit_price DECIMAL(12,2),
    total_sales DECIMAL(15,2),
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- Sample cleaned INSERTs (10 rows)
INSERT INTO dim_date VALUES
(1, '2023-01-15', 15, 1, 2023),
(2, '2023-02-05', 5, 2, 2023),
(3, '2023-03-31', 31, 3, 2023),
(4, '2023-05-21', 21, 5, 2023),
(5, '2023-06-04', 4, 6, 2023),
(6, '2023-07-22', 22, 7, 2023),
(7, '2023-08-09', 9, 8, 2023),
(8, '2023-09-27', 27, 9, 2023),
(9, '2023-10-26', 26, 10, 2023),
(10, '2023-12-08', 8, 12, 2023);

INSERT INTO dim_store VALUES
(1, 'Chennai Anna', 'Chennai'),
(2, 'Delhi South', 'Delhi'),
(3, 'Bangalore MG', 'Bangalore'),
(4, 'Pune FC Road', 'Pune'),
(5, 'Mumbai Central', 'Mumbai');

INSERT INTO dim_product VALUES
(1, 'Smartwatch', 'Electronics'),
(2, 'Phone', 'Electronics'),
(3, 'Laptop', 'Electronics'),
(4, 'Jeans', 'Clothing'),
(5, 'Atta 10kg', 'Grocery'),
(6, 'Milk 1L', 'Groceries'),
(7, 'Tablet', 'Electronics'),
(8, 'Speaker', 'Electronics'),
(9, 'Rice 5kg', 'Grocery'),
(10, 'Biscuits', 'Groceries');

-- Fact table sample inserts (cleaned)
INSERT INTO fact_sales VALUES
(1, 1, 1, 1, 'CUST004', 10, 58851.01, 588510.10),
(2, 2, 1, 2, 'CUST019', 20, 48703.39, 974067.80),
(3, 3, 4, 1, 'CUST025', 6, 58851.01, 353106.06),
(4, 4, 3, 3, 'CUST044', 13, 42343.15, 550460.95),
(5, 5, 1, 4, 'CUST031', 15, 30187.24, 452808.60),
(6, 6, 1, 5, 'CUST008', 3, 52464.00, 157392.00),
(7, 7, 3, 5, 'CUST027', 12, 52464.00, 629568.00),
(8, 8, 5, 8, 'CUST031', 14, 49262.78, 689678.92),
(9, 9, 4, 4, 'CUST041', 16, 2317.47, 37079.52),
(10, 10, 3, 10, 'CUST030', 9, 27469.99, 247229.91);