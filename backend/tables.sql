CREATE TABLE api.player (
	id SERIAL PRIMARY KEY,
	username TEXT UNIQUE NOT NULL,
	name TEXT NOT NULL,
	email TEXT UNIQUE,
	password TEXT NOT NULL);

CREATE FUNCTION api.hash_password()
  RETURNS TRIGGER AS
  $func$

    BEGIN
      NEW.password = public.crypt(NEW.password, public.gen_salt('bf', 8));
      RETURN NEW;
    END

  $func$ LANGUAGE plpgsql;

CREATE TRIGGER hash_password_for_new_users
BEFORE INSERT ON api.player FOR EACH ROW
EXECUTE PROCEDURE api.hash_password();

INSERT INTO api.player (username, name, email, password)
VALUES
(
	'wilsonrocks',
  'James Wilson',
  'james@james.com',
  'shelley'
),
(
  'zeph',
  'Zeph Auerbach',
  'zeph@zeph.com',
  'emily'
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

GRANT SELECT, INSERT, UPDATE ON api.player to web_anon;

GRANT EXECUTE ON FUNCTION api.hash_password() to web_anon;

GRANT UPDATE, SELECT ON api.player_id_seq to web_anon;

GRANT SELECT ON api.game to web_anon;
GRANT SELECT ON api.gameinfo to web_anon;
GRANT SELECT ON api.piece to web_anon;
