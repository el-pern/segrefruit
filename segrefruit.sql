--
-- PostgreSQL database cluster dump
--

-- Started on 2026-05-24 13:26:46 PST

\restrict r8cXp2sQhf0wyWtdMrgbn6ZEFAuNgGB70dGMokdcco7BNhlLOHTo1IKAhpuW41X

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;

--
-- User Configurations
--








\unrestrict r8cXp2sQhf0wyWtdMrgbn6ZEFAuNgGB70dGMokdcco7BNhlLOHTo1IKAhpuW41X

--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

\restrict kzHtg11fgO8B7nAu1VyplLRSChsbFPkQChjj9d49g4n9A5BiyfnbStfgYnecPxx

-- Dumped from database version 18.3 (Debian 18.3-1.pgdg13+1)
-- Dumped by pg_dump version 18.3 (Debian 18.3-1.pgdg13+1)

-- Started on 2026-05-24 13:26:46 PST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Completed on 2026-05-24 13:26:46 PST

--
-- PostgreSQL database dump complete
--

\unrestrict kzHtg11fgO8B7nAu1VyplLRSChsbFPkQChjj9d49g4n9A5BiyfnbStfgYnecPxx

--
-- Database "segrefruit" dump
--

--
-- PostgreSQL database dump
--

\restrict 60Mf7JAHKAR3KDVa4WNzozK3Dxw9yW7ldD4b3F4x6i9NAn85Cwc3KN8mzc4lr77

-- Dumped from database version 18.3 (Debian 18.3-1.pgdg13+1)
-- Dumped by pg_dump version 18.3 (Debian 18.3-1.pgdg13+1)

-- Started on 2026-05-24 13:26:46 PST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3561 (class 1262 OID 16388)
-- Name: segrefruit; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE segrefruit WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE segrefruit OWNER TO postgres;

\unrestrict 60Mf7JAHKAR3KDVa4WNzozK3Dxw9yW7ldD4b3F4x6i9NAn85Cwc3KN8mzc4lr77
\connect segrefruit
\restrict 60Mf7JAHKAR3KDVa4WNzozK3Dxw9yW7ldD4b3F4x6i9NAn85Cwc3KN8mzc4lr77

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 239 (class 1259 OID 17178)
-- Name: batchs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.batchs (
    id bigint NOT NULL,
    batch_num character varying(6) NOT NULL,
    start_time timestamp(0) without time zone NOT NULL,
    end_time timestamp(0) without time zone NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.batchs OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 17177)
-- Name: batchs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.batchs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.batchs_id_seq OWNER TO postgres;

--
-- TOC entry 3562 (class 0 OID 0)
-- Dependencies: 238
-- Name: batchs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.batchs_id_seq OWNED BY public.batchs.id;


--
-- TOC entry 225 (class 1259 OID 16435)
-- Name: cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16446)
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 17094)
-- Name: dmg_fruits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dmg_fruits (
    id bigint NOT NULL,
    fruit_name character varying(50) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.dmg_fruits OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 17093)
-- Name: dmg_fruits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dmg_fruits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dmg_fruits_id_seq OWNER TO postgres;

--
-- TOC entry 3563 (class 0 OID 0)
-- Dependencies: 236
-- Name: dmg_fruits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dmg_fruits_id_seq OWNED BY public.dmg_fruits.id;


--
-- TOC entry 231 (class 1259 OID 16488)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16487)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO postgres;

--
-- TOC entry 3564 (class 0 OID 0)
-- Dependencies: 230
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 235 (class 1259 OID 17085)
-- Name: fruits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fruits (
    id bigint NOT NULL,
    fruit_name character varying(50) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.fruits OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 17084)
-- Name: fruits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fruits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fruits_id_seq OWNER TO postgres;

--
-- TOC entry 3565 (class 0 OID 0)
-- Dependencies: 234
-- Name: fruits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fruits_id_seq OWNED BY public.fruits.id;


--
-- TOC entry 229 (class 1259 OID 16473)
-- Name: job_batches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16458)
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16457)
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO postgres;

--
-- TOC entry 3566 (class 0 OID 0)
-- Dependencies: 227
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- TOC entry 233 (class 1259 OID 17075)
-- Name: logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs (
    id bigint NOT NULL,
    info character varying(150) NOT NULL,
    log_date timestamp(0) without time zone NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.logs OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17074)
-- Name: logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.logs_id_seq OWNER TO postgres;

--
-- TOC entry 3567 (class 0 OID 0)
-- Dependencies: 232
-- Name: logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;


--
-- TOC entry 220 (class 1259 OID 16390)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16389)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3568 (class 0 OID 0)
-- Dependencies: 219
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 223 (class 1259 OID 16414)
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16423)
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16400)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16399)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3569 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3352 (class 2604 OID 17181)
-- Name: batchs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.batchs ALTER COLUMN id SET DEFAULT nextval('public.batchs_id_seq'::regclass);


--
-- TOC entry 3351 (class 2604 OID 17097)
-- Name: dmg_fruits id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dmg_fruits ALTER COLUMN id SET DEFAULT nextval('public.dmg_fruits_id_seq'::regclass);


--
-- TOC entry 3347 (class 2604 OID 16491)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 3350 (class 2604 OID 17088)
-- Name: fruits id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fruits ALTER COLUMN id SET DEFAULT nextval('public.fruits_id_seq'::regclass);


--
-- TOC entry 3346 (class 2604 OID 16461)
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- TOC entry 3349 (class 2604 OID 17078)
-- Name: logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);


--
-- TOC entry 3344 (class 2604 OID 16393)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 3345 (class 2604 OID 16403)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3555 (class 0 OID 17178)
-- Dependencies: 239
-- Data for Name: batchs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.batchs (id, batch_num, start_time, end_time, created_at, updated_at) FROM stdin;
1	637880	2026-05-20 17:00:00	2026-05-20 19:30:00	2026-05-22 21:25:29	2026-05-22 21:25:29
2	150696	2026-05-20 13:30:00	2026-05-20 16:00:00	2026-05-22 21:47:00	2026-05-22 21:47:00
\.


