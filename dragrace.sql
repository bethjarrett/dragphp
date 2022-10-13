--
-- Database: `BethJarrett`
-- N01535192
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `FindMaxiResult`$$
CREATE PROCEDURE `FindMaxiResult` (IN `maxi_challenge` VARCHAR(100), IN `maxi_result` INT)  READS SQL DATA
SELECT contestant.contestant_name, result.maxi_result, maxichallenge.maxi_challenge
FROM contestant 
JOIN result 
ON contestant.contestant_id = result.contestant_id
JOIN episodechallenge
ON result.episode_id = episodechallenge.episode
JOIN maxichallenge
ON episodechallenge.maxi = maxichallenge.maxi_id
WHERE maxichallenge.maxi_challenge = maxi_challenge AND result.maxi_result = maxi_result$$

DROP PROCEDURE IF EXISTS `FindMiniResult`$$
CREATE PROCEDURE `FindMiniResult` (IN `mini_challenge` VARCHAR(100)) 
SELECT contestant.contestant_name, result.mini_result, minichallenge.mini_challenge
FROM contestant 
JOIN result 
ON contestant.contestant_id = result.contestant_id
JOIN episodechallenge
ON result.episode_id = episodechallenge.episode
JOIN minichallenge
ON episodechallenge.mini = minichallenge.mini_id
where result.mini_result = 1 and minichallenge.mini_challenge = mini_challenge$$

DROP PROCEDURE IF EXISTS `Over30WinsCount`$$
CREATE PROCEDURE `Over30WinsCount` ()
SELECT `over_30_wins`.`contestant_age` AS `contestant_age`,count(0) AS `count(*)` 
FROM `over_30_wins`
GROUP by `over_30_wins`.`contestant_age`$$

DROP PROCEDURE IF EXISTS `CityWinsCount`$$
CREATE PROCEDURE `CityWinsCount` ()  
SELECT `city_wins`.`location_city` AS `location_city`,count(0) AS `count(*)`
FROM `city_wins`
GROUP BY `city_wins`.`location_city`$$

DELIMITER ;

--
-- Table structure for table `contestant`
--

DROP TABLE IF EXISTS `contestant`;
CREATE TABLE `contestant` (
  `contestant_id` int(11) NOT NULL,
  `contestant_season` int(11) NOT NULL,
  `contestant_name` varchar(60) NOT NULL,
  `contestant_age` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contestant`
--

INSERT INTO `contestant` (`contestant_id`, `contestant_season`, `contestant_name`, `contestant_age`) VALUES
(1, 1, 'Priyanka', 28),
(2, 1, 'Rita Baga', 32),
(3, 1, 'Scarlett BoBo', 29),
(4, 1, 'Jimbo', 36),
(5, 1, 'Lemon', 23),
(6, 1, 'Ilona Verley', 24),
(7, 1, 'BOA', 24),
(8, 1, 'Kiara', 22),
(9, 1, 'Tynomi Banks', 38),
(10, 1, 'Anastarzia Anaquway', 37),
(11, 1, 'Kyne', 21),
(12, 1, 'Juice Boxx', 31),
(13, 2, 'Icesis Couture', 34),
(14, 2, 'Kendall Gender', 30),
(15, 2, 'Pythia', 26),
(16, 2, 'Gia Metric', 29),
(17, 2, 'Adriana', 29),
(18, 2, 'Kimora Amour', 34),
(19, 2, 'Synthia Kiss', 29),
(20, 2, 'Eve 6000', 29),
(21, 2, 'Suki Doll', 27),
(22, 2, 'Stephanie Prince', 24),
(23, 2, 'Oceane Aqua-Black', 35),
(24, 2, 'Beth', 24);

-- --------------------------------------------------------

--
-- Table structure for table `contestantxlocation`
--

DROP TABLE IF EXISTS `contestantxlocation`;
CREATE TABLE `contestantxlocation` (
  `conloc_id` int(11) NOT NULL,
  `contestant_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contestantxlocation`
--

INSERT INTO `contestantxlocation` (`conloc_id`, `contestant_id`, `location_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 4, 3),
(5, 5, 1),
(6, 6, 4),
(7, 7, 5),
(8, 8, 2),
(9, 9, 1),
(10, 10, 1),
(11, 11, 6),
(12, 12, 5),
(13, 13, 7),
(14, 14, 4),
(15, 15, 2),
(16, 16, 4),
(17, 17, 8),
(18, 18, 1),
(19, 19, 4),
(20, 20, 1),
(21, 21, 2),
(22, 22, 9),
(23, 23, 8),
(24, 24, 4);

