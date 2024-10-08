CREATE DATABASE toy_shop;
USE toy_shop;

-- SETTING UP TOY SHOP TABELS-----------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE category (
category_id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
category_description VARCHAR (25)
);
INSERT INTO category (category_description) 
VALUES
('Boys'),('Girls'),('Creative learning'),('Construction'),('Soft toys') ;
-- SELECT * FROM category ;

CREATE TABLE brands (
brand_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
brand_description VARCHAR (25)
) ;
INSERT INTO brands (brand_description) 
VALUES
('Nerf'),('Barbie'),('Polly Pocket'),('Playdoh'),('Lego'),('Jellycat'),('Steiff'),('Hot Wheels') ;
-- SELECT * FROM brands ;

CREATE TABLE vendor (
vendor_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
vendor_name VARCHAR (25) NOT NULL,
vendor_email VARCHAR(40) NOT NULL,
vendor_phone_number VARCHAR (20),
lead_time_in_days INT
) ;
INSERT INTO vendor (vendor_name,vendor_email, vendor_phone_number,lead_time_in_days) 
VALUES
('Hasbro','info@hasbro.com','0800 224 27276',7),('Mattel','uk.reception@mattel.com','01628500303',9),
('Lego','info@lego.com','0800 066 8536',7),('Jellycat','hello@jellycat.co.uk','0333 004 0900',12),
('Steiff','info@steiff.com','0049 7322 131 222',14) ;
-- SELECT * FROM vendor ; 

-- DROP TABLE brands;
-- DROP TABLE category;
-- DROP TABLE products;
-- DROP TABLE vendor;

CREATE TABLE products 
(product_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
product_description VARCHAR (75),
category_id INT,
brand_id INT,
vendor_id INT,
is_online boolean,
cost_price decimal(6,2) NULL DEFAULT 0,
retail_price decimal(6,2) NULL DEFAULT 0,
CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES category(category_id),
CONSTRAINT fk_brand_id FOREIGN KEY (brand_id) REFERENCES brands(brand_id),
CONSTRAINT fk_vendor_id FOREIGN KEY (vendor_id) REFERENCES vendor(vendor_id)
);
-- amend product_id to start from 100
ALTER TABLE products AUTO_INCREMENT=100;
-- SELECT * FROM category;
-- SELECT * FROM brands;
INSERT INTO products (product_description,category_id,brand_id,vendor_id,is_online,cost_price,retail_price)
VALUES
('Elite 2.0 Prospect Blaster',1,1,1,false,3.15,6.5), 							-- NERF
('Super Soaker Wave Spray',1,1,1,true,10,16.99),
('Marvel Spider-Man Strike N Splash Blaster',1,1,1,true,19.5,33),
('Elite 2.0 Motoblitz CS-10 Blaster',1,1,1,true,31.2,44.99),
('Elite 2.0 Eaglepoint RD-8 Blaster',1,1,1,true,19.4,25.99),
('Dream Camper',2,2,2,true,85.2,129.99),             							-- Barbie
('New Barbie Dreamhouse Doll House',2,2,2,true,230,350),
('Malibu Colour Change Mermaid',2,2,2,false,15,23),
('Footballer Doll',2,2,2,false,9,14),
('The Movie Pink Gingham Dress Collectable Doll',2,2,2,true,34.4,45),
('Deluxe Blonde Styling Head',2,2,2,true,26.3,43),
('Ballerina Doll',2,2,2,false,15,28),
('Rainbow Unicorn Salon',2,3,2,true,19.88,35),      							-- Pollypocket
('PJ Party Sleepover Owl',2,3,2,false,9.6,15.99),
('Sloth Family 2-In-1 Purse Compact',2,3,2,true,19.4,24.99),
('Pollyville Resort Roll Away Playset',2,3,2,true,43.6,60),
('City 60420 Construction Excavator',4,5,3,true,32,49.99),     					-- Lego
('DUPLO 10954 Number Train - Learn To Count',4,5,3,false,10.5,18),
('Marvel Spider-Man 10789 Spider-Man\'s Car and Doc Ock',4,5,3,true,5.6,8.99),
('Harry Potter 76419 Hogwarts Castle and Grounds',4,5,3,true,96,149.99),
('City 60412 Fire Truck and Rescue Boat',4,5,3,false,18.3,24.99),
('Ideas 21336 The Office',4,5,3,true,61,83.99),
('DUPLO 10931 Truck & Tracked Excavator',4,5,3,false,11.34,17.99),
('Creator 3-in-1 31140 Magical Unicorn',4,5,3,false,5.5,8.99),
('Batman 76265 Batwing: Batman vs. The Joker',4,5,3,true,20.6,31.99),
('Fabulous Fruit Strawberry Soft Toy, Original, Multi',5,6,4,false,7.75,13),	-- Jellycat
('Fuddlewuddle Elephant Baby Soft Toy, Blue',5,6,4,true,15.4,26.99),
('Blossom Bunny Soft Toy Medium',5,6,4,false,14.12,24.99),
('Amuseable Strawberry Soft Toy',5,6,4,true,17.2,25.99),
('Happiest Broccoli Soft Toy, One Size, Green',5,6,4,false,11.89,17.99),
('Cosy Year 2024 Teddy Bear Soft Toy',5,7,5,true,36.4,59.90),    -- STEIFF
('Elmar Teddy Bear Soft Toy, Medium',5,7,5,true,58,95),
('Soft Cuddly Friends Berno Goldendoodle Plush Soft Toy',5,7,5,true,16.9,28),
('Kitchen Creations Little Chef Starter Set',3,4,1,false,7.65,12.99),     		-- PLAYDOH
('Kitchen Creations Magical Mixer',3,4,1,false,10.6,18.99),
('Sparkle Collection',3,4,1,false,5.45,7.99),
('Airplane Starter Set',3,4,1,false,9.8,12.99),
('Dino Crew Crunchin\' T-Rex',3,4,1,true,16.7,26),
('Kitchen Creations Super Colourful Cafe',3,4,1,true,21,35),
('All-in-One Creativity Starter Station',3,4,1,true,27.8,45),
('Kitchen Creations Ultimate Ice Cream Truck Playset',3,4,1,true,74,100),
('Race Ready 5 Car Pack',1,8,2,false,6.5,11.99),                      			-- NERF
('Race Ready 10 Car Pack',1,8,2,false,13.8,22.99),
('City Transforming Race Tower',1,8,2,true,23.1,42.99),
('Monster Truck Unstoppable Tiger Shark Remote Control Car Toy',1,8,2,true,36,66.99),
('City Ultimate Garage Track Set',1,8,2,true,68,130),
('City Cobra Tail Playset',1,8,2,true,20.1,35.99) ;
SELECT * FROM products ; 

