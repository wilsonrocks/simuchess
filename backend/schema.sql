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