-- --------------------------------------------------------

--
-- Table structure for table `episodechallenge`
--

DROP TABLE IF EXISTS `episodechallenge`;
CREATE TABLE `episodechallenge` (
  `epchall_id` int(11) NOT NULL,
  `season` int(11) DEFAULT NULL,
  `episode` int(11) DEFAULT NULL,
  `mini` int(11) DEFAULT NULL,
  `maxi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `episodechallenge`
--

INSERT INTO `episodechallenge` (`epchall_id`, `season`, `episode`, `mini`, `maxi`) VALUES
(1, 1, 1, 1, 1),
(2, 1, 2, 2, 2),
(3, 1, 3, 2, 3),
(4, 1, 4, 3, 1),
(5, 1, 5, 4, 4),
(6, 1, 6, 2, 5),
(7, 1, 7, NULL, 6),
(8, 1, 8, 5, 7),
(9, 1, 9, 6, 8),
(10, 1, 10, NULL, 9),
(11, 2, 11, 1, 1),
(12, 2, 12, 2, 10),
(13, 2, 13, NULL, 2),
(14, 2, 14, 4, 4),
(15, 2, 15, 2, 3),
(16, 2, 16, 7, 8),
(17, 2, 17, 4, 11),
(18, 2, 18, NULL, 7),
(19, 2, 19, NULL, 12),
(20, 2, 20, NULL, 9);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
CREATE TABLE `location` (
  `location_id` int(11) NOT NULL,
  `location_city` varchar(100) DEFAULT NULL,
  `location_prov` varchar(100) DEFAULT NULL,
  `location_reg` varchar(100) DEFAULT NULL,
  `location_lang` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `location_city`, `location_prov`, `location_reg`, `location_lang`) VALUES
(1, 'Toronto', 'ON', 'Central', 'English'),
(2, 'Montreal', 'QC', 'Central', 'French'),
(3, 'Victoria', 'BC', 'Pacific', 'English'),
(4, 'Vancouver', 'BC', 'Pacific', 'English'),
(5, 'Windsor', 'ON', 'Central', 'English'),
(6, 'Kitchener-Waterloo', 'ON', 'Central', 'English'),
(7, 'Ottawa', 'ON', 'Central', 'English'),
(8, 'Quebec City', 'QC', 'Central', 'French'),
(9, 'Calgary', 'AB', 'Prairie', 'English');

-- --------------------------------------------------------

--
-- Table structure for table `maxichallenge`
--

DROP TABLE IF EXISTS `maxichallenge`;
CREATE TABLE `maxichallenge` (
  `maxi_id` int(11) NOT NULL,
  `maxi_challenge` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `maxichallenge`
--

INSERT INTO `maxichallenge` (`maxi_id`, `maxi_challenge`) VALUES
(1, 'design'),
(2, 'acting'),
(3, 'singing, dancing'),
(4, 'snatch game'),
(5, 'comedy'),
(6, 'improv'),
(7, 'makeover'),
(8, 'ball'),
(9, 'remix'),
(10, 'Rusical'),
(11, 'roast'),
(12, 'lip sync');

-- --------------------------------------------------------

--
-- Table structure for table `minichallenge`
--

DROP TABLE IF EXISTS `minichallenge`;
CREATE TABLE `minichallenge` (
  `mini_id` int(11) NOT NULL,
  `mini_challenge` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `minichallenge`
--

INSERT INTO `minichallenge` (`mini_id`, `mini_challenge`) VALUES
(1, 'photoshoot'),
(2, 'quick drag, acting'),
(3, 'memory game'),
(4, 'reading'),
(5, 'puppets'),
(6, 'singing'),
(7, 'art');

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
CREATE TABLE `result` (
  `result_id` int(11) NOT NULL,
  `contestant_id` int(11) DEFAULT NULL,
  `episode_id` int(11) DEFAULT NULL,
  `mini_result` int(11) DEFAULT NULL,
  `maxi_result` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`result_id`, `contestant_id`, `episode_id`, `mini_result`, `maxi_result`) VALUES
(1, 12, 1, NULL, 0),
(2, 5, 1, NULL, 1),
(3, 11, 1, 1, 2),
(4, 7, 1, NULL, 3),
(5, 4, 1, NULL, 4),
(6, 2, 1, NULL, 5),
(7, 11, 2, NULL, 0),
(8, 9, 2, NULL, 1),
(9, 7, 2, 1, 2),
(10, 10, 2, 1, NULL),
(11, 4, 2, NULL, 3),
(12, 1, 2, NULL, 4),
(13, 5, 2, NULL, 5),
(14, 10, 3, NULL, 0),
(15, 9, 3, NULL, 1),
(16, 6, 3, NULL, 2),
(17, 7, 3, NULL, 3),
(18, 3, 3, NULL, 4),
(19, 1, 3, 1, 5),
(20, 5, 3, 1, NULL),
(21, 9, 4, NULL, 0),
(22, 6, 4, NULL, 1),
(23, 4, 4, 1, 2),
(24, 5, 4, NULL, 3),
(25, 1, 4, NULL, 4),
(26, 2, 4, NULL, 5),
(27, 8, 5, NULL, 0),
(28, 1, 5, NULL, 1),
(29, 7, 5, NULL, 2),
(30, 5, 5, 1, 3),
(31, 2, 5, NULL, 4),
(32, 4, 5, NULL, 5),
(33, 7, 6, NULL, 0),
(34, 6, 6, NULL, 1),
(35, 5, 6, 1, 2),
(36, 4, 6, NULL, 3),
(37, 3, 6, NULL, 4),
(38, 2, 6, NULL, 5),
(39, 6, 7, NULL, 0),
(40, 1, 7, NULL, 1),
(41, 4, 7, NULL, 2),
(42, 2, 7, NULL, 3),
(43, 3, 7, NULL, 4),
(44, 5, 7, NULL, 5),
(45, 5, 8, NULL, 0),
(46, 2, 8, NULL, 1),
(47, 4, 8, NULL, 2),
(48, 3, 8, 1, 4),
(49, 1, 8, NULL, 5),
(50, 4, 9, NULL, 0),
(51, 2, 9, 1, 1),
(52, 1, 9, NULL, 4),
(53, 3, 9, NULL, 5),
(54, 3, 10, NULL, 3),
(55, 2, 10, NULL, 4),
(56, 1, 10, NULL, 5),
(57, 24, 11, NULL, 0),
(58, 16, 11, NULL, 1),
(59, 20, 11, NULL, 2),
(60, 22, 11, NULL, 3),
(61, 21, 11, 1, 4),
(62, 13, 11, NULL, 5),
(63, 23, 12, 1, 0),
(64, 13, 12, NULL, 1),
(65, 20, 12, NULL, 2),
(66, 16, 12, NULL, 3),
(67, 14, 12, NULL, 4),
(68, 15, 12, NULL, 5),
(69, 22, 13, NULL, 0),
(70, 19, 13, NULL, 1),
(71, 14, 13, NULL, 2),
(72, 20, 13, NULL, 3),
(73, 16, 13, NULL, 4),
(74, 17, 13, NULL, 5),
(75, 21, 14, NULL, 0),
(76, 20, 14, NULL, 1),
(77, 17, 14, NULL, 2),
(78, 15, 14, NULL, 3),
(79, 18, 14, NULL, 4),
(80, 19, 14, NULL, 5),
(81, 13, 14, 1, NULL),
(82, 20, 15, NULL, 0),
(83, 19, 15, 1, 1),
(84, 14, 15, NULL, 2),
(85, 15, 15, NULL, 4),
(86, 13, 15, NULL, 4),
(87, 17, 15, NULL, 4),
(88, 16, 15, 1, 5),
(89, 19, 16, NULL, 0),
(90, 14, 16, NULL, 1),
(91, 17, 16, NULL, 2),
(92, 16, 16, NULL, 3),
(93, 18, 16, NULL, 4),
(94, 13, 16, 1, 5),
(95, 18, 17, NULL, 0),
(96, 16, 17, NULL, 1),
(97, 13, 17, NULL, 4),
(98, 14, 17, 1, 5),
(99, 17, 18, NULL, 0),
(100, 13, 18, NULL, 1),
(101, 14, 18, NULL, 2),
(102, 16, 18, NULL, 4),
(103, 15, 18, NULL, 5),
(104, 16, 19, NULL, 0),
(105, 15, 19, NULL, 1),
(106, 14, 19, NULL, 5),
(107, 13, 19, NULL, 5),
(108, 15, 20, NULL, 0),
(109, 14, 20, NULL, 0),
(110, 13, 20, NULL, 5);

-- --------------------------------------------------------

--
-- Structure for view `city_wins`
--
CREATE VIEW `city_wins`  AS  
SELECT `contestant`.`contestant_name` AS `contestant_name`,`location`.`location_city` AS `location_city`,`result`.`maxi_result` AS `maxi_result`
FROM (((`location` 
JOIN `contestantxlocation` 
ON ((`contestantxlocation`.`location_id` = `location`.`location_id`)))
JOIN `contestant` 
ON ((`contestant`.`contestant_id` = `contestantxlocation`.`contestant_id`))) 
JOIN `result` 
ON ((`contestant`.`contestant_id` = `result`.`contestant_id`))) 
WHERE (`result`.`maxi_result` = 5) 
ORDER BY `location`.`location_city` ;

-- --------------------------------------------------------

--
-- Structure for view `over_30_wins`
--
CREATE VIEW `over_30_wins`  AS  
SELECT `contestant`.`contestant_name` AS `contestant_name`,`contestant`.`contestant_age` AS `contestant_age`,`result`.`maxi_result` AS `maxi_result`
FROM (`contestant` 
JOIN `result` 
ON ((`contestant`.`contestant_id` = `result`.`contestant_id`)))
WHERE ((`contestant`.`contestant_age` >= 30) AND (`result`.`maxi_result` = 5)) 
ORDER by `contestant`.`contestant_age` ;

--
-- Indexes for table `contestant`
--
ALTER TABLE `contestant`
  ADD PRIMARY KEY (`contestant_id`);

--
-- Indexes for table `contestantxlocation`
--
ALTER TABLE `contestantxlocation`
  ADD PRIMARY KEY (`conloc_id`),
  ADD KEY `foreign key contestant` (`contestant_id`),
  ADD KEY `foreign key location` (`location_id`);

--
-- Indexes for table `episodechallenge`
--
ALTER TABLE `episodechallenge`
  ADD PRIMARY KEY (`epchall_id`),
  ADD KEY `foreign key mini` (`mini`),
  ADD KEY `foreign key maxi` (`maxi`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `maxichallenge`
--
ALTER TABLE `maxichallenge`
  ADD PRIMARY KEY (`maxi_id`);

--
-- Indexes for table `minichallenge`
--
ALTER TABLE `minichallenge`
  ADD PRIMARY KEY (`mini_id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`result_id`),
  ADD KEY `foreign key contestant result` (`contestant_id`),
  ADD KEY `foreign key episode` (`episode_id`);

