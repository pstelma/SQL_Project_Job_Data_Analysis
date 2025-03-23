-- Create Products Table
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    base_price NUMERIC,
    cost NUMERIC,
    margin NUMERIC
);

-- Create Customers Table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    region VARCHAR(50),
    demographic_group VARCHAR(50)
);

-- Create Sales Table
CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    product_id INT,
    customer_id INT,
    sale_date DATE,
    quantity INT,
    discount NUMERIC,
    price NUMERIC,
    revenue NUMERIC,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
