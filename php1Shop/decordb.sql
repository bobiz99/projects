-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2021 at 08:12 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `decordb`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminmenu`
--

CREATE TABLE `adminmenu` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adminmenu`
--

INSERT INTO `adminmenu` (`id`, `name`, `position`) VALUES
(1, 'products', 1),
(2, 'users', 2),
(3, 'brands', 3),
(4, 'genders', 4),
(5, 'menus', 5);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`) VALUES
(1, 'Rolex'),
(2, 'Casio');

-- --------------------------------------------------------

--
-- Table structure for table `galleryimages`
--

CREATE TABLE `galleryimages` (
  `id` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `purpose` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `galleryimages`
--

INSERT INTO `galleryimages` (`id`, `img`, `purpose`, `title`, `description`) VALUES
(1, 'choce_watch1.png', 1, 'Naslov 1', 'Opis 1'),
(2, 'choce_watch2.png', 1, 'Naslov 2', 'Opis 2'),
(3, 'gallery1.png', 2, NULL, NULL),
(4, 'gallery2.png', 2, NULL, NULL),
(5, 'gallery5edit.png', 2, NULL, NULL),
(6, 'gallery6edit.png', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`id`, `name`) VALUES
(1, 'man'),
(2, 'woman');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `privileges` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `position`, `privileges`) VALUES
(1, 'home', 1, 1),
(2, 'shop', 2, 2),
(3, 'about', 3, 1),
(4, 'contact', 4, 1),
(5, 'admin Panel', 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `id_user`, `address`) VALUES
(1, 2, 'Adresa 1'),
(2, 3, 'adresa 3'),
(3, 5, 'adresa2');

-- --------------------------------------------------------

--
-- Table structure for table `paymentoffers`
--

CREATE TABLE `paymentoffers` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `img` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `paymentoffers`
--

INSERT INTO `paymentoffers` (`id`, `name`, `description`, `img`) VALUES
(1, 'Free Shipping Method', 'Neki desc1', 'ti-package'),
(2, 'Secure Payment System', 'Neki desc2', 'ti-unlock'),
(3, 'Cash Back Guarantee', 'Neki desc3', 'ti-reload');

-- --------------------------------------------------------

--
-- Table structure for table `privileges`
--

CREATE TABLE `privileges` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `privileges`
--

INSERT INTO `privileges` (`id`, `name`) VALUES
(1, 'unauthorized user'),
(2, 'authorized user'),
(3, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `old_price` decimal(10,0) DEFAULT NULL,
  `img` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `gender_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `dateofadd` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `old_price`, `img`, `description`, `gender_id`, `brand_id`, `dateofadd`) VALUES
(1, 'Sat 1', '250', '300', 'product1.png', 'Neki opis', 1, 1, '2021-03-07 15:33:26'),
(2, 'Sat 2', '335', '435', 'product2.png', 'neki opis', 2, 1, '2021-03-07 15:33:26'),
(3, 'Sat 3', '325', '456', 'product3.png', 'neki opis ponovo', 1, 2, '2021-03-07 15:33:26'),
(4, 'Sat 4', '355', '435', 'product4.png', 'opisss', 2, 2, '2021-03-07 15:33:26'),
(5, 'Sat 5', '234', '545', 'product5.png', 'Opiscinaaa', 1, 1, '2021-03-07 15:33:26'),
(6, 'Sat 6', '235', '456', 'product6.png', 'Opis nekiii', 2, 2, '2021-03-07 15:33:26'),
(10, 'Sat 7', '234', '456', 'primerSlika.png', 'Neki opis 212', 1, 1, '2021-03-16 15:24:57'),
(11, 'Sat 8', '234', '456', 'product8.png', 'Opis primer', 1, 1, '2021-03-16 15:43:02'),
(12, 'Sat 9', '234', '456', 'product9.png', 'Neki opis', 1, 2, '2021-03-16 16:07:44'),
(13, 'Sat 10', '234', '456', 'americagardens.jpg', 'Neki opis234', 1, 2, '2021-03-16 16:08:32');

-- --------------------------------------------------------

--
-- Table structure for table `products_orders`
--

