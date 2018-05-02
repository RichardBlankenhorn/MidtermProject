-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema beerdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `beerdb` ;

-- -----------------------------------------------------
-- Schema beerdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `beerdb` DEFAULT CHARACTER SET utf8 ;
USE `beerdb` ;

-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `latitude` DOUBLE NULL,
  `longitude` DOUBLE NULL,
  `street` VARCHAR(50) NULL,
  `street2` VARCHAR(50) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `zip` VARCHAR(10) NULL,
  `phone` VARCHAR(20) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `brewery`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `brewery` ;

CREATE TABLE IF NOT EXISTS `brewery` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `web_url` VARCHAR(100) NULL,
  `address_id` INT NOT NULL,
  `name` VARCHAR(50) NULL,
  `description` VARCHAR(500) NULL,
  `rating` INT NULL,
  `img_url` VARCHAR(100) NULL,
  PRIMARY KEY (`id`),
  INDEX `address_id_idx` (`address_id` ASC),
  CONSTRAINT `fk_brewery_address_id`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `beer` ;

CREATE TABLE IF NOT EXISTS `beer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `cost` DOUBLE NULL,
  `abv` DOUBLE NULL,
  `description` VARCHAR(500) NULL,
  `brewery_id` INT NULL,
  `img_url` VARCHAR(100) NULL,
  `category_id` INT NULL,
  `ibu` DOUBLE NULL,
  `rating` INT UNSIGNED NULL,
  PRIMARY KEY (`id`),
  INDEX `category_id_idx` (`category_id` ASC),
  INDEX `fk_beer_brewery_id_idx` (`brewery_id` ASC),
  CONSTRAINT `fk_beer_category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_beer_brewery_id`
    FOREIGN KEY (`brewery_id`)
    REFERENCES `brewery` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `admin` TINYINT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `profile` ;

CREATE TABLE IF NOT EXISTS `profile` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(100) NOT NULL,
  `user_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC),
  CONSTRAINT `fk_profile_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beer_comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `beer_comments` ;

CREATE TABLE IF NOT EXISTS `beer_comments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `beer_id` INT NOT NULL,
  `description` VARCHAR(500) NULL,
  `date_time` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC),
  INDEX `beer_id_idx` (`beer_id` ASC),
  CONSTRAINT `fk_beer_comments_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_beer_comments_beer_id`
    FOREIGN KEY (`beer_id`)
    REFERENCES `beer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `brewery_comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `brewery_comments` ;

CREATE TABLE IF NOT EXISTS `brewery_comments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(500) NOT NULL,
  `user_id` INT NOT NULL,
  `brewery_id` INT NOT NULL,
  `date_time` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `brewery_id_idx` (`brewery_id` ASC),
  INDEX `user_id_idx` (`user_id` ASC),
  CONSTRAINT `fk_brewery_comments_brewery_id`
    FOREIGN KEY (`brewery_id`)
    REFERENCES `brewery` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_brewery_comments_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beer_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `beer_rating` ;

CREATE TABLE IF NOT EXISTS `beer_rating` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rating` INT UNSIGNED NULL,
  `user_id` INT NOT NULL,
  `beer_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `beer_id_idx` (`beer_id` ASC),
  INDEX `user_id_idx` (`user_id` ASC),
  CONSTRAINT `fk_beer_rating_beer_id`
    FOREIGN KEY (`beer_id`)
    REFERENCES `beer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_beer_rating_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `brewery_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `brewery_rating` ;

CREATE TABLE IF NOT EXISTS `brewery_rating` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL,
  `brewery_id` INT NULL,
  `rating` INT UNSIGNED NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC),
  INDEX `brewery_id_idx` (`brewery_id` ASC),
  CONSTRAINT `fk_brewery_rating_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_brewery_rating_brewery_id`
    FOREIGN KEY (`brewery_id`)
    REFERENCES `brewery` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO user@localhost;
 DROP USER user@localhost;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'user'@'localhost' IDENTIFIED BY 'beerisgood!#%';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'user'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerdb`;