--
-- TOC entry 3541 (class 0 OID 16435)
-- Dependencies: 225
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- TOC entry 3542 (class 0 OID 16446)
-- Dependencies: 226
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- TOC entry 3553 (class 0 OID 17094)
-- Dependencies: 237
-- Data for Name: dmg_fruits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dmg_fruits (id, fruit_name, created_at, updated_at) FROM stdin;
3	tomato4	2026-04-23 16:06:29	2026-04-23 16:06:29
4	tomato3	2026-04-26 15:43:39	2026-04-26 15:43:39
6	tomato	2026-05-18 09:13:59	2026-05-18 09:13:59
7	tomato	2026-05-18 09:15:34	2026-05-18 09:15:34
8	tomato	2026-05-18 09:15:52	2026-05-18 09:15:52
9	tomato	2026-05-18 09:17:26	2026-05-18 09:17:26
10	tomato	2026-05-18 09:17:35	2026-05-18 09:17:35
11	tomato	2026-05-18 09:17:43	2026-05-18 09:17:43
12	tomato	2026-05-18 09:21:55	2026-05-18 09:21:55
13	tomato	2026-05-18 09:22:42	2026-05-18 09:22:42
14	tomato	2026-05-18 09:23:36	2026-05-18 09:23:36
15	tomato	2026-05-18 09:24:01	2026-05-18 09:24:01
16	tomato	2026-05-18 09:24:23	2026-05-18 09:24:23
17	tomato	2026-05-18 09:24:39	2026-05-18 09:24:39
18	tomato	2026-05-18 09:25:02	2026-05-18 09:25:02
19	tomato	2026-05-18 09:41:25	2026-05-18 09:41:25
20	tomato	2026-05-18 09:42:31	2026-05-18 09:42:31
21	tomato	2026-05-18 09:43:06	2026-05-18 09:43:06
22	tomato	2026-05-18 09:43:27	2026-05-18 09:43:27
23	tomato	2026-05-18 09:44:04	2026-05-18 09:44:04
24	tomato	2026-05-18 09:44:19	2026-05-18 09:44:19
25	tomato	2026-05-18 09:44:30	2026-05-18 09:44:30
26	tomato	2026-05-18 09:44:51	2026-05-18 09:44:51
27	tomato	2026-05-18 09:45:13	2026-05-18 09:45:13
28	tomato	2026-05-18 09:45:25	2026-05-18 09:45:25
29	tomato	2026-05-18 09:47:24	2026-05-18 09:47:24
30	tomato	2026-05-18 09:47:39	2026-05-18 09:47:39
31	tomato	2026-05-18 09:47:49	2026-05-18 09:47:49
32	tomato	2026-05-18 09:48:06	2026-05-18 09:48:06
33	tomato	2026-05-18 09:48:21	2026-05-18 09:48:21
34	tomato	2026-05-18 09:53:22	2026-05-18 09:53:22
35	tomato	2026-05-18 09:53:30	2026-05-18 09:53:30
36	tomato	2026-05-18 09:54:12	2026-05-18 09:54:12
37	tomato	2026-05-18 09:54:20	2026-05-18 09:54:20
38	tomato	2026-05-18 09:54:44	2026-05-18 09:54:44
39	tomato	2026-05-18 09:54:53	2026-05-18 09:54:53
40	tomato	2026-05-18 09:55:05	2026-05-18 09:55:05
41	tomato	2026-05-18 09:55:41	2026-05-18 09:55:41
42	tomato	2026-05-18 09:55:49	2026-05-18 09:55:49
43	tomato	2026-05-18 09:57:15	2026-05-18 09:57:15
44	tomato	2026-05-18 09:57:49	2026-05-18 09:57:49
45	tomato	2026-05-18 09:58:15	2026-05-18 09:58:15
46	tomato	2026-05-18 09:59:45	2026-05-18 09:59:45
47	tomato	2026-05-18 10:09:09	2026-05-18 10:09:09
48	tomato	2026-05-18 10:09:18	2026-05-18 10:09:18
49	tomato	2026-05-18 10:09:54	2026-05-18 10:09:54
50	tomato	2026-05-18 10:10:26	2026-05-18 10:10:26
51	tomato	2026-05-18 10:10:38	2026-05-18 10:10:38
52	tomato	2026-05-18 10:10:51	2026-05-18 10:10:51
53	tomato	2026-05-18 10:13:46	2026-05-18 10:13:46
54	tomato	2026-05-20 11:41:18	2026-05-20 11:41:18
55	tomato	2026-05-20 11:41:31	2026-05-20 11:41:31
56	tomato	2026-05-20 11:41:42	2026-05-20 11:41:42
57	tomato	2026-05-20 11:41:50	2026-05-20 11:41:50
58	tomato	2026-05-20 11:58:27	2026-05-20 11:58:27
59	tomato	2026-05-20 13:16:29	2026-05-20 13:16:29
60	tomato	2026-05-20 13:16:37	2026-05-20 13:16:37
61	tomato	2026-05-20 13:16:47	2026-05-20 13:16:47
62	tomato	2026-05-20 13:17:09	2026-05-20 13:17:09
63	tomato	2026-05-20 13:17:47	2026-05-20 13:17:47
64	tomato	2026-05-20 13:18:01	2026-05-20 13:18:01
65	tomato	2026-05-20 13:18:12	2026-05-20 13:18:12
66	tomato	2026-05-20 13:19:45	2026-05-20 13:19:45
67	tomato	2026-05-20 13:20:06	2026-05-20 13:20:06
68	tomato	2026-05-20 13:21:03	2026-05-20 13:21:03
69	tomato	2026-05-20 13:21:27	2026-05-20 13:21:27
70	tomato	2026-05-20 13:22:45	2026-05-20 13:22:45
71	tomato	2026-05-20 13:22:54	2026-05-20 13:22:54
72	tomato	2026-05-20 13:23:03	2026-05-20 13:23:03
73	tomato	2026-05-20 13:23:11	2026-05-20 13:23:11
74	tomato	2026-05-20 13:23:19	2026-05-20 13:23:19
75	tomato	2026-05-20 13:23:42	2026-05-20 13:23:42
76	tomato	2026-05-20 13:23:49	2026-05-20 13:23:49
77	tomato	2026-05-20 13:23:58	2026-05-20 13:23:58
78	tomato	2026-05-20 13:24:15	2026-05-20 13:24:15
79	tomato	2026-05-20 13:24:23	2026-05-20 13:24:23
80	tomato	2026-05-20 13:24:41	2026-05-20 13:24:41
81	tomato	2026-05-20 13:24:50	2026-05-20 13:24:50
82	tomato	2026-05-20 13:25:18	2026-05-20 13:25:18
83	tomato	2026-05-20 13:25:39	2026-05-20 13:25:39
84	tomato	2026-05-20 13:25:48	2026-05-20 13:25:48
85	tomato	2026-05-20 13:25:57	2026-05-20 13:25:57
86	tomato	2026-05-20 13:26:14	2026-05-20 13:26:14
87	tomato	2026-05-20 13:26:37	2026-05-20 13:26:37
88	tomato	2026-05-20 13:27:01	2026-05-20 13:27:01
89	tomato	2026-05-20 13:27:09	2026-05-20 13:27:09
90	tomato	2026-05-20 13:27:18	2026-05-20 13:27:18
91	tomato	2026-05-20 13:27:36	2026-05-20 13:27:36
92	tomato	2026-05-20 13:27:44	2026-05-20 13:27:44
93	tomato	2026-05-20 13:28:01	2026-05-20 13:28:01
94	tomato	2026-05-20 13:28:10	2026-05-20 13:28:10
95	tomato	2026-05-20 13:28:18	2026-05-20 13:28:18
96	tomato	2026-05-20 13:28:59	2026-05-20 13:28:59
97	tomato	2026-05-20 13:29:16	2026-05-20 13:29:16
98	tomato	2026-05-20 13:29:24	2026-05-20 13:29:24
99	tomato	2026-05-20 13:29:34	2026-05-20 13:29:34
100	tomato	2026-05-20 13:29:44	2026-05-20 13:29:44
101	tomato	2026-05-20 13:29:53	2026-05-20 13:29:53
102	tomato	2026-05-20 13:30:02	2026-05-20 13:30:02
103	tomato	2026-05-20 13:30:10	2026-05-20 13:30:10
104	tomato	2026-05-20 13:30:35	2026-05-20 13:30:35
105	tomato	2026-05-20 13:30:52	2026-05-20 13:30:52
106	tomato	2026-05-20 13:31:17	2026-05-20 13:31:17
107	tomato	2026-05-20 13:31:34	2026-05-20 13:31:34
108	tomato	2026-05-20 13:31:43	2026-05-20 13:31:43
109	tomato	2026-05-20 13:31:51	2026-05-20 13:31:51
110	tomato	2026-05-20 13:32:06	2026-05-20 13:32:06
111	tomato	2026-05-20 13:32:26	2026-05-20 13:32:26
112	tomato	2026-05-20 13:32:34	2026-05-20 13:32:34
113	tomato	2026-05-20 13:32:42	2026-05-20 13:32:42
114	tomato	2026-05-20 13:33:00	2026-05-20 13:33:00
115	tomato	2026-05-20 13:33:10	2026-05-20 13:33:10
116	tomato	2026-05-20 13:33:20	2026-05-20 13:33:20
117	tomato	2026-05-20 13:34:00	2026-05-20 13:34:00
118	tomato	2026-05-20 13:34:08	2026-05-20 13:34:08
119	tomato	2026-05-20 13:34:29	2026-05-20 13:34:29
120	tomato	2026-05-20 13:34:37	2026-05-20 13:34:37
121	tomato	2026-05-20 13:34:45	2026-05-20 13:34:45
122	tomato	2026-05-20 13:35:01	2026-05-20 13:35:01
123	tomato	2026-05-20 13:35:10	2026-05-20 13:35:10
124	tomato	2026-05-20 13:35:18	2026-05-20 13:35:18
125	tomato	2026-05-20 13:35:35	2026-05-20 13:35:35
126	tomato	2026-05-20 13:35:55	2026-05-20 13:35:55
127	tomato	2026-05-20 13:36:49	2026-05-20 13:36:49
\.


