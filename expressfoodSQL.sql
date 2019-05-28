-- MySQL Script generated by MySQL Workbench
-- Sun Feb 17 21:05:10 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Expressfood
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Expressfood` ;

-- -----------------------------------------------------
-- Schema Expressfood
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Expressfood` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema sys
-- -----------------------------------------------------
USE `Expressfood` ;

-- -----------------------------------------------------
-- Table `Employer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Employer` ;

CREATE TABLE IF NOT EXISTS `Employer` (
  `employerID` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(20) CHARACTER SET 'utf8' NOT NULL,
  `lastName` VARCHAR(20) CHARACTER SET 'utf8' NOT NULL,
  `mobileNumber` BIGINT NOT NULL,
  PRIMARY KEY (`employerID`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `employerID_UNIQUE` ON `Employer` (`employerID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Shift`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Shift` ;

CREATE TABLE IF NOT EXISTS `Shift` (
  `shiftID` INT NOT NULL AUTO_INCREMENT,
  `dayShift` TINYINT NULL,
  `afternoonShift` TINYINT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`shiftID`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `shiftID_UNIQUE` ON `Shift` (`shiftID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `ShiftSchedule`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ShiftSchedule` ;

CREATE TABLE IF NOT EXISTS `ShiftSchedule` (
  `shiftScheduleID` INT NOT NULL AUTO_INCREMENT,
  `employerID` INT NOT NULL,
  `shiftID` INT NOT NULL,
  PRIMARY KEY (`shiftScheduleID`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `shiftScheduleID_UNIQUE` ON `ShiftSchedule` (`shiftScheduleID` ASC) INVISIBLE;


-- -----------------------------------------------------
-- Table `Locationarea`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Locationarea` ;

CREATE TABLE IF NOT EXISTS `Locationarea` (
  `locationAreaID` INT NOT NULL AUTO_INCREMENT,
  `area` VARCHAR(45) NOT NULL,
  `address` TEXT NOT NULL,
  PRIMARY KEY (`locationAreaID`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `locationAreaID_UNIQUE` ON `Locationarea` (`locationAreaID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Dish`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Dish` ;

CREATE TABLE IF NOT EXISTS `Dish` (
  `dishID` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `dishDayNumber` INT NOT NULL,
  `dishName` VARCHAR(45) NOT NULL,
  `discription` TEXT NOT NULL,
  `price` FLOAT NOT NULL,
  `amount` INT NOT NULL,
  PRIMARY KEY (`dishID`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `dishID_UNIQUE` ON `Dish` (`dishID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Email`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Email` ;

CREATE TABLE IF NOT EXISTS `Email` (
  `emailID` INT NOT NULL AUTO_INCREMENT,
  `emailAddresse` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`emailID`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `emailID_UNIQUE` ON `Email` (`emailID` ASC) VISIBLE;

CREATE UNIQUE INDEX `emailAddresse_UNIQUE` ON `Email` (`emailAddresse` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Customer` ;

CREATE TABLE IF NOT EXISTS `Customer` (
  `customerID` INT NOT NULL,
  `emailID` INT NOT NULL,
  `pwd` CHAR(128) NOT NULL,
  PRIMARY KEY (`customerID`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `costumerID_UNIQUE` ON `Customer` (`customerID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Orders` ;

CREATE TABLE IF NOT EXISTS `Orders` (
  `orderID` INT NOT NULL AUTO_INCREMENT,
  `customerID` INT NOT NULL,
  `dishID` INT NOT NULL,
  `dishOrderAmount` INT NOT NULL,
  `dateOrder` DATETIME NOT NULL,
  PRIMARY KEY (`orderID`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `orderID_UNIQUE` ON `Orders` (`orderID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Delivery`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Delivery` ;

CREATE TABLE IF NOT EXISTS `Delivery` (
  `deliveryID` INT NOT NULL AUTO_INCREMENT,
  `orderID` INT NOT NULL,
  `shiftScheduleID` INT NOT NULL,
  `locationAreaID` INT NOT NULL,
  `startTimeDelivery` TIME NOT NULL,
  `EndTimeDelivery` TIME NOT NULL,
  PRIMARY KEY (`deliveryID`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `deliveryID_UNIQUE` ON `Delivery` (`deliveryID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Address` ;

CREATE TABLE IF NOT EXISTS `Address` (
  `addressID` INT NOT NULL AUTO_INCREMENT,
  `customerID` INT NOT NULL,
  `billAddress` TINYINT NULL,
  `deliveryAddress` TINYINT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `streetNumber` INT NULL,
  `zip` INT NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `mobileNumber` BIGINT NULL,
  PRIMARY KEY (`addressID`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `addressID_UNIQUE` ON `Address` (`addressID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Newsletter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Newsletter` ;

CREATE TABLE IF NOT EXISTS `Newsletter` (
  `newsletterID` INT NOT NULL AUTO_INCREMENT,
  `dateNewsletter` DATE NOT NULL,
  `newsletterContent` TEXT NOT NULL,
  PRIMARY KEY (`newsletterID`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `newsletterID_UNIQUE` ON `Newsletter` (`newsletterID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `SendNewsletter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SendNewsletter` ;

CREATE TABLE IF NOT EXISTS `SendNewsletter` (
  `SendNewsletterID` INT NOT NULL AUTO_INCREMENT,
  `newsletterID` INT NOT NULL,
  `emailID` INT NOT NULL,
  PRIMARY KEY (`SendNewsletterID`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `SendNewsletterID_UNIQUE` ON `SendNewsletter` (`SendNewsletterID` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Employer`
-- -----------------------------------------------------
START TRANSACTION;
USE `Expressfood`;
INSERT INTO `Employer` (`employerID`, `firstName`, `lastName`, `mobileNumber`) VALUES (1, 'Sebastian', 'Smith', 987654321);
INSERT INTO `Employer` (`employerID`, `firstName`, `lastName`, `mobileNumber`) VALUES (2, 'Linda', 'Now', 887654321);
INSERT INTO `Employer` (`employerID`, `firstName`, `lastName`, `mobileNumber`) VALUES (3, 'Carl', 'Tower', 787654321);
INSERT INTO `Employer` (`employerID`, `firstName`, `lastName`, `mobileNumber`) VALUES (4, 'Martin', 'Taylor', 687654321);
INSERT INTO `Employer` (`employerID`, `firstName`, `lastName`, `mobileNumber`) VALUES (5, 'Andreas', 'Brown', 587654321);
INSERT INTO `Employer` (`employerID`, `firstName`, `lastName`, `mobileNumber`) VALUES (6, 'Christina', 'Lawyer', 487654321);
INSERT INTO `Employer` (`employerID`, `firstName`, `lastName`, `mobileNumber`) VALUES (7, 'Mike', 'Brain', 387654321);
INSERT INTO `Employer` (`employerID`, `firstName`, `lastName`, `mobileNumber`) VALUES (8, 'Andre', 'Line', 287654321);
INSERT INTO `Employer` (`employerID`, `firstName`, `lastName`, `mobileNumber`) VALUES (9, 'Nicolas', 'Blue', 187654321);
INSERT INTO `Employer` (`employerID`, `firstName`, `lastName`, `mobileNumber`) VALUES (10, 'Nick', 'Yellow', 117654321);
INSERT INTO `Employer` (`employerID`, `firstName`, `lastName`, `mobileNumber`) VALUES (11, 'Leon', 'Black', 127654321);
INSERT INTO `Employer` (`employerID`, `firstName`, `lastName`, `mobileNumber`) VALUES (12, 'Jonas', 'Grey', 137654321);
INSERT INTO `Employer` (`employerID`, `firstName`, `lastName`, `mobileNumber`) VALUES (13, 'Felix', 'Red', 147654321);
INSERT INTO `Employer` (`employerID`, `firstName`, `lastName`, `mobileNumber`) VALUES (14, 'Philipp', 'Car', 157654321);
INSERT INTO `Employer` (`employerID`, `firstName`, `lastName`, `mobileNumber`) VALUES (15, 'Fabian', 'Sun', 167654321);
INSERT INTO `Employer` (`employerID`, `firstName`, `lastName`, `mobileNumber`) VALUES (16, 'Yannick', 'Ocean', 177654321);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Shift`
-- -----------------------------------------------------
START TRANSACTION;
USE `Expressfood`;
INSERT INTO `Shift` (`shiftID`, `dayShift`, `afternoonShift`, `date`) VALUES (1, 1, 0, '2019-03-01');
INSERT INTO `Shift` (`shiftID`, `dayShift`, `afternoonShift`, `date`) VALUES (2, 0, 1, '2019-03-01');
INSERT INTO `Shift` (`shiftID`, `dayShift`, `afternoonShift`, `date`) VALUES (3, 1, 0, '2019-03-02');
INSERT INTO `Shift` (`shiftID`, `dayShift`, `afternoonShift`, `date`) VALUES (4, 0, 1, '2019-03-02');
INSERT INTO `Shift` (`shiftID`, `dayShift`, `afternoonShift`, `date`) VALUES (5, 1, 0, '2019-03-03');
INSERT INTO `Shift` (`shiftID`, `dayShift`, `afternoonShift`, `date`) VALUES (6, 0, 1, '2019-03-03');

COMMIT;


-- -----------------------------------------------------
-- Data for table `ShiftSchedule`
-- -----------------------------------------------------
START TRANSACTION;
USE `Expressfood`;
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (1, 1, 1);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (2, 2, 1);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (3, 3, 1);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (4, 4, 1);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (5, 5, 1);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (6, 6, 1);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (7, 7, 1);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (8, 8, 1);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (9, 9, 2);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (10, 10, 2);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (11, 11, 2);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (12, 12, 2);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (13, 13, 2);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (14, 14, 2);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (15, 15, 2);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (16, 16, 2);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (17, 17, 3);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (18, 18, 3);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (19, 19, 3);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (20, 20, 3);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (21, 21, 3);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (22, 22, 3);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (23, 23, 3);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (24, 24, 3);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (25, 25, 4);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (26, 26, 4);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (27, 27, 4);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (28, 28, 4);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (29, 29, 4);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (30, 30, 4);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (31, 31, 4);
INSERT INTO `ShiftSchedule` (`shiftScheduleID`, `employerID`, `shiftID`) VALUES (32, 32, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Locationarea`
-- -----------------------------------------------------
START TRANSACTION;
USE `Expressfood`;
INSERT INTO `Locationarea` (`locationAreaID`, `area`, `address`) VALUES (1, 'North', 'North Aberdeen Street; North Ada Street; North Albany Avenue; North Algonquin Avenue; North Allen Avenue; North Anchor Drive; North Armour Street; North Artesian Avenue; North Ashland Avenue; North Ashland Boulevard; North Astor Street; North Austin Avenue; North Austin Boulevard; North Avers Avenue; North Avondale Avenue; North Bay Court; North Beacon Street; North Beaubien Court; North Bell Avenue; North Bernard Street; North Bingham Street; North Bishop Street; North Bissell Street; North Bosworth Avenue; North Bowmanville Avenue; North Broadway; North Burling Street; North Caldwell Avenue; North California Avenue; North Cambridge Avenue; North Campbell Avenue');
INSERT INTO `Locationarea` (`locationAreaID`, `area`, `address`) VALUES (2, 'East', 'East 105th Street; East 106th Street; East 107th Street; East 108th Street; East 109th Street; East 110th Street; East 111th Place; East 111th Street; East 112th Place; East 112th Street; East 113th Street; East 114th Place; East 114th Street; East 115th Street; East 116th Street; East 117th Place; East 117th Street; East 118th Place; East 118th Street; East 119st Street; East 119th Place; East 119th Street; East 120th Place; East 120th Street; East 121st Place; East 121st Street; East 122nd Street; East 123rd Street');
INSERT INTO `Locationarea` (`locationAreaID`, `area`, `address`) VALUES (3, 'South', 'South Charles Street; South China Place; South Christiana Avenue; South Church Street; South Claremont Avenue; South Clinton Street; South Clyde Avenue; South Coles Avenue; South Colfax Avenue; South Columbus Drive; South Commercial Avenue; South Commodove Whalen Drive; South Corbett Street; South Corliss Avenue; South Cornell Avenue; South Cottage Grove Avenue; South Cottage Grove Avenue; South Crandon Avenue; South Cregier Avenue; South Crilly Drive; South Crowell Street; South Cyril Court; South Damen Avenue; South Daniel Drive; South Dauphin Avenue; South Davol Street; South Denvir Avenue; South Desplaines Street; South Dobson Avenue');
INSERT INTO `Locationarea` (`locationAreaID`, `area`, `address`) VALUES (4, 'West', 'West Brodman Avenue; West Brompton Avenue; West Bross Avenue; West Bryn Mawr Avenue; West Buckingham Place; West Buena Avenue; West Burton Place; West Byron Street; West Cabrini Street; West Cahill Terrace; West Calhoun Place; West California Terrace; West Campbell Park Drive; West Carmen Avenue; West Carroll Avenue; West Casteisland Avenue; West Castleisland Avenue; West Castlewood Terrace; West Catalpa Avenue; West Catherine Avenue; West Caton Street; West Charleston Street; West Chelsea Place; West Cherry Street; West Chestnut Street');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Dish`
-- -----------------------------------------------------
START TRANSACTION;
USE `Expressfood`;
INSERT INTO `Dish` (`dishID`, `date`, `dishDayNumber`, `dishName`, `discription`, `price`, `amount`) VALUES (1, '2019-03-01', 1, 'Coleslaw', 'Fine shredded raw cabbage; vinaigrette (acetic acid (vinegar essence) or vinegar, vegetable oil, salt) or mayonnaise and salad cream', 6.80, 988);
INSERT INTO `Dish` (`dishID`, `date`, `dishDayNumber`, `dishName`, `discription`, `price`, `amount`) VALUES (2, '2019-03-01', 2, 'Ema datshi', 'Cheese (cow or yak milk), chili peppers (green, red, or white)', 7.60, 986);
INSERT INTO `Dish` (`dishID`, `date`, `dishDayNumber`, `dishName`, `discription`, `price`, `amount`) VALUES (3, '2019-03-01', 3, 'Angel cake', 'Sponge cake, cream, food colouring', 3.50, 985);
INSERT INTO `Dish` (`dishID`, `date`, `dishDayNumber`, `dishName`, `discription`, `price`, `amount`) VALUES (4, '2019-03-02', 4, 'Apple cake', 'Apple, caramel icing ', 4.20, 993);
INSERT INTO `Dish` (`dishID`, `date`, `dishDayNumber`, `dishName`, `discription`, `price`, `amount`) VALUES (5, '2019-03-02', 1, 'Pasta primavera', 'Pasta, vegetables, soffritto,garlic, olive oil', 6.80, 988);
INSERT INTO `Dish` (`dishID`, `date`, `dishDayNumber`, `dishName`, `discription`, `price`, `amount`) VALUES (6, '2019-03-02', 2, 'Ratatouille', 'Vegetables, tomatoes, onions, courgettes, aubergines, bell peppers, garlic, marjoram, basil', 7.60, 986);
INSERT INTO `Dish` (`dishID`, `date`, `dishDayNumber`, `dishName`, `discription`, `price`, `amount`) VALUES (7, '2019-03-02', 3, 'Banoffee pie', 'pastry base or crumbled biscuits, butter, bananas, cream, toffee', 3.50, 985);
INSERT INTO `Dish` (`dishID`, `date`, `dishDayNumber`, `dishName`, `discription`, `price`, `amount`) VALUES (8, '2019-03-02', 4, 'Carrot cake', 'Flour, eggs, sugar, carrots, almonds and baking powde', 4.20, 996);
INSERT INTO `Dish` (`dishID`, `date`, `dishDayNumber`, `dishName`, `discription`, `price`, `amount`) VALUES (9, '2019-03-03', 1, 'Stuffed squash', 'onions, spices, tomato sauce', 6.80, 1000);
INSERT INTO `Dish` (`dishID`, `date`, `dishDayNumber`, `dishName`, `discription`, `price`, `amount`) VALUES (10, '2019-03-03', 2, 'Sweet potato pie', 'Pie shell, sweet potatoes, milk, sugar, eggs', 7.60, 1000);
INSERT INTO `Dish` (`dishID`, `date`, `dishDayNumber`, `dishName`, `discription`, `price`, `amount`) VALUES (11, '2019-03-03', 3, 'Cobbler', 'batter, biscuit, or pie crust; fruit or savoury filling', 4.20, 1000);
INSERT INTO `Dish` (`dishID`, `date`, `dishDayNumber`, `dishName`, `discription`, `price`, `amount`) VALUES (12, '2019-03-03', 4, 'Blancmange', 'Milk or cream, sugar, gelatin, cornstarch or Irish moss, almonds', 3.50, 1000);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Email`
-- -----------------------------------------------------
START TRANSACTION;
USE `Expressfood`;
INSERT INTO `Email` (`emailID`, `emailAddresse`) VALUES (1, 'tony.morton@gmail.com');
INSERT INTO `Email` (`emailID`, `emailAddresse`) VALUES (2, 'christian.singh@gmail.com');
INSERT INTO `Email` (`emailID`, `emailAddresse`) VALUES (3, 'mary.wang@gmail.com');
INSERT INTO `Email` (`emailID`, `emailAddresse`) VALUES (4, 'mathias.gagnon@gmail.com');
INSERT INTO `Email` (`emailID`, `emailAddresse`) VALUES (5, 'sina.gelbero@gmail.com');
INSERT INTO `Email` (`emailID`, `emailAddresse`) VALUES (6, 'ben.lam@gmail.com');
INSERT INTO `Email` (`emailID`, `emailAddresse`) VALUES (7, 'carmen.kelly@gmail.com');
INSERT INTO `Email` (`emailID`, `emailAddresse`) VALUES (8, 'tina.joney@gmail.com');
INSERT INTO `Email` (`emailID`, `emailAddresse`) VALUES (9, 'miguel.roberts@gmail.com');
INSERT INTO `Email` (`emailID`, `emailAddresse`) VALUES (10, 'stefanie.neill@gmail.com');
INSERT INTO `Email` (`emailID`, `emailAddresse`) VALUES (11, 'sebastian.narrow@gmail.com');
INSERT INTO `Email` (`emailID`, `emailAddresse`) VALUES (12, 'andrea.house@gmail.com');
INSERT INTO `Email` (`emailID`, `emailAddresse`) VALUES (13, 'mike.country@gmail.com');
INSERT INTO `Email` (`emailID`, `emailAddresse`) VALUES (14, 'nanny.row@gmail.com');
INSERT INTO `Email` (`emailID`, `emailAddresse`) VALUES (15, 'flash.lawt@gmail.com');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Customer`
-- -----------------------------------------------------
START TRANSACTION;
USE `Expressfood`;
INSERT INTO `Customer` (`customerID`, `emailID`, `pwd`) VALUES (1, 1, '8180d427fede463e02e3e413b7a4346c');
INSERT INTO `Customer` (`customerID`, `emailID`, `pwd`) VALUES (2, 2, ' aa003842effeadbf5148fd46d6b39d11');
INSERT INTO `Customer` (`customerID`, `emailID`, `pwd`) VALUES (3, 3, '374a7b4378cda2182b83a534e9a073d3');
INSERT INTO `Customer` (`customerID`, `emailID`, `pwd`) VALUES (4, 4, '103fc837b5c6f8879f6316b9f31367bc');
INSERT INTO `Customer` (`customerID`, `emailID`, `pwd`) VALUES (5, 5, '78381cf1c75dbe47fd53f0718e77f305');
INSERT INTO `Customer` (`customerID`, `emailID`, `pwd`) VALUES (6, 6, '6123f610938cca767601bab28d53e92b');
INSERT INTO `Customer` (`customerID`, `emailID`, `pwd`) VALUES (7, 7, 'caada9546f0d243e7e36d1b35d4190ff');
INSERT INTO `Customer` (`customerID`, `emailID`, `pwd`) VALUES (8, 8, 'f58e6055e87b73ff8f65e8af2850aa56');
INSERT INTO `Customer` (`customerID`, `emailID`, `pwd`) VALUES (9, 9, ' b2b098a64fefac48077f932f7436a27c');
INSERT INTO `Customer` (`customerID`, `emailID`, `pwd`) VALUES (10, 10, '662ab9b4a08cce4580fd1558d236bac6');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Orders`
-- -----------------------------------------------------
START TRANSACTION;
USE `Expressfood`;
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (1, 1, 1, 2, '2019-03-01 11:32:22');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (2, 1, 3, 2, '2019-03-01 11:32:22');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (3, 3, 2, 1, '2019-03-01 11:34:01');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (4, 4, 2, 3, '2019-03-01 12:02:33');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (5, 4, 4, 3, '2019-03-01 12:02:33');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (6, 5, 1, 1, '2019-03-01 12:24:49');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (7, 5, 3, 3, '2019-03-01 12:24:49');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (8, 5, 4, 1, '2019-03-01 12:24:49');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (9, 6, 1, 1, '2019-03-01 12:34:14');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (10, 6, 4, 1, '2019-03-01 12:34:14');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (11, 7, 2, 1, '2019-03-01 12:36:19');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (12, 7, 3, 1, '2019-03-01 12:36:19');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (13, 8, 2, 3, '2019-03-01 12:39:47');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (14, 8, 3, 4, '2019-03-01 12:39:47');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (15, 8, 1, 5, '2019-03-01 12:39:47');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (16, 8, 4, 2, '2019-03-01 12:39:47');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (17, 10, 2, 2, '2019-03-01 12:42:36');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (18, 10, 1, 3, '2019-03-01 12:42:36');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (19, 10, 3, 5, '2019-03-01 12:42:36');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (20, 2, 2, 2, '2019-03-01 12:47:56');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (21, 1, 5, 2, '2019-03-02 11:04:01');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (22, 1, 7, 2, '2019-03-02 11:03:01');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (23, 2, 6, 3, '2019-03-02 11:24:50');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (24, 2, 7, 4, '2019-03-02 11:34:01');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (25, 2, 6, 5, '2019-03-02 11:34:01');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (26, 2, 7, 2, '2019-03-02 11:34:01');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (27, 5, 5, 4, '2019-03-02 11:55:41');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (28, 5, 6, 3, '2019-03-02 11:55:41');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (29, 5, 7, 1, '2019-03-02 11:55:41');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (30, 8, 8, 4, '2019-03-02 12:25:18');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (31, 8, 5, 6, '2019-03-02 12:25:18');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (32, 8, 6, 3, '2019-03-02 12:25:18');
INSERT INTO `Orders` (`orderID`, `customerID`, `dishID`, `dishOrderAmount`, `dateOrder`) VALUES (33, 8, 7, 6, '2019-03-02 12:25:18');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Delivery`
-- -----------------------------------------------------
START TRANSACTION;
USE `Expressfood`;
INSERT INTO `Delivery` (`deliveryID`, `orderID`, `shiftScheduleID`, `locationAreaID`, `startTimeDelivery`, `EndTimeDelivery`) VALUES (1, 1, 1, 4, '11:37:00', '12:07:00');
INSERT INTO `Delivery` (`deliveryID`, `orderID`, `shiftScheduleID`, `locationAreaID`, `startTimeDelivery`, `EndTimeDelivery`) VALUES (2, 2, 2, 2, '11:39:00', '12:09:00');
INSERT INTO `Delivery` (`deliveryID`, `orderID`, `shiftScheduleID`, `locationAreaID`, `startTimeDelivery`, `EndTimeDelivery`) VALUES (3, 3, 3, 3, '12:07:00', '12:27:00');
INSERT INTO `Delivery` (`deliveryID`, `orderID`, `shiftScheduleID`, `locationAreaID`, `startTimeDelivery`, `EndTimeDelivery`) VALUES (4, 4, 4, 1, '12:29:00', '12:48:00');
INSERT INTO `Delivery` (`deliveryID`, `orderID`, `shiftScheduleID`, `locationAreaID`, `startTimeDelivery`, `EndTimeDelivery`) VALUES (5, 5, 5, 4, '12:39:00', '12:59:00');
INSERT INTO `Delivery` (`deliveryID`, `orderID`, `shiftScheduleID`, `locationAreaID`, `startTimeDelivery`, `EndTimeDelivery`) VALUES (6, 6, 6, 3, '12:41:00', '01:01:00');
INSERT INTO `Delivery` (`deliveryID`, `orderID`, `shiftScheduleID`, `locationAreaID`, `startTimeDelivery`, `EndTimeDelivery`) VALUES (7, 7, 7, 2, '12:44:00', '01:04:00');
INSERT INTO `Delivery` (`deliveryID`, `orderID`, `shiftScheduleID`, `locationAreaID`, `startTimeDelivery`, `EndTimeDelivery`) VALUES (8, 8, 8, 3, '12:47:00', '01:07:00');
INSERT INTO `Delivery` (`deliveryID`, `orderID`, `shiftScheduleID`, `locationAreaID`, `startTimeDelivery`, `EndTimeDelivery`) VALUES (9, 9, 17, 1, '12:52:00', '01:12:00');
INSERT INTO `Delivery` (`deliveryID`, `orderID`, `shiftScheduleID`, `locationAreaID`, `startTimeDelivery`, `EndTimeDelivery`) VALUES (10, 10, 18, 4, '11:09:00', '11:29:00');
INSERT INTO `Delivery` (`deliveryID`, `orderID`, `shiftScheduleID`, `locationAreaID`, `startTimeDelivery`, `EndTimeDelivery`) VALUES (11, 11, 19, 2, '11:29:00', '11:49:00');
INSERT INTO `Delivery` (`deliveryID`, `orderID`, `shiftScheduleID`, `locationAreaID`, `startTimeDelivery`, `EndTimeDelivery`) VALUES (12, 12, 20, 1, '12:00:00', '12:20:00');
INSERT INTO `Delivery` (`deliveryID`, `orderID`, `shiftScheduleID`, `locationAreaID`, `startTimeDelivery`, `EndTimeDelivery`) VALUES (13, 13, 21, 2, '12:30:00', '12:50:00');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Address`
-- -----------------------------------------------------
START TRANSACTION;
USE `Expressfood`;
INSERT INTO `Address` (`addressID`, `customerID`, `billAddress`, `deliveryAddress`, `firstName`, `lastName`, `street`, `streetNumber`, `zip`, `city`, `mobileNumber`) VALUES (1, 1, 1, 0, 'Tony', 'Morton', 'West Brodman Avenue', 30, 60172, 'Chicago', 100234567);
INSERT INTO `Address` (`addressID`, `customerID`, `billAddress`, `deliveryAddress`, `firstName`, `lastName`, `street`, `streetNumber`, `zip`, `city`, `mobileNumber`) VALUES (2, 1, 0, 1, 'Tony', 'Morton', 'North Aberdeen Street', 7, 60875, 'Chicago', 100234567);
INSERT INTO `Address` (`addressID`, `customerID`, `billAddress`, `deliveryAddress`, `firstName`, `lastName`, `street`, `streetNumber`, `zip`, `city`, `mobileNumber`) VALUES (3, 2, 1, 1, 'Christian', 'Singh', 'East 105th Street', 89, 60458, 'Chicago', 303234567);
INSERT INTO `Address` (`addressID`, `customerID`, `billAddress`, `deliveryAddress`, `firstName`, `lastName`, `street`, `streetNumber`, `zip`, `city`, `mobileNumber`) VALUES (4, 3, 1, 1, 'Mary', 'Wang', 'South Charles Street', 42, 60972, 'Chicago', 404234567);
INSERT INTO `Address` (`addressID`, `customerID`, `billAddress`, `deliveryAddress`, `firstName`, `lastName`, `street`, `streetNumber`, `zip`, `city`, `mobileNumber`) VALUES (5, 4, 1, 0, 'Mathias', 'Gagnon', 'East 106th Street', 105, 60458, 'Chicago', 505234567);
INSERT INTO `Address` (`addressID`, `customerID`, `billAddress`, `deliveryAddress`, `firstName`, `lastName`, `street`, `streetNumber`, `zip`, `city`, `mobileNumber`) VALUES (6, 4, 0, 1, 'Mathias', 'Gagnon', 'West Brompton Avenue', 48, 60172, 'Chicago', 505234567);
INSERT INTO `Address` (`addressID`, `customerID`, `billAddress`, `deliveryAddress`, `firstName`, `lastName`, `street`, `streetNumber`, `zip`, `city`, `mobileNumber`) VALUES (7, 5, 1, 1, 'Sina', 'Gelbero', 'North Ada Street', 30, 60875, 'Chicago', 707234567);
INSERT INTO `Address` (`addressID`, `customerID`, `billAddress`, `deliveryAddress`, `firstName`, `lastName`, `street`, `streetNumber`, `zip`, `city`, `mobileNumber`) VALUES (8, 6, 1, 0, 'Ben', 'Lam', 'East 107th Street', 2, 60458, 'Chicago', 909234567);
INSERT INTO `Address` (`addressID`, `customerID`, `billAddress`, `deliveryAddress`, `firstName`, `lastName`, `street`, `streetNumber`, `zip`, `city`, `mobileNumber`) VALUES (9, 6, 1, 1, 'Ben', 'Lam', 'South Christiana Avenue', 72, 60972, 'Chicago', 909234567);
INSERT INTO `Address` (`addressID`, `customerID`, `billAddress`, `deliveryAddress`, `firstName`, `lastName`, `street`, `streetNumber`, `zip`, `city`, `mobileNumber`) VALUES (10, 7, 1, 1, 'Carmen', 'Kelly', 'South Church Street', 70, 60972, 'Chicago', 110234567);
INSERT INTO `Address` (`addressID`, `customerID`, `billAddress`, `deliveryAddress`, `firstName`, `lastName`, `street`, `streetNumber`, `zip`, `city`, `mobileNumber`) VALUES (11, 8, 1, 1, 'Tina', 'Joney', 'East 108th Street', 5, 60458, 'Chicago', 111234567);
INSERT INTO `Address` (`addressID`, `customerID`, `billAddress`, `deliveryAddress`, `firstName`, `lastName`, `street`, `streetNumber`, `zip`, `city`, `mobileNumber`) VALUES (12, 9, 1, 0, 'Miguel', 'Roberts', 'North Algonquin Avenue', 4, 60875, 'Chicago', 122234567);
INSERT INTO `Address` (`addressID`, `customerID`, `billAddress`, `deliveryAddress`, `firstName`, `lastName`, `street`, `streetNumber`, `zip`, `city`, `mobileNumber`) VALUES (13, 9, 0, 1, 'Miguel', 'Roberts', 'West Bryn Mawr Avenue', 10, 60172, 'Chicago', 122234567);
INSERT INTO `Address` (`addressID`, `customerID`, `billAddress`, `deliveryAddress`, `firstName`, `lastName`, `street`, `streetNumber`, `zip`, `city`, `mobileNumber`) VALUES (14, 10, 1, 1, 'Stefanie', 'Neill', 'South Claremont Avenue', 52, 60972, 'Chicago', 144234567);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Newsletter`
-- -----------------------------------------------------
START TRANSACTION;
USE `Expressfood`;
INSERT INTO `Newsletter` (`newsletterID`, `dateNewsletter`, `newsletterContent`) VALUES (1, '2019-03-01', 'Dishes and desserts for the 1st March 2019 Dishes Name: Coleslaw Description: Fine shredded raw cabbage; vinaigrette (acetic acid (vinegar essence) or vinegar, vegetable oil, salt) or mayonnaise and salad cream Price: $ 6.80 Name: Ema datshi Description: Cheese (cow or yak milk), chili peppers (green, red, or white) Price: $ 7.60 Dessert Name: Angel cake  Description: Sponge cake, cream, food colouring Price:  $ 3.50 Name: Apple cake Description: Apple, caramel icing  Price: $ 4.20');
INSERT INTO `Newsletter` (`newsletterID`, `dateNewsletter`, `newsletterContent`) VALUES (2, '2019-03-02', 'Dishes and desserts for the 2st March 2019 Dishes Name: Coleslaw Description: Fine shredded raw cabbage; vinaigrette (acetic acid (vinegar essence) or vinegar, vegetable oil, salt) or mayonnaise and salad cream Price: $ 6.80 Name: Ema datshi Description: Cheese (cow or yak milk), chili peppers (green, red, or white) Price: $ 7.60 Dessert Name: Angel cake  Description: Sponge cake, cream, food colouring Price:  $ 3.50 Name: Apple cake Description: Apple, caramel icing  Price: $ 4.20');
INSERT INTO `Newsletter` (`newsletterID`, `dateNewsletter`, `newsletterContent`) VALUES (3, '2019-03-03', 'Dishes and desserts for the 3st March 2019 Dishes Name: Coleslaw Description: Fine shredded raw cabbage; vinaigrette (acetic acid (vinegar essence) or vinegar, vegetable oil, salt) or mayonnaise and salad cream Price: $ 6.80 Name: Ema datshi Description: Cheese (cow or yak milk), chili peppers (green, red, or white) Price: $ 7.60 Dessert Name: Angel cake  Description: Sponge cake, cream, food colouring Price:  $ 3.50 Name: Apple cake Description: Apple, caramel icing  Price: $ 4.20');

COMMIT;


-- -----------------------------------------------------
-- Data for table `SendNewsletter`
-- -----------------------------------------------------
START TRANSACTION;
USE `Expressfood`;
INSERT INTO `SendNewsletter` (`SendNewsletterID`, `newsletterID`, `emailID`) VALUES (1, 1, 1);
INSERT INTO `SendNewsletter` (`SendNewsletterID`, `newsletterID`, `emailID`) VALUES (2, 1, 2);
INSERT INTO `SendNewsletter` (`SendNewsletterID`, `newsletterID`, `emailID`) VALUES (3, 1, 5);
INSERT INTO `SendNewsletter` (`SendNewsletterID`, `newsletterID`, `emailID`) VALUES (4, 1, 6);
INSERT INTO `SendNewsletter` (`SendNewsletterID`, `newsletterID`, `emailID`) VALUES (5, 1, 10);
INSERT INTO `SendNewsletter` (`SendNewsletterID`, `newsletterID`, `emailID`) VALUES (6, 1, 11);
INSERT INTO `SendNewsletter` (`SendNewsletterID`, `newsletterID`, `emailID`) VALUES (7, 1, 12);
INSERT INTO `SendNewsletter` (`SendNewsletterID`, `newsletterID`, `emailID`) VALUES (8, 1, 13);
INSERT INTO `SendNewsletter` (`SendNewsletterID`, `newsletterID`, `emailID`) VALUES (9, 1, 14);
INSERT INTO `SendNewsletter` (`SendNewsletterID`, `newsletterID`, `emailID`) VALUES (10, 1, 15);
INSERT INTO `SendNewsletter` (`SendNewsletterID`, `newsletterID`, `emailID`) VALUES (11, 2, 1);
INSERT INTO `SendNewsletter` (`SendNewsletterID`, `newsletterID`, `emailID`) VALUES (12, 2, 2);
INSERT INTO `SendNewsletter` (`SendNewsletterID`, `newsletterID`, `emailID`) VALUES (13, 2, 5);
INSERT INTO `SendNewsletter` (`SendNewsletterID`, `newsletterID`, `emailID`) VALUES (14, 2, 6);
INSERT INTO `SendNewsletter` (`SendNewsletterID`, `newsletterID`, `emailID`) VALUES (15, 2, 10);
INSERT INTO `SendNewsletter` (`SendNewsletterID`, `newsletterID`, `emailID`) VALUES (16, 2, 11);
INSERT INTO `SendNewsletter` (`SendNewsletterID`, `newsletterID`, `emailID`) VALUES (17, 2, 12);
INSERT INTO `SendNewsletter` (`SendNewsletterID`, `newsletterID`, `emailID`) VALUES (18, 2, 13);
INSERT INTO `SendNewsletter` (`SendNewsletterID`, `newsletterID`, `emailID`) VALUES (19, 2, 14);

COMMIT;

