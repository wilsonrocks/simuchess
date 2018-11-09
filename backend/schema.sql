DROP DATABASE IF EXISTS simuchess;
CREATE DATABASE simuchess;
\connect simuchess;

CREATE EXTENSION "pgcrypto" SCHEMA public;
CREATE EXTENSION pgjwt;

CREATE SCHEMA api;

\i enums.sql

DROP ROLE IF EXISTS web_anon;
CREATE ROLE web_anon nologin;
GRANT USAGE ON SCHEMA api to web_anon;

\i tables.sql
\i views/stats.sql
\i functions.sql


DROP ROLE IF EXISTS player;
CREATE role player nologin;
GRANT USAGE ON SCHEMA api to player;
GRANT ALL ON api.piece to player;
GRANT USAGE, SELECT on api.piece_id_seq to player;

GRANT SELECT, INSERT, UPDATE ON api.player to player;
GRANT EXECUTE ON FUNCTION api.hash_password() to player;
GRANT UPDATE, SELECT ON api.player_id_seq to player;

