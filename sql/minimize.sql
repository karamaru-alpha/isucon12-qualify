DROP TABLE IF EXISTS latest_player_score;
CREATE TABLE latest_player_score (
    tenant_id BIGINT NOT NULL,
    competition_id VARCHAR(255) NOT NULL,
    player_id VARCHAR(255) NOT NULL,
    score BIGINT NOT NULL,
    created_at BIGINT NOT NULL,
    updated_at BIGINT NOT NULL,
    PRIMARY KEY (tenant_id, competition_id, player_id)
);

INSERT INTO latest_player_score SELECT t1.tenant_id, t1.competition_id, t1.player_id, t1.score, t1.created_at, t1.updated_at FROM player_score t1 JOIN (
    SELECT tenant_id, competition_id, player_id, MAX(row_num) AS max_row_num FROM player_score GROUP BY tenant_id, competition_id, player_id
) t2 ON t1.tenant_id = t2.tenant_id AND t1.competition_id = t2.competition_id AND  t1.player_id = t2.player_id AND t1.row_num = t2.max_row_num;
