CREATE VIEW api.stats AS
SELECT
(SELECT count(id) FROM api.player) AS players,
(SELECT count(id) FROM api.game) AS games,
(SELECT count(id) FROM api.piece) AS pieces;

GRANT SELECT ON api.stats TO web_anon;
