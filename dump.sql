--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)

-- Started on 2022-08-06 13:23:33 -03

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
-- TOC entry 209 (class 1259 OID 17240)
-- Name: deletedUrls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."deletedUrls" (
    id integer NOT NULL,
    "userId" integer,
    "urlId" integer NOT NULL,
    "longUrl" text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2022-08-06 13:15:17.087121'::timestamp without time zone NOT NULL
);


ALTER TABLE public."deletedUrls" OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 17238)
-- Name: deletedUrls_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."deletedUrls_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."deletedUrls_id_seq" OWNER TO postgres;

--
-- TOC entry 3019 (class 0 OID 0)
-- Dependencies: 208
-- Name: deletedUrls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."deletedUrls_id_seq" OWNED BY public."deletedUrls".id;


--
-- TOC entry 205 (class 1259 OID 17215)
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer,
    token text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2022-08-06 13:15:17.087121'::timestamp without time zone NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 17213)
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
-- TOC entry 3020 (class 0 OID 0)
-- Dependencies: 204
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- TOC entry 207 (class 1259 OID 17227)
-- Name: urls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "longUrl" text NOT NULL,
    "shortUrl" text NOT NULL,
    "viewsCount" integer DEFAULT 0,
    "createdAt" timestamp without time zone DEFAULT '2022-08-06 13:15:17.087121'::timestamp without time zone NOT NULL
);


ALTER TABLE public.urls OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 17225)
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
-- TOC entry 3021 (class 0 OID 0)
-- Dependencies: 206
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- TOC entry 203 (class 1259 OID 17200)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "viewsCount" integer DEFAULT 0,
    "createdAt" timestamp without time zone DEFAULT '2022-08-06 13:15:17.087121'::timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 17198)
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
-- TOC entry 3022 (class 0 OID 0)
-- Dependencies: 202
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 2864 (class 2604 OID 17243)
-- Name: deletedUrls id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."deletedUrls" ALTER COLUMN id SET DEFAULT nextval('public."deletedUrls_id_seq"'::regclass);


--
-- TOC entry 2859 (class 2604 OID 17218)
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- TOC entry 2861 (class 2604 OID 17230)
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- TOC entry 2856 (class 2604 OID 17203)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3013 (class 0 OID 17240)
-- Dependencies: 209
-- Data for Name: deletedUrls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."deletedUrls" (id, "userId", "urlId", "longUrl", "createdAt") FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 17215)
-- Dependencies: 205
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, "userId", token, "createdAt") FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 17227)
-- Dependencies: 207
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.urls (id, "userId", "longUrl", "shortUrl", "viewsCount", "createdAt") FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 17200)
-- Dependencies: 203
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password, "viewsCount", "createdAt") FROM stdin;
1	day	day@email.com	123	0	2022-08-06 13:15:17.087121
2	Dayane	dayane@gmail.com	$2b$10$C2zB1/wMYHdvx24P6hloUe0AYPqt.Ps1YjvfEJ.HMNeWYO0bUuey.	0	2022-08-06 13:15:17.087121
3	NewDay	newDay@gmail.com	$2b$10$9DoAUfyVQXf0/4BqMOT/A.F3jkj9QTvdcMXNUtEiDNe.w77zyCEuS	0	2022-08-06 13:15:17.087121
\.


--
-- TOC entry 3023 (class 0 OID 0)
-- Dependencies: 208
-- Name: deletedUrls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."deletedUrls_id_seq"', 1, false);


--
-- TOC entry 3024 (class 0 OID 0)
-- Dependencies: 204
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sessions_id_seq', 1, false);


--
-- TOC entry 3025 (class 0 OID 0)
-- Dependencies: 206
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.urls_id_seq', 1, false);


--
-- TOC entry 3026 (class 0 OID 0)
-- Dependencies: 202
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- TOC entry 2875 (class 2606 OID 17249)
-- Name: deletedUrls deletedUrls_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."deletedUrls"
    ADD CONSTRAINT "deletedUrls_pk" PRIMARY KEY (id);


--
-- TOC entry 2871 (class 2606 OID 17224)
-- Name: sessions sessions_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pk PRIMARY KEY (id);


--
-- TOC entry 2873 (class 2606 OID 17237)
-- Name: urls urls_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pk PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 17212)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 2869 (class 2606 OID 17210)
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- TOC entry 2878 (class 2606 OID 17260)
-- Name: deletedUrls deletedUrls_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."deletedUrls"
    ADD CONSTRAINT "deletedUrls_fk0" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- TOC entry 2879 (class 2606 OID 17265)
-- Name: deletedUrls deletedUrls_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."deletedUrls"
    ADD CONSTRAINT "deletedUrls_fk1" FOREIGN KEY ("urlId") REFERENCES public.urls(id);


--
-- TOC entry 2876 (class 2606 OID 17250)
-- Name: sessions sessions_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- TOC entry 2877 (class 2606 OID 17255)
-- Name: urls urls_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


-- Completed on 2022-08-06 13:23:33 -03

--
-- PostgreSQL database dump complete
--