--
-- TOC entry 3547 (class 0 OID 16488)
-- Dependencies: 231
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- TOC entry 3551 (class 0 OID 17085)
-- Dependencies: 235
-- Data for Name: fruits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fruits (id, fruit_name, created_at, updated_at) FROM stdin;
3	tomato1	2026-04-26 15:43:39	2026-04-26 15:43:39
4	tomato2	2026-04-26 15:43:39	2026-04-26 15:43:39
5	tomato	2026-05-18 09:16:40	2026-05-18 09:16:40
6	tomato	2026-05-18 09:42:00	2026-05-18 09:42:00
7	tomato	2026-05-18 09:42:44	2026-05-18 09:42:44
8	tomato	2026-05-18 09:43:16	2026-05-18 09:43:16
9	tomato	2026-05-18 09:44:39	2026-05-18 09:44:39
10	tomato	2026-05-18 09:45:03	2026-05-18 09:45:03
11	tomato	2026-05-18 09:48:37	2026-05-18 09:48:37
12	tomato	2026-05-18 09:48:55	2026-05-18 09:48:55
13	tomato	2026-05-18 09:49:15	2026-05-18 09:49:15
14	tomato	2026-05-18 09:49:33	2026-05-18 09:49:33
15	tomato	2026-05-18 09:49:44	2026-05-18 09:49:44
16	tomato	2026-05-18 09:50:48	2026-05-18 09:50:48
17	tomato	2026-05-18 09:50:56	2026-05-18 09:50:56
18	tomato	2026-05-18 09:51:04	2026-05-18 09:51:04
19	tomato	2026-05-18 09:51:20	2026-05-18 09:51:20
20	tomato	2026-05-18 09:51:31	2026-05-18 09:51:31
21	tomato	2026-05-18 09:51:49	2026-05-18 09:51:49
22	tomato	2026-05-18 09:52:00	2026-05-18 09:52:00
23	tomato	2026-05-18 09:52:12	2026-05-18 09:52:12
24	tomato	2026-05-18 09:52:22	2026-05-18 09:52:22
25	tomato	2026-05-18 09:52:37	2026-05-18 09:52:37
26	tomato	2026-05-18 09:53:40	2026-05-18 09:53:40
27	tomato	2026-05-18 09:55:31	2026-05-18 09:55:31
28	tomato	2026-05-18 09:55:59	2026-05-18 09:55:59
29	tomato	2026-05-18 09:56:14	2026-05-18 09:56:14
30	tomato	2026-05-18 09:56:25	2026-05-18 09:56:25
31	tomato	2026-05-18 09:56:36	2026-05-18 09:56:36
32	tomato	2026-05-18 09:56:44	2026-05-18 09:56:44
33	tomato	2026-05-18 09:57:23	2026-05-18 09:57:23
34	tomato	2026-05-18 09:57:33	2026-05-18 09:57:33
35	tomato	2026-05-18 09:57:41	2026-05-18 09:57:41
36	tomato	2026-05-18 09:58:27	2026-05-18 09:58:27
37	tomato	2026-05-18 09:58:35	2026-05-18 09:58:35
38	tomato	2026-05-18 09:58:43	2026-05-18 09:58:43
39	tomato	2026-05-18 09:59:05	2026-05-18 09:59:05
40	tomato	2026-05-18 10:09:28	2026-05-18 10:09:28
41	tomato	2026-05-18 10:10:05	2026-05-18 10:10:05
42	tomato	2026-05-18 10:11:09	2026-05-18 10:11:09
43	tomato	2026-05-20 11:40:56	2026-05-20 11:40:56
44	tomato	2026-05-20 11:59:08	2026-05-20 11:59:08
45	tomato	2026-05-20 13:18:33	2026-05-20 13:18:33
46	tomato	2026-05-20 13:19:15	2026-05-20 13:19:15
47	tomato	2026-05-20 13:19:55	2026-05-20 13:19:55
48	tomato	2026-05-20 13:20:37	2026-05-20 13:20:37
49	tomato	2026-05-20 13:20:54	2026-05-20 13:20:54
50	tomato	2026-05-20 13:21:11	2026-05-20 13:21:11
51	tomato	2026-05-20 13:21:44	2026-05-20 13:21:44
52	tomato	2026-05-20 13:24:06	2026-05-20 13:24:06
53	tomato	2026-05-20 13:26:06	2026-05-20 13:26:06
54	tomato	2026-05-20 13:26:53	2026-05-20 13:26:53
55	tomato	2026-05-20 13:27:53	2026-05-20 13:27:53
56	tomato	2026-05-20 13:28:26	2026-05-20 13:28:26
57	tomato	2026-05-20 13:28:37	2026-05-20 13:28:37
58	tomato	2026-05-20 13:30:19	2026-05-20 13:30:19
59	tomato	2026-05-20 13:30:27	2026-05-20 13:30:27
60	tomato	2026-05-20 13:30:43	2026-05-20 13:30:43
61	tomato	2026-05-20 13:31:00	2026-05-20 13:31:00
62	tomato	2026-05-20 13:31:09	2026-05-20 13:31:09
63	tomato	2026-05-20 13:32:15	2026-05-20 13:32:15
64	tomato	2026-05-20 13:32:51	2026-05-20 13:32:51
65	tomato	2026-05-20 13:33:35	2026-05-20 13:33:35
66	tomato	2026-05-20 13:33:51	2026-05-20 13:33:51
67	tomato	2026-05-20 13:35:46	2026-05-20 13:35:46
68	tomato	2026-05-20 13:36:04	2026-05-20 13:36:04
69	tomato	2026-05-20 13:36:23	2026-05-20 13:36:23
70	tomato	2026-05-20 13:36:31	2026-05-20 13:36:31
71	tomato	2026-05-20 13:36:40	2026-05-20 13:36:40
\.


