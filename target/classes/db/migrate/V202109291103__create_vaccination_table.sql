CREATE TABLE `covid`.`vaccination` (
  `vaccin_id` BIGINT NOT NULL,
  `accumulatedFirstCnt` INT NULL,
  `accumulatedSecondCnt` INT NULL,
  `baseDate` VARCHAR(255) NULL,
  `firstCnt` INT NULL,
  `secondCnt` INT NULL,
  `sido` VARCHAR(45) NULL,
  `totalFirstCnt` INT NULL,
  `totalSecondCnt` INT NULL,
  PRIMARY KEY (`vaccin_id`));