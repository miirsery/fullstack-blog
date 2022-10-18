--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12
-- Dumped by pg_dump version 12.12

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
-- Name: cinema; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cinema (
    id integer NOT NULL,
    title text,
    address text,
    location text,
    phone text
);


--
-- Name: cinema_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cinema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cinema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cinema_id_seq OWNED BY public.cinema.id;


--
-- Name: employee; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.employee (
    id integer NOT NULL,
    name text,
    surname text,
    patronymic text,
    birthdate date,
    cinema_id integer NOT NULL,
    rate integer,
    "position" text
);


--
-- Name: employee_cinema_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.employee_cinema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: employee_cinema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.employee_cinema_id_seq OWNED BY public.employee.cinema_id;


--
-- Name: employee_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.employee_id_seq OWNED BY public.employee.id;


--
-- Name: hall; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hall (
    id integer NOT NULL,
    title integer,
    seats_count integer,
    cinema_id integer NOT NULL
);


--
-- Name: hall_cinema_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hall_cinema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hall_cinema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hall_cinema_id_seq OWNED BY public.hall.cinema_id;


--
-- Name: hall_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hall_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hall_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hall_id_seq OWNED BY public.hall.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    run_on timestamp without time zone NOT NULL
);


--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: movie; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movie (
    id integer NOT NULL,
    title text NOT NULL,
    studio text,
    genre text,
    description text,
    release_date date,
    preview text
);


--
-- Name: movie_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.movie_id_seq OWNED BY public.movie.id;


--
-- Name: person; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.person (
    id integer NOT NULL,
    name text,
    surname text,
    patronymic text,
    role text DEFAULT 'user'::text NOT NULL,
    email text NOT NULL,
    login text NOT NULL,
    password text NOT NULL,
    register_date timestamp without time zone DEFAULT now() NOT NULL,
    birthdate date,
    discount integer DEFAULT 0,
    avatar text,
    CONSTRAINT person_discount_check CHECK ((discount >= 0))
);


--
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- Name: session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.session (
    id integer NOT NULL,
    date date NOT NULL,
    "time" time without time zone,
    hall_id integer NOT NULL,
    movie_id integer NOT NULL
);


--
-- Name: session_hall_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.session_hall_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: session_hall_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.session_hall_id_seq OWNED BY public.session.hall_id;


--
-- Name: session_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.session_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.session_id_seq OWNED BY public.session.id;


--
-- Name: session_movie_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.session_movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: session_movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.session_movie_id_seq OWNED BY public.session.movie_id;


--
-- Name: ticket; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ticket (
    id integer NOT NULL,
    seat integer,
    price integer,
    buy_date timestamp without time zone DEFAULT now() NOT NULL,
    session_id integer NOT NULL,
    seller_id integer NOT NULL,
    user_id integer NOT NULL,
    movie_id integer NOT NULL
);


--
-- Name: ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ticket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ticket_id_seq OWNED BY public.ticket.id;


--
-- Name: ticket_movie_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ticket_movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ticket_movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ticket_movie_id_seq OWNED BY public.ticket.movie_id;


--
-- Name: ticket_seller_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ticket_seller_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ticket_seller_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ticket_seller_id_seq OWNED BY public.ticket.seller_id;


--
-- Name: ticket_session_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ticket_session_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ticket_session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ticket_session_id_seq OWNED BY public.ticket.session_id;


--
-- Name: ticket_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ticket_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ticket_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ticket_user_id_seq OWNED BY public.ticket.user_id;


--
-- Name: cinema id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cinema ALTER COLUMN id SET DEFAULT nextval('public.cinema_id_seq'::regclass);


--
-- Name: employee id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employee ALTER COLUMN id SET DEFAULT nextval('public.employee_id_seq'::regclass);


--
-- Name: employee cinema_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employee ALTER COLUMN cinema_id SET DEFAULT nextval('public.employee_cinema_id_seq'::regclass);


--
-- Name: hall id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hall ALTER COLUMN id SET DEFAULT nextval('public.hall_id_seq'::regclass);