--
-- TOC entry 3545 (class 0 OID 16473)
-- Dependencies: 229
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- TOC entry 3544 (class 0 OID 16458)
-- Dependencies: 228
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- TOC entry 3549 (class 0 OID 17075)
-- Dependencies: 233
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logs (id, info, log_date, created_at, updated_at) FROM stdin;
1	sfadmin logged in	2026-04-28 11:10:31	2026-04-28 11:10:31	2026-04-28 11:10:31
2	sfadmin logged out	2026-04-28 11:10:42	2026-04-28 11:10:42	2026-04-28 11:10:42
3	sfadmin logged in	2026-04-28 11:18:37	2026-04-28 11:18:37	2026-04-28 11:18:37
4	sfadmin logged out	2026-04-28 12:24:24	2026-04-28 12:24:24	2026-04-28 12:24:24
5	sfadmin logged in	2026-04-28 12:24:54	2026-04-28 12:24:54	2026-04-28 12:24:54
6	sfadmin logged out	2026-04-28 12:28:34	2026-04-28 12:28:34	2026-04-28 12:28:34
7	sfadmin logged in	2026-04-28 20:57:06	2026-04-28 20:57:06	2026-04-28 20:57:06
8	sfadmin logged out	2026-04-28 21:51:17	2026-04-28 21:51:17	2026-04-28 21:51:17
9	sfadmin logged in	2026-04-29 13:07:39	2026-04-29 13:07:39	2026-04-29 13:07:39
10	sfadmin logged out	2026-04-29 13:10:09	2026-04-29 13:10:09	2026-04-29 13:10:09
11	sfadmin logged in	2026-04-29 14:16:49	2026-04-29 14:16:49	2026-04-29 14:16:49
12	sfadmin logged out	2026-04-29 14:39:19	2026-04-29 14:39:19	2026-04-29 14:39:19
13	sfadmin logged in	2026-04-29 14:43:25	2026-04-29 14:43:25	2026-04-29 14:43:25
14	sfadmin logged out	2026-04-29 14:44:12	2026-04-29 14:44:12	2026-04-29 14:44:12
15	sfadmin logged in	2026-05-01 13:52:55	2026-05-01 13:52:55	2026-05-01 13:52:55
16	sfadmin logged out	2026-05-01 14:51:37	2026-05-01 14:51:37	2026-05-01 14:51:37
17	sfadmin logged in	2026-05-01 14:51:54	2026-05-01 14:51:54	2026-05-01 14:51:54
18	sfadmin logged in	2026-05-01 17:43:53	2026-05-01 17:43:53	2026-05-01 17:43:53
19	sfadmin logged out	2026-05-01 17:44:57	2026-05-01 17:44:57	2026-05-01 17:44:57
20	sfadmin logged in	2026-05-01 17:45:28	2026-05-01 17:45:28	2026-05-01 17:45:28
21	sfadmin logged out	2026-05-01 18:48:57	2026-05-01 18:48:57	2026-05-01 18:48:57
22	sfadmin logged in	2026-05-04 13:12:36	2026-05-04 13:12:36	2026-05-04 13:12:36
23	sfadmin logged in	2026-05-04 18:16:18	2026-05-04 18:16:18	2026-05-04 18:16:18
24	sfadmin logged out	2026-05-04 18:21:13	2026-05-04 18:21:13	2026-05-04 18:21:13
25	sfadmin logged in	2026-05-04 18:22:04	2026-05-04 18:22:04	2026-05-04 18:22:04
26	sfadmin logged out	2026-05-04 19:02:53	2026-05-04 19:02:53	2026-05-04 19:02:53
27	sfadmin logged in	2026-05-04 19:04:11	2026-05-04 19:04:11	2026-05-04 19:04:11
28	sfadmin logged out	2026-05-04 19:04:43	2026-05-04 19:04:43	2026-05-04 19:04:43
29	sfadmin logged in	2026-05-04 19:05:45	2026-05-04 19:05:45	2026-05-04 19:05:45
30	sfadmin logged out	2026-05-04 19:48:10	2026-05-04 19:48:10	2026-05-04 19:48:10
31	sfadmin logged in	2026-05-05 18:08:49	2026-05-05 18:08:49	2026-05-05 18:08:49
32	sfadmin logged out	2026-05-05 19:55:21	2026-05-05 19:55:21	2026-05-05 19:55:21
33	sfadmin logged in	2026-05-05 19:55:29	2026-05-05 19:55:29	2026-05-05 19:55:29
34	sfadmin logged out	2026-05-05 20:01:07	2026-05-05 20:01:07	2026-05-05 20:01:07
35	sfadmin logged in	2026-05-08 10:30:18	2026-05-08 10:30:18	2026-05-08 10:30:18
36	sfadmin logged out	2026-05-08 12:39:05	2026-05-08 12:39:05	2026-05-08 12:39:05
37	sfadmin logged in	2026-05-08 14:24:13	2026-05-08 14:24:13	2026-05-08 14:24:13
38	sfadmin logged out	2026-05-08 14:24:53	2026-05-08 14:24:53	2026-05-08 14:24:53
39	sfadmin logged in	2026-05-08 15:57:09	2026-05-08 15:57:09	2026-05-08 15:57:09
40	sfadmin directed to dashboard for 13 May 2026	2026-05-08 15:57:15	2026-05-08 15:57:15	2026-05-08 15:57:15
41	sfadmin directed to dashboard for 26 April 2026	2026-05-08 15:57:42	2026-05-08 15:57:42	2026-05-08 15:57:42
42	sfadmin directed to dashboard for 29 April 2026	2026-05-08 15:57:46	2026-05-08 15:57:46	2026-05-08 15:57:46
43	sfadmin logged out	2026-05-08 15:57:55	2026-05-08 15:57:55	2026-05-08 15:57:55
44	sfadmin logged in	2026-05-08 19:26:42	2026-05-08 19:26:42	2026-05-08 19:26:42
45	sfadmin logged out	2026-05-08 19:27:04	2026-05-08 19:27:04	2026-05-08 19:27:04
46	sfadmin logged in	2026-05-08 19:27:10	2026-05-08 19:27:10	2026-05-08 19:27:10
47	sfadmin directed to dashboard for 14 May 2026	2026-05-08 19:27:17	2026-05-08 19:27:17	2026-05-08 19:27:17
48	sfadmin directed to dashboard for 26 April 2026	2026-05-08 19:27:27	2026-05-08 19:27:27	2026-05-08 19:27:27
49	sfadmin logged out	2026-05-08 19:28:17	2026-05-08 19:28:17	2026-05-08 19:28:17
50	sfadmin logged in	2026-05-08 19:38:37	2026-05-08 19:38:37	2026-05-08 19:38:37
51	sfadmin logged out	2026-05-08 19:39:34	2026-05-08 19:39:34	2026-05-08 19:39:34
52	sfadmin logged in	2026-05-08 19:59:38	2026-05-08 19:59:38	2026-05-08 19:59:38
53	sfadmin directed to dashboard for 13 May 2026	2026-05-08 20:00:51	2026-05-08 20:00:51	2026-05-08 20:00:51
54	sfadmin directed to dashboard for 26 April 2026	2026-05-08 20:01:10	2026-05-08 20:01:10	2026-05-08 20:01:10
55	sfadmin directed to dashboard for 26 April 2026	2026-05-08 20:03:52	2026-05-08 20:03:52	2026-05-08 20:03:52
56	sfadmin directed to dashboard for 26 April 2026	2026-05-08 20:03:54	2026-05-08 20:03:54	2026-05-08 20:03:54
57	sfadmin directed to dashboard for 26 April 2026	2026-05-08 20:04:43	2026-05-08 20:04:43	2026-05-08 20:04:43
58	sfadmin directed to dashboard for 26 April 2026	2026-05-08 20:05:06	2026-05-08 20:05:06	2026-05-08 20:05:06
59	sfadmin directed to dashboard for 26 April 2026	2026-05-08 20:05:24	2026-05-08 20:05:24	2026-05-08 20:05:24
60	sfadmin directed to dashboard for 26 April 2026	2026-05-08 20:05:26	2026-05-08 20:05:26	2026-05-08 20:05:26
61	sfadmin directed to dashboard for 26 April 2026	2026-05-08 20:05:38	2026-05-08 20:05:38	2026-05-08 20:05:38
62	sfadmin directed to dashboard for 26 April 2026	2026-05-08 20:05:44	2026-05-08 20:05:44	2026-05-08 20:05:44
63	sfadmin directed to dashboard for 26 April 2026	2026-05-08 20:05:56	2026-05-08 20:05:56	2026-05-08 20:05:56
64	sfadmin directed to dashboard for 26 April 2026	2026-05-08 20:08:05	2026-05-08 20:08:05	2026-05-08 20:08:05
65	sfadmin logged out	2026-05-08 20:25:38	2026-05-08 20:25:38	2026-05-08 20:25:38
66	sfadmin logged in	2026-05-09 14:27:09	2026-05-09 14:27:09	2026-05-09 14:27:09
67	sfadmin directed to dashboard for 26 April 2026	2026-05-09 14:28:09	2026-05-09 14:28:09	2026-05-09 14:28:09
68	sfadmin logged out	2026-05-09 14:41:08	2026-05-09 14:41:08	2026-05-09 14:41:08
69	sfadmin logged in	2026-05-14 12:44:17	2026-05-14 12:44:17	2026-05-14 12:44:17
70	sfadmin directed to dashboard for 23 April 2026	2026-05-14 12:57:59	2026-05-14 12:57:59	2026-05-14 12:57:59
71	sfadmin directed to dashboard for 23 April 2026	2026-05-14 12:59:30	2026-05-14 12:59:30	2026-05-14 12:59:30
72	sfadmin directed to dashboard for 23 April 2026	2026-05-14 13:00:03	2026-05-14 13:00:03	2026-05-14 13:00:03
73	sfadmin directed to dashboard for 23 April 2026	2026-05-14 13:02:37	2026-05-14 13:02:37	2026-05-14 13:02:37
74	sfadmin directed to dashboard for 23 April 2026	2026-05-14 13:02:51	2026-05-14 13:02:51	2026-05-14 13:02:51
75	sfadmin directed to dashboard for 26 April 2026	2026-05-14 13:03:07	2026-05-14 13:03:07	2026-05-14 13:03:07
76	sfadmin directed to dashboard for 26 April 2026	2026-05-14 13:04:35	2026-05-14 13:04:35	2026-05-14 13:04:35
77	sfadmin logged out	2026-05-14 13:11:00	2026-05-14 13:11:00	2026-05-14 13:11:00
78	sfadmin logged in	2026-05-14 16:26:09	2026-05-14 16:26:09	2026-05-14 16:26:09
79	sfadmin directed to dashboard for 26 April 2026	2026-05-14 16:30:44	2026-05-14 16:30:44	2026-05-14 16:30:44
80	sfadmin created a backup: backup_2026-05-14_17-34-20.sql	2026-05-14 17:34:20	2026-05-14 17:34:20	2026-05-14 17:34:20
81	sfadmin created a backup: backup_2026-05-14_17-34-29.sql	2026-05-14 17:34:29	2026-05-14 17:34:29	2026-05-14 17:34:29
82	sfadmin created a backup: segrefruit_2026-05-14_17-35-04.sql	2026-05-14 17:35:04	2026-05-14 17:35:04	2026-05-14 17:35:04
83	sfadmin created a backup: segrefruit_2026-05-14_17-37-37.sql	2026-05-14 17:37:37	2026-05-14 17:37:37	2026-05-14 17:37:37
84	sfadmin created a backup: segrefruit_2026-05-14_17-38-36.sql	2026-05-14 17:38:36	2026-05-14 17:38:36	2026-05-14 17:38:36
85	sfadmin created a backup: segrefruit_2026-05-14_17-41-42.sql	2026-05-14 17:41:42	2026-05-14 17:41:42	2026-05-14 17:41:42
86	sfadmin restored from backup: segrefruit_2026-05-14_17-41-42.sql	2026-05-14 17:56:23	2026-05-14 17:56:23	2026-05-14 17:56:23
87	sfadmin restored from backup: segrefruit_2026-05-14_17-41-42.sql	2026-05-14 18:17:30	2026-05-14 18:17:30	2026-05-14 18:17:30
88	sfadmin created a backup: segrefruit_2026-05-14_18-19-46.sql	2026-05-14 18:19:46	2026-05-14 18:19:46	2026-05-14 18:19:46
89	sfadmin directed to dashboard for 06 May 2026	2026-05-14 18:20:01	2026-05-14 18:20:01	2026-05-14 18:20:01
90	sfadmin logged out	2026-05-14 18:24:26	2026-05-14 18:24:26	2026-05-14 18:24:26
91	sfadmin logged in	2026-05-17 09:45:31	2026-05-17 09:45:31	2026-05-17 09:45:31
92	sfadmin directed to dashboard for 26 April 2026	2026-05-17 09:46:01	2026-05-17 09:46:01	2026-05-17 09:46:01
93	sfadmin directed to dashboard for 26 April 2026	2026-05-17 09:50:09	2026-05-17 09:50:09	2026-05-17 09:50:09
94	sfadmin directed to dashboard for 26 April 2026	2026-05-17 09:57:13	2026-05-17 09:57:13	2026-05-17 09:57:13
95	sfadmin directed to dashboard for 26 April 2026	2026-05-17 10:00:59	2026-05-17 10:00:59	2026-05-17 10:00:59
96	sfadmin directed to dashboard for 26 April 2026	2026-05-17 10:19:35	2026-05-17 10:19:35	2026-05-17 10:19:35
97	sfadmin directed to dashboard for 23 April 2026	2026-05-17 10:19:47	2026-05-17 10:19:47	2026-05-17 10:19:47
98	sfadmin logged out	2026-05-17 11:27:12	2026-05-17 11:27:12	2026-05-17 11:27:12
99	sfadmin logged in	2026-05-18 09:46:25	2026-05-18 09:46:25	2026-05-18 09:46:25
100	sfadmin directed to dashboard for 18 May 2026	2026-05-18 09:46:30	2026-05-18 09:46:30	2026-05-18 09:46:30
101	sfadmin directed to dashboard for 18 May 2026	2026-05-18 09:49:50	2026-05-18 09:49:50	2026-05-18 09:49:50
102	sfadmin directed to dashboard for 18 May 2026	2026-05-18 09:59:52	2026-05-18 09:59:52	2026-05-18 09:59:52
103	sfadmin logged out	2026-05-18 10:00:26	2026-05-18 10:00:26	2026-05-18 10:00:26
104	sfadmin logged in	2026-05-18 10:11:24	2026-05-18 10:11:24	2026-05-18 10:11:24
105	sfadmin directed to dashboard for 20 May 2026	2026-05-18 10:11:58	2026-05-18 10:11:58	2026-05-18 10:11:58
106	sfadmin directed to dashboard for 18 May 2026	2026-05-18 10:12:11	2026-05-18 10:12:11	2026-05-18 10:12:11
107	sfadmin logged in	2026-05-20 11:42:06	2026-05-20 11:42:06	2026-05-20 11:42:06
108	sfadmin directed to dashboard for 20 May 2026	2026-05-20 11:42:10	2026-05-20 11:42:10	2026-05-20 11:42:10
109	sfadmin logged out	2026-05-20 11:42:45	2026-05-20 11:42:45	2026-05-20 11:42:45
110	sfadmin logged in	2026-05-20 11:59:28	2026-05-20 11:59:28	2026-05-20 11:59:28
111	sfadmin directed to dashboard for 20 May 2026	2026-05-20 12:00:37	2026-05-20 12:00:37	2026-05-20 12:00:37
112	sfadmin logged out	2026-05-20 12:02:00	2026-05-20 12:02:00	2026-05-20 12:02:00
113	sfadmin logged in	2026-05-20 13:48:07	2026-05-20 13:48:07	2026-05-20 13:48:07
114	sfadmin directed to dashboard for 20 May 2026	2026-05-20 13:48:31	2026-05-20 13:48:31	2026-05-20 13:48:31
115	sfadmin logged out	2026-05-20 13:51:33	2026-05-20 13:51:33	2026-05-20 13:51:33
116	sfadmin logged in	2026-05-20 13:54:11	2026-05-20 13:54:11	2026-05-20 13:54:11
117	sfadmin directed to dashboard for 20 May 2026	2026-05-20 13:54:17	2026-05-20 13:54:17	2026-05-20 13:54:17
118	sfadmin directed to dashboard for 20 May 2026	2026-05-20 13:54:20	2026-05-20 13:54:20	2026-05-20 13:54:20
119	sfadmin directed to dashboard for 20 May 2026	2026-05-20 13:54:32	2026-05-20 13:54:32	2026-05-20 13:54:32
120	sfadmin logged out	2026-05-20 14:15:02	2026-05-20 14:15:02	2026-05-20 14:15:02
121	sfadmin logged in	2026-05-22 18:52:25	2026-05-22 18:52:25	2026-05-22 18:52:25
122	sfadmin directed to dashboard for 20 May 2026	2026-05-22 18:52:34	2026-05-22 18:52:34	2026-05-22 18:52:34
123	sfadmin directed to dashboard for 20 May 2026	2026-05-22 18:52:41	2026-05-22 18:52:41	2026-05-22 18:52:41
124	sfadmin created a backup: segrefruit_2026-05-22_18-53-20.sql	2026-05-22 18:53:20	2026-05-22 18:53:20	2026-05-22 18:53:20
125	sfadmin directed to dashboard for 22 May 2026	2026-05-22 19:12:46	2026-05-22 19:12:46	2026-05-22 19:12:46
126	sfadmin created a backup: segrefruit_2026-05-22_19-14-21.sql	2026-05-22 19:14:21	2026-05-22 19:14:21	2026-05-22 19:14:21
127	sfadmin directed to dashboard for 20 May 2026	2026-05-22 19:24:44	2026-05-22 19:24:44	2026-05-22 19:24:44
128	sfadmin directed to dashboard for 20 May 2026	2026-05-22 19:54:16	2026-05-22 19:54:16	2026-05-22 19:54:16
129	sfadmin directed to dashboard for 20 May 2026	2026-05-22 20:01:12	2026-05-22 20:01:12	2026-05-22 20:01:12
130	sfadmin directed to dashboard for 20 May 2026	2026-05-22 20:07:48	2026-05-22 20:07:48	2026-05-22 20:07:48
131	sfadmin directed to dashboard for 20 May 2026	2026-05-22 20:08:00	2026-05-22 20:08:00	2026-05-22 20:08:00
132	sfadmin directed to dashboard for 20 May 2026	2026-05-22 20:39:54	2026-05-22 20:39:54	2026-05-22 20:39:54
133	sfadmin directed to dashboard for 20 May 2026	2026-05-22 20:40:28	2026-05-22 20:40:28	2026-05-22 20:40:28
134	sfadmin directed to dashboard for 20 May 2026	2026-05-22 20:41:19	2026-05-22 20:41:19	2026-05-22 20:41:19
135	sfadmin directed to dashboard for 20 May 2026	2026-05-22 20:41:32	2026-05-22 20:41:32	2026-05-22 20:41:32
136	sfadmin directed to dashboard for 20 May 2026	2026-05-22 20:42:00	2026-05-22 20:42:00	2026-05-22 20:42:00
137	sfadmin directed to dashboard for 20 May 2026	2026-05-22 20:43:45	2026-05-22 20:43:45	2026-05-22 20:43:45
138	sfadmin directed to dashboard for 20 May 2026	2026-05-22 20:44:37	2026-05-22 20:44:37	2026-05-22 20:44:37
139	sfadmin directed to dashboard for 20 May 2026	2026-05-22 20:47:49	2026-05-22 20:47:49	2026-05-22 20:47:49
140	sfadmin directed to dashboard for 20 May 2026	2026-05-22 21:08:31	2026-05-22 21:08:31	2026-05-22 21:08:31
141	sfadmin directed to dashboard for 20 May 2026	2026-05-22 21:08:54	2026-05-22 21:08:54	2026-05-22 21:08:54
142	sfadmin directed to dashboard for 20 May 2026	2026-05-22 21:09:13	2026-05-22 21:09:13	2026-05-22 21:09:13
143	sfadmin directed to dashboard for 20 May 2026	2026-05-22 21:09:42	2026-05-22 21:09:42	2026-05-22 21:09:42
144	sfadmin directed to dashboard for 20 May 2026	2026-05-22 21:12:09	2026-05-22 21:12:09	2026-05-22 21:12:09
145	sfadmin directed to dashboard for 20 May 2026	2026-05-22 21:12:25	2026-05-22 21:12:25	2026-05-22 21:12:25
146	sfadmin directed to dashboard for 20 May 2026	2026-05-22 21:12:53	2026-05-22 21:12:53	2026-05-22 21:12:53
147	sfadmin directed to dashboard for 20 May 2026	2026-05-22 21:17:01	2026-05-22 21:17:01	2026-05-22 21:17:01
148	sfadmin directed to dashboard for 20 May 2026	2026-05-22 21:20:56	2026-05-22 21:20:56	2026-05-22 21:20:56
149	sfadmin directed to dashboard for 20 May 2026	2026-05-22 21:21:10	2026-05-22 21:21:10	2026-05-22 21:21:10
150	sfadmin directed to dashboard for 20 May 2026	2026-05-22 21:21:26	2026-05-22 21:21:26	2026-05-22 21:21:26
151	sfadmin directed to dashboard for 20 May 2026	2026-05-22 21:23:18	2026-05-22 21:23:18	2026-05-22 21:23:18
152	sfadmin directed to dashboard for 20 May 2026	2026-05-22 21:23:53	2026-05-22 21:23:53	2026-05-22 21:23:53
153	sfadmin directed to dashboard for 20 May 2026	2026-05-22 21:24:52	2026-05-22 21:24:52	2026-05-22 21:24:52
154	sfadmin directed to dashboard for 20 May 2026	2026-05-22 21:25:04	2026-05-22 21:25:04	2026-05-22 21:25:04
155	sfadmin created a batch for 20 May 2026	2026-05-22 21:25:29	2026-05-22 21:25:29	2026-05-22 21:25:29
156	sfadmin directed to dashboard for 20 May 2026	2026-05-22 21:25:29	2026-05-22 21:25:29	2026-05-22 21:25:29
157	sfadmin directed to dashboard for 20 May 2026	2026-05-22 21:26:52	2026-05-22 21:26:52	2026-05-22 21:26:52
158	sfadmin directed to dashboard for 20 May 2026	2026-05-22 21:35:13	2026-05-22 21:35:13	2026-05-22 21:35:13
159	sfadmin directed to dashboard for 20 May 2026	2026-05-22 21:40:21	2026-05-22 21:40:21	2026-05-22 21:40:21
160	sfadmin directed to dashboard for 20 May 2026	2026-05-22 21:40:45	2026-05-22 21:40:45	2026-05-22 21:40:45
161	sfadmin directed to dashboard for 20 May 2026	2026-05-22 21:42:18	2026-05-22 21:42:18	2026-05-22 21:42:18
162	sfadmin directed to dashboard for 20 May 2026	2026-05-22 21:42:38	2026-05-22 21:42:38	2026-05-22 21:42:38
163	sfadmin directed to dashboard for 20 May 2026	2026-05-22 21:44:31	2026-05-22 21:44:31	2026-05-22 21:44:31
164	sfadmin directed to dashboard for 20 May 2026	2026-05-22 21:44:42	2026-05-22 21:44:42	2026-05-22 21:44:42
165	sfadmin directed to dashboard for 20 May 2026	2026-05-22 21:46:18	2026-05-22 21:46:18	2026-05-22 21:46:18
166	sfadmin directed to dashboard for 20 May 2026	2026-05-22 21:46:36	2026-05-22 21:46:36	2026-05-22 21:46:36
167	sfadmin created a batch for 20 May 2026	2026-05-22 21:47:00	2026-05-22 21:47:00	2026-05-22 21:47:00
168	sfadmin directed to dashboard for 20 May 2026	2026-05-22 21:47:00	2026-05-22 21:47:00	2026-05-22 21:47:00
169	sfadmin directed to dashboard for 20 May 2026	2026-05-22 21:47:43	2026-05-22 21:47:43	2026-05-22 21:47:43
170	sfadmin logged in	2026-05-24 10:36:29	2026-05-24 10:36:29	2026-05-24 10:36:29
171	sfadmin directed to dashboard for 20 May 2026	2026-05-24 10:40:49	2026-05-24 10:40:49	2026-05-24 10:40:49
172	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:16:24	2026-05-24 11:16:24	2026-05-24 11:16:24
173	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:19:57	2026-05-24 11:19:57	2026-05-24 11:19:57
174	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:20:04	2026-05-24 11:20:04	2026-05-24 11:20:04
175	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:20:10	2026-05-24 11:20:10	2026-05-24 11:20:10
176	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:20:13	2026-05-24 11:20:13	2026-05-24 11:20:13
177	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:20:20	2026-05-24 11:20:20	2026-05-24 11:20:20
178	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:20:23	2026-05-24 11:20:23	2026-05-24 11:20:23
179	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:20:29	2026-05-24 11:20:29	2026-05-24 11:20:29
180	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:21:32	2026-05-24 11:21:32	2026-05-24 11:21:32
181	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:21:34	2026-05-24 11:21:34	2026-05-24 11:21:34
182	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:21:40	2026-05-24 11:21:40	2026-05-24 11:21:40
183	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:23:22	2026-05-24 11:23:22	2026-05-24 11:23:22
184	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:23:37	2026-05-24 11:23:37	2026-05-24 11:23:37
185	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:23:38	2026-05-24 11:23:38	2026-05-24 11:23:38
186	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:24:28	2026-05-24 11:24:28	2026-05-24 11:24:28
187	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:24:31	2026-05-24 11:24:31	2026-05-24 11:24:31
188	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:24:33	2026-05-24 11:24:33	2026-05-24 11:24:33
189	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:24:35	2026-05-24 11:24:35	2026-05-24 11:24:35
190	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:24:36	2026-05-24 11:24:36	2026-05-24 11:24:36
191	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:24:43	2026-05-24 11:24:43	2026-05-24 11:24:43
192	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:27:45	2026-05-24 11:27:45	2026-05-24 11:27:45
193	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:27:50	2026-05-24 11:27:50	2026-05-24 11:27:50
194	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:28:50	2026-05-24 11:28:50	2026-05-24 11:28:50
195	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:28:52	2026-05-24 11:28:52	2026-05-24 11:28:52
196	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:28:53	2026-05-24 11:28:53	2026-05-24 11:28:53
197	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:28:55	2026-05-24 11:28:55	2026-05-24 11:28:55
198	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:29:15	2026-05-24 11:29:15	2026-05-24 11:29:15
199	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:29:28	2026-05-24 11:29:28	2026-05-24 11:29:28
200	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:29:38	2026-05-24 11:29:38	2026-05-24 11:29:38
201	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:32:24	2026-05-24 11:32:24	2026-05-24 11:32:24
202	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:32:27	2026-05-24 11:32:27	2026-05-24 11:32:27
203	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:32:30	2026-05-24 11:32:30	2026-05-24 11:32:30
204	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:32:34	2026-05-24 11:32:34	2026-05-24 11:32:34
205	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:32:35	2026-05-24 11:32:35	2026-05-24 11:32:35
206	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:33:04	2026-05-24 11:33:04	2026-05-24 11:33:04
207	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:33:12	2026-05-24 11:33:12	2026-05-24 11:33:12
208	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:33:14	2026-05-24 11:33:14	2026-05-24 11:33:14
209	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:33:16	2026-05-24 11:33:16	2026-05-24 11:33:16
210	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:33:17	2026-05-24 11:33:17	2026-05-24 11:33:17
211	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:33:18	2026-05-24 11:33:18	2026-05-24 11:33:18
212	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:33:20	2026-05-24 11:33:20	2026-05-24 11:33:20
213	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:34:47	2026-05-24 11:34:47	2026-05-24 11:34:47
214	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:35:23	2026-05-24 11:35:23	2026-05-24 11:35:23
215	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:35:32	2026-05-24 11:35:32	2026-05-24 11:35:32
216	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:35:33	2026-05-24 11:35:33	2026-05-24 11:35:33
217	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:35:37	2026-05-24 11:35:37	2026-05-24 11:35:37
218	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:35:42	2026-05-24 11:35:42	2026-05-24 11:35:42
219	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:35:45	2026-05-24 11:35:45	2026-05-24 11:35:45
220	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:40:44	2026-05-24 11:40:44	2026-05-24 11:40:44
221	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:40:48	2026-05-24 11:40:48	2026-05-24 11:40:48
222	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:42:03	2026-05-24 11:42:03	2026-05-24 11:42:03
223	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:42:24	2026-05-24 11:42:24	2026-05-24 11:42:24
224	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:43:01	2026-05-24 11:43:01	2026-05-24 11:43:01
225	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:43:35	2026-05-24 11:43:35	2026-05-24 11:43:35
226	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:43:57	2026-05-24 11:43:57	2026-05-24 11:43:57
227	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:44:10	2026-05-24 11:44:10	2026-05-24 11:44:10
228	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:44:13	2026-05-24 11:44:13	2026-05-24 11:44:13
229	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:44:17	2026-05-24 11:44:17	2026-05-24 11:44:17
230	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:44:21	2026-05-24 11:44:21	2026-05-24 11:44:21
231	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:44:25	2026-05-24 11:44:25	2026-05-24 11:44:25
232	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:45:07	2026-05-24 11:45:07	2026-05-24 11:45:07
233	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:45:16	2026-05-24 11:45:16	2026-05-24 11:45:16
234	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:45:32	2026-05-24 11:45:32	2026-05-24 11:45:32
235	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:45:35	2026-05-24 11:45:35	2026-05-24 11:45:35
236	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:47:43	2026-05-24 11:47:43	2026-05-24 11:47:43
237	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:48:01	2026-05-24 11:48:01	2026-05-24 11:48:01
238	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:48:38	2026-05-24 11:48:38	2026-05-24 11:48:38
239	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:48:42	2026-05-24 11:48:42	2026-05-24 11:48:42
240	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:48:46	2026-05-24 11:48:46	2026-05-24 11:48:46
241	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:48:48	2026-05-24 11:48:48	2026-05-24 11:48:48
242	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:48:50	2026-05-24 11:48:50	2026-05-24 11:48:50
243	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:48:55	2026-05-24 11:48:55	2026-05-24 11:48:55
244	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:50:53	2026-05-24 11:50:53	2026-05-24 11:50:53
245	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:54:23	2026-05-24 11:54:23	2026-05-24 11:54:23
246	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:54:42	2026-05-24 11:54:42	2026-05-24 11:54:42
247	sfadmin directed to dashboard for 20 May 2026	2026-05-24 11:54:49	2026-05-24 11:54:49	2026-05-24 11:54:49
248	sfadmin created a backup: segrefruit_2026-05-24_12-39-56.sql	2026-05-24 12:39:56	2026-05-24 12:39:56	2026-05-24 12:39:56
249	sfadmin created a backup: segrefruit_2026-05-24_13-02-11.sql	2026-05-24 13:02:11	2026-05-24 13:02:11	2026-05-24 13:02:11
250	sfadmin created a backup: segrefruit_2026-05-24_13-06-07.sql	2026-05-24 13:06:08	2026-05-24 13:06:08	2026-05-24 13:06:08
251	sfadmin created a backup: segrefruit_2026-05-24_13-15-25.sql	2026-05-24 13:15:25	2026-05-24 13:15:25	2026-05-24 13:15:25
252	sfadmin exported fruits CSV	2026-05-24 13:15:34	2026-05-24 13:15:34	2026-05-24 13:15:34
253	sfadmin imported fruits CSV	2026-05-24 13:16:06	2026-05-24 13:16:06	2026-05-24 13:16:06
254	sfadmin created a backup: segrefruit_2026-05-24_13-16-14.sql	2026-05-24 13:16:14	2026-05-24 13:16:14	2026-05-24 13:16:14
255	sfadmin created a backup: segrefruit_2026-05-24_13-16-36.sql	2026-05-24 13:16:37	2026-05-24 13:16:37	2026-05-24 13:16:37
256	sfadmin restored from backup: segrefruit_2026-05-24_13-16-14.sql	2026-05-24 13:16:50	2026-05-24 13:16:50	2026-05-24 13:16:50
257	sfadmin attempted to create a backup: segrefruit_2026-05-24_13-23-24.sql	2026-05-24 13:23:24	2026-05-24 13:23:24	2026-05-24 13:23:24
258	sfadmin attempted to export fruits CSV	2026-05-24 13:23:30	2026-05-24 13:23:30	2026-05-24 13:23:30
259	sfadmin directed to dashboard for 20 May 2026	2026-05-24 13:23:50	2026-05-24 13:23:50	2026-05-24 13:23:50
260	sfadmin directed to dashboard for 20 May 2026	2026-05-24 13:24:09	2026-05-24 13:24:09	2026-05-24 13:24:09
261	sfadmin logged out	2026-05-24 13:24:33	2026-05-24 13:24:33	2026-05-24 13:24:33
\.