CREATE TABLE `products_orders` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_orders`
--

INSERT INTO `products_orders` (`id`, `id_product`, `id_order`, `quantity`) VALUES
(1, 1, 1, 3),
(2, 1, 2, 3),
(3, 1, 2, 5),
(4, 1, 3, 2),
(5, 2, 3, 4),
(6, 2, 1, 5),
(7, 2, 1, 6),
(8, 3, 1, 2),
(9, 3, 2, 1),
(10, 4, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `purposes`
--

CREATE TABLE `purposes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purposes`
--

INSERT INTO `purposes` (`id`, `name`) VALUES
(1, 'watchOfChoice'),
(2, 'galleryArea');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `slider_images`
--

CREATE TABLE `slider_images` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `slider_images`
--

INSERT INTO `slider_images` (`id`, `title`, `caption`, `name`) VALUES
(1, 'Select your new perfect style', 'Smisli neki caption', 'sliderImage1.png'),
(2, 'Look fashionable', 'Neki caption 2', 'sliderImage2.png');

-- --------------------------------------------------------

--
-- Table structure for table `socials`
--

CREATE TABLE `socials` (
  `id` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `socials`
--

INSERT INTO `socials` (`id`, `img`, `link`) VALUES
(1, 'fab fa-twitter', 'https://twitter.com/home'),
(2, 'fab fa-facebook-f', 'https://www.facebook.com/'),
(3, 'fab fa-linkedin', 'https://www.linkedin.com/');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `dateofcreation` date NOT NULL,
  `isActive` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `lastname`, `email`, `password`, `role_id`, `code`, `dateofcreation`, `isActive`) VALUES
(1, 'Slobodan', 'Zafirovski', 'szafirovski36@gmail.com', 'df5e8c760f430ff37c1384098bd7e806', 1, '832518dc409dff298f2a933479b4bad08d8ada0f', '2021-03-04', 1),
(2, 'Proba', 'Proba', 'proba@gmail.com', 'abd7911a7b95ee5a74b70c5dbf9cb0cb', 2, '75d06a71744d841c0192cc4144291cb54004168d', '2021-03-04', 1),
(3, 'Test', 'Test', 'test@gmail.com', 'cc03e747a6afbbcbf8be7668acfebee5', 2, 'b395ee22827828fed399030826b9184bf15854fa', '2021-03-04', 1),
(10, 'James', 'Bond', 'bond007@gmail.com', 'df5e8c760f430ff37c1384098bd7e806', 2, 'b033cc4504a0932ba0695e0809ef577e6fc425c2', '2021-03-16', 0),
(12, 'Boba', 'Slobic', 'boba@gmail.com', 'df5e8c760f430ff37c1384098bd7e806', 2, '223392354b86b24243e2a458ea679ecfebd61879', '2021-03-16', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminmenu`
--
ALTER TABLE `adminmenu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galleryimages`
--
ALTER TABLE `galleryimages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purpose` (`purpose`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `privileges` (`privileges`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paymentoffers`
--
ALTER TABLE `paymentoffers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `privileges`
--
ALTER TABLE `privileges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gender_id` (`gender_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indexes for table `products_orders`
--
ALTER TABLE `products_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_order` (`id_order`);

--
-- Indexes for table `purposes`
--
ALTER TABLE `purposes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider_images`
--
ALTER TABLE `slider_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socials`
--
ALTER TABLE `socials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminmenu`
--
ALTER TABLE `adminmenu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `galleryimages`
--
ALTER TABLE `galleryimages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `paymentoffers`
--
ALTER TABLE `paymentoffers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `privileges`
--
ALTER TABLE `privileges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products_orders`
--
ALTER TABLE `products_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `purposes`
--
ALTER TABLE `purposes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `slider_images`
--
ALTER TABLE `slider_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `socials`
--
ALTER TABLE `socials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `galleryimages`
--
ALTER TABLE `galleryimages`
  ADD CONSTRAINT `galleryimages_ibfk_1` FOREIGN KEY (`purpose`) REFERENCES `purposes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`privileges`) REFERENCES `privileges` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products_orders`
--
ALTER TABLE `products_orders`
  ADD CONSTRAINT `products_orders_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_orders_ibfk_2` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
