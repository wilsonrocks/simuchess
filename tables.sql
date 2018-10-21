CREATE TABLE api.player (
	id SERIAL PRIMARY KEY,
	username TEXT UNIQUE NOT NULL,
	name TEXT NOT NULL,
	email TEXT UNIQUE,
	pwhash TEXT NOT NULL);

INSERT INTO api.player (username, name, email, pwhash)
VALUES
(
	'wilsonrocks',
  'James Wilson',
  'james@james.com',
  crypt('shelley', gen_salt('bf', 8))
),
(
  'zeph',
  'Zeph Auerbach',
  'zeph@zeph.com',
  crypt('emily', gen_salt('bf', 8))
);

CREATE TABLE api.game (
	id SERIAL PRIMARY KEY,
	white_id INTEGER REFERENCES api.player,
	black_id INTEGER REFERENCES api.player,
	current_turn INTEGER DEFAULT 1
);

INSERT INTO api.game (white_id, black_id)
VALUES
(1, 2),
(2, 1);

CREATE VIEW api.gameinfo AS
SELECT
api.game.id AS game_id,
api.game.current_turn,
whitejoin.username AS white,
blackjoin.username AS black
FROM api.game
JOIN api.player whitejoin
ON whitejoin.id = api.game.white_id
JOIN api.player blackjoin
ON blackjoin.id = api.game.black_id;

CREATE TABLE api.piece (
	id SERIAL PRIMARY KEY,
	game_id INTEGER REFERENCES api.game NOT NULL,
	turn INTEGER NOT NULL,
	square SQUARE_TYPE NOT NULL,
	colour COLOUR_TYPE NOT NULL,
	type PIECE_TYPE NOT NULL,
	UNIQUE (game_id, turn, square)
);


INSERT INTO api.piece (game_id, turn, square, colour, type)
VALUES
(1, 1, 'a1', 'black', 'queen'),
(1, 1, 'a2', 'black', 'king'),
(2, 1, 'h1', 'black', 'pawn'),
(2, 1, 'c6', 'white', 'queen');

GRANT SELECT ON api.player to web_anon;
GRANT SELECT ON api.game to web_anon;
GRANT SELECT ON api.gameinfo to web_anon;
GRANT SELECT ON api.piece to web_anon;
