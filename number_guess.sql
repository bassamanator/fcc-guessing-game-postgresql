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
VALUES (37, 37, 27, false);
INSERT INTO public.games
VALUES (33, 208, 27, false);
INSERT INTO public.games
VALUES (32, 321, 27, false);
INSERT INTO public.games
VALUES (34, 142, 28, false);
INSERT INTO public.games
VALUES (44, 46, 29, false);
INSERT INTO public.games
VALUES (45, 20, 29, false);
INSERT INTO public.games
VALUES (41, 191, 30, false);
INSERT INTO public.games
VALUES (40, 312, 29, false);
INSERT INTO public.games
VALUES (43, 81, 29, false);
INSERT INTO public.games
VALUES (42, 124, 30, false);
INSERT INTO public.games
VALUES (46, NULL, 25, false);
INSERT INTO public.games
VALUES (110, 38, 73, false);
INSERT INTO public.games
VALUES (106, 209, 73, false);
INSERT INTO public.games
VALUES (109, 64, 73, false);
INSERT INTO public.games
VALUES (108, 98, 74, false);
INSERT INTO public.games
VALUES (105, 321, 73, false);
INSERT INTO public.games
VALUES (112, 635, 75, false);
INSERT INTO public.games
VALUES (96, 8, 70, true);
INSERT INTO public.games
VALUES (54, 11, 33, false);
INSERT INTO public.games
VALUES (55, NULL, 34, false);
INSERT INTO public.games
VALUES (97, 1, 70, true);
INSERT INTO public.games
VALUES (113, 767, 75, false);
INSERT INTO public.games
VALUES (114, 543, 76, false);
INSERT INTO public.games
VALUES (115, 47, 76, false);
INSERT INTO public.games
VALUES (116, 826, 75, false);
INSERT INTO public.games
VALUES (56, 7, 35, false);
INSERT INTO public.games
VALUES (117, 517, 75, false);
INSERT INTO public.games
VALUES (118, 946, 75, false);
INSERT INTO public.games
VALUES (119, 368, 77, false);
INSERT INTO public.games
VALUES (120, 632, 77, false);
INSERT INTO public.games
VALUES (121, 804, 78, false);
INSERT INTO public.games
VALUES (122, 837, 78, false);
INSERT INTO public.games
VALUES (123, 992, 77, false);
INSERT INTO public.games
VALUES (124, 484, 77, false);
INSERT INTO public.games
VALUES (125, 927, 77, false);
INSERT INTO public.games
VALUES (39, 51, 29, true);
INSERT INTO public.games
VALUES (47, 43, 31, true);
INSERT INTO public.games
VALUES (101, 96, 72, false);
INSERT INTO public.games
VALUES (99, 212, 71, false);
INSERT INTO public.games
VALUES (98, 324, 71, false);
INSERT INTO public.games
VALUES (25, 324, 25, false);
INSERT INTO public.games
VALUES (31, 16, 25, false);
INSERT INTO public.games
VALUES (26, 211, 25, false);
INSERT INTO public.games
VALUES (30, 38, 25, false);
INSERT INTO public.games
VALUES (28, 95, 26, false);
INSERT INTO public.games
VALUES (29, 63, 25, false);
INSERT INTO public.games
VALUES (27, 138, 26, false);
INSERT INTO public.games
VALUES (103, 39, 71, false);
INSERT INTO public.games
VALUES (100, 142, 72, false);
INSERT INTO public.games
VALUES (104, 17, 71, false);
INSERT INTO public.games
VALUES (102, 65, 71, false);
INSERT INTO public.games
VALUES (48, 307, 31, false);
INSERT INTO public.games
VALUES (51, 77, 31, false);
INSERT INTO public.games
VALUES (53, 18, 31, false);
INSERT INTO public.games
VALUES (52, 44, 31, false);
INSERT INTO public.games
VALUES (49, 188, 32, false);
INSERT INTO public.games
VALUES (50, 123, 32, false);
INSERT INTO public.games
VALUES (89, 309, 68, false);
INSERT INTO public.games
VALUES (38, 15, 27, false);
INSERT INTO public.games
VALUES (91, 138, 69, false);
INSERT INTO public.games
VALUES (94, 36, 68, false);
INSERT INTO public.games
VALUES (35, 94, 28, false);
INSERT INTO public.games
VALUES (93, 63, 68, false);
INSERT INTO public.games
VALUES (92, 99, 69, false);
INSERT INTO public.games
VALUES (95, 16, 68, false);
INSERT INTO public.games
VALUES (90, 205, 68, false);
INSERT INTO public.games
VALUES (36, 61, 27, false);
INSERT INTO public.games
VALUES (107, 138, 74, false);
INSERT INTO public.games
VALUES (111, 16, 73, false);
--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users
VALUES (25, 'user_1703926405395');
INSERT INTO public.users
VALUES (26, 'user_1703926405394');
INSERT INTO public.users
VALUES (27, 'user_1703926598955');
INSERT INTO public.users
VALUES (28, 'user_1703926598954');
INSERT INTO public.users
VALUES (29, 'user_1703926776775');
INSERT INTO public.users
VALUES (30, 'user_1703926776774');
INSERT INTO public.users
VALUES (31, 'user_1703927417717');
INSERT INTO public.users
VALUES (32, 'user_1703927417716');
INSERT INTO public.users
VALUES (33, 'bob');
INSERT INTO public.users
VALUES (34, '628');
INSERT INTO public.users
VALUES (35, 'bobby');
INSERT INTO public.users
VALUES (68, 'user_1703927855914');
INSERT INTO public.users
VALUES (69, 'user_1703927855913');
INSERT INTO public.users
VALUES (70, 'Dylan');
INSERT INTO public.users
VALUES (71, 'user_1703928419125');
INSERT INTO public.users
VALUES (72, 'user_1703928419124');
INSERT INTO public.users
VALUES (73, 'user_1703928532686');
INSERT INTO public.users
VALUES (74, 'user_1703928532685');
INSERT INTO public.users
VALUES (75, 'user_1703929172258');
INSERT INTO public.users
VALUES (76, 'user_1703929172257');
INSERT INTO public.users
VALUES (77, 'user_1703929232573');
INSERT INTO public.users
VALUES (78, 'user_1703929232572');
--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 125, true);
--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 78, true);
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