-- Add column case_pack into proucts table
ALTER TABLE products
ADD COLUMN `case_pack` INT DEFAULT 0 AFTER product_description;

-- populate column case_pack
-- SELECT product_id,product_description,case_pack,retail_price FROM products WHERE retail_price > 100.01 ;
UPDATE products
SET case_pack = 2 WHERE product_id IN (105,106,119,145);

CREATE TABLE inventory_on_hand (
product_id INT NOT NULL,
units_on_shop_floor INT NULL DEFAULT 0,
units_in_warehouse INT NULL DEFAULT 0,
CONSTRAINT fk_invent_on_hand_product_id FOREIGN KEY (product_id) REFERENCES products (product_id)
) ;
-- SELECT product_id, product_description FROM products WHERE retail_price >= 150;
INSERT INTO inventory_on_hand (product_id, units_on_shop_floor,units_in_warehouse)
VALUES
(100,15,25),(118,10,20),(123,15,6),(135,3,0),																				-- up to £10
(108,6,1),(125,2,18),(133,12,24),(136,0,0),(141,8,16),																		-- up to £15
(101,1,0),(113,4,8),(117,1,32),(122,23,0),(129,8,0),(134,4,18),																-- up to £20
(104,3,12),(107,10,24),(111,5,32),(114,12,24),(120,12,6),(126,3,20),(127,6,1),(128,32,0),(132,0,6),(137,1,1),(142,12,46),	-- up to £30
(102,3,0),(103,6,12),(109,0,0),(110,18,2),(112,8,3),(116,2,3),(124,4,8),(138,8,4),(139,12,12),(143,3,2),(146,8,12),			-- up to £50
(115,2,1),(121,4,42),(130,0,12),(131,14,2),(140,3,0),(144,8,10),															-- up to £100
(105,0,0),(119,1,1),(145,8,12),																								-- up to £150
(106,2,6) ;
-- SELECT * FROM inventory_on_hand;