--
-- TOC entry 3536 (class 0 OID 16390)
-- Dependencies: 220
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
7	2026_04_11_093331_create_logs_table	2
8	2026_04_11_100944_create_fruits_table	2
9	2026_04_11_101029_create_dmg_fruits_table	2
16	2026_05_22_211117_create_batchs_table	3
\.


--
-- TOC entry 3539 (class 0 OID 16414)
-- Dependencies: 223
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 3540 (class 0 OID 16423)
-- Dependencies: 224
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
xQXvMCKwNl797VRmHYbXq4rKPJDEgdt2MMT7iMa3	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFFpRzNCcFB5NHIzZFNjYWN3UjJoMUt1THMydTZFSjljWm5pU3JPRyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zZWdyZWZydWl0L2xvZ2luIjtzOjU6InJvdXRlIjtzOjU6ImxvZ2luIjt9fQ==	1779600273
\.


--
-- TOC entry 3538 (class 0 OID 16400)
-- Dependencies: 222
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
1	SF_Admin	sfadmin	\N	$2y$12$HkdK3yhlyYRujmlEoQbvDe3omDFyzwShuh7IWTpZZcFrdxaXycXlu	\N	\N	\N
\.


--
-- TOC entry 3570 (class 0 OID 0)
-- Dependencies: 238
-- Name: batchs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.batchs_id_seq', 2, true);