--
-- Name: hall cinema_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hall ALTER COLUMN cinema_id SET DEFAULT nextval('public.hall_cinema_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: movie id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie ALTER COLUMN id SET DEFAULT nextval('public.movie_id_seq'::regclass);


--
-- Name: person id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- Name: session id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session ALTER COLUMN id SET DEFAULT nextval('public.session_id_seq'::regclass);


--
-- Name: session hall_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session ALTER COLUMN hall_id SET DEFAULT nextval('public.session_hall_id_seq'::regclass);


--
-- Name: session movie_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session ALTER COLUMN movie_id SET DEFAULT nextval('public.session_movie_id_seq'::regclass);


--
-- Name: ticket id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket ALTER COLUMN id SET DEFAULT nextval('public.ticket_id_seq'::regclass);


--
-- Name: ticket session_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket ALTER COLUMN session_id SET DEFAULT nextval('public.ticket_session_id_seq'::regclass);


--
-- Name: ticket seller_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket ALTER COLUMN seller_id SET DEFAULT nextval('public.ticket_seller_id_seq'::regclass);


--
-- Name: ticket user_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket ALTER COLUMN user_id SET DEFAULT nextval('public.ticket_user_id_seq'::regclass);


--
-- Name: ticket movie_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket ALTER COLUMN movie_id SET DEFAULT nextval('public.ticket_movie_id_seq'::regclass);


--
-- Data for Name: cinema; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cinema (id, title, address, location, phone) FROM stdin;
1	The best cinema#1	The best street#1	43.44, -79.69	8800353535
2	The best cinema#2	The best street#1	43.44, -79.69	8800353535
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.employee (id, name, surname, patronymic, birthdate, cinema_id, rate, "position") FROM stdin;
1	The best name#4	The best surname#5	The best patronymic#5	1991-06-12	1	1	cashier
2	The best name#5	The best surname#6	The best patronymic#6	1992-09-12	2	1	cashier
3	The best name#6	The best surname#7	The best patronymic#7	1993-08-12	2	1	cashier
4	The best name#7	The best surname#8	The best patronymic#8	1994-07-12	1	1	cashier
\.


--
-- Data for Name: hall; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.hall (id, title, seats_count, cinema_id) FROM stdin;
1	0	30	1
2	1	40	1
3	2	80	1
4	0	10	2
5	1	15	2
6	2	20	2
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.migrations (id, name, run_on) FROM stdin;
1	/20220929105015-initialize	2022-10-18 18:47:35.922
2	/20221015164456-insert-tables	2022-10-18 18:47:35.946
\.


--
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.movie (id, title, studio, genre, description, release_date, preview) FROM stdin;
1	The best movie#1	The best studio#1	Horror	The best description#1	1998-02-02	
2	The best movie#2	The best studio#1	Horror	The best description#2	1991-11-13	
3	The best movie#3	The best studio#2	Comedy	The best description#3	1998-03-24	
4	The best movie#4	The best studio#3	Comedy		1944-03-14	
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.person (id, name, surname, patronymic, role, email, login, password, register_date, birthdate, discount, avatar) FROM stdin;
1	The best name#1	The best surname#1	The best patronymic#1	user	email@mail.ru	login	password	2022-10-18 18:47:35.928224	1999-06-12	0	
2	The best name#2	The best surname#2	The best patronymic#2	user	email1@mail.ru	login1	password	2022-10-18 18:47:35.928224	2001-02-01	0	
3	The best name#3	The best surname#3	The best patronymic#3	user	email2@mail.ru	login2	password	2022-10-18 18:47:35.928224	2006-02-02	0	
4	The best name#4	The best surname#4	The best patronymic#4	user	email3@mail.ru	login3	password	2022-10-18 18:47:35.928224	1991-06-12	0	
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.session (id, date, "time", hall_id, movie_id) FROM stdin;
1	2022-09-11	11:35:00	1	1
2	2022-09-12	11:15:00	2	1
3	2022-10-13	11:25:00	1	1
4	2022-01-14	23:35:00	2	2
5	2022-02-15	21:35:00	1	3
6	2022-09-16	10:35:00	2	2
7	2022-11-17	09:35:00	1	3
8	2022-12-18	01:25:00	2	1
\.


--
-- Data for Name: ticket; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ticket (id, seat, price, buy_date, session_id, seller_id, user_id, movie_id) FROM stdin;
2	3	20	2022-10-18 18:47:35.928224	1	2	2	2
3	5	30	2022-10-18 18:47:35.928224	1	3	3	3
4	7	10	2022-10-18 18:47:35.928224	1	4	4	4
6	2	350	2022-10-18 18:47:35.928224	2	2	2	2
7	3	350	2022-10-18 18:47:35.928224	2	3	3	3
8	4	350	2022-10-18 18:47:35.928224	2	4	4	4
10	11	350	2022-10-18 18:47:35.928224	3	2	2	2
11	12	350	2022-10-18 18:47:35.928224	3	3	3	3
12	13	350	2022-10-18 18:47:35.928224	3	4	4	4
14	22	5000	2022-10-18 18:47:35.928224	4	2	2	2
15	21	5000	2022-10-18 18:47:35.928224	4	3	3	3
16	20	5000	2022-10-18 18:47:35.928224	5	4	4	4
9	10	0	2022-10-18 18:47:35.928224	3	1	1	1
5	1	0	2022-10-18 18:47:35.928224	2	1	1	1
1	1	0	2022-10-18 18:47:35.928224	1	1	1	1
13	23	100	2022-10-18 18:47:35.928224	4	1	1	1
\.


--
-- Name: cinema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cinema_id_seq', 2, true);


--
-- Name: employee_cinema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.employee_cinema_id_seq', 1, false);


--
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.employee_id_seq', 4, true);


--
-- Name: hall_cinema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hall_cinema_id_seq', 1, false);


--
-- Name: hall_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hall_id_seq', 6, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.migrations_id_seq', 2, true);


