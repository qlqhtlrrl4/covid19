CREATE TABLE `covid`.`covidstatus` (
  `accDefRate` DOUBLE NULL,
  `covidstatus_id` BIGINT NOT NULL AUTO_INCREMENT,
  `accExamCnt` INT NULL,
  `accExamCompCnt` INT NULL,
  `careCnt` INT NULL,
  `clearCnt` INT NULL,
  `createDt` VARCHAR(255) NULL,
  `stateDt` VARCHAR(255) NULL,
  `stateTime` VARCHAR(255) NULL,
  `updateDt` VARCHAR(255) NULL,
  `deathCnt` INT NULL,
  `decideCnt` INT NULL,
  `examCnt` INT NULL,
  `resutlNegCnt` INT NULL,
  `seq` INT NULL,
  PRIMARY KEY (`covidstatus_id`));
  
