DROP DATABASE IF EXISTS simuchess;
CREATE DATABASE simuchess;
\connect simuchess;

CREATE SCHEMA api;

CREATE TYPE COLOUR_TYPE AS ENUM ('black', 'white');
CREATE TYPE PIECE_TYPE AS ENUM ('pawn', 'rook', 'knight', 'bishop', 'queen', 'king');
CREATE TYPE SQUARE_TYPE AS ENUM (
	'a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 
  'b1', 'b2', 'b3', 'b4', 'b5', 'b6', 'b7', 'b8', 
  'c1', 'c2', 'c3', 'c4', 'c5', 'c6', 'c7', 'c8', 
  'd1', 'd2', 'd3', 'd4', 'd5', 'd6', 'd7', 'd8', 
  'e1', 'e2', 'e3', 'e4', 'e5', 'e6', 'e7', 'e8', 
  'f1', 'f2', 'f3', 'f4', 'f5', 'f6', 'f7', 'f8', 
  'g1', 'g2', 'g3', 'g4', 'g5', 'g6', 'g7', 'g8', 
  'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'h7', 'h8'
);

CREATE TABLE api.player (
id SERIAL PRIMARY KEY,
username TEXT UNIQUE NOT NULL,
name TEXT NOT NULL,
email TEXT UNIQUE);

INSERT INTO api.player (username, name, email)
VALUES
('wilsonrocks', 'James Wilson', 'james@james.com'),
('zeph', 'Zeph Auerbach', 'zeph@zeph.com');

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
	type PIECE_TYPE NOT NULL
);

INSERT INTO api.piece (game_id, turn, square, colour, type)
VALUES
(1, 1, 'a1', 'black', 'queen'),
(1, 1, 'a2', 'black', 'king'),
(2, 1, 'h1', 'black', 'pawn'),
(2, 1, 'c6', 'white', 'queen');

DROP ROLE IF EXISTS web_anon;
CREATE ROLE web_anon nologin;
GRANT USAGE ON SCHEMA api to web_anon;
GRANT SELECT ON api.player to web_anon;
GRANT SELECT ON api.game to web_anon;
GRANT SELECT ON api.gameinfo to web_anon;
GRANT SELECT ON api.piece to web_anon;

\i functions.sql