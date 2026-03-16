use orders;
-- Customers Table
CREATE TABLE tbl_customers (
customer_id VARCHAR(50) PRIMARY KEY,
customer_name VARCHAR(200) NOT NULL,
customer_email VARCHAR(100) unique not null,
customer_city VARCHAR(150)
);

-- Sales Rep Table
CREATE TABLE tbl_salesrep (
    sales_rep_id VARCHAR(50) PRIMARY KEY,
    sales_rep_name VARCHAR(200) NOT NULL,
    sales_rep_email VARCHAR(100) UNIQUE NOT NULL,
    office_address VARCHAR(200)
);

-- Category Table
CREATE TABLE tbl_category (
    category_id VARCHAR(50) PRIMARY KEY,
    category_name VARCHAR(200) NOT NULL
);

-- Product Table
CREATE TABLE tbl_product (
    product_id VARCHAR(50) PRIMARY KEY,
    product_name VARCHAR(200) NOT NULL,
    category_id VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES tbl_category(category_id)
);

-- Order Header Table
CREATE TABLE tbl_orderheader (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50) NOT NULL,
    sales_rep_id VARCHAR(50) NOT NULL,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES tbl_customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES tbl_salesrep(sales_rep_id)
);

-- Order Detail Table
CREATE TABLE tbl_orderdetail (
    order_id VARCHAR(50) NOT NULL,
    order_line_id INT NOT NULL,
    product_id VARCHAR(50) NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, order_line_id),
    FOREIGN KEY (order_id) REFERENCES tbl_orderheader(order_id),
    FOREIGN KEY (product_id) REFERENCES tbl_product(product_id)
);

-- Insert into Customers Table
insert into tbl_customers(customer_id,customer_name,customer_email,customer_city)
values ('C001','Rohan Mehta','rohan@gmail.com','Mumbai'),
('C002','Priya Sharma','priya@gmail.com','Delhi'),
('C003','Amit Verma','amit@gmail.com','Bangalore'),
('C004','Sneha Iyer','sneha@gmail.com','Chennai'),
('C005','Vikram Singh','vikram@gmail.com','Mumbai');

-- Insert into Sales Rep Table
insert into tbl_salesrep(sales_rep_id,sales_rep_name,sales_rep_email,office_address) 
values
('SR02','Anita Desai','anita@corp.com','Delhi Office, Connaught Place, New Delhi - 110001'),
('SR01','Deepak Joshi','deepak@corp.com','Mumbai HQ, Nariman Point, Mumbai - 400021'),
('SR03','Ravi Kumar','ravi@corp.com','South Zone, MG Road, Bangalore - 560001'),
('SR04','Pramod Rao','pramod@corp.com','East Zone, Temple Road, Kolkata - 700005'),
('SR05','Ravikumar Naidu','ravikumar@corp.com','Overseas, Camberwell Green - SE17 3UN');

-- Insert into Category Table
insert into tbl_category(category_id, category_name)
values ('CT001','Stationery'),
('CT002','Electronics'),
('CT003','Furniture'),
('CT004','Clothing'),
('CT005','Beauty');

-- Insert into Product table
insert into tbl_product(product_id,product_name,category_id,unit_price)
values
('P004','Notebook','CT001',120),
('P007','Pen Set','CT001',250),
('P005','Headphones','CT002',3200),
('P003','Desk Chair','CT003',8500),
('P006','Standing Desk','CT003',22000),
('P008','Webcam','CT002',2100),
('P001','Laptop','CT002',55000),
('P002','Mouse','CT002',800);

-- Insert into Order Header Table
insert into tbl_orderheader(order_id,customer_id,sales_rep_id,order_date)
values
('ORD1022','C005','SR01','2023/10/15'),
('ORD1054','C002','SR03','2023/10/4'),
('ORD1095','C001','SR03','2023/11/8'),
('ORD1125','C004','SR02','2023/7/28'),
('ORD1166','C003','SR02','2023/9/5');

-- Insert into Order Detail Table
insert into tbl_orderdetail(order_id,order_line_id,product_id,quantity)
values
('ORD1022',1,'P002',5),
('ORD1054',1,'P001',1),
('ORD1095',1,'P001',3),
('ORD1125',1,'P001',3),
('ORD1166',1,'P002',3);
