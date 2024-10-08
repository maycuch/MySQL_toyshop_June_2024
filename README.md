# MySQL toyshop project

### What does this project do
- this is MySQL code practice working with an imaginary database toy shop. It has 6 tables, populated with toys products' details. It answers several questions regarding the toy range.

### How to use this 
- you need to install the interpreter for the MYSQL language [MySQL Community Server](https://dev.mysql.com/downloads/file/?id=526336)
- and also an application which allows us to see, manage and access data. e.g. [MySQL WorkBench](https://downloads.mysql.com/archives/workbench/)

### What can you find in code
- it consists of 6 tables:
  - category - Boys, Girls, Creative Learning, Construction, Soft Toys
  - brands - Nerf, Barbie, Polly Pocket, Playdoh, Lego, Jellycat, Steiff
  - vendor - Hasbro, Mattel, Lego, Jellycat, Steiff
  - products - a list of 46 products
  - inventory_on_hand - stock in store and in warehouse
  - inventory_open_orders - stock on order
 
  ***EER diagram***
  - ![EER diagram toy_shop](https://github.com/maycuch/CFG-Assignments/assets/104008913/fc6fba53-cb90-48a7-b213-934055bc3e98)

  
- the code creates database and tables and it populates them with data
- the analysis is done through queries using various MySQL commands and answers questions to following qeustions:
  - Find products that are online and have %margin less than 15% as they need to be removed from online due to high cost of deliveries, list producrs with the lowest %mgn on top
  - Calculate total %margin per brand and list all brands by %margin in descending order 
  - Which category has a highest % margin
  - What is the highest and lowest retail price in range
  - What vendor has the biggest number of products in our range
  - Find what is an average retail price for Lego brand
  - Check for any products with no stock on shop floor or in warehouse. If they have orders placed against them, check when the orders shoud have been delivered
  - Create a summary VIEW
 assignment-4-build-API
  - Create function to check stock on hand and any open orders, and suggest a new order qty if low stock, based on case pack and retail price.
