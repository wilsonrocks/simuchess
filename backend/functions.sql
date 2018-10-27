CREATE FUNCTION api.setup_board(INTEGER)
RETURNS void AS 
$$
DELETE FROM api.piece WHERE game_id=$1;
INSERT INTO api.piece (game_id, turn, square, colour, type)
VALUES
($1, 1, 'a1', 'white', 'rook'),
($1, 1, 'b1', 'white', 'knight'),
($1, 1, 'c1', 'white', 'bishop'),
($1, 1, 'd1', 'white', 'queen'),
($1, 1, 'e1', 'white', 'king'),
($1, 1, 'f1', 'white', 'bishop'),
($1, 1, 'g1', 'white', 'knight'),
($1, 1, 'h1', 'white', 'rook'),
($1, 1, 'a2', 'white', 'pawn'),
($1, 1, 'b2', 'white', 'pawn'),
($1, 1, 'c2', 'white', 'pawn'),
($1, 1, 'd2', 'white', 'pawn'),
($1, 1, 'e2', 'white', 'pawn'),
($1, 1, 'f2', 'white', 'pawn'),
($1, 1, 'g2', 'white', 'pawn'),
($1, 1, 'h2', 'white', 'pawn'),
($1, 1, 'a8', 'white', 'rook'),
($1, 1, 'b8', 'black', 'knight'),
($1, 1, 'c8', 'black', 'bishop'),
($1, 1, 'd8', 'black', 'queen'),
($1, 1, 'e8', 'black', 'king'),
($1, 1, 'f8', 'black', 'bishop'),
($1, 1, 'g8', 'black', 'knight'),
($1, 1, 'h8', 'black', 'rook'),
($1, 1, 'a7', 'black', 'pawn'),
($1, 1, 'b7', 'black', 'pawn'),
($1, 1, 'c7', 'black', 'pawn'),
($1, 1, 'd7', 'black', 'pawn'),
($1, 1, 'e7', 'black', 'pawn'),
($1, 1, 'f7', 'black', 'pawn'),
($1, 1, 'g7', 'black', 'pawn'),
($1, 1, 'h7', 'black', 'pawn');
$$

LANGUAGE SQL;
