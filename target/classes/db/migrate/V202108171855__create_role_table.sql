CREATE TABLE `covid`.`roles` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT(20) NOT NULL,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
   CONSTRAINT `fk_roles_users` FOREIGN KEY (`user_id`)
        REFERENCES `users` (`id`)
        ON DELETE CASCADE
  );

  
