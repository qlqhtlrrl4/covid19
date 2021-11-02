CREATE TABLE `covid`.`reply` (
  `replyIdx` BIGINT NOT NULL AUTO_INCREMENT,
  `contentIdx` BIGINT NOT NULL,
  `content` VARCHAR(500) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replyIdx`),
  INDEX `fk1_reply_idx` (`contentIdx` ASC) VISIBLE,
  CONSTRAINT `fk1_reply` FOREIGN KEY (`contentIdx`) REFERENCES `contents` (`contentIdx`) ON DELETE CASCADE
    ON UPDATE NO ACTION);
