
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