CREATE TABLE inventory_open_orders (
inventory_order_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
product_id INT,
order_date DATE,
ordered_qty_units INT NULL DEFAULT 0,
delivered_qty_units INT NULL DEFAULT 0,
outstanding_qty_units INT NULL DEFAULT 0,
CONSTRAINT fk_inv_orders_product_id FOREIGN KEY (product_id) REFERENCES products(product_id) 
) ; 
-- Inventory order id to start from 2000
ALTER TABLE inventory_open_orders AUTO_INCREMENT=4000 ;

-- DROP TABLE inventory_open_orders; 
-- SELECT i.product_id, units_on_shop_floor, units_in_warehouse,p.retail_price FROM inventory_on_hand i JOIN products p ON i.product_id = p.product_id WHERE units_on_shop_floor <5 OR units_in_warehouse <1  ;
INSERT INTO inventory_open_orders (product_id,order_date, ordered_qty_units,delivered_qty_units,outstanding_qty_units)
VALUES
(135,'2024-06-09',32,0,32),(136,'2024-05-15',0,0,0),(101,'2024-06-09',35,15,20),(129,'2024-04-29',12,0,12),(128,'2024-06-03',24,0,24),(132,'2024-05-20',6,0,6),(109,'2024-05-28',2,0,0),
(130,'2024-06-06',14,0,14),(140,'2024-06-01',6,2,4),(105,'2024-05-14',8,0,0),(125,'2024-06-10',30,0,0),(119,'2024-06-10',8,0,0);
SELECT * FROM inventory_open_orders;


-- delete open order that has no ordered, delivered or outstanding units - product_id =136
DELETE FROM inventory_open_orders WHERE product_id = 136; 

-- CREATE FUNCTION TO CACLCULATE % margin with assumption of 20% VAT with max 2 decimal spaces

-- SET GLOBAL log_bin_trust_function_creators = 0;
DELIMITER //
CREATE FUNCTION margin (retail_price DECIMAL(6,2),cost_price DECIMAL(6,2)) 
RETURNS DECIMAL(5,2)
DETERMINISTIC

BEGIN
	DECLARE margin DECIMAL(5,2) ;
    SET margin = ((retail_price/1.2 - cost_price)/(retail_price/1.2)) *100 ;
	RETURN (margin) ;
END//
DELIMITER ;

-- Find products that are online and have %margin less than 15% as they need to be removed from online due to high cost od deliveries, list the lowest %mgn on top 
SELECT 
	product_id,
    product_description,
    cost_price,
    retail_price,
    is_online,
    CONCAT(ROUND(margin(retail_price,cost_price),1),' %') AS '% margin'
FROM products 
WHERE is_online = True AND margin(retail_price,cost_price) < 15
ORDER BY margin(retail_price,cost_price) ;

-- Create function which finds products that are online and have %margin below 15% and add a new column with a comment 'REMOVE FROM ONLINE DUE TO LOW MARGIN'.

DELIMITER //
CREATE FUNCTION check_for_low_mgn_online (retail_price DECIMAL(6,2),cost_price DECIMAL(6,2),is_online BOOLEAN)
RETURNS VARCHAR(50)
DETERMINISTIC

BEGIN
	DECLARE comment VARCHAR(50) ;
    IF margin(retail_price,cost_price) < 15 AND is_online = TRUE
    THEN SET comment = 'REMOVE FROM WEB DUE TO LOW MARGIN';
    ELSE SET comment = '' ;
    END IF ;
    
    RETURN comment ;
END //
DELIMITER ;

-- Use above function check_for_low_mgn_online on all aproducts in range
SELECT 
	product_id, 
	product_description, 
	cost_price,retail_price,
	is_online,concat(round(margin(retail_price,cost_price),1),'%') AS '% margin',
	check_for_low_mgn_online(retail_price, cost_price,is_online) AS online_feasibility 
FROM products 
ORDER BY 7 DESC ;


-- Calculate total %margin per brand and list brands with the highest %margin on top
SELECT
	UPPER(b.brand_description),
    CONCAT(ROUND((((SUM(p.retail_price))/1.2 - SUM(p.cost_price))/(SUM(p.retail_price))/1.2) * 100,1), ' %') AS '% brand_margin'
FROM products p
JOIN brands b ON p.brand_id = b.brand_id
GROUP BY p.brand_id
ORDER BY 2 DESC ;

-- Which category has a highest % margin
SELECT
	UPPER(c.category_description),
    CONCAT(ROUND((((SUM(p.retail_price))/1.2 - SUM(p.cost_price))/(SUM(p.retail_price))/1.2) * 100,1), ' %') AS '% brand_margin'