INSERT INTO `category` (`id`, `name`) VALUES (1, 'IPA');
INSERT INTO `category` (`id`, `name`) VALUES (2, 'Double IPA');
INSERT INTO `category` (`id`, `name`) VALUES (3, 'Triple IPA');
INSERT INTO `category` (`id`, `name`) VALUES (4, 'Rye IPA');
INSERT INTO `category` (`id`, `name`) VALUES (5, 'Porter');
INSERT INTO `category` (`id`, `name`) VALUES (6, 'Stout');
INSERT INTO `category` (`id`, `name`) VALUES (7, 'Pale Ale');
INSERT INTO `category` (`id`, `name`) VALUES (8, 'Amber Ale');
INSERT INTO `category` (`id`, `name`) VALUES (9, 'Lager');
INSERT INTO `category` (`id`, `name`) VALUES (10, 'Imperial Stout');
INSERT INTO `category` (`id`, `name`) VALUES (11, 'Pilsner');
INSERT INTO `category` (`id`, `name`) VALUES (12, 'Wheat Beer');
INSERT INTO `category` (`id`, `name`) VALUES (13, 'Saison');
INSERT INTO `category` (`id`, `name`) VALUES (14, 'Sour');
INSERT INTO `category` (`id`, `name`) VALUES (15, 'Blonde');
INSERT INTO `category` (`id`, `name`) VALUES (16, 'India Pale Ale');
INSERT INTO `category` (`id`, `name`) VALUES (17, 'Brown Ale');
INSERT INTO `category` (`id`, `name`) VALUES (18, 'Red Ale');
INSERT INTO `category` (`id`, `name`) VALUES (19, 'Scotch Ale');
INSERT INTO `category` (`id`, `name`) VALUES (20, 'Farmhouse Ale');
INSERT INTO `category` (`id`, `name`) VALUES (21, 'Imperial IPA');
INSERT INTO `category` (`id`, `name`) VALUES (22, 'Barleywine');
INSERT INTO `category` (`id`, `name`) VALUES (23, 'Kolsch');
INSERT INTO `category` (`id`, `name`) VALUES (24, 'Helles');
INSERT INTO `category` (`id`, `name`) VALUES (25, 'New England IPA');
INSERT INTO `category` (`id`, `name`) VALUES (26, 'Schwarzbier');
INSERT INTO `category` (`id`, `name`) VALUES (27, 'Scottish Ale');
INSERT INTO `category` (`id`, `name`) VALUES (28, 'Cream Ale');

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerdb`;
INSERT INTO `address` (`id`, `latitude`, `longitude`, `street`, `street2`, `city`, `state`, `zip`, `phone`) VALUES (1, 39.652665, -104.81204, '15120 E Hampden Ave', '', 'Aurora', 'CO', '80014', '303-400-5606');
INSERT INTO `address` (`id`, `latitude`, `longitude`, `street`, `street2`, `city`, `state`, `zip`, `phone`) VALUES (2, 39.730621, -104.999277, '925 W 9th Ave', '', 'Denver', 'CO', '80204', '720-401-4089');
INSERT INTO `address` (`id`, `latitude`, `longitude`, `street`, `street2`, `city`, `state`, `zip`, `phone`) VALUES (3, 39.761486, -104.981076, '2920 Larimer St', '', 'Denver', 'CO', '80205', '303-997-8288');
INSERT INTO `address` (`id`, `latitude`, `longitude`, `street`, `street2`, `city`, `state`, `zip`, `phone`) VALUES (4, 39.737351, -105.015661, '1330 Zuni Street, Unit M', '', 'Denver', 'CO', '80204', '720-985-2337');
INSERT INTO `address` (`id`, `latitude`, `longitude`, `street`, `street2`, `city`, `state`, `zip`, `phone`) VALUES (5, 39.761438, -105.0067, '2540 19th Street', '', 'Denver', 'CO', '80211', '303-729-1175');
INSERT INTO `address` (`id`, `latitude`, `longitude`, `street`, `street2`, `city`, `state`, `zip`, `phone`) VALUES (6, 39.740381, -104.905731, '7101 E Colfax Ave', '', 'Denver', 'CO', '80220', '720-456-7163');
INSERT INTO `address` (`id`, `latitude`, `longitude`, `street`, `street2`, `city`, `state`, `zip`, `phone`) VALUES (7, 39.679752, -104.990775, '2030 S Cherokee Street', '', 'Denver', 'CO', '80223', '303-955-7410');
INSERT INTO `address` (`id`, `latitude`, `longitude`, `street`, `street2`, `city`, `state`, `zip`, `phone`) VALUES (8, 39.682566, -104.980782, '1875 S Pearl Street', '', 'Denver', 'CO', '80210', '303-993-4002');
INSERT INTO `address` (`id`, `latitude`, `longitude`, `street`, `street2`, `city`, `state`, `zip`, `phone`) VALUES (9, 39.771248, -104.97973, '3501 Delgany Street', '', 'Denver', 'CO', '80216', '303-953-2058');

COMMIT;


-- -----------------------------------------------------
-- Data for table `brewery`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerdb`;
INSERT INTO `brewery` (`id`, `web_url`, `address_id`, `name`, `description`, `rating`, `img_url`) VALUES (1, 'https://drydockbrewing.com/', 1, 'Dry Dock', 'Brewery', 5, 'https://s3-media3.fl.yelpcdn.com/bphoto/6b5wc6ZTWASVk5sH70M3hQ/o.jpg');
INSERT INTO `brewery` (`id`, `web_url`, `address_id`, `name`, `description`, `rating`, `img_url`) VALUES (2, 'http://renegadebrewing.com/', 2, 'Renegade', 'Brewery', 5, 'https://s3-media2.fl.yelpcdn.com/bphoto/qCN5EC2LuAWXEWkQtth8oA/o.jpg');
INSERT INTO `brewery` (`id`, `web_url`, `address_id`, `name`, `description`, `rating`, `img_url`) VALUES (3, 'http://ratiobeerworks.com/', 3, 'Ratio Beerworks', 'Brewery', 5, 'https://s3-media1.fl.yelpcdn.com/bphoto/nSb83C9eQTrPKdtHac-H6A/o.jpg');
INSERT INTO `brewery` (`id`, `web_url`, `address_id`, `name`, `description`, `rating`, `img_url`) VALUES (4, 'http://strangecraft.com/', 4, 'Strange Craft', 'Brewery', 5, 'https://s3-media2.fl.yelpcdn.com/bphoto/f13ZvDTyWgUdOe_dUujtjw/o.jpg');
INSERT INTO `brewery` (`id`, `web_url`, `address_id`, `name`, `description`, `rating`, `img_url`) VALUES (5, 'https://prostbrewing.com/', 5, 'Prost', 'Brewery', 5, 'https://s3-media4.fl.yelpcdn.com/bphoto/6glcwwsoCTa_attxKIb1xQ/o.jpg');
INSERT INTO `brewery` (`id`, `web_url`, `address_id`, `name`, `description`, `rating`, `img_url`) VALUES (6, 'http://www.fictionbeer.com/', 6, 'Fiction', 'Brewery', 5, 'https://s3-media2.fl.yelpcdn.com/bphoto/3s-G6u9f3jbkmUGnrQXupQ/o.jpg');
INSERT INTO `brewery` (`id`, `web_url`, `address_id`, `name`, `description`, `rating`, `img_url`) VALUES (7, 'https://www.declarationbrewing.com/', 7, 'Declaration', 'Brewery', 5, 'https://s3-media2.fl.yelpcdn.com/bphoto/GatejP-5M3Sjl3AJImPmdw/o.jpg');
INSERT INTO `brewery` (`id`, `web_url`, `address_id`, `name`, `description`, `rating`, `img_url`) VALUES (8, 'http://www.plattparkbrewing.com/', 8, 'Platt Park', 'Brewery', 5, 'https://s3-media2.fl.yelpcdn.com/bphoto/qWT_FAoYjZ5XbwGIlYTkuA/o.jpg');
INSERT INTO `brewery` (`id`, `web_url`, `address_id`, `name`, `description`, `rating`, `img_url`) VALUES (9, 'http://mockerybrewing.com/', 9, 'Mockery', 'Brewery', 5, 'http://www.mockerybrewing.com/assets/images/slider/1000-8227.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `beer`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerdb`;
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (1, 'Apricot Blonde', 6, 5.1, 'A misty golden blonde ale fermented with shiploads of fruit.', 1, '', 15, 17, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (2, 'Sour Apricot', 6, 5.1, 'This beer strikes an elegant balance of soure and sweet.  Refreshingly tart and fruity with bright effervescence.', 1, '', 14, 17, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (3, 'Dry Dock IPA', 6, 7, 'Bold IPA with hints of mango, pear and citrus aroma', 1, '', 1, 60, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (4, 'Hop Abomination IPA', 6, 6.5, 'A warship of an IPA. Massive amounts of floral, citrus and tropical hop flavors.', 1, '', 1, 70, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (5, 'Grapefruit Double IPA', 6, 9, 'Hoppy citrus and pine intertwined with grapefruit', 1, '', 2, 90, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (6, 'Amber Ale', 6, 5.8, 'Earthy hop flavor and just enough bitterness', 1, '', 8, 49, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (7, 'Vanilla Porter', 6, 5.4, 'A brown porter with a generous dose of real vanilla beans with a smooth rich flavor.', 1, '', 5, 33, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (8, 'Hopricot', 6, 5.8, 'Blend one part Apricot Blonde and one part Hop Abomination that is slightly sweet and subtly hopped.', 1, '', 1, 44, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (9, '1916 Colorado Lager', 6, 4.5, 'The 1916 Colorado Lager is designed to be similar to the beer that would have been available in Denver around the time of Colorado prohibition. Base Dortmund Beer.', 2, '', 9, 25, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (10, 'Consilium Pale Ale', 6, 5, 'Pale Ale brewed with Oats, Lactose and Orange Peel.', 2, '', 7, 40, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (11, 'Endpoint Triple IPA', 6, 11.2, 'Summit hops brings on aromas of papaya, mango and tropical fruits, while creating a clean herbaceous finish.', 2, '', 3, 100, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (12, 'Runaway IPA', 6, 6, 'A west coast IPA with citrus and grapfrit notes on the nose, you get a small amount of pine coming through on the back palate.', 2, '', 1, 70, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (13, 'Redacted Rye IPA', 6, 7, 'Brewed with 20% rye malt which contributes a note of black pepper to balance a citrusy hop.', 2, '', 4, 60, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (14, '5:00 Afternoon Ale', 6, 5, 'Afternoon Ale is a pilsner recipe made with an ale yeast. Not quite a pilsner, not quite a blonde, its an afternoon ale.', 2, '', 11, 25, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (15, 'Dear You', 6, 5.5, 'A saison with a drier and earthier flavor thatn sweeter and fruitier Belgian styles', 3, '', 13, 25, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (16, 'Hold Steady', 6, 7.5, 'A dark scotch ale that carries chocolate and a subtle smokiness', 3, '', 19, 27, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (17, 'Antidote', 6, 7, 'A west coast IPA with massive amounts of Centennial and Mandarina Bavaria hops to produce a dry and bitter initial taste with a clean finish', 3, '', 1, 69, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (18, 'Repeater', 6, 6.1, 'Between a pale and an india pale ale brewed with a roastier Munich II malt which is found in many German beers', 3, '', 7, 50, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (19, 'Breakfast Grapefruit IPA', 6, 6.5, 'Citra and Amarillo hops, finished with grapefruit', 4, '', 1, 60, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (20, 'Le Bruit du Diable Farmhouse Ale', 6, 8.3, 'Fruity, spicy, malty Belgian', 4, '', 20, 40, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (21, 'Cherry Kriek', 6, 5, 'Belgian blonde with Montmorency pie cherries', 4, '', 15, 20, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (22, '1000 Barrels Imperial IPA', 6, 8.5, 'Over 3 pounds of Simcoe, Amarillo, and Summit hops per barrel', 4, '', 21, 100, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (23, 'Dr. Strangelove Barleywine', 6, 10.5, 'Hoppy, malty , award winning American-style Barleywine', 4, '', 22, 100, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (24, 'Kolsch', 6, 4.6, 'Delicate and pale with less bitterness than a Pils and less sweetness than a Helles', 5, '', 23, 22, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (25, 'Weissbier', 6, 4.5, 'A traditional German wheat bier with flavors of banana and clove with a slightly citrusy and sweet flavor', 5, '', 12, 12, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (26, 'Altbier', 6, 5, 'An ale with copper color, slight hop presence, clean flavor and a dry finish', 5, '', 17, 37, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (27, 'Dunkel', 6, 5.2, 'A dark amber lager with a smooth malty flavor', 5, '', 8, 25, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (28, 'Pils', 6, 4.5, 'A pils pale gold in color and capped with a thick, brillantly white, dense collar of foam', 5, '', 11, 37, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (29, 'Helles', 6, 5, 'Crisp, clean and refreshing, lightly hopped, with just a hint of sweetness', 5, '', 24, 17, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (30, 'Keller Pils', 6, 4.6, 'Soft, light, dry. Unfiltered and naturally carbonated, this bier is cloudier and less effervescent than the pils', 5, '', 11, 37, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (31, 'Madame Psychosis', 6, 6.5, 'Featuring Idaho 7, Mandarina Bavaria, Mosaic and Citra hops. Flavors of ripe papaya and mango with pineapple, orange zest and peach skin.', 6, '', 25, 78, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (32, 'Old Bums & Beat Cowboys', 6, 4.9, 'A bright but subtle piney nose leads directly to a wealth of grapefruit and citrust flavor. Colorado grown and malty.', 6, '', 7, 35, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (33, 'Alternate Present', 6, 5.2, 'Flavors of chocolate with a bit of roasted marshmellows up front, a slightly fruitier ester note in the middle with a malty finish.', 6, '', 26, 25, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (34, 'The Falconer', 6, 5.8, 'Dry hopped saison', 6, '', 13, 30, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (35, 'Sour Saison', 6, 7.1, 'Saison blended with Golden Sour', 6, '', 14, 24, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (36, 'Waves and Ripples', 6, 4, 'Sour - Gose', 6, '', 14, 5, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (37, 'Nothing Rhymes with Orange', 6, 5.9, 'Orange/Papaya Milkshake IPA', 6, '', 1, 70, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (38, 'Beta Capsule', 6, 8.5, 'DDH Imperial New England IPA', 6, '', 25, 70, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (39, 'King Kalu Koa\'e', 6, 9, 'Imperial India Pale Ale with a Rotating Hop. Golden color, lasting light white head', 7, '', 21, 74, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (40, 'Purloined Pearl', 6, 4.5, 'Light golden color, brilliantly clear, creamy white head with citrus flavor', 7, '', 7, 37, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (41, 'Impure Penelope Armstrong', 6, 6.6, 'Golden color, creamy white head. Piney nose with stront cents of citrus, especially lemon', 7, '', 1, 70, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (42, 'Mile Highlander', 6, 8, 'Dark caramel color, transparent, light tan head with sweet caramel flavor', 7, '', 27, 25, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (43, 'Veiled Vixen', 6, 4.6, 'Straw color, transparent with a light strawberry nose balanced with light malty sweetness', 7, '', 12, 30, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (44, 'Hardtack Copper Ale', 6, 5.3, 'Copper colored, white head. Oasted barley, toast and a hint of chocolate and nut.', 7, '', 8, 55, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (45, 'High Class Horchata', 6, 5.8, 'Spiced Mexican lager with caramel color and cinnamon, vanilla and sweet malt', 7, '', 9, 23, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (46, 'Bus Stout', 6, 6, 'Transparent, black with a red hue at the edge. Coffe, chocolate and caramel aroma with a hint of citrus', 7, '', 6, 66, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (47, 'Astronaut Amber', 6, 5.1, 'Amber Ale', 8, '', 8, 27, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (48, 'Phaded Pale Ale', 6, 5.1, 'Pale Ale', 8, '', 7, 42, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (49, 'Gump\'s Vienna Lager', 6, 4.9, 'Vienna style lager', 8, '', 9, 26, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (50, 'Belgian Ambassador', 6, 6.6, 'Belgian Dubbel', 8, '', 17, 18, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (51, 'Hop Religion: Chapter Three', 6, 7.1, 'Unfiltered IPA', 8, '', 1, 88, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (52, 'Madagascar Dream', 6, 6.9, 'Nitro Vanilla Cream Ale', 8, '', 28, 18, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (53, 'Tropical Snow Dance iPA', 6, 6.9, 'Mosaic Single Hop IPA', 8, '', 1, 90, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (54, 'White Pear Berliner', 6, 4.2, 'Berliner Weisse', 8, '', 12, 5, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (55, 'Pillow Fight Pilsner', 6, 5.3, 'Pilsner', 8, '', 11, 26, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (56, 'Platt Park Porter', 6, 5.4, 'Kaladi Coffee Porter', 8, '', 5, 22, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (57, 'Future Blind Sour Stout', 6, 6.8, 'Chocolate & Cherry Sour Stout - Barrel Aged', 8, '', 6, 5, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (58, 'Blue Steel', 6, 5.8, 'Blonde Ale', 9, '', 15, 14, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (59, 'Salted Scotch Ale', 6, 5.8, 'Scotch Ale', 9, '', 19, 14, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (60, 'Parts Unknown', 6, 6.9, 'Tangerine Sour Ale', 9, '', 14, 5, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (61, 'Rock the F*ck on Forever', 6, 6.5, 'IPA', 9, '', 1, 55, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (62, 'Hopscylla', 6, 8.9, 'Double IPA', 9, '', 2, 90, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (63, 'Born in Winter', 6, 5.8, 'Pale Ale', 9, '', 7, 5, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (64, 'Malt Licker', 6, 10.5, 'B.A. Old Ale', 9, '', 17, 25, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (65, 'Grenade', 6, 6, 'Tepache Inspired Blonde Ale', 9, '', 15, 17, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (66, 'Wish You Were Here', 6, 5.6, 'Blonde Ale with Mango\'s & Pineapple', 9, '', 15, 11, 5);
INSERT INTO `beer` (`id`, `name`, `cost`, `abv`, `description`, `brewery_id`, `img_url`, `category_id`, `ibu`, `rating`) VALUES (67, 'Schizophrenic Narcoleptic', 6, 10.2, 'B.A. Coffee Stout', 9, '', 6, 24, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerdb`;
INSERT INTO `user` (`id`, `username`, `password`, `admin`) VALUES (1, 'admin', 'beerisgood!#%', 1);
INSERT INTO `user` (`id`, `username`, `password`, `admin`) VALUES (2, 'user', 'user', 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `profile`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerdb`;
INSERT INTO `profile` (`id`, `email`, `user_id`, `first_name`, `last_name`) VALUES (1, 'admin@admin.com', 1, 'Admin', 'Admin');

COMMIT;


-- -----------------------------------------------------
-- Data for table `beer_comments`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerdb`;
INSERT INTO `beer_comments` (`id`, `user_id`, `beer_id`, `description`, `date_time`) VALUES (1, 1, 1, 'hell yeah', '2018-04-27 10:10:02');

COMMIT;


-- -----------------------------------------------------
-- Data for table `brewery_comments`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerdb`;
INSERT INTO `brewery_comments` (`id`, `description`, `user_id`, `brewery_id`, `date_time`) VALUES (1, 'would hit it again', 2, 1, '2018-04-27 10:10:02');

COMMIT;


-- -----------------------------------------------------
-- Data for table `beer_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerdb`;
INSERT INTO `beer_rating` (`id`, `rating`, `user_id`, `beer_id`) VALUES (1, 5, 2, 15);

COMMIT;


-- -----------------------------------------------------
-- Data for table `brewery_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerdb`;
INSERT INTO `brewery_rating` (`id`, `user_id`, `brewery_id`, `rating`) VALUES (1, 2, 1, 4);

COMMIT;
