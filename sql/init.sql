DELETE FROM tenant WHERE id > 100;
DELETE FROM visit_history WHERE created_at >= '1654041600';
UPDATE id_generator SET id=2678400000 WHERE stub='a';
ALTER TABLE id_generator AUTO_INCREMENT=2678400000;

DROP TABLE IF EXISTS `latest_visit_history`;
CREATE TABLE `latest_visit_history` (
    `tenant_id` BIGINT UNSIGNED NOT NULL,
    `competition_id` VARCHAR(255) NOT NULL,
    `player_id` VARCHAR(255) NOT NULL,
    `created_at` BIGINT NOT NULL,
    PRIMARY KEY (`tenant_id`, `competition_id`, `player_id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4;

INSERT INTO `latest_visit_history` SELECT tenant_id, competition_id, player_id, created_at FROM init_latest_visit_history;


DELETE FROM `competition`;
INSERT INTO `competition` SELECT * FROM `init_competition`;

DELETE FROM `player`;
INSERT INTO `player` SELECT * FROM `init_player`;

DELETE FROM `player_score`;
INSERT INTO `player_score` SELECT * FROM `init_player_score`;