--
-- TOC entry 3571 (class 0 OID 0)
-- Dependencies: 236
-- Name: dmg_fruits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dmg_fruits_id_seq', 127, true);


--
-- TOC entry 3572 (class 0 OID 0)
-- Dependencies: 230
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 3573 (class 0 OID 0)
-- Dependencies: 234
-- Name: fruits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fruits_id_seq', 71, true);


--
-- TOC entry 3574 (class 0 OID 0)
-- Dependencies: 227
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- TOC entry 3575 (class 0 OID 0)
-- Dependencies: 232
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_id_seq', 261, true);


--
-- TOC entry 3576 (class 0 OID 0)
-- Dependencies: 219
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 16, true);


--
-- TOC entry 3577 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- TOC entry 3387 (class 2606 OID 17187)
-- Name: batchs batchs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.batchs
    ADD CONSTRAINT batchs_pkey PRIMARY KEY (id);


--
-- TOC entry 3370 (class 2606 OID 16455)
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- TOC entry 3367 (class 2606 OID 16444)
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- TOC entry 3385 (class 2606 OID 17101)
-- Name: dmg_fruits dmg_fruits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dmg_fruits
    ADD CONSTRAINT dmg_fruits_pkey PRIMARY KEY (id);


--
-- TOC entry 3377 (class 2606 OID 16503)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3379 (class 2606 OID 16505)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 3383 (class 2606 OID 17092)
-- Name: fruits fruits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fruits
    ADD CONSTRAINT fruits_pkey PRIMARY KEY (id);


