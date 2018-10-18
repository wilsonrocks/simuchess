CREATE FUNCTION api.setup_board(INTEGER)
RETURNS void AS 
$$
INSERT INTO api.piece (game_id, turn, square, colour, type)
VALUES
($1, 1, 'a1', 'white', 'rook');
$$

LANGUAGE SQL;