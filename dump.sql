--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)

-- Started on 2022-08-07 14:08:31 -03

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
-- TOC entry 205 (class 1259 OID 17288)
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer,
    token text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2022-08-07 14:02:04.068301'::timestamp without time zone NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 17286)
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO postgres;

--
-- TOC entry 3004 (class 0 OID 0)
-- Dependencies: 204
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- TOC entry 207 (class 1259 OID 17300)
-- Name: urls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "longUrl" text NOT NULL,
    "shortUrl" text NOT NULL,
    "viewsCount" integer DEFAULT 0,
    "createdAt" timestamp without time zone DEFAULT '2022-08-07 14:02:04.068301'::timestamp without time zone NOT NULL
);


ALTER TABLE public.urls OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 17298)
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.urls_id_seq OWNER TO postgres;

--
-- TOC entry 3005 (class 0 OID 0)
-- Dependencies: 206
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- TOC entry 203 (class 1259 OID 17273)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "viewsCount" integer DEFAULT 0,
    "createdAt" timestamp without time zone DEFAULT '2022-08-07 14:02:04.068301'::timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 17271)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3006 (class 0 OID 0)
-- Dependencies: 202
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 2852 (class 2604 OID 17291)
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- TOC entry 2854 (class 2604 OID 17303)
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- TOC entry 2849 (class 2604 OID 17276)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2996 (class 0 OID 17288)
-- Dependencies: 205
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, "userId", token, "createdAt") FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 17300)
-- Dependencies: 207
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.urls (id, "userId", "longUrl", "shortUrl", "viewsCount", "createdAt") FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 17273)
-- Dependencies: 203
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password, "viewsCount", "createdAt") FROM stdin;
1	João	joao@driven.com.br	$2b$10$dpB8v4UYXx6SBjcWfKgP/OT0URaKxmfhKkhtEAUftZ9u9Wh.jj6Xi	0	2022-08-07 14:02:04.068301
2	Dayane	dayane@driven.com.br	$2b$10$0Rx2RiulFJu2mWg1o3sdn.C0y8fOnW1AwhT0oWLNV2gfwoZ.q9h5y	0	2022-08-07 14:02:04.068301
3	asjkl	asjkl@driven.com.br	$2b$10$APXdvaZEkGgwrBJB..eucOwodR7VFdKlSXTtOAc6EJ5hwTH6ixnLe	0	2022-08-07 14:02:04.068301
4	abc	abc@driven.com.br	$2b$10$dLkhv3aJY5anM6ypF5iBM.hS6mApoqEsMzKGyrelxpIYcqdKbJmyS	0	2022-08-07 14:02:04.068301
5	def	def@driven.com.br	$2b$10$2TA8bpeAiOO8EKXFgAttqOKrEnpZOyvLz8S7viVMpTco9BgGhgn4q	0	2022-08-07 14:02:04.068301
6	hij	hij@driven.com.br	$2b$10$JbV6E9pfGsYo6rpd/jzKQexdSzMvJ7BRQ116zpc2/YG54OkIxjDG.	0	2022-08-07 14:02:04.068301
7	klm	klm@driven.com.br	$2b$10$alianknpZbi61ug9y6a0leIvSxf0sOziEDy/4S6hFPwWFlZllk2R2	0	2022-08-07 14:02:04.068301
8	mno	mno@driven.com.br	$2b$10$7fjlyxxXH4KSOZWjjjdeIewVbmGfngadAtGg.PQkKm4GaCT7zjwJ6	0	2022-08-07 14:02:04.068301
9	pqr	pqr@driven.com.br	$2b$10$B9Kop1FeTx4dFfO5Pq8wRusQDKiiVrxXv3aQ7hjLgvhfwfl2bpO5e	0	2022-08-07 14:02:04.068301
10	qrs	qrs@driven.com.br	$2b$10$tlsteuu9NX0qS4GLV5PWU.1DP4w2P1HcBFkaCDzq7Jzs.m.8JrH5i	0	2022-08-07 14:02:04.068301
11	srt	srt@driven.com.br	$2b$10$nNpHCjgSMg7kArjRIvjGmueTI/O8bay3mB.zGGD0oA/ejBrvSvdJa	0	2022-08-07 14:02:04.068301
12	aaa	aaa@driven.com.br	$2b$10$G1iMsohKT.yl/2a8X8TpLup7SyzwjN/zTA1MtjyNM/kx4T75/VqNq	0	2022-08-07 14:02:04.068301
13	bbb	bbb@driven.com.br	$2b$10$CGI4DzVTThx3l0R8CZDv1.9c0Zk3If/7JN0rdtotuWT1ZogKg62QW	0	2022-08-07 14:02:04.068301
\.


--
-- TOC entry 3007 (class 0 OID 0)
-- Dependencies: 204
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sessions_id_seq', 1, false);


--
-- TOC entry 3008 (class 0 OID 0)
-- Dependencies: 206
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.urls_id_seq', 1, false);


--
-- TOC entry 3009 (class 0 OID 0)
-- Dependencies: 202
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 13, true);


--
-- TOC entry 2862 (class 2606 OID 17297)
-- Name: sessions sessions_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pk PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 17310)
-- Name: urls urls_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pk PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 17285)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 2860 (class 2606 OID 17283)
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- TOC entry 2865 (class 2606 OID 17311)
-- Name: sessions sessions_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- TOC entry 2866 (class 2606 OID 17316)
-- Name: urls urls_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


-- Completed on 2022-08-07 14:08:31 -03

--
-- PostgreSQL database dump complete
--