--
-- TOC entry 3375 (class 2606 OID 16486)
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- TOC entry 3372 (class 2606 OID 16471)
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3381 (class 2606 OID 17083)
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- TOC entry 3354 (class 2606 OID 16398)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3360 (class 2606 OID 16422)
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- TOC entry 3363 (class 2606 OID 16432)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 3356 (class 2606 OID 16413)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 3358 (class 2606 OID 16411)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3365 (class 1259 OID 16445)
-- Name: cache_expiration_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cache_expiration_index ON public.cache USING btree (expiration);


--
-- TOC entry 3368 (class 1259 OID 16456)
-- Name: cache_locks_expiration_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cache_locks_expiration_index ON public.cache_locks USING btree (expiration);


--
-- TOC entry 3373 (class 1259 OID 16472)
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- TOC entry 3361 (class 1259 OID 16434)
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- TOC entry 3364 (class 1259 OID 16433)
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


-- Completed on 2026-05-24 13:26:46 PST

--
-- PostgreSQL database dump complete
--

\unrestrict 60Mf7JAHKAR3KDVa4WNzozK3Dxw9yW7ldD4b3F4x6i9NAn85Cwc3KN8mzc4lr77

-- Completed on 2026-05-24 13:26:46 PST

--
-- PostgreSQL database cluster dump complete
--

