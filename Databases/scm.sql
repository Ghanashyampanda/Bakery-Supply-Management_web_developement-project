-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2023 at 05:03 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scm`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL COMMENT 'Id of Manufacturing unit',
  `username` varchar(20) NOT NULL COMMENT 'username for login',
  `password` varchar(20) NOT NULL COMMENT 'password of user login'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Details of Manufacturer login';

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL COMMENT 'Id of category',
  `cat_name` varchar(25) NOT NULL COMMENT 'Name of category',
  `cat_details` text DEFAULT NULL COMMENT 'Details about the category'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Category details';

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`, `cat_details`) VALUES
(1, 'Fast Food', ''),
(2, 'Bread Buns', ''),
(3, 'Counter Cakes', ''),
(4, 'Deserts', ''),
(5, 'Pastry Rs - 55', ''),
(6, 'Pastry Rs - 60', ''),
(7, 'Pastry Rs - 65', ''),
(8, 'Pastry Rs - 70', ''),
(9, 'Add On Items', ''),
(10, 'Cakes', ''),
(11, 'Cheese Cake', '');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

CREATE TABLE `manufacturer` (
  `man_id` int(11) NOT NULL COMMENT 'Id of distributor',
  `man_name` varchar(25) NOT NULL COMMENT 'Name of distributor',
  `man_email` varchar(40) DEFAULT NULL COMMENT 'Email of distributor',
  `man_phone` varchar(10) DEFAULT NULL COMMENT 'Phone number of distributor',
  `username` varchar(20) NOT NULL COMMENT 'username for login',
  `password` varchar(20) NOT NULL COMMENT 'password of user'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Dispatcher details';

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`man_id`, `man_name`, `man_email`, `man_phone`, `username`, `password`) VALUES
(1, 'Rajesh Mehta', 'rajeshmehta@hotmail.com', '8798665783', 'rajesh123', 'rajesh123'),
(2, 'Suresh Kumar', 'sureshkumar@yahoo.co.in', '9978654690', 'suresh567', '9876584839'),
(3, 'Nishit Shah', 'nishit.shah44@gmail.com', '8000786785', 'nishit44', 'shah456'),
(4, 'Nayan Boghani', 'nayanbh@hotmail.com', '9909087932', 'boghani890', 'nayan567'),
(5, 'Altaf Neva', 'altafneva@gmail.com', '9978112131', 'altafneva', 'myname'),
(6, 'Altaf Husain', 'altafneva@gmail.com', '9978112131', 'altafneva', 'altaf123');

-- --------------------------------------------------------

--
-- Table structure for table `man_invoice`
--

