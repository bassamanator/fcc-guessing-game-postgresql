--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;
DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';
ALTER DATABASE number_guess OWNER TO freecodecamp;
\ connect number_guess
SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;
SET default_tablespace = '';
SET default_table_access_method = heap;
--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
	game_id integer NOT NULL,
	num_guesses integer,
	user_id integer NOT NULL,
	solved boolean DEFAULT false
);
ALTER TABLE public.games OWNER TO freecodecamp;
--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;
--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;
--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
	user_id integer NOT NULL,
	username character varying(22)
);
ALTER TABLE public.users OWNER TO freecodecamp;
--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;
--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
ALTER COLUMN game_id
SET DEFAULT nextval('public.games_game_id_seq'::regclass);
--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
ALTER COLUMN user_id
SET DEFAULT nextval('public.users_user_id_seq'::regclass);
--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games
VALUES (1, NULL, 8, false);
INSERT INTO public.games
VALUES (13, 3, 8, true);
INSERT INTO public.games
VALUES (2, 1, 9, true);
INSERT INTO public.games
VALUES (3, 1, 10, true);
INSERT INTO public.games
VALUES (4, 1, 11, true);
INSERT INTO public.games
VALUES (5, 1, 12, true);
INSERT INTO public.games
VALUES (6, 1, 13, true);
INSERT INTO public.games
VALUES (7, 1, 14, true);
INSERT INTO public.games
VALUES (8, 4, 15, true);
INSERT INTO public.games
VALUES (10, 126, 17, false);
INSERT INTO public.games
VALUES (9, 302, 16, false);
INSERT INTO public.games
VALUES (11, 308, 18, false);
INSERT INTO public.games
VALUES (12, 126, 19, false);
--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users
VALUES (1, 'bob1');
INSERT INTO public.users
VALUES (3, 'hello');
INSERT INTO public.users
VALUES (4, 'bob2');
INSERT INTO public.users
VALUES (5, 'bob3');
INSERT INTO public.users
VALUES (6, 'bob11');
INSERT INTO public.users
VALUES (7, 'bobby');
INSERT INTO public.users
VALUES (8, 'Dylan');
INSERT INTO public.users
VALUES (9, 'bobo');
INSERT INTO public.users
VALUES (10, 'bonop');
INSERT INTO public.users
VALUES (11, 'fasdf');
INSERT INTO public.users
VALUES (12, 'ben');
INSERT INTO public.users
VALUES (13, 'ben2');
INSERT INTO public.users
VALUES (14, '2d');
INSERT INTO public.users
VALUES (15, 'bendo');
INSERT INTO public.users
VALUES (16, 'user_1703917679304');
INSERT INTO public.users
VALUES (17, 'user_1703917679303');
INSERT INTO public.users
VALUES (18, 'user_1703917910124');
INSERT INTO public.users
VALUES (19, 'user_1703917910123');
--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 13, true);
--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 19, true);
--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);
--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
ADD CONSTRAINT users_username_key UNIQUE (username);
--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
--
-- PostgreSQL database dump complete
--

