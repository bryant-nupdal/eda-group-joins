-- Get all customers and their addresses.
SELECT "first_name", "last_name", "street", "city", "state", "zip", "address_type" FROM "customers" 
JOIN "addresses" ON "customers"."id" = "addresses"."customer_id";

-- Get all orders and their line items (orders, quantity and product).
SELECT "order_date", "street", "city", "state", "zip", "address_type", "description","unit_price", "quantity" FROM "orders" 
JOIN "line_items" ON "orders"."id" = "order_id" 
JOIN "addresses" ON  "addresses"."id" = "orders"."address_id" 
JOIN "products" ON "products"."id" = "line_items"."product_id";

-- Which warehouses have cheetos?
  -- Delta
SELECT "warehouse", "description" FROM "warehouse_product"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
JOIN "warehouse" ON "warehouse"."id" = "warehouse_id"
WHERE "description" = 'cheetos';

-- Which warehouses have diet pepsi?
  --Alpha, Delta, Gamma
SELECT "warehouse", "description" FROM "warehouse_product"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
JOIN "warehouse" ON "warehouse"."id" = "warehouse_id"
WHERE "description" = 'diet pepsi';

-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "first_name", "last_name", count(*) AS "number of orders" from "orders"
JOIN "addresses" ON "addresses"."id" = "orders"."address_id"
JOIN "customers" ON "customers"."id" = "addresses"."customer_id"
GROUP BY "first_name", "last_name";

-- How many customers do we have?
SELECT count(*) FROM "customers"; 

-- How many products do we carry?
SELECT count("products"."description") FROM "products";

-- What is the total available on-hand quantity of diet pepsi?
SELECT SUM("on_hand") FROM "warehouse_product"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
JOIN "warehouse" ON "warehouse"."id" = "warehouse_id"
WHERE "description" = 'diet pepsi';

-- Stretch

-- How much was the total cost for each order?

-- How much has each customer spent in total?

-- How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).
