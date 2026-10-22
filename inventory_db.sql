
-- Step 6: Create the INVENTORY table.
-- Store information about each inventory item.
CREATE TABLE INVENTORY (
    item_id INT NOT NULL PRIMARY KEY,
    item_name VARCHAR(40) NOT NULL,
    category VARCHAR(30),
    quantity INT,
    unit_cost DECIMAL(7,2),
    received_on DATE
);

-- Check that the table has the correct columns.
DESCRIBE INVENTORY;

-- Step 7: Add three products to the inventory.
-- Insert the mouse, keyboard, and USB hub.
INSERT INTO INVENTORY
(item_id, item_name, category, quantity, unit_cost, received_on)
VALUES
(1, 'Laser Mouse', 'Peripherals', 25, 18.50, '2026-02-10'),
(2, 'Mechanical Keyboard', 'Peripherals', 12, 64.00, '2026-03-05'),
(3, 'USB Hub', 'Accessories', 40, 22.75, '2026-04-18');

-- Show all products to check that they were added.
SELECT * FROM INVENTORY;

-- Step 8: Check the prices before changing anything.
-- Show the ID, name, and price of every item.
SELECT item_id, item_name, unit_cost
FROM INVENTORY;

-- Change only the keyboard price to 59.99.
UPDATE INVENTORY
SET unit_cost = 59.99
WHERE item_id = 2;

-- Check the prices again to confirm the change.
SELECT item_id, item_name, unit_cost
FROM INVENTORY;

-- Step 9: Create a view to calculate inventory values.
-- Multiply the quantity by the cost of each item.
CREATE VIEW INVENTORY_VALUE AS
SELECT
    item_name,
    quantity,
    unit_cost,
    quantity * unit_cost AS total_value
FROM INVENTORY;

-- Show the items from highest to lowest total value.
SELECT *
FROM INVENTORY_VALUE
ORDER BY total_value DESC;

-- Step 10: Make a copy of the inventory table.
-- Copy all six columns and the three products.
CREATE TABLE INVENTORY_COPY AS
SELECT * FROM INVENTORY;

-- Check the structure of the copied table.
SHOW CREATE TABLE INVENTORY_COPY;

-- Add a primary key to the copied table.
ALTER TABLE INVENTORY_COPY
ADD PRIMARY KEY (item_id);

-- Check that item_id is now the primary key.
DESCRIBE INVENTORY_COPY;

-- Test the primary key with a duplicate ID.
-- This should fail because item_id 1 already exists.
-- INSERT INTO INVENTORY_COPY (item_id, item_name)
-- VALUES (1, 'Test Mouse');

-- Step 11: Create a new user for the inventory database.
-- This creates an account named stockclerk.
CREATE USER 'stockclerk'@'localhost'
IDENTIFIED BY 'Stock#2026';

-- Show the database users to check the new account.
SELECT user, host
FROM mysql.user
ORDER BY user;







