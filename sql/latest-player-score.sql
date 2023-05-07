DROP TABLE IF EXISTS latest_player_score;
CREATE TABLE latest_player_score (
    tenant_id BIGINT NOT NULL,
    competition_id VARCHAR(255) NOT NULL,
    player_id VARCHAR(255) NOT NULL,
    score BIGINT NOT NULL,
    created_at BIGINT NOT NULL,
    updated_at BIGINT NOT NULL,
    PRIMARY KEY(tenant_id, competition_id, player_id)
);

INSERT INTO latest_player_score SELECT * FROM init_latest_player_score;
