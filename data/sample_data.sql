-- Customers
INSERT INTO customers VALUES
(1, 'Amit Sharma', 'Male', 'Delhi', '2023-01-10'),
(2, 'Neha Verma', 'Female', 'Mumbai', '2023-02-15'),
(3, 'Rahul Singh', 'Male', 'Bangalore', '2023-03-05'),
(4, 'Priya Iyer', 'Female', 'Chennai', '2023-04-20'),
(5, 'Ankit Patel', 'Male', 'Ahmedabad', '2023-05-12');

-- Products
INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 60000),
(102, 'Smartphone', 'Electronics', 30000),
(103, 'Headphones', 'Accessories', 3000),
(104, 'Office Chair', 'Furniture', 7000),
(105, 'Desk Lamp', 'Furniture', 1500);

-- Orders
INSERT INTO orders VALUES
(1001, 1, '2023-06-01'),
(1002, 2, '2023-06-05'),
(1003, 1, '2023-07-10'),
(1004, 3, '2023-07-15'),
(1005, 4, '2023-08-01');

-- Order Items
INSERT INTO order_items VALUES
(1, 1001, 101, 1),
(2, 1001, 103, 2),
(3, 1002, 102, 1),
(4, 1003, 104, 1),
(5, 1003, 105, 2),
(6, 1004, 101, 1),
(7, 1005, 103, 1);