--
-- AUTO_INCREMENT for table `contestantxlocation`
--
ALTER TABLE `contestantxlocation`
  MODIFY `conloc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `episodechallenge`
--
ALTER TABLE `episodechallenge`
  MODIFY `epchall_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `maxichallenge`
--
ALTER TABLE `maxichallenge`
  MODIFY `maxi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `minichallenge`
--
ALTER TABLE `minichallenge`
  MODIFY `mini_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- Constraints for table `contestantxlocation`
--
ALTER TABLE `contestantxlocation`
  ADD CONSTRAINT `foreign key contestant` FOREIGN KEY (`contestant_id`) REFERENCES `contestant` (`contestant_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `foreign key location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON DELETE SET NULL;

--
-- Constraints for table `episodechallenge`
--
ALTER TABLE `episodechallenge`
  ADD CONSTRAINT `foreign key maxi` FOREIGN KEY (`maxi`) REFERENCES `maxichallenge` (`maxi_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `foreign key mini` FOREIGN KEY (`mini`) REFERENCES `minichallenge` (`mini_id`) ON DELETE SET NULL;

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `foreign key contestant result` FOREIGN KEY (`contestant_id`) REFERENCES `contestant` (`contestant_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `foreign key episode` FOREIGN KEY (`episode_id`) REFERENCES `episodechallenge` (`epchall_id`) ON DELETE SET NULL;
