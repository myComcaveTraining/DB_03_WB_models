-- 2. verbundene Tabellen + Inserts

-- Vorbereitung
DROP DATABASE IF EXISTS mydb;
CREATE DATABASE IF NOT EXISTS mydb;

/* SERVANTS */

-- Servants: ohne Fremdschlüssel
CREATE TABLE IF NOT EXISTS `mydb`.`servants` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `servant_name` VARCHAR(45) NOT NULL,
  `yrs_served` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- Servants: Struktur
DESCRIBE mydb.servants;

-- Servants: Inserts
INSERT INTO `mydb`.`servants` (`id`, `servant_name`, `yrs_served`) VALUES (DEFAULT, "Peter", 5);
INSERT INTO `mydb`.`servants` (`id`, `servant_name`, `yrs_served`) VALUES (DEFAULT, "Holger", 2);

-- Servants: Inhalte 
SELECT * FROM mydb.servants;


-- Products: ohne Fremdschlüssel
CREATE TABLE IF NOT EXISTS `mydb`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  `product_price` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- ServantsProducts (purchases)
CREATE TABLE IF NOT EXISTS `mydb`.`purchases` (
  `servants_id` INT NOT NULL,
  `products_id` INT NOT NULL,
  PRIMARY KEY (`servants_id`, `products_id`),
  INDEX `fk_servants_has_products_products1_idx` (`products_id` ASC) VISIBLE,
  INDEX `fk_servants_has_products_servants_idx` (`servants_id` ASC) VISIBLE,
  CONSTRAINT `fk_servants_has_products_servants`
    FOREIGN KEY (`servants_id`)
    REFERENCES `mydb`.`servants` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servants_has_products_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `mydb`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;