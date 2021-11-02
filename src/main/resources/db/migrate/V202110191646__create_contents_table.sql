CREATE TABLE `contents` (
  `contentIdx` bigint NOT NULL AUTO_INCREMENT,
  `subject` varchar(45) DEFAULT NULL,
  `text` varchar(45) DEFAULT NULL,
  `writerIdx` bigint DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `count` bigint NOT NULL,
  `open` varchar(45) DEFAULT NULL,
  `writer` varchar(45) DEFAULT NULL,
  `ensubject` varchar(45) DEFAULT NULL,
  `entext` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`contentIdx`),
  KEY `fk1_contents_idx` (`writerIdx`),
  CONSTRAINT `fk1_contents` FOREIGN KEY (`writerIdx`) REFERENCES `users` (`id`)
);