DELETE FROM tenant WHERE id > 100;
DELETE FROM visit_history WHERE created_at >= '1654041600';
UPDATE id_generator SET id=2678400000 WHERE stub='a';
ALTER TABLE id_generator AUTO_INCREMENT=2678400000;

DROP TABLE IF EXISTS `latest_visit_history`;
CREATE TABLE `latest_visit_history` (
    `player_id` VARCHAR(255) NOT NULL,
    `tenant_id` BIGINT UNSIGNED NOT NULL,
    `competition_id` VARCHAR(255) NOT NULL,
    PRIMARY KEY  (`player_id`, `tenant_id`, `competition_id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4;

INSERT INTO `latest_visit_history` SELECT player_id, MIN(t1.tenant_id), MIN(created_at) AS created_at FROM visit_history GROUP BY player_id;
