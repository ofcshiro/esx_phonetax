-- Creates Item Table
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int NOT NULL DEFAULT '1',
  `rare` tinyint NOT NULL DEFAULT '0',
  `can_remove` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Inserts the Item
-- dphone means "Disabled Phone"
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('dphone', 'Handy', 1, 0, 1);

