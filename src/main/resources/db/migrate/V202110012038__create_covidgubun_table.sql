CREATE TABLE `covid`.`covidgubun` (
  `covidgubun_id` BIGINT NOT NULL,
  `confCase` INT NULL,
  `covidgubuncol` DOUBLE NULL,
  `createDt` VARCHAR(255) NULL,
  `criticalRate` DOUBLE NULL,
  `death` INT NULL,
  `deathRate` DOUBLE NULL,
  `gubun` VARCHAR(255) NULL,
  `seq` INT NULL,
  `updateDt` VARCHAR(255) NULL,
  PRIMARY KEY (`covidgubun_id`));