CREATE TABLE `man_invoice` (
  `invoice_id` int(11) NOT NULL COMMENT 'Id of invoice',
  `order_id` int(11) NOT NULL COMMENT 'Id of order'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Invoice of Manufacturing unit';

-- --------------------------------------------------------

--
-- Table structure for table `man_order`
--

CREATE TABLE `man_order` (
  `order_id` int(11) NOT NULL COMMENT 'Id of order',
  `date` date NOT NULL COMMENT 'Date of order placed',
  `retailer_id` int(11) NOT NULL COMMENT 'Id of retailer',
  `status` tinyint(1) NOT NULL,
  `total_amount` decimal(8,2) NOT NULL COMMENT 'Total amount'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Orders at manufacturing units';

--
-- Dumping data for table `man_order`
--

INSERT INTO `man_order` (`order_id`, `date`, `retailer_id`, `status`, `total_amount`) VALUES
(1, '2023-02-26', 1, 0, 974.88),
(2, '2023-02-26', 2, 1, 50.01),
(3, '2023-02-27', 1, 0, 100.02),
(4, '2023-02-27', 1, 0, 118.71),
(5, '2023-02-27', 3, 1, 141.69),
(6, '2023-02-27', 1, 0, 240.00),
(7, '2023-02-27', 1, 0, 132.33),
(8, '2023-02-27', 1, 0, 132.33),
(9, '2023-03-04', 1, 0, 100.02),
(10, '2023-03-04', 1, 0, 100.02),
(11, '2023-03-04', 1, 0, 100.02),
(12, '2023-03-04', 1, 0, 100.02),
(13, '2023-03-04', 1, 0, 50.01),
(14, '2023-03-04', 1, 0, 50.01),
(15, '2023-03-04', 1, 0, 50.01),
(16, '2023-03-04', 1, 0, 1117.42),
(17, '2023-03-04', 1, 0, 150.03),
(18, '2023-03-04', 1, 0, 150.03);

-- --------------------------------------------------------

--
-- Table structure for table `man_order_items`
--

CREATE TABLE `man_order_items` (
  `order_items_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `man_order_items`
--

INSERT INTO `man_order_items` (`order_items_id`, `order_id`, `product_id`, `quantity`) VALUES
(1, 15, 1, 3),
(2, 16, 1, 4),
(3, 16, 2, 10),
(4, 16, 12, 3),
(6, 17, 1, 4),
(7, 17, 2, 5),
(8, 18, 1, 4),
(9, 18, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pro_id` int(11) NOT NULL COMMENT 'Id of product',
  `pro_name` varchar(25) NOT NULL COMMENT 'Name of product',
  `pro_desc` text DEFAULT NULL COMMENT 'Description of the product',
  `pro_price` decimal(10,2) NOT NULL COMMENT 'Price of the product',
  `unit` int(3) NOT NULL COMMENT 'unit of measurement',
  `quantity_in_stock` int(8) NOT NULL COMMENT 'Quantity of the product in stock',
  `pro_cat_id` int(11) NOT NULL COMMENT 'Id of the category of product'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Details of products at manufacturing unit';

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pro_id`, `pro_name`, `pro_desc`, `pro_price`, `unit`, `quantity_in_stock`, `pro_cat_id`) VALUES
(1, 'Butter Puff', '', 16.67, 2, 0, 1),
(2, 'Corn Puff', '', 16.67, 2, 0, 1),
(3, 'Garlic Cheese Roll', '', 39.57, 2, 0, 1),
(4, 'Butter Stuffed Bun', '', 42.00, 2, 0, 1),
(5, 'Paneer Tikka S. Bun', '', 52.50, 2, 0, 1),
(6, 'Burger Bun 4 PCS', '', 42.00, 2, 0, 2),
(7, 'Hot Dog Bun 4 PCS', '', 46.00, 2, 0, 2),
(8, 'Garlic Lauf', '', 47.23, 2, 0, 2),
(9, 'Dabeli Bun 12 PCS', '', 48.54, 2, 0, 2),
(10, 'Pizza Base 4 PCS', '', 35.65, 2, 0, 2),
(11, 'Pizza Sauce', '', 120.00, 1, 0, 9),
(12, 'Sweet Onion Sauce', '', 112.00, 1, 0, 9),
(13, 'Strawberry Cake 1 KG', '', 386.67, 1, 0, 3),
(14, 'Choco Chips Cake 1 KG', '', 480.00, 1, 0, 3),
(15, 'Belgium Cake 1 KG', '', 395.67, 1, 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `retailer`
--

CREATE TABLE `retailer` (
  `retailer_id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `address` varchar(200) NOT NULL,
  `area_code` varchar(25) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `retailer`
--

INSERT INTO `retailer` (`retailer_id`, `username`, `password`, `address`, `area_code`, `phone`, `email`) VALUES
(1, 'rajesh123', 'mrpuff', 'Maninagar', 'MNGR', '9876543456', 'rajesh@mrpuff.in'),
(2, 'suresh567', '2349870', 'New Ranip', 'NRNP', '9044549234', 'suresh@mrpuff.in'),
(3, 'nishit44', 'hey435', 'Vastrapur', 'VTPR', '9898734511', 'nishit44@mrpuff.in'),
(4, 'boghani890', 'nayan12345', 'Nikol', 'NIKL', '8000875643', 'nayan@mrpuff.in');

-- --------------------------------------------------------

--
-- Table structure for table `retailer_invoice`
--

CREATE TABLE `retailer_invoice` (
  `invoice_id` int(11) NOT NULL COMMENT 'Id of invoice',
  `order_id` int(11) NOT NULL COMMENT 'Id of order'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Invoice details at Distribution Unit';

-- --------------------------------------------------------

--
-- Table structure for table `retailer_orders`
--

CREATE TABLE `retailer_orders` (
  `order_id` int(11) NOT NULL COMMENT 'Id of order',
  `order_date` date NOT NULL COMMENT 'Date of order placed',
  `status` varchar(15) NOT NULL COMMENT 'Processing or Completed',
  `pro_id` int(11) NOT NULL COMMENT 'Id of product',
  `amount` decimal(8,2) NOT NULL COMMENT 'Total amount'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Orders at Distribution unit';

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `id` int(3) NOT NULL,
  `unit_name` varchar(30) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id`, `unit_name`, `description`) VALUES
(1, 'KG', 'Kilo gram'),
(2, 'PCS', 'Pieces'),
(3, 'LTR', ''),
(4, 'ML', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`man_id`);

--
-- Indexes for table `man_invoice`
--
ALTER TABLE `man_invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `man_order`
--
ALTER TABLE `man_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `dist_id` (`retailer_id`),
  ADD KEY `retailer_id` (`retailer_id`);

--
-- Indexes for table `man_order_items`
--
ALTER TABLE `man_order_items`
  ADD PRIMARY KEY (`order_items_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pro_id`),
  ADD KEY `pro_cat_id` (`pro_cat_id`);

--
-- Indexes for table `retailer`
--
ALTER TABLE `retailer`
  ADD PRIMARY KEY (`retailer_id`);

--
-- Indexes for table `retailer_invoice`
--
ALTER TABLE `retailer_invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `retailer_orders`
--
ALTER TABLE `retailer_orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `pro_id` (`pro_id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id of Manufacturing unit';

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id of category', AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `manufacturer`
--
ALTER TABLE `manufacturer`
  MODIFY `man_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id of distributor', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `man_invoice`
--
ALTER TABLE `man_invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id of invoice';

--
-- AUTO_INCREMENT for table `man_order`
--
ALTER TABLE `man_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id of order', AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `man_order_items`
--
ALTER TABLE `man_order_items`
  MODIFY `order_items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id of product', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `retailer`
--
ALTER TABLE `retailer`
  MODIFY `retailer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `retailer_invoice`
--
ALTER TABLE `retailer_invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id of invoice';

--
-- AUTO_INCREMENT for table `retailer_orders`
--
ALTER TABLE `retailer_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id of order';

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `man_invoice`
--
ALTER TABLE `man_invoice`
  ADD CONSTRAINT `man_invoice_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `man_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `man_order`
--
ALTER TABLE `man_order`
  ADD CONSTRAINT `man_order_ibfk_1` FOREIGN KEY (`retailer_id`) REFERENCES `retailer` (`retailer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `man_order_items`
--
ALTER TABLE `man_order_items`
  ADD CONSTRAINT `man_order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `man_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `man_order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`pro_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`pro_cat_id`) REFERENCES `categories` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `retailer_invoice`
--
ALTER TABLE `retailer_invoice`
  ADD CONSTRAINT `retailer_invoice_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `retailer_orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `retailer_orders`
--
ALTER TABLE `retailer_orders`
  ADD CONSTRAINT `retailer_orders_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `products` (`pro_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