FROM products p
JOIN category c ON p.category_id = c.category_id
GROUP BY c.category_id
ORDER BY 2 DESC 
LIMIT 1;


-- What are the highest and lowest retail price in range
SELECT
	MAX(retail_price) AS max_rrp,
    MIN(retail_price) AS min_rrp
FROM products ;

-- What vendor has the biggest number of products in our range
SELECT
	UPPER(vendor_name),
	COUNT(*) AS no_of_products_in_range
FROM products p
JOIN vendor v ON p.vendor_id = v.vendor_id
GROUP BY vendor_name 
ORDER BY 2 DESC
LIMIT 1;


-- Find what is an average retail price for Lego brand
SELECT
	ROUND(AVG(retail_price),2) AS avg_retail_price
FROM products
WHERE brand_id = (SELECT p.brand_id 
					FROM products p
                    JOIN brands b ON p.brand_id = b.brand_id
                    WHERE brand_description = 'Lego'
                    GROUP BY p.brand_id) ;

-- Check for any products with no stock on shop floor or in warehouse. If they have orders placed against them, check when the orders shoud have been delivered by using lead_time_in_days column from products table and order_date 
SELECT
	p.product_id,
	p.product_description,
	ioh.units_on_shop_floor,
    ioh.units_in_warehouse,
    ioo.ordered_qty_units,
    ioo.order_date + Interval (v.lead_time_in_days) DAY AS Should_be_delivered_by
FROM products p 
LEFT JOIN inventory_on_hand ioh ON p.product_id = ioh.product_id
LEFT JOIN inventory_open_orders ioo ON p.product_id = ioo.product_id 
LEFT JOIN vendor v ON p.vendor_id = v.vendor_id
WHERE ioh.units_on_shop_floor = 0 AND ioh.units_in_warehouse = 0 ;


-- CREATE VIEW summarizing products and their stock
CREATE OR REPLACE VIEW product_range_vw AS
	SELECT 	p.product_id, p.product_description,v.vendor_name,c.category_description,b.brand_description, p.cost_price,p.retail_price,margin(p.retail_price,p.cost_price) AS '% margin',
			(ioh.units_on_shop_floor + ioh.units_in_warehouse) AS stock_on_hand,IFNULL(ioo.ordered_qty_units,0) AS ordered_qty
	FROM products p 
    LEFT JOIN inventory_on_hand ioh ON p.product_id = ioh.product_id
    LEFT JOIN inventory_open_orders ioo ON p.product_id = ioo.product_id
    LEFT JOIN vendor v ON p.vendor_id = v.vendor_id
    LEFT JOIN brands b ON p.brand_id = b.brand_id
    LEFT JOIN category c ON p.category_id = c.category_id
    ORDER BY c.category_description, b.brand_description, (ioh.units_on_shop_floor + ioh.units_in_warehouse) ;

SELECT * FROM product_range_vw;

-- Create function to check stock on hand and any open orders, and suggest a new order qty if low stock, based on case pack and retail price. 
DELIMITER //
CREATE FUNCTION order_stock (units_on_shop_floor INT,units_in_warehouse INT,inventory_order_id INT,retail_price DECIMAL (6,2),case_pack INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE new_order_qty int ;
    IF units_on_shop_floor + units_in_warehouse < 5 AND inventory_order_id IS NULL AND retail_price < 100
    THEN SET new_order_qty = case_pack * 4 ;
    ELSEIF units_on_shop_floor + units_in_warehouse < 2 AND inventory_order_id IS NULL AND retail_price > 100
    THEN SET new_order_qty = case_pack * 2 ;
    END IF ;

	RETURN new_order_qty ;
    END //

DELIMITER ;

SELECT 
p.product_id,p.product_description,p.retail_price,p.case_pack, 
ioh.units_on_shop_floor, ioh.units_in_warehouse, 
ioo.inventory_order_id, 
order_stock(units_on_shop_floor,units_in_warehouse,inventory_order_id,retail_price,case_pack) AS 'suggested a new order qty'
FROM products p 
LEFT JOIN inventory_on_hand ioh ON p.product_id = ioh.product_id
LEFT JOIN inventory_open_orders ioo ON p.product_id = ioo.product_id
WHERE order_stock(units_on_shop_floor,units_in_warehouse,inventory_order_id,retail_price,case_pack) IS NOT NULL ;








    