--
-- Name: movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.movie_id_seq', 4, true);


--
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.person_id_seq', 4, true);


--
-- Name: session_hall_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.session_hall_id_seq', 1, false);


--
-- Name: session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.session_id_seq', 8, true);


--
-- Name: session_movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.session_movie_id_seq', 1, false);


--
-- Name: ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ticket_id_seq', 16, true);


--
-- Name: ticket_movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ticket_movie_id_seq', 1, false);


--
-- Name: ticket_seller_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ticket_seller_id_seq', 1, false);


--
-- Name: ticket_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ticket_session_id_seq', 1, false);


--
-- Name: ticket_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ticket_user_id_seq', 1, false);


--
-- Name: cinema cinema_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cinema
    ADD CONSTRAINT cinema_pkey PRIMARY KEY (id);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- Name: hall hall_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hall
    ADD CONSTRAINT hall_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: movie movie_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (id);


--
-- Name: person person_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_email_key UNIQUE (email);


--
-- Name: person person_login_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_login_key UNIQUE (login);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (id);


--
-- Name: ticket ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_pkey PRIMARY KEY (id);


--
-- Name: employee fk_cinema; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT fk_cinema FOREIGN KEY (cinema_id) REFERENCES public.cinema(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: hall fk_cinema; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hall
    ADD CONSTRAINT fk_cinema FOREIGN KEY (cinema_id) REFERENCES public.cinema(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: session fk_hall; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT fk_hall FOREIGN KEY (hall_id) REFERENCES public.hall(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: session fk_movie; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT fk_movie FOREIGN KEY (movie_id) REFERENCES public.movie(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ticket fk_movie; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT fk_movie FOREIGN KEY (movie_id) REFERENCES public.movie(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ticket fk_seller; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT fk_seller FOREIGN KEY (seller_id) REFERENCES public.employee(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ticket fk_session; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT fk_session FOREIGN KEY (session_id) REFERENCES public.session(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ticket fk_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES public.person(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

