--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: groups; Type: TABLE; Schema: public; Owner: scoutsfd; Tablespace: 
--

CREATE TABLE groups (
    id integer NOT NULL,
    name character varying,
    parent_id integer,
    admin boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.groups OWNER TO scoutsfd;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: scoutsfd
--

CREATE SEQUENCE groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO scoutsfd;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scoutsfd
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


--
-- Name: groups_roles; Type: TABLE; Schema: public; Owner: scoutsfd; Tablespace: 
--

CREATE TABLE groups_roles (
    id integer NOT NULL,
    group_id integer,
    role_id integer
);


ALTER TABLE public.groups_roles OWNER TO scoutsfd;

--
-- Name: groups_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: scoutsfd
--

CREATE SEQUENCE groups_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_roles_id_seq OWNER TO scoutsfd;

--
-- Name: groups_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scoutsfd
--

ALTER SEQUENCE groups_roles_id_seq OWNED BY groups_roles.id;


--
-- Name: groups_users; Type: TABLE; Schema: public; Owner: scoutsfd; Tablespace: 
--

CREATE TABLE groups_users (
    id integer NOT NULL,
    group_id integer,
    user_id integer
);


ALTER TABLE public.groups_users OWNER TO scoutsfd;

--
-- Name: groups_users_id_seq; Type: SEQUENCE; Schema: public; Owner: scoutsfd
--

CREATE SEQUENCE groups_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_users_id_seq OWNER TO scoutsfd;

--
-- Name: groups_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scoutsfd
--

ALTER SEQUENCE groups_users_id_seq OWNED BY groups_users.id;


--
-- Name: members_runs; Type: TABLE; Schema: public; Owner: scoutsfd; Tablespace: 
--

CREATE TABLE members_runs (
    id integer NOT NULL,
    user_id integer,
    run_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.members_runs OWNER TO scoutsfd;

--
-- Name: members_runs_id_seq; Type: SEQUENCE; Schema: public; Owner: scoutsfd
--

CREATE SEQUENCE members_runs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.members_runs_id_seq OWNER TO scoutsfd;

--
-- Name: members_runs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scoutsfd
--

ALTER SEQUENCE members_runs_id_seq OWNED BY members_runs.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: scoutsfd; Tablespace: 
--

CREATE TABLE payments (
    id integer NOT NULL,
    subscription_id integer,
    amount_paid numeric,
    date timestamp without time zone,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    paypal boolean,
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.payments OWNER TO scoutsfd;

--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: scoutsfd
--

CREATE SEQUENCE payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_id_seq OWNER TO scoutsfd;

--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scoutsfd
--

ALTER SEQUENCE payments_id_seq OWNED BY payments.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: scoutsfd; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    role character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.roles OWNER TO scoutsfd;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: scoutsfd
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO scoutsfd;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scoutsfd
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: routes; Type: TABLE; Schema: public; Owner: scoutsfd; Tablespace: 
--

CREATE TABLE routes (
    id integer NOT NULL,
    name character varying,
    group_id integer,
    print_sequence integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    marker character varying
);


ALTER TABLE public.routes OWNER TO scoutsfd;

--
-- Name: routes_id_seq; Type: SEQUENCE; Schema: public; Owner: scoutsfd
--

CREATE SEQUENCE routes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.routes_id_seq OWNER TO scoutsfd;

--
-- Name: routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scoutsfd
--

ALTER SEQUENCE routes_id_seq OWNED BY routes.id;


--
-- Name: routes_users; Type: TABLE; Schema: public; Owner: scoutsfd; Tablespace: 
--

CREATE TABLE routes_users (
    id integer NOT NULL,
    route_id integer,
    user_id integer
);


ALTER TABLE public.routes_users OWNER TO scoutsfd;

--
-- Name: routes_users_id_seq; Type: SEQUENCE; Schema: public; Owner: scoutsfd
--

CREATE SEQUENCE routes_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.routes_users_id_seq OWNER TO scoutsfd;

--
-- Name: routes_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scoutsfd
--

ALTER SEQUENCE routes_users_id_seq OWNED BY routes_users.id;


--
-- Name: runs; Type: TABLE; Schema: public; Owner: scoutsfd; Tablespace: 
--

CREATE TABLE runs (
    id integer NOT NULL,
    route_id integer,
    datetime_started timestamp without time zone,
    datetime_ended timestamp without time zone,
    am_pm character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.runs OWNER TO scoutsfd;

--
-- Name: runs_id_seq; Type: SEQUENCE; Schema: public; Owner: scoutsfd
--

CREATE SEQUENCE runs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.runs_id_seq OWNER TO scoutsfd;

--
-- Name: runs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scoutsfd
--

ALTER SEQUENCE runs_id_seq OWNED BY runs.id;


--
-- Name: runs_users; Type: TABLE; Schema: public; Owner: scoutsfd; Tablespace: 
--

CREATE TABLE runs_users (
    id integer NOT NULL,
    run_id integer,
    user_id integer
);


ALTER TABLE public.runs_users OWNER TO scoutsfd;

--
-- Name: runs_users_id_seq; Type: SEQUENCE; Schema: public; Owner: scoutsfd
--

CREATE SEQUENCE runs_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.runs_users_id_seq OWNER TO scoutsfd;

--
-- Name: runs_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scoutsfd
--

ALTER SEQUENCE runs_users_id_seq OWNED BY runs_users.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: scoutsfd; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO scoutsfd;

--
-- Name: subscribers; Type: TABLE; Schema: public; Owner: scoutsfd; Tablespace: 
--

CREATE TABLE subscribers (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    email character varying,
    cell_phone character varying,
    landline character varying,
    address_line_1 character varying,
    address_line_2 character varying,
    city character varying,
    state character varying,
    zip character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    subscription_amount integer
);


ALTER TABLE public.subscribers OWNER TO scoutsfd;

--
-- Name: subscribers_id_seq; Type: SEQUENCE; Schema: public; Owner: scoutsfd
--

CREATE SEQUENCE subscribers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscribers_id_seq OWNER TO scoutsfd;

--
-- Name: subscribers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scoutsfd
--

ALTER SEQUENCE subscribers_id_seq OWNED BY subscribers.id;


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: scoutsfd; Tablespace:
--

CREATE TABLE subscriptions (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    email character varying,
    cell_phone character varying,
    landline character varying,
    route_id integer,
    print_sequence integer,
    address_line_1 character varying,
    address_line_2 character varying,
    city character varying,
    state character varying,
    zip character varying,
    qty integer,
    group_id integer,
    last_invoice_sent timestamp without time zone,
    renewal_due_date timestamp without time zone,
    notes text,
    maintenance_notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    latitude double precision,
    longitude double precision,
    subscriber_id integer,
    status character varying,
    renewal_grp double precision,
    qty_comp integer,
    subscription_notes character varying
);


ALTER TABLE public.subscriptions OWNER TO scoutsfd;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: scoutsfd
--

CREATE SEQUENCE subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriptions_id_seq OWNER TO scoutsfd;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scoutsfd
--

ALTER SEQUENCE subscriptions_id_seq OWNED BY subscriptions.id;


--
-- Name: tasks; Type: TABLE; Schema: public; Owner: scoutsfd; Tablespace:
--

CREATE TABLE tasks (
    id integer NOT NULL,
    run_id integer,
    user_id integer,
    subscription_id integer,
    description character varying,
    qty integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.tasks OWNER TO scoutsfd;

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: scoutsfd
--

CREATE SEQUENCE tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasks_id_seq OWNER TO scoutsfd;

--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scoutsfd
--

ALTER SEQUENCE tasks_id_seq OWNED BY tasks.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: scoutsfd; Tablespace:
--

CREATE TABLE users (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email character varying,
    encrypted_password character varying(128) NOT NULL,
    confirmation_token character varying(128),
    remember_token character varying(128) NOT NULL,
    can_view_routes boolean,
    first_name character varying,
    last_name character varying,
    cell_phone character varying,
    landline character varying,
    is_active boolean,
    vehicle character varying,
    group_id integer,
    route_id integer
);


ALTER TABLE public.users OWNER TO scoutsfd;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: scoutsfd
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO scoutsfd;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scoutsfd
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scoutsfd
--

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scoutsfd
--

ALTER TABLE ONLY groups_roles ALTER COLUMN id SET DEFAULT nextval('groups_roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scoutsfd
--

ALTER TABLE ONLY groups_users ALTER COLUMN id SET DEFAULT nextval('groups_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scoutsfd
--

ALTER TABLE ONLY members_runs ALTER COLUMN id SET DEFAULT nextval('members_runs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scoutsfd
--

ALTER TABLE ONLY payments ALTER COLUMN id SET DEFAULT nextval('payments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scoutsfd
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scoutsfd
--

ALTER TABLE ONLY routes ALTER COLUMN id SET DEFAULT nextval('routes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scoutsfd
--

ALTER TABLE ONLY routes_users ALTER COLUMN id SET DEFAULT nextval('routes_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scoutsfd
--

ALTER TABLE ONLY runs ALTER COLUMN id SET DEFAULT nextval('runs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scoutsfd
--

ALTER TABLE ONLY runs_users ALTER COLUMN id SET DEFAULT nextval('runs_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scoutsfd
--

ALTER TABLE ONLY subscribers ALTER COLUMN id SET DEFAULT nextval('subscribers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scoutsfd
--

ALTER TABLE ONLY subscriptions ALTER COLUMN id SET DEFAULT nextval('subscriptions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scoutsfd
--

ALTER TABLE ONLY tasks ALTER COLUMN id SET DEFAULT nextval('tasks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scoutsfd
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: scoutsfd
--

COPY groups (id, name, parent_id, admin, created_at, updated_at) FROM stdin;
1	SiteAdmins	\N	t	2015-05-09 16:28:28.893066	2015-05-09 16:28:28.893066
4	Troop02	\N	f	2015-05-09 16:28:28.92748	2015-05-09 16:28:28.92748
5	Troop03	\N	f	2015-05-09 16:28:28.932849	2015-05-09 16:28:28.932849
3	Troop1300	2	f	2015-05-09 16:28:28.921967	2015-05-09 22:42:22.945441
2	Troop1300Leaders	\N	f	2015-05-09 16:28:28.915732	2015-05-09 22:42:40.427293
\.


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: scoutsfd
--

SELECT pg_catalog.setval('groups_id_seq', 5, true);


--
-- Data for Name: groups_roles; Type: TABLE DATA; Schema: public; Owner: scoutsfd
--

COPY groups_roles (id, group_id, role_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	3
5	5	3
\.


--
-- Name: groups_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: scoutsfd
--

SELECT pg_catalog.setval('groups_roles_id_seq', 5, true);


--
-- Data for Name: groups_users; Type: TABLE DATA; Schema: public; Owner: scoutsfd
--

COPY groups_users (id, group_id, user_id) FROM stdin;
1	1	1
2	2	8
3	3	2
4	3	3
5	3	8
6	3	5
7	3	6
8	3	7
9	1	20
10	1	21
11	1	22
12	1	23
13	1	24
14	1	25
15	1	26
16	1	27
17	1	90
18	1	153
19	1	216
20	1	279
21	1	342
22	1	405
23	1	468
24	1	531
25	3	593
26	3	592
27	3	591
28	3	590
29	3	589
30	3	588
31	3	587
32	3	586
33	3	585
34	3	584
35	3	583
36	3	582
37	3	581
38	3	580
39	3	579
40	3	578
41	3	577
42	3	576
43	3	575
44	3	574
45	3	573
46	3	572
47	3	571
48	3	570
49	3	569
50	3	568
51	3	567
52	3	566
53	3	565
54	3	564
55	3	563
56	3	562
57	3	561
58	3	560
59	3	559
60	3	558
61	3	557
62	3	556
63	3	555
64	3	554
65	3	553
66	3	552
67	3	551
68	3	550
69	3	549
70	3	548
71	3	547
72	3	546
73	3	545
74	3	544
75	3	543
76	3	542
77	3	541
78	3	540
79	3	539
80	3	538
81	3	537
82	3	536
83	3	535
84	3	534
85	3	533
86	3	532
87	3	531
88	1	594
89	3	656
90	3	655
91	3	654
92	3	653
93	3	652
94	3	651
95	3	650
96	3	649
97	3	648
98	3	647
99	3	646
100	3	645
101	3	644
102	3	643
103	3	642
104	3	641
105	3	640
106	3	639
107	3	638
108	3	637
109	3	636
110	3	635
111	3	634
112	3	633
113	3	632
114	3	631
115	3	630
116	3	629
117	3	628
118	3	627
119	3	626
120	3	625
121	3	624
122	3	623
123	3	622
124	3	621
125	3	620
126	3	619
127	3	618
128	3	617
129	3	616
130	3	615
131	3	614
132	3	613
133	3	612
134	3	611
135	3	610
136	3	609
137	3	608
138	3	607
139	3	606
140	3	605
141	3	604
142	3	603
143	3	602
144	3	601
145	3	600
146	3	599
147	3	598
148	3	597
149	3	596
150	3	595
151	3	594
152	2	657
159	2	658
\.


--
-- Name: groups_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: scoutsfd
--

SELECT pg_catalog.setval('groups_users_id_seq', 159, true);


--
-- Data for Name: members_runs; Type: TABLE DATA; Schema: public; Owner: scoutsfd
--

COPY members_runs (id, user_id, run_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: members_runs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: scoutsfd
--

SELECT pg_catalog.setval('members_runs_id_seq', 1, false);


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: scoutsfd
--

COPY payments (id, subscription_id, amount_paid, date, start_date, end_date, paypal, notes, created_at, updated_at) FROM stdin;
7206	5174	30.00	2015-05-09 18:06:33.755076	2013-06-12 00:00:00	2014-06-12 00:00:00	f	updated service date	2015-05-09 18:06:33.755084	2015-05-09 18:06:33.755087
7207	5175	30.00	2015-05-09 18:06:33.755407	2013-06-12 00:00:00	2014-06-12 00:00:00	t		2015-05-09 18:06:33.755414	2015-05-09 18:06:33.755417
7208	5088	30.00	2015-05-09 18:06:33.755548	2013-06-15 00:00:00	2014-06-15 00:00:00	f		2015-05-09 18:06:33.755555	2015-05-09 18:06:33.755557
7209	5090	30.00	2015-05-09 18:06:33.755679	2013-06-15 00:00:00	2014-06-15 00:00:00	f		2015-05-09 18:06:33.755685	2015-05-09 18:06:33.755687
7210	5093	30.00	2015-05-09 18:06:33.755805	2013-06-18 00:00:00	2014-06-18 00:00:00	f		2015-05-09 18:06:33.755811	2015-05-09 18:06:33.755813
7211	5094	30.00	2015-05-09 18:06:33.755938	2013-06-18 00:00:00	2014-06-18 00:00:00	f		2015-05-09 18:06:33.755944	2015-05-09 18:06:33.755946
7212	5125	30.00	2015-05-09 18:06:33.756074	2013-06-18 00:00:00	2014-06-18 00:00:00	f		2015-05-09 18:06:33.75608	2015-05-09 18:06:33.756082
7213	5121	30.00	2015-05-09 18:06:33.7562	2013-06-18 00:00:00	2014-06-18 00:00:00	f	920 Hawthorne and Front of	2015-05-09 18:06:33.756206	2015-05-09 18:06:33.756208
7214	5092	30.00	2015-05-09 18:06:33.756323	2013-06-18 00:00:00	2014-06-18 00:00:00	f		2015-05-09 18:06:33.756329	2015-05-09 18:06:33.756331
7215	5132	30.00	2015-05-09 18:06:33.756444	2013-06-18 00:00:00	2014-06-18 00:00:00	f		2015-05-09 18:06:33.75645	2015-05-09 18:06:33.756453
7216	5177	30.00	2015-05-09 18:06:33.756565	2013-06-13 00:00:00	2014-06-13 00:00:00	f		2015-05-09 18:06:33.756571	2015-05-09 18:06:33.756573
7217	5124	30.00	2015-05-09 18:06:33.756685	2013-06-18 00:00:00	2014-06-18 00:00:00	f	920 Hawthorne and Front of	2015-05-09 18:06:33.756691	2015-05-09 18:06:33.756693
7218	5131	180.00	2015-05-09 18:06:33.756805	2013-06-20 00:00:00	2014-06-20 00:00:00	f	Extra $150 donation	2015-05-09 18:06:33.756812	2015-05-09 18:06:33.756814
7219	5130	180.00	2015-05-09 18:06:33.756926	2013-06-20 00:00:00	2014-06-20 00:00:00	f	Extra $150 donation	2015-05-09 18:06:33.756932	2015-05-09 18:06:33.756935
7220	5127	30.00	2015-05-09 18:06:33.757046	2013-06-20 00:00:00	2014-06-20 00:00:00	f		2015-05-09 18:06:33.757052	2015-05-09 18:06:33.757055
7221	5119	30.00	2015-05-09 18:06:33.757165	2013-06-24 00:00:00	2014-06-24 00:00:00	f		2015-05-09 18:06:33.757171	2015-05-09 18:06:33.757174
7222	5149	30.00	2015-05-09 18:06:33.757284	2013-06-24 00:00:00	2014-06-24 00:00:00	f		2015-05-09 18:06:33.75729	2015-05-09 18:06:33.757293
7223	5129	30.00	2015-05-09 18:06:33.757404	2013-06-24 00:00:00	2014-06-24 00:00:00	f		2015-05-09 18:06:33.75741	2015-05-09 18:06:33.757412
7224	5139	30.00	2015-05-09 18:06:33.757527	2013-06-24 00:00:00	2014-06-24 00:00:00	f		2015-05-09 18:06:33.757533	2015-05-09 18:06:33.757536
7225	5097	30.00	2015-05-09 18:06:33.757647	2013-06-26 00:00:00	2014-06-26 00:00:00	f		2015-05-09 18:06:33.757653	2015-05-09 18:06:33.757655
7226	5157	30.00	2015-05-09 18:06:33.757779	2013-06-26 00:00:00	2014-06-26 00:00:00	f		2015-05-09 18:06:33.757785	2015-05-09 18:06:33.757787
7227	5166	50.00	2015-05-09 18:06:33.757894	2013-06-26 00:00:00	2014-06-26 00:00:00	f	Extra 20 donation	2015-05-09 18:06:33.7579	2015-05-09 18:06:33.757902
7228	5168	30.00	2015-05-09 18:06:33.75801	2013-06-26 00:00:00	2014-06-26 00:00:00	f		2015-05-09 18:06:33.758016	2015-05-09 18:06:33.758018
7229	5178	30.00	2015-05-09 18:06:33.758129	2013-06-26 00:00:00	2014-06-26 00:00:00	f		2015-05-09 18:06:33.758135	2015-05-09 18:06:33.758138
7230	5150	30.00	2015-05-09 18:06:33.758245	2013-06-30 00:00:00	2014-06-30 00:00:00	f		2015-05-09 18:06:33.758251	2015-05-09 18:06:33.758253
7231	5155	30.00	2015-05-09 18:06:33.75836	2013-06-30 00:00:00	2014-06-30 00:00:00	f		2015-05-09 18:06:33.758366	2015-05-09 18:06:33.758368
7232	5118	30.00	2015-05-09 18:06:33.75848	2013-06-30 00:00:00	2014-06-30 00:00:00	f		2015-05-09 18:06:33.758486	2015-05-09 18:06:33.758488
7233	5160	30.00	2015-05-09 18:06:33.758596	2013-06-30 00:00:00	2014-06-30 00:00:00	f		2015-05-09 18:06:33.758601	2015-05-09 18:06:33.758604
7234	5151	530.00	2015-05-09 18:06:33.758711	2013-06-30 00:00:00	2014-06-30 00:00:00	f	Extra $500	2015-05-09 18:06:33.758717	2015-05-09 18:06:33.758719
7235	5152	30.00	2015-05-09 18:06:33.758864	2013-06-30 00:00:00	2014-06-30 00:00:00	f		2015-05-09 18:06:33.75887	2015-05-09 18:06:33.758872
7236	5167	30.00	2015-05-09 18:06:33.758989	2013-06-30 00:00:00	2014-06-30 00:00:00	f		2015-05-09 18:06:33.758995	2015-05-09 18:06:33.758997
7237	5158	30.00	2015-05-09 18:06:33.759108	2013-06-30 00:00:00	2014-06-30 00:00:00	f		2015-05-09 18:06:33.759114	2015-05-09 18:06:33.759117
7238	5163	30.00	2015-05-09 18:06:33.759238	2013-06-30 00:00:00	2014-06-30 00:00:00	f		2015-05-09 18:06:33.759244	2015-05-09 18:06:33.759246
7239	5173	30.00	2015-05-09 18:06:33.759353	2013-06-14 00:00:00	2014-06-14 00:00:00	t	Assumed Paypal	2015-05-09 18:06:33.759359	2015-05-09 18:06:33.759361
7240	5171	30.00	2015-05-09 18:06:33.759471	2013-06-14 00:00:00	2014-06-14 00:00:00	t	Assumed Paypal	2015-05-09 18:06:33.759476	2015-05-09 18:06:33.759478
7241	5172	30.00	2015-05-09 18:06:33.759586	2013-06-14 00:00:00	2014-06-14 00:00:00	t	Assumed Paypal	2015-05-09 18:06:33.759592	2015-05-09 18:06:33.759594
7242	5117	30.00	2015-05-09 18:06:33.759702	2013-07-01 00:00:00	2014-07-01 00:00:00	f		2015-05-09 18:06:33.759708	2015-05-09 18:06:33.75971
7243	5164	30.00	2015-05-09 18:06:33.759818	2013-07-01 00:00:00	2014-07-01 00:00:00	f		2015-05-09 18:06:33.759823	2015-05-09 18:06:33.759826
7244	5154	30.00	2015-05-09 18:06:33.759933	2013-07-01 00:00:00	2014-07-01 00:00:00	t		2015-05-09 18:06:33.759939	2015-05-09 18:06:33.759941
7245	5162	30.00	2015-05-09 18:06:33.760048	2013-07-02 00:00:00	2014-07-02 00:00:00	f		2015-05-09 18:06:33.760054	2015-05-09 18:06:33.760056
7246	5138	30.00	2015-05-09 18:06:33.760163	2013-07-03 00:00:00	2014-07-03 00:00:00	f	Change of address.	2015-05-09 18:06:33.760169	2015-05-09 18:06:33.760171
7247	5120	30.00	2015-05-09 18:06:33.760282	2013-07-11 00:00:00	2014-07-11 00:00:00	f		2015-05-09 18:06:33.760289	2015-05-09 18:06:33.760291
7248	5096	30.00	2015-05-09 18:06:33.760424	2013-07-11 00:00:00	2014-07-11 00:00:00	f		2015-05-09 18:06:33.76043	2015-05-09 18:06:33.760432
7249	5148	30.00	2015-05-09 18:06:33.760539	2013-07-11 00:00:00	2014-07-11 00:00:00	f		2015-05-09 18:06:33.760545	2015-05-09 18:06:33.760547
7250	5165	30.00	2015-05-09 18:06:33.760654	2013-07-15 00:00:00	2014-07-15 00:00:00	f		2015-05-09 18:06:33.76066	2015-05-09 18:06:33.760662
7251	5161	30.00	2015-05-09 18:06:33.760779	2013-07-15 00:00:00	2014-07-15 00:00:00	f		2015-05-09 18:06:33.760784	2015-05-09 18:06:33.760786
7252	5091	30.00	2015-05-09 18:06:33.76089	2013-07-16 00:00:00	2014-09-12 00:00:00	f	Expiration mistake, added 1 service	2015-05-09 18:06:33.760896	2015-05-09 18:06:33.760898
7253	5116	30.00	2015-05-09 18:06:33.761003	2013-07-20 00:00:00	2014-07-20 00:00:00	f		2015-05-09 18:06:33.761008	2015-05-09 18:06:33.76101
7254	5193	30.00	2015-05-09 18:06:33.761114	2013-08-07 00:00:00	2014-08-07 00:00:00	t		2015-05-09 18:06:33.76112	2015-05-09 18:06:33.761122
7255	5153	30.00	2015-05-09 18:06:33.761225	2013-08-07 00:00:00	2014-08-07 00:00:00	t		2015-05-09 18:06:33.761231	2015-05-09 18:06:33.761233
7256	5135	30.00	2015-05-09 18:06:33.761337	2013-08-07 00:00:00	2014-08-07 00:00:00	t		2015-05-09 18:06:33.761343	2015-05-09 18:06:33.761345
7257	5122	30.00	2015-05-09 18:06:33.761461	2013-08-09 00:00:00	2014-08-09 00:00:00	f		2015-05-09 18:06:33.761467	2015-05-09 18:06:33.761469
7258	5140	30.00	2015-05-09 18:06:33.761576	2013-08-09 00:00:00	2014-08-09 00:00:00	f		2015-05-09 18:06:33.761582	2015-05-09 18:06:33.761584
7259	5138	0	2015-05-09 18:06:33.761695	2013-08-09 00:00:00	2014-08-09 00:00:00	f	New address - dropped account	2015-05-09 18:06:33.761701	2015-05-09 18:06:33.761703
7260	5179	30.00	2015-05-09 18:06:33.761854	2013-08-09 00:00:00	2014-08-09 00:00:00	f	New	2015-05-09 18:06:33.76186	2015-05-09 18:06:33.761862
7261	5159	30.00	2015-05-09 18:06:33.761967	2013-08-09 00:00:00	2015-02-28 00:00:00	f	Adjusted 2 more flag days due to 2nd	2015-05-09 18:06:33.761973	2015-05-09 18:06:33.761975
7262	5147	30.00	2015-05-09 18:06:33.76208	2013-08-12 00:00:00	2014-08-12 00:00:00	f		2015-05-09 18:06:33.762085	2015-05-09 18:06:33.762088
7263	5126	60.00	2015-05-09 18:06:33.762195	2013-08-12 00:00:00	2014-08-12 00:00:00	f		2015-05-09 18:06:33.762201	2015-05-09 18:06:33.762203
7264	5145	60.00	2015-05-09 18:06:33.762307	2013-08-18 00:00:00	2014-08-18 00:00:00	f		2015-05-09 18:06:33.762312	2015-05-09 18:06:33.762314
7265	5137	30.00	2015-05-09 18:06:33.762418	2013-08-18 00:00:00	2014-08-18 00:00:00	f		2015-05-09 18:06:33.762424	2015-05-09 18:06:33.762426
7266	5142	30.00	2015-05-09 18:06:33.762529	2013-08-18 00:00:00	2014-08-18 00:00:00	f		2015-05-09 18:06:33.762535	2015-05-09 18:06:33.762537
7267	5146	30.00	2015-05-09 18:06:33.76264	2013-08-09 00:00:00	2014-08-24 00:00:00	f		2015-05-09 18:06:33.762646	2015-05-09 18:06:33.762648
7268	5143	30.00	2015-05-09 18:06:33.762751	2013-08-20 00:00:00	2014-08-24 00:00:00	f		2015-05-09 18:06:33.762757	2015-05-09 18:06:33.762759
7269	5099	30.00	2015-05-09 18:06:33.762882	2013-10-25 00:00:00	2014-10-24 00:00:00	f		2015-05-09 18:06:33.762888	2015-05-09 18:06:33.76289
7270	5095	30.00	2015-05-09 18:06:33.762994	2013-10-28 00:00:00	2014-10-27 00:00:00	f		2015-05-09 18:06:33.763	2015-05-09 18:06:33.763002
7271	5141	40.00	2015-05-09 18:06:33.763115	2013-10-23 00:00:00	2014-10-22 00:00:00	f	$10 donation!	2015-05-09 18:06:33.763121	2015-05-09 18:06:33.763123
7272	5110	30.00	2015-05-09 18:06:33.763241	2013-11-02 00:00:00	2014-11-02 00:00:00	f	Note MAILING ADDRESS CHANGE	2015-05-09 18:06:33.763246	2015-05-09 18:06:33.763248
7273	5112	30.00	2015-05-09 18:06:33.763351	2013-11-03 00:00:00	2014-11-02 00:00:00	f		2015-05-09 18:06:33.763356	2015-05-09 18:06:33.763358
7274	5086	30.00	2015-05-09 18:06:33.763458	2013-11-07 00:00:00	2014-11-06 00:00:00	f	Jim received	2015-05-09 18:06:33.763464	2015-05-09 18:06:33.763466
7275	5087	30.00	2015-05-09 18:06:33.763567	2013-11-07 00:00:00	2014-11-06 00:00:00	t		2015-05-09 18:06:33.763572	2015-05-09 18:06:33.763574
7276	5111	30.00	2015-05-09 18:06:33.763675	2013-11-11 00:00:00	2015-02-18 00:00:00	f	Nov '13 missed, but now paid up. ?	2015-05-09 18:06:33.76368	2015-05-09 18:06:33.763682
7277	5136	30.00	2015-05-09 18:06:33.763796	2014-01-20 00:00:00	2015-01-20 00:00:00	f		2015-05-09 18:06:33.763801	2015-05-09 18:06:33.763803
7278	5103	30.00	2015-05-09 18:06:33.7639	2014-01-20 00:00:00	2015-01-20 00:00:00	f		2015-05-09 18:06:33.763906	2015-05-09 18:06:33.763907
7279	5106	30.00	2015-05-09 18:06:33.764004	2014-01-20 00:00:00	2015-01-20 00:00:00	f		2015-05-09 18:06:33.76401	2015-05-09 18:06:33.764012
7280	5098	30.00	2015-05-09 18:06:33.764109	2014-01-20 00:00:00	2015-01-20 00:00:00	f		2015-05-09 18:06:33.764114	2015-05-09 18:06:33.764116
7281	5128	30.00	2015-05-09 18:06:33.764226	2014-02-01 00:00:00	2015-02-01 00:00:00	f		2015-05-09 18:06:33.764232	2015-05-09 18:06:33.764234
7282	5111	30.00	2015-05-09 18:06:33.764334	2014-02-01 00:00:00	2015-02-01 00:00:00	f	Appears to be right customer	2015-05-09 18:06:33.764339	2015-05-09 18:06:33.764341
7283	5115	30.00	2015-05-09 18:06:33.764446	2014-02-01 00:00:00	2015-02-01 00:00:00	f		2015-05-09 18:06:33.764452	2015-05-09 18:06:33.764454
7284	5134	30.00	2015-05-09 18:06:33.764567	2014-02-01 00:00:00	2015-02-01 00:00:00	f		2015-05-09 18:06:33.764572	2015-05-09 18:06:33.764574
7285	5105	30.00	2015-05-09 18:06:33.764686	2014-02-01 00:00:00	2015-02-01 00:00:00	f		2015-05-09 18:06:33.764691	2015-05-09 18:06:33.764693
7286	5084	420.00	2015-05-09 18:06:33.764794	2013-07-04 00:00:00	2014-07-04 00:00:00	f		2015-05-09 18:06:33.764799	2015-05-09 18:06:33.764801
7287	5114	30.00	2015-05-09 18:06:33.764901	2014-02-10 00:00:00	2015-02-10 00:00:00	f		2015-05-09 18:06:33.764907	2015-05-09 18:06:33.764909
7288	5104	30.00	2015-05-09 18:06:33.765021	2014-02-15 00:00:00	2015-02-15 00:00:00	f		2015-05-09 18:06:33.765027	2015-05-09 18:06:33.765029
7289	5180	30.00	2015-05-09 18:06:33.765138	2014-02-15 00:00:00	2015-02-15 00:00:00	f		2015-05-09 18:06:33.765144	2015-05-09 18:06:33.765146
7290	5123	30.00	2015-05-09 18:06:33.765246	2014-02-15 00:00:00	2015-02-15 00:00:00	f		2015-05-09 18:06:33.765252	2015-05-09 18:06:33.765254
7291	5086	30.00	2015-05-09 18:06:33.765367	2014-11-07 00:00:00	2015-11-08 00:00:00	f	$30 donation	2015-05-09 18:06:33.765373	2015-05-09 18:06:33.765375
7292	5109	60.00	2015-05-09 18:06:33.765563	2014-04-02 00:00:00	2015-06-30 00:00:00	f	late, then Don errored on Status	2015-05-09 18:06:33.765569	2015-05-09 18:06:33.765571
7293	5171	30.00	2015-05-09 18:06:33.765688	2014-04-15 00:00:00	2015-04-16 00:00:00	f		2015-05-09 18:06:33.765693	2015-05-09 18:06:33.765695
7294	5148	30.00	2015-05-09 18:06:33.765807	2014-04-15 00:00:00	2015-04-16 00:00:00	f		2015-05-09 18:06:33.765812	2015-05-09 18:06:33.765814
7295	5135	30.00	2015-05-09 18:06:33.765919	2014-05-03 00:00:00	2015-05-03 00:00:00	f		2015-05-09 18:06:33.765925	2015-05-09 18:06:33.765927
7296	5119	30.00	2015-05-09 18:06:33.766042	2014-05-03 00:00:00	2015-05-03 00:00:00	f		2015-05-09 18:06:33.766048	2015-05-09 18:06:33.76605
7297	5093	30.00	2015-05-09 18:06:33.766153	2014-05-03 00:00:00	2015-05-03 00:00:00	f		2015-05-09 18:06:33.766159	2015-05-09 18:06:33.766161
7298	5132	30.00	2015-05-09 18:06:33.766268	2014-05-03 00:00:00	2015-05-03 00:00:00	f		2015-05-09 18:06:33.766274	2015-05-09 18:06:33.766276
7299	5127	30.00	2015-05-09 18:06:33.766391	2014-05-03 00:00:00	2015-05-03 00:00:00	f		2015-05-09 18:06:33.766397	2015-05-09 18:06:33.766399
7300	5094	30.00	2015-05-09 18:06:33.766499	2014-05-03 00:00:00	2015-05-03 00:00:00	f		2015-05-09 18:06:33.766505	2015-05-09 18:06:33.766507
7301	5109	60.00	2015-05-09 18:06:33.766606	2014-05-03 00:00:00	2015-05-03 00:00:00	f	UNKOWN WHO THIS IS FROM (2 loc?)	2015-05-09 18:06:33.766612	2015-05-09 18:06:33.766614
7302	5090	30.00	2015-05-09 18:06:33.766766	2014-05-03 00:00:00	2015-05-03 00:00:00	f		2015-05-09 18:06:33.766775	2015-05-09 18:06:33.766777
7303	5172	30.00	2015-05-09 18:06:33.766951	2014-05-03 00:00:00	2015-05-03 00:00:00	f		2015-05-09 18:06:33.766957	2015-05-09 18:06:33.766959
7304	5173	50.00	2015-05-09 18:06:33.767092	2014-06-15 00:00:00	2015-06-16 00:00:00	f	Grandsone is an Eagle	2015-05-09 18:06:33.767098	2015-05-09 18:06:33.7671
7305	5175	30.00	2015-05-09 18:06:33.767213	2014-05-03 00:00:00	2015-05-03 00:00:00	f		2015-05-09 18:06:33.767219	2015-05-09 18:06:33.767221
7306	5092	30.00	2015-05-09 18:06:33.767332	2014-05-03 00:00:00	2015-05-03 00:00:00	f		2015-05-09 18:06:33.767338	2015-05-09 18:06:33.76734
7307	5121	30.00	2015-05-09 18:06:33.767463	2014-05-03 00:00:00	2015-05-03 00:00:00	f	one check 2 loc #47	2015-05-09 18:06:33.767469	2015-05-09 18:06:33.767471
7308	5125	30.00	2015-05-09 18:06:33.767586	2014-05-03 00:00:00	2015-05-03 00:00:00	f		2015-05-09 18:06:33.767592	2015-05-09 18:06:33.767594
7309	5174	30.00	2015-05-09 18:06:33.767712	2014-05-03 00:00:00	2015-05-03 00:00:00	f		2015-05-09 18:06:33.767718	2015-05-09 18:06:33.76772
7310	5149	40.00	2015-05-09 18:06:33.767856	2014-05-03 00:00:00	2015-05-03 00:00:00	f	3 loc and $10 donation	2015-05-09 18:06:33.767862	2015-05-09 18:06:33.767864
7311	5129	30.00	2015-05-09 18:06:33.767968	2014-05-03 00:00:00	2015-05-03 00:00:00	f	pd for by #72	2015-05-09 18:06:33.767973	2015-05-09 18:06:33.767975
7312	5139	30.00	2015-05-09 18:06:33.768083	2014-05-03 00:00:00	2015-05-03 00:00:00	f	pd for by #72	2015-05-09 18:06:33.768088	2015-05-09 18:06:33.76809
7313	5088	30.00	2015-05-09 18:06:33.768194	2014-05-03 00:00:00	2015-05-03 00:00:00	f		2015-05-09 18:06:33.7682	2015-05-09 18:06:33.768202
7314	5116	30.00	2015-05-09 18:06:33.768304	2014-05-25 00:00:00	2015-05-25 00:00:00	f		2015-05-09 18:06:33.768309	2015-05-09 18:06:33.768311
7315	5124	30.00	2015-05-09 18:06:33.768413	2014-05-03 00:00:00	2015-05-03 00:00:00	f	one check 2 locations #44	2015-05-09 18:06:33.768419	2015-05-09 18:06:33.768421
7316	5150	30.00	2015-05-09 18:06:33.7686	2014-06-01 00:00:00	2015-06-01 00:00:00	f		2015-05-09 18:06:33.768608	2015-05-09 18:06:33.768611
7317	5165	30.00	2015-05-09 18:06:33.768735	2014-06-01 00:00:00	2015-07-15 00:00:00	f		2015-05-09 18:06:33.768741	2015-05-09 18:06:33.768743
7318	5166	30.00	2015-05-09 18:06:33.768869	2014-06-01 00:00:00	2015-06-26 00:00:00	f		2015-05-09 18:06:33.768875	2015-05-09 18:06:33.768877
7319	5183	30.00	2015-05-09 18:06:33.768987	2014-06-01 00:00:00	2015-06-01 00:00:00	f	Paid for by #101 Auld	2015-05-09 18:06:33.768993	2015-05-09 18:06:33.768995
7320	5177	30.00	2015-05-09 18:06:33.769104	2014-06-01 00:00:00	2015-06-13 00:00:00	f		2015-05-09 18:06:33.76911	2015-05-09 18:06:33.769112
7321	5163	30.00	2015-05-09 18:06:33.76922	2014-06-01 00:00:00	2015-06-01 00:00:00	f		2015-05-09 18:06:33.769225	2015-05-09 18:06:33.769227
7322	5158	30.00	2015-05-09 18:06:33.769333	2014-06-01 00:00:00	2015-06-01 00:00:00	f		2015-05-09 18:06:33.769338	2015-05-09 18:06:33.76934
7323	5184	30.00	2015-05-09 18:06:33.769469	2014-06-01 00:00:00	2015-06-01 00:00:00	f		2015-05-09 18:06:33.769475	2015-05-09 18:06:33.769477
7324	5117	30.00	2015-05-09 18:06:33.769584	2014-07-01 00:00:00	2015-07-01 00:00:00	f		2015-05-09 18:06:33.76959	2015-05-09 18:06:33.769592
7325	5157	30.00	2015-05-09 18:06:33.769723	2014-06-25 00:00:00	2015-06-26 00:00:00	f		2015-05-09 18:06:33.769729	2015-05-09 18:06:33.769731
7326	5152	30.00	2015-05-09 18:06:33.769844	2014-06-30 00:00:00	2015-07-01 00:00:00	f		2015-05-09 18:06:33.76985	2015-05-09 18:06:33.769852
7327	5160	30.00	2015-05-09 18:06:33.769954	2014-06-30 00:00:00	2015-07-01 00:00:00	f		2015-05-09 18:06:33.769959	2015-05-09 18:06:33.769961
7328	5151	130.00	2015-05-09 18:06:33.770063	2014-06-30 00:00:00	2015-07-01 00:00:00	f	Extra $30	2015-05-09 18:06:33.770069	2015-05-09 18:06:33.770071
7329	5130	30.00	2015-05-09 18:06:33.770186	2014-06-21 00:00:00	2015-06-22 00:00:00	f		2015-05-09 18:06:33.770191	2015-05-09 18:06:33.770193
7330	5131	30.00	2015-05-09 18:06:33.770306	2014-06-21 00:00:00	2015-06-22 00:00:00	f		2015-05-09 18:06:33.770312	2015-05-09 18:06:33.770314
7331	5097	30.00	2015-05-09 18:06:33.770415	2014-06-26 00:00:00	2015-06-27 00:00:00	f		2015-05-09 18:06:33.77042	2015-05-09 18:06:33.770422
7332	5164	30.00	2015-05-09 18:06:33.77054	2014-07-01 00:00:00	2015-07-02 00:00:00	f		2015-05-09 18:06:33.770546	2015-05-09 18:06:33.770548
7333	5162	30.00	2015-05-09 18:06:33.770646	2014-06-30 00:00:00	2015-07-01 00:00:00	f		2015-05-09 18:06:33.770651	2015-05-09 18:06:33.770653
7334	5155	30.00	2015-05-09 18:06:33.77075	2014-07-07 00:00:00	2015-07-07 00:00:00	f		2015-05-09 18:06:33.770756	2015-05-09 18:06:33.770758
7335	5186	30.00	2015-05-09 18:06:33.770891	2014-06-27 00:00:00	2015-06-28 00:00:00	f		2015-05-09 18:06:33.77091	2015-05-09 18:06:33.770913
7336	5187	30.00	2015-05-09 18:06:33.771018	2014-06-30 00:00:00	2015-07-01 00:00:00	f		2015-05-09 18:06:33.771023	2015-05-09 18:06:33.771025
7337	5154	30.00	2015-05-09 18:06:33.771142	2014-06-24 00:00:00	2015-07-01 00:00:00	f		2015-05-09 18:06:33.771147	2015-05-09 18:06:33.771149
7338	5118	30.00	2015-05-09 18:06:33.77125	2014-06-23 00:00:00	2015-07-01 00:00:00	f		2015-05-09 18:06:33.771256	2015-05-09 18:06:33.771258
7339	5188	30.00	2015-05-09 18:06:33.771359	2014-06-29 00:00:00	2015-06-30 00:00:00	t		2015-05-09 18:06:33.771364	2015-05-09 18:06:33.771366
7340	5190	30.00	2015-05-09 18:06:33.771479	2014-07-01 00:00:00	2015-07-02 00:00:00	t		2015-05-09 18:06:33.771484	2015-05-09 18:06:33.771486
7341	5189	30.00	2015-05-09 18:06:33.771584	2014-07-02 00:00:00	2015-07-03 00:00:00	t		2015-05-09 18:06:33.771589	2015-05-09 18:06:33.771591
7342	5191	30.00	2015-05-09 18:06:33.771688	2014-07-28 00:00:00	2015-11-30 00:00:00	f	one check - advanced by one to make	2015-05-09 18:06:33.771693	2015-05-09 18:06:33.771695
7343	5192	30.00	2015-05-09 18:06:33.771794	2014-07-28 00:00:00	2015-09-15 00:00:00	f	one check, missed 9/11/14 - no hole	2015-05-09 18:06:33.7718	2015-05-09 18:06:33.771801
7344	5120	30.00	2015-05-09 18:06:33.7719	2014-07-12 00:00:00	2015-07-13 00:00:00	f		2015-05-09 18:06:33.771905	2015-05-09 18:06:33.771907
7345	5168	30.00	2015-05-09 18:06:33.772019	2014-06-27 00:00:00	2015-06-28 00:00:00	f		2015-05-09 18:06:33.772024	2015-05-09 18:06:33.772026
7346	5143	30.00	2015-05-09 18:06:33.772126	2014-08-31 00:00:00	2015-09-01 00:00:00	f		2015-05-09 18:06:33.772132	2015-05-09 18:06:33.772134
7347	5146	30.00	2015-05-09 18:06:33.772252	2014-08-31 00:00:00	2015-09-01 00:00:00	f		2015-05-09 18:06:33.772258	2015-05-09 18:06:33.77226
7348	5137	30.00	2015-05-09 18:06:33.772379	2014-08-31 00:00:00	2015-09-01 00:00:00	f		2015-05-09 18:06:33.772385	2015-05-09 18:06:33.772387
7349	5126	60.00	2015-05-09 18:06:33.772487	2014-08-31 00:00:00	2015-09-01 00:00:00	f		2015-05-09 18:06:33.772493	2015-05-09 18:06:33.772495
7350	5122	30.00	2015-05-09 18:06:33.772611	2014-08-31 00:00:00	2015-09-01 00:00:00	f		2015-05-09 18:06:33.772617	2015-05-09 18:06:33.772619
7351	5167	30.00	2015-05-09 18:06:33.772722	2014-08-31 00:00:00	2015-09-01 00:00:00	f		2015-05-09 18:06:33.772728	2015-05-09 18:06:33.77273
7352	5140	30.00	2015-05-09 18:06:33.772846	2014-08-31 00:00:00	2015-09-01 00:00:00	f		2015-05-09 18:06:33.772852	2015-05-09 18:06:33.772854
7353	5145	60.00	2015-05-09 18:06:33.772954	2014-09-13 00:00:00	2015-09-13 00:00:00	f	$20 donation	2015-05-09 18:06:33.77296	2015-05-09 18:06:33.772962
7354	5181	420.00	2015-05-09 18:06:33.773075	2014-06-14 00:00:00	2015-06-13 00:00:00	f		2015-05-09 18:06:33.77308	2015-05-09 18:06:33.773082
7355	5142	30.00	2015-05-09 18:06:33.77318	2014-08-19 00:00:00	2015-08-18 00:00:00	f		2015-05-09 18:06:33.773185	2015-05-09 18:06:33.773187
7356	5147	30.00	2015-05-09 18:06:33.773284	2014-08-13 00:00:00	2015-08-12 00:00:00	f		2015-05-09 18:06:33.77329	2015-05-09 18:06:33.773292
7357	5153	30.00	2015-05-09 18:06:33.773389	2014-08-08 00:00:00	2015-08-09 00:00:00	f	This came after we sold -but it was	2015-05-09 18:06:33.773394	2015-05-09 18:06:33.773396
7358	5084	420.00	2015-05-09 18:06:33.773508	2014-09-01 00:00:00	2015-10-01 00:00:00	f	Paid via Jim or Dan	2015-05-09 18:06:33.773514	2015-05-09 18:06:33.773516
7359	5105	30.00	2015-05-09 18:06:33.773636	2015-02-02 00:00:00	2015-12-31 00:00:00	f	FY 2015	2015-05-09 18:06:33.773642	2015-05-09 18:06:33.773644
7360	5180	30.00	2015-05-09 18:06:33.773749	2015-02-15 00:00:00	2015-12-31 00:00:00	f	FY 2015 chk 42950 Western Management	2015-05-09 18:06:33.773754	2015-05-09 18:06:33.773756
7361	5104	30.00	2015-05-09 18:06:33.773861	2015-02-15 00:00:00	2015-12-31 00:00:00	f	FY 2015 chk 42950 Western Management	2015-05-09 18:06:33.773867	2015-05-09 18:06:33.773869
7362	5112	30.00	2015-05-09 18:06:33.773986	2014-11-02 00:00:00	2015-12-31 00:00:00	f	FY 2015	2015-05-09 18:06:33.773991	2015-05-09 18:06:33.773993
7363	5136	30.00	2015-05-09 18:06:33.774109	2015-01-20 00:00:00	2015-12-31 00:00:00	f	FY 2015	2015-05-09 18:06:33.774115	2015-05-09 18:06:33.774117
7364	5141	30.00	2015-05-09 18:06:33.774221	2014-10-23 00:00:00	2015-12-31 00:00:00	f	FY 2015	2015-05-09 18:06:33.774227	2015-05-09 18:06:33.774229
7365	5106	30.00	2015-05-09 18:06:33.774333	2015-01-21 00:00:00	2015-12-31 00:00:00	f	FY 2015	2015-05-09 18:06:33.774339	2015-05-09 18:06:33.774341
7366	5109	60.00	2015-05-09 18:06:33.774444	2015-01-01 00:00:00	2015-12-31 00:00:00	f	FY 2015	2015-05-09 18:06:33.77445	2015-05-09 18:06:33.774452
7367	5099	60.00	2015-05-09 18:06:33.774571	2014-10-25 00:00:00	2015-12-31 00:00:00	f	FY 2015 = 2 flags paid for in FY15	2015-05-09 18:06:33.774577	2015-05-09 18:06:33.774579
7368	5111	30.00	2015-05-09 18:06:33.774695	2015-02-02 00:00:00	2015-12-31 00:00:00	f	FY 2015	2015-05-09 18:06:33.774701	2015-05-09 18:06:33.774703
7369	5193	30.00	2015-05-09 18:06:33.77482	2014-11-02 00:00:00	2015-12-31 00:00:00	f	FY 2015	2015-05-09 18:06:33.774826	2015-05-09 18:06:33.774828
7370	5194	30.00	2015-05-09 18:06:33.774953	2014-11-05 00:00:00	2015-12-31 00:00:00	f	FY 2015	2015-05-09 18:06:33.774959	2015-05-09 18:06:33.774961
7371	5098	30.00	2015-05-09 18:06:33.775069	2015-01-21 00:00:00	2015-12-31 00:00:00	f	FY 2015	2015-05-09 18:06:33.775075	2015-05-09 18:06:33.775078
7372	5134	30.00	2015-05-09 18:06:33.775186	2014-11-05 00:00:00	2015-12-31 00:00:00	f	FY 2015	2015-05-09 18:06:33.775192	2015-05-09 18:06:33.775194
7373	5103	30.00	2015-05-09 18:06:33.775312	2015-01-21 00:00:00	2015-12-31 00:00:00	f	FY 2015	2015-05-09 18:06:33.775318	2015-05-09 18:06:33.77532
7374	5195	30.00	2015-05-09 18:06:33.775439	2014-11-08 00:00:00	2015-12-31 00:00:00	f	FY 2015	2015-05-09 18:06:33.775445	2015-05-09 18:06:33.775447
7375	5182	30.00	2015-05-09 18:06:33.775581	2014-11-14 00:00:00	2015-12-31 00:00:00	f	FY 2015 - Add'l funds raised	2015-05-09 18:06:33.775587	2015-05-09 18:06:33.775589
7376	5114	30.00	2015-05-09 18:06:33.775711	2014-11-24 00:00:00	2015-12-31 00:00:00	f	FY 2015	2015-05-09 18:06:33.775717	2015-05-09 18:06:33.775719
7377	5115	30.00	2015-05-09 18:06:33.775823	2014-11-24 00:00:00	2015-12-31 00:00:00	f	FY 2015	2015-05-09 18:06:33.775829	2015-05-09 18:06:33.775831
7378	5128	30.00	2015-05-09 18:06:33.775935	2014-11-24 00:00:00	2015-12-31 00:00:00	f	FY 2015	2015-05-09 18:06:33.775941	2015-05-09 18:06:33.775943
7379	5123	30.00	2015-05-09 18:06:33.776047	2014-11-24 00:00:00	2015-12-31 00:00:00	f	FY 2015	2015-05-09 18:06:33.776053	2015-05-09 18:06:33.776055
\.


--
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: scoutsfd
--

SELECT pg_catalog.setval('payments_id_seq', 7379, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: scoutsfd
--

COPY roles (id, role, created_at, updated_at) FROM stdin;
1	SiteAdmin	2015-05-09 16:28:28.865866	2015-05-09 16:28:28.865866
2	TroopLeader	2015-05-09 16:28:28.869108	2015-05-09 16:28:28.869108
3	TroopMember	2015-05-09 16:28:28.8716	2015-05-09 16:28:28.8716
4	TroopMember	2015-05-09 16:43:24.934557	2015-05-09 16:43:24.934557
5	TroopMember	2015-05-09 16:57:06.951872	2015-05-09 16:57:06.951872
6	TroopMember	2015-05-09 17:21:04.881249	2015-05-09 17:21:04.881249
7	TroopMember	2015-05-09 18:22:04.24157	2015-05-09 18:22:04.24157
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: scoutsfd
--

SELECT pg_catalog.setval('roles_id_seq', 7, true);


--
-- Data for Name: routes; Type: TABLE DATA; Schema: public; Owner: scoutsfd
--

COPY routes (id, name, group_id, print_sequence, created_at, updated_at, marker) FROM stdin;
399	Orange - Pebble Creek	3	102	2015-05-09 18:06:33.717433	2015-05-09 22:42:22.93207	\N
398	GBL - George Bush Library	3	101	2015-05-09 18:06:33.717336	2015-05-09 22:42:22.933617	\N
395	Red	3	50	2015-05-09 18:06:33.717053	2016-04-10 22:40:36.850997	http://maps.gstatic.com/mapfiles/ridefinder-images/mm_20_purple.png
393	Green 1 - South	3	30	2015-05-09 18:06:33.716841	2016-04-11 22:26:58.28428	http://www.google.com/mapfiles/arrow.png
394	Green 2 - North	3	40	2015-05-09 18:06:33.716956	2016-04-12 03:58:21.390469	http://maps.google.com/mapfiles/dir_walk_57.png
396	Yellow (w GBL)	3	70	2015-05-09 18:06:33.717148	2016-04-12 03:58:50.610827	http://maps.google.com/mapfiles/kml/pal4/icon53.png
397	Flag - Outer Rim	3	100	2015-05-09 18:06:33.717243	2016-04-12 04:24:02.0302	http://maps.google.com/mapfiles/kml/pal4/icon49.png
391	Blue	3	10	2015-05-09 18:06:33.716219	2016-04-20 19:20:39.025427	http://maps.google.com/mapfiles/kml/pal4/icon53.png
392	Bryan	3	20	2015-05-09 18:06:33.71673	2016-05-03 00:17:37.734671	http://maps.google.com/mapfiles/kml/pal4/icon52.png
\.


--
-- Name: routes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: scoutsfd
--

SELECT pg_catalog.setval('routes_id_seq', 399, true);


--
-- Data for Name: routes_users; Type: TABLE DATA; Schema: public; Owner: scoutsfd
--

COPY routes_users (id, route_id, user_id) FROM stdin;
1	1	2
2	1	3
\.


--
-- Name: routes_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: scoutsfd
--

SELECT pg_catalog.setval('routes_users_id_seq', 2, true);


--
-- Data for Name: runs; Type: TABLE DATA; Schema: public; Owner: scoutsfd
--

COPY runs (id, route_id, datetime_started, datetime_ended, am_pm, created_at, updated_at) FROM stdin;
1	1	2015-05-09 16:28:29.091892	\N	\N	2015-05-09 16:28:29.098326	2015-05-09 16:28:29.098326
2	399	2015-05-11 20:57:03.714662	2015-05-11 20:57:07.321825	am	2015-05-11 20:57:03.715536	2015-05-11 20:57:07.322566
3	395	2015-05-11 20:57:49.318329	2015-05-11 20:59:24.205306	am	2015-05-11 20:57:49.319129	2015-05-11 20:59:24.206008
4	395	2015-05-11 21:16:33.800108	2015-05-11 21:17:43.349567	am	2015-05-11 21:16:33.80088	2015-05-11 21:17:43.350186
5	395	2015-05-11 21:40:14.49062	2015-05-11 21:40:51.679719	am	2015-05-11 21:40:14.49148	2015-05-11 21:40:51.68043
7	399	2016-03-25 16:34:40.717325	2016-03-25 16:34:43.421766	am	2016-03-25 16:34:40.737591	2016-03-25 16:34:43.423155
8	399	2016-03-29 00:50:06.447174	2016-03-29 00:50:09.797469	pm	2016-03-29 00:50:06.449018	2016-03-29 00:50:09.79865
9	398	2016-03-29 01:07:22.165461	2016-03-29 01:07:23.617921	am	2016-03-29 01:07:22.167019	2016-03-29 01:07:23.619765
10	399	2016-04-06 02:49:51.917078	2016-04-06 02:49:54.034845	pm	2016-04-06 02:49:51.918866	2016-04-06 02:49:54.036379
11	396	2016-04-06 02:51:56.350085	2016-04-06 02:52:04.194375	am	2016-04-06 02:51:56.352224	2016-04-06 02:52:04.19605
12	399	2016-04-06 23:34:00.709606	2016-04-06 23:34:10.153451	am	2016-04-06 23:34:00.711209	2016-04-06 23:34:10.155247
13	392	2016-04-06 23:34:20.155734	2016-04-06 23:34:36.213202	am	2016-04-06 23:34:20.157098	2016-04-06 23:34:36.214793
14	397	2016-04-07 04:40:05.393046	\N	am	2016-04-07 04:40:05.415128	2016-04-07 04:40:05.415128
15	397	2016-04-10 01:23:58.7095	\N	am	2016-04-10 01:23:58.710747	2016-04-10 01:23:58.710747
16	393	2016-04-11 23:17:10.081644	\N	am	2016-04-11 23:17:10.083222	2016-04-11 23:17:10.083222
17	393	2016-04-11 23:17:18.372868	\N	am	2016-04-11 23:17:18.374225	2016-04-11 23:17:18.374225
18	397	2016-04-26 00:28:42.294065	2016-04-26 00:30:39.577228	am	2016-04-26 00:28:42.341942	2016-04-26 00:30:39.579104
19	397	2016-04-26 00:37:45.607617	2016-04-26 00:39:07.152735	am	2016-04-26 00:37:45.629471	2016-04-26 00:39:07.169286
20	393	2016-04-26 00:39:20.744937	\N	am	2016-04-26 00:39:20.746415	2016-04-26 00:39:20.746415
21	397	2016-04-26 00:40:21.313308	2016-04-26 02:50:12.57541	am	2016-04-26 00:40:21.314816	2016-04-26 02:50:12.586527
22	391	2016-04-26 02:50:22.986173	\N	am	2016-04-26 02:50:22.987745	2016-04-26 02:50:22.987745
23	393	2016-05-01 23:13:35.932188	2016-05-01 23:13:48.843522	am	2016-05-01 23:13:35.945202	2016-05-01 23:13:48.844721
24	392	2016-05-03 00:17:17.857092	2016-05-03 00:17:55.06082	am	2016-05-03 00:17:17.858418	2016-05-03 00:17:55.06211
25	397	2016-05-03 00:25:05.509216	2016-05-03 00:25:17.923017	am	2016-05-03 00:25:05.510926	2016-05-03 00:25:17.924665
26	396	2016-05-03 00:25:51.534778	2016-05-03 00:42:11.502655	am	2016-05-03 00:25:51.536033	2016-05-03 00:42:11.504101
\.


--
-- Name: runs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: scoutsfd
--

SELECT pg_catalog.setval('runs_id_seq', 26, true);


--
-- Data for Name: runs_users; Type: TABLE DATA; Schema: public; Owner: scoutsfd
--

COPY runs_users (id, run_id, user_id) FROM stdin;
1	1	2
2	1	3
3	2	594
4	3	594
5	4	594
6	5	594
8	7	658
9	8	658
10	9	650
11	9	594
12	10	658
13	11	596
14	12	595
15	13	597
16	14	594
17	15	594
18	16	594
19	17	594
20	18	596
21	19	597
22	19	599
23	19	600
24	20	597
25	20	598
26	20	599
27	21	600
28	21	601
29	21	602
30	22	598
31	23	595
32	24	595
33	24	596
34	24	597
35	25	599
36	25	601
37	25	631
38	26	596
39	26	598
40	26	599
\.


--
-- Name: runs_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: scoutsfd
--

SELECT pg_catalog.setval('runs_users_id_seq', 40, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: scoutsfd
--

COPY schema_migrations (version) FROM stdin;
20150405174552
20150405175710
20150405182607
20150405183008
20150405183111
20150405192538
20150405193933
20150405194143
20150426153040
20150426155110
20150427144503
20150427144504
20150428155110
20160406215027
20160409024403
20160425230023
20160425230604
20160503222708
20160503222728
20160503222748
20160503222804
20160503222835
\.


--
-- Data for Name: subscribers; Type: TABLE DATA; Schema: public; Owner: scoutsfd
--

COPY subscribers (id, first_name, last_name, email, cell_phone, landline, address_line_1, address_line_2, city, state, zip, created_at, updated_at, subscription_amount) FROM stdin;
1	Donald G	Barker	\N	\N	\N	1100 Timm Dr	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
2	Virginia	Bockholt	\N	\N	\N	1102 Timm Dr	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
3	Mary	Miller	\N	\N	\N	1104 Timm Dr	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
4	Ted/Ellen	Fox	\N	\N	\N	1103 Timm Dr	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
5	Dorothy	Holecek	\N	\N	\N	1105 Timm Dr	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
6	Elizabeth	Blodgett	\N	\N	\N	409 Timber St	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
7	Imadel	Bachus	\N	\N	\N	306 Timber St	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
8	Michael	Stavinoha	\N	\N	\N	304 Timber St	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
9	Connie	Dodd	\N	\N	\N	1307 Leacrest Dr	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
10	Bill J.	Cooley	\N	\N	\N	503 Glade St	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
11	Mary	Ketchersid	\N	\N	\N	1301 Timm Dr	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	60
12	Parsonage?	Grace	\N	\N	\N	1406 Village Dr	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	0
13	Juan	Rodriguez	\N	\N	\N	1220 Orr Str	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
14	David & Diane	Chester	\N	\N	\N	1201 Glade St	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
15	Jo	Engelking	\N	\N	\N	3727 East 29th	\N	Bryan	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
16	Peter	Lockett	\N	\N	\N	3727 East 29th	\N	Bryan	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
17	Michael	Eckart	\N	\N	\N	1215 Glade St	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
18	Peter	Hitchcock	\N	\N	\N	1217 Glade St	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
19	Christopher	Mathewson	\N	\N	\N	1307 Glade St	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
20	David	Evans	\N	\N	\N	1705 Carter Creek Pkwy	\N	Bryan	TX	77802	2016-05-03 03:50:00	2016-05-03 03:50:00	30
21	Angela	Morehead	\N	\N	\N	1905 Carter Creek Pkwy	\N	Bryan	TX	77802	2016-05-03 03:50:00	2016-05-03 03:50:00	30
22	Don	Smith	\N	\N	\N	704 Inwood Dr 	\N	Bryan	TX	77802	2016-05-03 03:50:00	2016-05-03 03:50:00	30
23	Lesa	Colson	\N	\N	\N	506 Kyle	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
24	Ted & Nancy	Smith	\N	\N	\N	1401 Tanglewood Dr	\N	Wichita Falls	TX	76309	2016-05-03 03:50:00	2016-05-03 03:50:00	30
25	W.R.	Lancaster	\N	\N	\N	303 Dexter Dr	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
26	Laura	Arth	\N	\N	\N	305 Dexter Dr	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
27	Nancy	Schneider	\N	\N	\N	405 Dexter Dr	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
28	Matt	Poling	\N	\N	\N	504 Dexter Dr	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
29	Jennifer	Roberts	\N	\N	\N	505 Dexter Dr	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
30	Ken	Matthews	\N	\N	\N	602 West Dexter Dr	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
31	Russ	Harvell	\N	\N	\N	504 Guernsey St	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
32	Quint	Floyd	\N	\N	\N	302 Fidelity St	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
33	John	Lampo	\N	\N	\N	802 Hereford St	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
34	Eileen	Kulvesky	\N	\N	\N	804 Hawthorn St	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
35	Gayle	Schultz	\N	\N	\N	920 Hawthorn St	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
36	Debbie	Fry	\N	\N	\N	912 Hawthorn St	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
37	Frances	Martin	\N	\N	\N	1204 Winding Road	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
38	Brett	Giroir	\N	\N	\N	918 Hawthorn St	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
39	Doug and Cindy	Roesler	\N	\N	\N	1205 Winding Road	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
40	Gayle	Schultz	\N	\N	\N	920 Hawthorn St	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
41	Pam	Kelling	\N	\N	\N	911 Hawthorn St	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
42	Laura	Peycke	\N	\N	\N	1002 Winding Rd	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
43	Deborah	Jasek	\N	\N	\N	1007 Winding Rd	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
44	Manda	Rosser	\N	\N	\N	104 Lee Ave	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
45	Amy and Tim	Leach	\N	\N	\N	211 Pershing Ave	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
46	F.J.	Moreno	\N	\N	\N	213 Pershing Ave	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
47	Mark & Tammy	Stein	\N	\N	\N	218 Pershing	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	60
48	Jeannie	Barrett	\N	\N	\N	118 Pershing Ave	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
49	Gaines	West	\N	\N	\N	200 Suffolk Ave	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
50	Doug and Cindy	Roesler	\N	\N	\N	1205 Winding Road	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
51	Hays & Robin	Glover	\N	\N	\N	203 Suffolk Ave	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
52	Hays & Robin	Glover	\N	\N	\N	203 Suffolk Ave	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
53	Gail	Hensley	\N	\N	\N	310 Suffolk Ave	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
54	Greg	Gorman	\N	\N	\N	315 Suffolk Ave	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
55	Buzz	Pruit	\N	\N	\N	900 Park Place	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
56	Theresa	Schimelpfening	\N	\N	\N	316 Pershing Ave	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
57	Mark & Tammy	Stein	\N	\N	\N	218 Pershing	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
58	Will & Amber	Reed	\N	\N	\N	906 Park Place	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
59	James	Matson	\N	\N	\N	1002 Park Place	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
60	Jean	Mays	\N	\N	\N	1111 Park Place	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
61	Robert	McGehee	\N	\N	\N	311 Lee Ave	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
62	Vicky	Harrison	\N	\N	\N	207 Lee Ave	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
63	Alice	Jimenez	\N	\N	\N	1220 South Dexter Dr	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
64	Doug and Cindy	Roesler	\N	\N	\N	1205 Winding Road	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
65	Mary	Zingaro	\N	\N	\N	1813 Medina Dr	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
66	Kathleen	Kenefick	\N	\N	\N	1815 Medina Dr	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
67	James	Mondshine	\N	\N	\N	1814 Hondo Dr	\N	College Station	TX	77440	2016-05-03 03:50:00	2016-05-03 03:50:00	30
68	Southwood	Church	\N	\N	\N	1901 Harvey Mitchell Pkwy S.	\N	College Station	TX	77845	2016-05-03 03:50:00	2016-05-03 03:50:00	0
69	Sharon	Richmond	\N	\N	\N	1813 Hondo Dr	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
70	Mary	Dallis	\N	\N	\N	1816 Shadowwood Dr	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
71	Mary	Bryan	\N	\N	\N	1813 Shadowwood Dr	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
72	Patti	Ljungdahl	\N	\N	\N	1822 Shadowwood Dr	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
73	Patricia	Rand	\N	\N	\N	1801 Sabine Ct	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	60
74	Peggy	Crittenden	\N	\N	\N	1803 Laura Lane	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
75	Richard	Williams	\N	\N	\N	1714 Glade St	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	60
76	Albert	Schneider	\N	\N	\N	1401 Angelina Cir	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
77	David	Jones	\N	\N	\N	1404 Angelina Cir	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	30
78	Church	St Thomas	\N	\N	\N	906 George Bush Dr West	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	0
79	Will King	George Bush Presidential Library	\N	\N	\N	1000 George Bush Dr West	\N	College Station	TX	77845	2016-05-03 03:50:00	2016-05-03 03:50:00	420
80	Hillel	Foundation	\N	\N	\N	800 George Bush	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	0
81	Grace	Church	\N	\N	\N	700 Anderson Street	\N	College Station	TX	77840	2016-05-03 03:50:00	2016-05-03 03:50:00	0
\.


--
-- Name: subscribers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: scoutsfd
--

SELECT pg_catalog.setval('subscribers_id_seq', 1, true);


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: scoutsfd
--

COPY subscriptions (id, first_name, last_name, email, cell_phone, landline, route_id, print_sequence, address_line_1, address_line_2, city, state, zip, qty, group_id, last_invoice_sent, renewal_due_date, notes, maintenance_notes, created_at, updated_at, latitude, longitude, subscriber_id, status, renewal_grp, qty_comp, subscription_notes) FROM stdin;
1	Donald G	Barker	\N	979-696-7962	\N	391	\N	1100 Timm Dr	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2012-05-28 00:00:00	2016-05-03 03:50:00	\N	\N	1	GOOD	16	\N	\N
2	Virginia	Bockholt	\N	979-696-6704	\N	391	\N	1102 Timm Dr	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2012-05-28 00:00:00	2016-05-03 03:50:00	\N	\N	2	OVERDUE	15	\N	\N
3	Mary	Miller	\N	979-695-5267	\N	391	\N	1104 Timm Dr	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2012-05-29 00:00:00	2016-05-03 03:50:01	\N	\N	3	GOOD	16	\N	\N
4	Ted/Ellen	Fox	ellenfox50@hotmail.com	979-696-7537	\N	391	\N	1103 Timm Dr	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2012-05-28 00:00:00	2016-05-03 03:50:01	\N	\N	4	GOOD	16	\N	\N
5	Dorothy	Holecek	lardot@suddenlink.net	979-696-8120	\N	391	\N	1105 Timm Dr	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2012-05-29 00:00:00	2016-05-03 03:50:02	\N	\N	5	GOOD	16	\N	\N
6	Elizabeth	Blodgett	earlywest@verizon.net	979-776-1925	\N	391	\N	409 Timber St	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2012-05-29 00:00:00	2016-05-03 03:50:02	\N	\N	6	OVERDUE	15	\N	\N
7	Imadel	Bachus	\N	979-696-4260	\N	391	\N	306 Timber St	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2012-05-29 00:00:00	2016-05-03 03:50:03	\N	\N	7	GOOD	15	\N	\N
8	Michael	Stavinoha	reidstav@suddenlink.net	281-413-4605	\N	391	\N	304 Timber St	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2015-08-31 00:00:00	2016-05-03 03:50:03	\N	\N	8	GOOD	16	\N	\N
9	Connie	Dodd	\N	979-696-8351	\N	391	\N	1307 Leacrest Dr	\N	College Station	TX	77840	1	\N	\N	\N	She has 1 flag of her own	\N	2012-05-29 00:00:00	2016-05-03 03:50:04	\N	\N	9	GOOD	16	\N	\N
10	Bill J.	Cooley	\N	979-696-5142	\N	391	\N	503 Glade St	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2013-02-12 00:00:00	2016-05-03 03:50:04	\N	\N	10	GOOD	16	\N	\N
11	Mary	Ketchersid	mlketcher2@yahoo.com	979.820.0108	\N	391	\N	1301 Timm Dr	\N	College Station	TX	77840	2	\N	\N	\N	1 Timm, 1 Glade	\N	2012-05-29 00:00:00	2016-05-03 03:50:05	\N	\N	11	GOOD	16	\N	\N
12	Parsonage?	Grace	\N	\N	\N	391	\N	1406 Village Dr	\N	College Station	TX	77840	1	\N	\N	\N	Well hidden, 1 ft from curb	\N	2010-01-01 00:00:00	2016-05-03 03:50:05	\N	\N	12	GOOD	16	1	\N
13	Juan	Rodriguez	graciella.rodriguez@gmail.com	979-575-5983	\N	391	\N	1220 Orr Str	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2015-08-31 00:00:00	2016-05-03 03:50:06	\N	\N	13	GOOD	16	\N	\N
14	David & Diane	Chester	\N	979-693-1666	\N	391	\N	1201 Glade St	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2013-02-12 00:00:00	2016-05-03 03:50:06	\N	\N	14	GOOD	16	\N	\N
15	Jo	Engelking	jo-engelking@hotmail.com	979-224-0592	\N	391	\N	1211 Glade St	\N	College Station	TX	77802	1	\N	\N	\N	\N	\N	2013-02-21 00:00:00	2016-05-03 03:50:07	\N	\N	15	GOOD	15	\N	Check is from Western Management 3727 E29th St!
16	Peter	Lockett	jo-engelking@hotmail.com	979.846.7268	\N	391	\N	1213 Glade St	\N	College Station	TX	77802	1	\N	\N	\N	\N	\N	2014-02-09 00:00:00	2016-05-03 03:50:07	\N	\N	16	GOOD	15	\N	Neighbor Jo Engelking paid for this
17	Michael	Eckart	michael.eckart@yahoo.com	940.727.8240	\N	391	\N	1215 Glade St	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2015-09-01 00:00:00	2016-05-03 03:50:08	\N	\N	17	GOOD	16	\N	\N
18	Peter	Hitchcock	mkhitch@live.com	979-255-9819	\N	391	\N	1217 Glade St	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2013-02-12 00:00:00	2016-05-03 03:50:08	\N	\N	18	GOOD	16	\N	\N
19	Christopher	Mathewson	mathewson@geo.tamu.edu	979-693-5382	\N	391	\N	1307 Glade St	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2013-02-21 00:00:00	2016-05-03 03:50:09	\N	\N	19	GOOD	16	\N	\N
20	David	Evans	Debaytown@aol.com	\N	\N	392	\N	1705 Carter Creek Pkwy	\N	Bryan	TX	77802	1	\N	\N	\N	\N	\N	2013-06-14 00:00:00	2016-05-03 03:50:09	\N	\N	20	GOOD	16	\N	\N
21	Angela	Morehead	\N	\N	\N	392	\N	1905 Carter Creek Pkwy	\N	Bryan	TX	77802	1	\N	\N	\N	\N	\N	2013-06-14 00:00:00	2016-05-03 03:50:10	\N	\N	21	GOOD	16	\N	\N
22	Don	Smith	\N	\N	\N	392	\N	704 Inwood Dr 	\N	Bryan	TX	77802	1	\N	\N	\N	\N	\N	2012-11-11 00:00:00	2016-05-03 03:50:10	\N	\N	22	GOOD	16	\N	\N
23	Lesa	Colson	\N	\N	\N	392	\N	506 Kyle	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2013-06-14 00:00:00	2016-05-03 03:50:11	\N	\N	23	GOOD	16	\N	\N
24	Ted & Nancy	Smith	\N	940-692-7420	\N	393	\N	301 Dexter Dr	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2012-11-11 00:00:00	2016-05-03 03:50:11	\N	\N	24	OVERDUE	15	\N	Mail goes to 1401 Tanglewood Dr/Wichita Falls/76309
25	W.R.	Lancaster	wlavc@suddenlink.net	979.696.5286	\N	393	\N	303 Dexter Dr	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2016-11-11 00:00:00	2016-05-03 03:50:12	\N	\N	25	*  NEW *	16	\N	Flyer generated subscription
26	Laura	Arth	\N	979-696-2227	\N	393	\N	305 Dexter Dr	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2012-05-29 00:00:00	2016-05-03 03:50:12	\N	\N	26	GOOD	16	\N	DRG Called me, chk rec'vd 11/17/13, 11/2/13 Number is not in service.  Skipped Nov'13.  Gave 1 service day.
27	Nancy	Schneider	\N	979-693-4538	\N	393	\N	405 Dexter Dr	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2012-05-29 00:00:00	2016-05-03 03:50:13	\N	\N	27	GOOD	16	\N	DRG Called 11/2 - will write check
28	Matt	Poling	\N	\N	\N	393	\N	504 Dexter Dr	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2011-02-21 00:00:00	2016-05-03 03:50:13	\N	\N	28	GOOD	16	\N	\N
29	Jennifer	Roberts	jennroberts13@gmail.com	979.716.8015	\N	393	\N	505 Dexter Dr	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2015-08-31 00:00:00	2016-05-03 03:50:14	\N	\N	29	GOOD	16	\N	\N
30	Ken	Matthews	kenjeanice@yahoo.com	979-696-1535	\N	393	\N	602 West Dexter Dr	\N	College Station	TX	77840	1	\N	\N	\N	Next to curb	Move Sleeve	2012-02-20 00:00:00	2016-05-03 03:50:14	\N	\N	30	GOOD	16	\N	Referred by Polings
31	Russ	Harvell	fortli@aol.com	979-703-5305	\N	393	\N	504 Guernsey St	\N	College Station	TX	77840	1	\N	\N	\N	Rt of sidwalk about 2 ft	Check	2012-07-04 00:00:00	2016-05-03 03:50:15	\N	\N	31	GOOD	16	\N	\N
32	Quint	Floyd	quint77842@yahoo.com	979-777-9424	\N	393	\N	302 Fidelity St	\N	College Station	TX	77840	1	\N	\N	\N	\N	Need Sleeve & Cap	2011-07-04 00:00:00	2016-05-03 03:50:15	\N	\N	32	GOOD	15.5	\N	EMAILED 8/15 - BOUNCED - but got a check from Maureen
33	John	Lampo	\N	979-777-4747	\N	393	\N	802 Hereford St	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2012-05-29 00:00:00	2016-05-03 03:50:16	\N	\N	33	GOOD	16	\N	\N
34	Eileen	Kulvesky	\N	979-696-7013	\N	393	\N	804 Hawthorn St	\N	College Station	TX	77840	1	\N	\N	\N	Rt of sidewalk	\N	2012-05-29 00:00:00	2016-05-03 03:50:16	\N	\N	34	GOOD	16	\N	\N
35	Gayle	Schultz	jgschultz@suddenlink.net	713-865-3606	\N	393	\N	900 Hawthorn St	\N	College Station	TX	77840	1	\N	\N	\N	Median	\N	2012-05-29 00:00:00	2016-05-03 03:50:17	\N	\N	35	GOOD	16	\N	\N
36	Debbie	Fry	debwfry@gmail.com	979-696-0402	\N	393	\N	912 Hawthorn St	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2012-09-11 00:00:00	2016-05-03 03:50:17	\N	\N	36	GOOD	16	\N	\N
37	Frances	Martin	fdmartin@suddenlink.net	979-693-8092	\N	393	\N	1204 Winding Road	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2011-05-28 00:00:00	2016-05-03 03:50:18	\N	\N	37	GOOD	16	\N	\N
38	Brett	Giroir	teamgiroir@gmail.com	703-973-1857	\N	393	\N	918 Hawthorn St	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2011-02-21 00:00:00	2016-05-03 03:50:18	\N	\N	38	GOOD	16	\N	\N
39	Doug and Cindy	Roesler	d76c78@aol.com	979-292-6916	\N	393	\N	1205 Winding Road	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2011-05-28 00:00:00	2016-05-03 03:50:19	\N	\N	39	GOOD	16	\N	 3 different locations (Medina/Suffolk/Winding)
40	Gayle	Schultz	jgschultz@suddenlink.net	713-865-3606	\N	393	\N	920 Hawthorn St	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2012-05-29 00:00:00	2016-05-03 03:50:19	\N	\N	40	GOOD	16	\N	\N
41	Pam	Kelling	ph77840@gmail.com	979-693-6396	\N	393	\N	911 Hawthorn St	\N	College Station	TX	77840	1	\N	\N	\N	Right of sidewalk 6" from curb  - yellow tag	\N	2012-05-28 00:00:00	2016-05-03 03:50:20	\N	\N	41	GOOD	16	\N	\N
42	Laura	Peycke	lpeycke@cvm.tamu.edu	979 693 1024	\N	393	\N	1002 Winding Rd	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2014-06-01 00:00:00	2016-05-03 03:50:20	\N	\N	42	GOOD	16	\N	\N
43	Deborah	Jasek	debjasek@hotmail.com	979-693-0343	\N	393	\N	1007 Winding Rd	\N	College Station	TX	77840	2	\N	\N	\N	\N	\N	2011-11-11 00:00:00	2016-05-03 03:50:21	\N	\N	43	GOOD	16	\N	2015 ? 2014: Added 1 more flag.  Need one hole on either side of driveway.
44	Manda	Rosser	mhrosser@gmail.com	979-696-3464	\N	394	\N	104 Lee Ave	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2014-06-24 00:00:00	2016-05-03 03:50:21	\N	\N	44	GOOD	16	\N	\N
45	Amy and Tim	Leach	timothyleach@suddenlink.net	432-685-0668	\N	394	\N	211 Pershing Ave	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2014-07-28 00:00:00	2016-05-03 03:50:22	\N	\N	45	GOOD	16	\N	\N
46	F.J.	Moreno	\N	281.280.9640	\N	394	\N	213 Pershing Ave	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2015-09-04 00:00:00	2016-05-03 03:50:22	\N	\N	46	GOOD	16	\N	\N
47	Mark & Tammy	Stein	\N	832.331.4022	\N	394	\N	218 Pershing Ave	\N	College Station	TX	77840	2	\N	\N	\N	One each between Oak Trees	* New flag Feb 2016 *	2016-01-17 00:00:00	2016-05-03 03:50:23	\N	\N	47	GOOD	16	\N	\N
48	Jeannie	Barrett	barrett.jeannie@gmail.com	979-696-5968	\N	394	\N	118 Pershing Ave	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2012-05-28 00:00:00	2016-05-03 03:50:23	\N	\N	48	GOOD	16	\N	\N
49	Gaines	West	gaines.west@westwebblaw.com	979-229-1984	\N	394	\N	200 Suffolk Ave	\N	College Station	TX	77840	1	\N	\N	\N	\N	Sleeve/Cap	2012-02-20 00:00:00	2016-05-03 03:50:24	\N	\N	49	GOOD	16	\N	s
50	Doug and Cindy	Roesler	d76c78@aol.com	979-292-6916	\N	394	\N	204 Suffolk Ave	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2012-06-14 00:00:00	2016-05-03 03:50:24	\N	\N	50	GOOD	16	\N	 3 different locations (Medina/Suffolk/Winding)
51	Hays & Robin	Glover	\N	979-693-8238	\N	394	\N	203 Suffolk Ave	\N	College Station	TX	77840	1	\N	\N	\N	Wrong hole marked - use other	\N	2012-06-14 00:00:00	2016-05-03 03:50:25	\N	\N	51	GOOD	16	\N	2nd is for 203 Suffolk, extra is donation
52	Hays & Robin	Glover	\N	979-693-8238	\N	394	\N	300 Suffolk Ave	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2012-06-14 00:00:00	2016-05-03 03:50:25	\N	\N	52	GOOD	16	\N	Paid for Suffolk (x2) - extra is donation
53	Gail	Hensley	gail24014@gmail.com	\N	\N	394	\N	310 Suffolk Ave	\N	College Station	TX	77840	1	\N	\N	\N	\N	Sleeve	2014-11-01 00:00:00	2016-05-03 03:50:26	\N	\N	53	GOOD	16	\N	\N
54	Greg	Gorman	\N	979-693-8103	\N	394	\N	315 Suffolk Ave	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2012-05-29 00:00:00	2016-05-03 03:50:26	\N	\N	54	GOOD	16	\N	\N
55	Buzz	Pruit	pruittkaty@hotmail.com	979-693-3690	\N	394	\N	900 Park Place	\N	College Station	TX	77840	1	\N	\N	\N	Plug set far back	\N	2011-02-21 00:00:00	2016-05-03 03:50:27	\N	\N	55	GOOD	16	\N	\N
56	Theresa	Schimelpfening	\N	713-248-6418	\N	394	\N	316 Pershing Ave	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2012-05-29 00:00:00	2016-05-03 03:50:27	\N	\N	56	GOOD	16	\N	\N
57	Mark & Tammy	Stein	\N	832.331.4022	\N	394	\N	314 Pershing Ave	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2016-01-17 00:00:00	2016-05-03 03:50:28	\N	\N	57	GOOD	16	\N	\N
58	Will & Amber	Reed	amberreed02@hotmail.com	979-777-6337	\N	394	\N	906 Park Place	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2015-09-04 00:00:00	2016-05-03 03:50:28	\N	\N	58	GOOD	16	\N	\N
59	James	Matson	\N	979-693-0133	\N	394	\N	1002 Park Place	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2011-02-21 00:00:00	2016-05-03 03:50:29	\N	\N	59	GOOD	16	\N	\N
60	Jean	Mays	gmays1054@gmail.com	979-777-0000	\N	394	\N	1111 Park Place	\N	College Station	TX	77840	1	\N	\N	\N	1' back from curb	\N	2014-06-01 00:00:00	2016-05-03 03:50:29	\N	\N	60	OVERDUE	15	\N	\N
61	Robert	McGehee	\N	\N	\N	394	\N	311 Lee Ave	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2015-05-31 00:00:00	2016-05-03 03:50:30	\N	\N	61	GOOD	15.5	\N	\N
62	Vicky	Harrison	\N	979-696-5952	\N	394	\N	207 Lee Ave	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2012-06-14 00:00:00	2016-05-03 03:50:30	\N	\N	62	GOOD	16	\N	\N
63	Alice	Jimenez	skjimenez@hotmail.com	\N	\N	395	\N	1220 South Dexter Dr	\N	College Station	TX	77840	1	\N	\N	\N	At end of cul-de-sac, ours is 6" back from curb	\N	2011-11-11 00:00:00	2016-05-03 03:50:31	\N	\N	63	GOOD	16	\N	\N
64	Doug and Cindy	Roesler	d76c78@aol.com	979-292-6916	\N	395	\N	1812 Medina Dr	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2011-07-04 00:00:00	2016-05-03 03:50:31	\N	\N	64	GOOD	16	\N	 3 different locations (Medina/Suffolk/Winding)
65	Mary	Zingaro	mjzingaro@yahoo.com	979-693-5888	\N	395	\N	1813 Medina Dr	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2011-11-11 00:00:00	2016-05-03 03:50:32	\N	\N	65	GOOD	16	\N	\N
66	Kathleen	Kenefick	\N	\N	\N	395	\N	1815 Medina Dr	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2012-11-11 00:00:00	2016-05-03 03:50:32	\N	\N	66	GOOD	16	\N	\N
67	James	Mondshine	lori@mondshine.net	281.764.4068	\N	395	\N	1814 Hondo Dr	\N	College Station	TX	77440	1	\N	\N	\N	\N	\N	2015-11-01 00:00:00	2016-05-03 03:50:33	\N	\N	67	*  NEW *	16	\N	\N
68	Southwood	Church	\N	\N	\N	395	\N	1901 Harvey Mitchell Pkwy S.	\N	College Station	TX	77845	4	\N	\N	\N	\N	\N	2010-01-01 00:00:00	2016-05-03 03:50:33	\N	\N	68	GOOD	16	4	\N
69	Sharon	Richmond	\N	979-696-3258	\N	395	\N	1813 Hondo Dr	\N	College Station	TX	77840	1	\N	\N	\N	6" back from curb	\N	2011-11-11 00:00:00	2016-05-03 03:50:34	\N	\N	69	GOOD	16	\N	\N
70	Mary	Dallis	yiayiadallis@gmail.com'	979-693-7827	\N	395	\N	1816 Shadowwood Dr	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2011-11-11 00:00:00	2016-05-03 03:50:34	\N	\N	70	GOOD	16	\N	\N
71	Mary	Bryan	marlylbryan@aol.com	979-777-5554	\N	395	\N	1813 Shadowwood Dr	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2015-08-31 00:00:00	2016-05-03 03:50:35	\N	\N	71	GOOD	16	\N	\N
72	Patti	Ljungdahl	pattil@suddenlink.net	\N	\N	395	\N	1822 Shadowwood Dr	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2013-06-07 00:00:00	2016-05-03 03:50:35	\N	\N	72	GOOD	16	\N	\N
73	Patricia	Rand	\N	979-694-0239	\N	395	\N	1801 Sabine Ct	\N	College Station	TX	77840	2	\N	\N	\N	\N	\N	2011-11-11 00:00:00	2016-05-03 03:50:36	\N	\N	73	GOOD	16	\N	\N
74	Peggy	Crittenden	pcritt@suddenlink.net	979-693-5241	\N	395	\N	1803 Laura Lane	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2011-11-11 00:00:00	2016-05-03 03:50:36	\N	\N	74	GOOD	16	\N	\N
75	Richard	Williams	Heirsonline@gmail.com	979-764-8286	\N	395	\N	1714 Glade St	\N	College Station	TX	77840	2	\N	\N	\N	Thick grass - tough to find.	\N	2011-07-04 00:00:00	2016-05-03 03:50:37	\N	\N	75	GOOD	16	\N	\N
76	Albert	Schneider	\N	979-693-7546	\N	395	\N	1401 Angelina Cir	\N	College Station	TX	77840	1	\N	\N	\N	Marked w Yellow Paint	\N	2011-11-11 00:00:00	2016-05-03 03:50:37	\N	\N	76	GOOD	16	\N	\N
77	David	Jones	ketakay@gmail.com	979-693-0097	\N	395	\N	1404 Angelina Cir	\N	College Station	TX	77840	1	\N	\N	\N	\N	\N	2014-11-04 00:00:00	2016-05-03 03:50:38	\N	\N	77	GOOD	16	\N	\N
78	Church	St Thomas	\N	\N	\N	396	\N	906 George Bush Dr West	\N	College Station	TX	77840	3	\N	\N	\N	\N	\N	2010-01-01 00:00:00	2016-05-03 03:50:38	\N	\N	78	GOOD	16	3	Home base - comp
79	Will King -	George Bush Presidential Library	\N	979-691-4069	\N	397	\N	1000 George Bush Dr West	\N	College Station	TX	77845	14	\N	\N	\N	2 at main entrance, rest down sidewalk in line with fountain and front of bldg	\N	2012-09-11 00:00:00	2016-05-03 03:50:39	\N	\N	79	GOOD	15	\N	\N
80	Hillel	Foundation	\N	\N	\N	398	\N	800 George Bush	\N	College Station	TX	77840	3	\N	\N	\N	\N	\N	2014-02-12 00:00:00	2016-05-03 03:50:39	\N	\N	80	GOOD	15	3	\N
81	Grace	Church	\N	\N	\N	399	\N	700 Anderson Street	\N	College Station	TX	77840	4	\N	\N	\N	\N	\N	2010-01-01 00:00:00	2016-05-03 03:50:40	\N	\N	81	GOOD	16	4	\N
\.


--
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: scoutsfd
--

SELECT pg_catalog.setval('subscriptions_id_seq', 5195, true);


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: scoutsfd
--

COPY tasks (id, run_id, user_id, subscription_id, description, qty, created_at, updated_at) FROM stdin;
487	\N	\N	\N	AM: Flags	4	2014-11-11 00:00:00	2015-05-09 18:06:33.833703
488	\N	\N	\N	AM: Parking	1	2014-10-26 00:00:00	2015-05-09 18:06:33.833963
489	\N	\N	\N	AM: Parking	4	2014-10-26 00:00:00	2015-05-09 18:06:33.834076
490	\N	\N	\N	AM: Parking	4	2014-10-26 00:00:00	2015-05-09 18:06:33.83419
491	\N	\N	\N	AM: Parking	4	2014-10-26 00:00:00	2015-05-09 18:06:33.834288
492	\N	\N	\N	AM: Water	2	2014-10-26 00:00:00	2015-05-09 18:06:33.834384
493	\N	611	\N	AM: Water	2	2014-10-26 00:00:00	2015-05-09 18:06:33.834479
494	\N	610	\N	AM: Water	1	2014-10-26 00:00:00	2015-05-09 18:06:33.834575
495	\N	647	\N	AM: Water	1	2014-10-26 00:00:00	2015-05-09 18:06:33.834685
496	\N	\N	\N	AM: Water	1	2014-10-26 00:00:00	2015-05-09 18:06:33.834802
497	\N	\N	\N	PM: Flag Maint	2	2014-10-26 00:00:00	2015-05-09 18:06:33.834901
498	\N	\N	\N	PM: Flag Maint	1	2014-10-26 00:00:00	2015-05-09 18:06:33.835009
499	\N	628	\N	PM: Flag Maint	1	2014-10-26 00:00:00	2015-05-09 18:06:33.835103
500	\N	610	\N	PM: Flag Maint	2	2014-10-26 00:00:00	2015-05-09 18:06:33.835198
501	\N	645	\N	PM: Flag Maint	2	2014-10-26 00:00:00	2015-05-09 18:06:33.835291
502	\N	647	\N	PM: Flag Maint	3	2014-10-26 00:00:00	2015-05-09 18:06:33.835385
503	\N	\N	\N	PM: Flag Maint	1	2014-10-26 00:00:00	2015-05-09 18:06:33.835479
504	\N	\N	\N	PM: Flag Maint	2	2014-10-26 00:00:00	2015-05-09 18:06:33.835572
505	\N	627	\N	AM: Flags	2	2014-09-09 00:00:00	2015-05-09 18:06:33.835682
506	\N	628	\N	AM: Flags	2	2014-09-09 00:00:00	2015-05-09 18:06:33.835779
507	\N	610	\N	AM: Flags	2	2014-09-09 00:00:00	2015-05-09 18:06:33.83589
508	\N	610	\N	AM: Flags	2	2014-09-09 00:00:00	2015-05-09 18:06:33.836002
509	\N	\N	\N	AM: Flags	2	2014-09-09 00:00:00	2015-05-09 18:06:33.836098
510	\N	\N	\N	AM: Flags	2	2014-09-09 00:00:00	2015-05-09 18:06:33.836198
511	\N	599	\N	AM: Flags	1	2014-09-09 00:00:00	2015-05-09 18:06:33.836295
512	\N	611	\N	AM: Flags	6	2014-09-09 00:00:00	2015-05-09 18:06:33.836417
513	\N	610	\N	: Flags	4	2014-09-09 00:00:00	2015-05-09 18:06:33.836533
514	\N	636	\N	: Flags	2	2014-07-04 00:00:00	2015-05-09 18:06:33.836634
515	\N	635	\N	: Flags	2	2014-07-04 00:00:00	2015-05-09 18:06:33.836734
516	\N	648	\N	: Flags	2	2014-07-04 00:00:00	2015-05-09 18:06:33.836834
517	\N	647	\N	: Flags	2	2014-07-04 00:00:00	2015-05-09 18:06:33.836934
518	\N	628	\N	: Flags	8	2014-07-04 00:00:00	2015-05-09 18:06:33.837034
519	\N	651	\N	PM: Flags	1	2014-07-04 00:00:00	2015-05-09 18:06:33.837134
520	\N	\N	\N	PM: Flags	1	2014-07-04 00:00:00	2015-05-09 18:06:33.837234
521	\N	\N	\N	PM: Flags	2	2014-07-04 00:00:00	2015-05-09 18:06:33.837335
522	\N	618	\N	AM: Flags	2	2014-07-04 00:00:00	2015-05-09 18:06:33.837435
523	\N	\N	\N	: Flags	4	2014-07-04 00:00:00	2015-05-09 18:06:33.837534
524	\N	599	\N	PM: Flags	1	2014-07-04 00:00:00	2015-05-09 18:06:33.837639
525	\N	\N	\N	AM: Flags	2	2014-07-04 00:00:00	2015-05-09 18:06:33.837739
526	\N	649	\N	AM: Flags	4	2014-06-14 00:00:00	2015-05-09 18:06:33.83784
527	\N	610	\N	AM: Flags	3	2014-06-14 00:00:00	2015-05-09 18:06:33.83794
528	\N	\N	\N	: Flags	4	2014-06-14 00:00:00	2015-05-09 18:06:33.83804
529	\N	631	\N	: Flags	2	2014-06-14 00:00:00	2015-05-09 18:06:33.838145
530	\N	599	\N	: Flags	2	2014-06-14 00:00:00	2015-05-09 18:06:33.838246
531	\N	\N	\N	AM: Flags	4	2014-06-14 00:00:00	2015-05-09 18:06:33.838346
532	\N	627	\N	: Flags	8	2014-06-14 00:00:00	2015-05-09 18:06:33.838447
533	\N	\N	\N	: Flags	2	2014-05-26 00:00:00	2015-05-09 18:06:33.838547
534	\N	621	\N	: Flags	2	2014-05-26 00:00:00	2015-05-09 18:06:33.838647
535	\N	\N	\N	: Flags	4	2014-05-26 00:00:00	2015-05-09 18:06:33.838747
536	\N	628	\N	: Flags	4	2014-05-26 00:00:00	2015-05-09 18:06:33.838867
537	\N	609	\N	: Flags	4	2014-05-26 00:00:00	2015-05-09 18:06:33.838972
538	\N	611	\N	: Flags	4	2014-05-26 00:00:00	2015-05-09 18:06:33.839073
539	\N	637	\N	: Flags	4	2014-05-26 00:00:00	2015-05-09 18:06:33.839173
540	\N	617	\N	AM: Flags	2	2014-05-26 00:00:00	2015-05-09 18:06:33.839273
541	\N	618	\N	PM: Flags	2	2014-05-26 00:00:00	2015-05-09 18:06:33.839373
542	\N	618	\N	AM: Flags	2	2014-05-26 00:00:00	2015-05-09 18:06:33.839473
543	\N	\N	\N	AM: Flags	2	2014-05-26 00:00:00	2015-05-09 18:06:33.839573
544	\N	628	\N	PM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.839673
545	\N	628	\N	AM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.839773
546	\N	627	\N	PM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.839873
547	\N	627	\N	AM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.839973
548	\N	631	\N	AM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.840073
549	\N	613	\N	PM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.840172
550	\N	613	\N	AM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.840272
551	\N	611	\N	PM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.840377
552	\N	611	\N	AM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.840477
553	\N	\N	\N	PM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.840581
554	\N	\N	\N	AM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.840682
555	\N	\N	\N	PM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.840782
556	\N	\N	\N	AM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.840882
557	\N	648	\N	PM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.840982
558	\N	647	\N	PM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.841082
559	\N	648	\N	AM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.841182
560	\N	647	\N	AM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.841282
561	\N	649	\N	PM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.841382
562	\N	649	\N	AM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.841482
563	\N	635	\N	PM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.841581
564	\N	617	\N	PM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.841681
565	\N	609	\N	PM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.841786
566	\N	610	\N	AM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.841886
567	\N	609	\N	AM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.841985
568	\N	631	\N	PM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.842085
569	\N	645	\N	PM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.842185
570	\N	645	\N	AM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.842285
571	\N	651	\N	AM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.842384
572	\N	621	\N	PM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.842483
573	\N	621	\N	AM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.842583
574	\N	638	\N	PM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.842683
575	\N	638	\N	AM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.842788
576	\N	637	\N	PM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.842903
577	\N	637	\N	AM: Flags	1	2013-11-11 00:00:00	2015-05-09 18:06:33.843003
578	\N	621	\N	PM: Flags	1	2013-09-10 00:00:00	2015-05-09 18:06:33.843108
579	\N	621	\N	AM: Flags	1	2013-09-10 00:00:00	2015-05-09 18:06:33.843208
580	\N	648	\N	PM: Flags	1	2013-09-10 00:00:00	2015-05-09 18:06:33.843307
581	\N	647	\N	PM: Flags	1	2013-09-10 00:00:00	2015-05-09 18:06:33.843407
582	\N	649	\N	PM: Flags	1	2013-09-10 00:00:00	2015-05-09 18:06:33.843507
583	\N	648	\N	AM: Flags	1	2013-09-10 00:00:00	2015-05-09 18:06:33.843607
584	\N	647	\N	AM: Flags	1	2013-09-10 00:00:00	2015-05-09 18:06:33.843707
585	\N	649	\N	AM: Flags	1	2013-09-10 00:00:00	2015-05-09 18:06:33.843806
586	\N	638	\N	PM: Flags	1	2013-09-10 00:00:00	2015-05-09 18:06:33.843906
587	\N	638	\N	AM: Flags	1	2013-09-10 00:00:00	2015-05-09 18:06:33.844007
588	\N	608	\N	PM: Flags	1	2013-09-10 00:00:00	2015-05-09 18:06:33.844107
589	\N	628	\N	PM: Flags	1	2013-09-10 00:00:00	2015-05-09 18:06:33.844207
590	\N	627	\N	PM: Flags	1	2013-09-10 00:00:00	2015-05-09 18:06:33.844307
591	\N	608	\N	AM: Flags	1	2013-09-10 00:00:00	2015-05-09 18:06:33.844406
592	\N	628	\N	AM: Flags	1	2013-09-10 00:00:00	2015-05-09 18:06:33.844511
593	\N	627	\N	AM: Flags	1	2013-09-10 00:00:00	2015-05-09 18:06:33.844614
594	\N	651	\N	PM: Flags	1	2013-09-10 00:00:00	2015-05-09 18:06:33.844715
595	\N	\N	\N	PM: Flags	1	2013-09-10 00:00:00	2015-05-09 18:06:33.844815
596	\N	617	\N	AM: Flags	1	2013-09-10 00:00:00	2015-05-09 18:06:33.844915
597	\N	618	\N	PM: Flags	1	2013-09-10 00:00:00	2015-05-09 18:06:33.845015
598	\N	618	\N	AM: Flags	1	2013-09-10 00:00:00	2015-05-09 18:06:33.845114
599	\N	630	\N	PM: Flags	1	2013-09-10 00:00:00	2015-05-09 18:06:33.845214
600	\N	630	\N	AM: Flags	1	2013-09-10 00:00:00	2015-05-09 18:06:33.845314
601	\N	651	\N	AM: Flags	1	2013-09-10 00:00:00	2015-05-09 18:06:33.845414
602	\N	\N	\N	AM: Flags	1	2013-09-10 00:00:00	2015-05-09 18:06:33.845514
603	\N	621	\N	AM: Flags	1	2013-07-05 00:00:00	2015-05-09 18:06:33.845614
604	\N	620	\N	AM: Flags	1	2013-07-05 00:00:00	2015-05-09 18:06:33.845714
605	\N	638	\N	PM: Flags	1	2013-07-04 00:00:00	2015-05-09 18:06:33.845814
606	\N	638	\N	AM: Flags	1	2013-07-04 00:00:00	2015-05-09 18:06:33.845918
607	\N	649	\N	AM: Flags	1	2013-07-04 00:00:00	2015-05-09 18:06:33.846018
608	\N	649	\N	AM: Flags	1	2013-07-04 00:00:00	2015-05-09 18:06:33.846204
609	\N	650	\N	PM: Flags	1	2013-07-04 00:00:00	2015-05-09 18:06:33.846308
610	\N	650	\N	AM: Flags	1	2013-07-04 00:00:00	2015-05-09 18:06:33.846419
611	\N	609	\N	PM: Flags	1	2013-07-04 00:00:00	2015-05-09 18:06:33.846516
612	\N	609	\N	AM: Flags	1	2013-07-04 00:00:00	2015-05-09 18:06:33.846626
613	\N	621	\N	PM: Flags	1	2013-07-04 00:00:00	2015-05-09 18:06:33.846726
614	\N	621	\N	AM: Flags	1	2013-07-04 00:00:00	2015-05-09 18:06:33.846875
615	\N	622	\N	AM: Flags	1	2013-07-04 00:00:00	2015-05-09 18:06:33.846984
616	\N	620	\N	PM: Flags	1	2013-07-04 00:00:00	2015-05-09 18:06:33.847093
617	\N	620	\N	AM: Flags	1	2013-07-04 00:00:00	2015-05-09 18:06:33.84719
618	\N	651	\N	PM: Flags	1	2013-07-04 00:00:00	2015-05-09 18:06:33.847291
619	\N	651	\N	AM: Flags	1	2013-07-04 00:00:00	2015-05-09 18:06:33.8474
620	\N	630	\N	PM: Flags	1	2013-07-04 00:00:00	2015-05-09 18:06:33.847516
621	\N	630	\N	AM: Flags	1	2013-07-04 00:00:00	2015-05-09 18:06:33.847613
622	\N	630	\N	PM: Flags	1	2013-07-04 00:00:00	2015-05-09 18:06:33.84771
623	\N	630	\N	AM: Flags	1	2013-07-04 00:00:00	2015-05-09 18:06:33.847807
624	\N	626	\N	AM: Flags	1	2013-06-14 00:00:00	2015-05-09 18:06:33.847917
625	\N	624	\N	AM: Flags	1	2013-06-14 00:00:00	2015-05-09 18:06:33.848023
626	\N	651	\N	PM: Flags	1	2013-06-14 00:00:00	2015-05-09 18:06:33.848114
627	\N	620	\N	AM: Flags	1	2013-06-14 00:00:00	2015-05-09 18:06:33.848205
628	\N	621	\N	PM: Flags	1	2013-06-14 00:00:00	2015-05-09 18:06:33.848308
629	\N	621	\N	AM: Flags	1	2013-06-14 00:00:00	2015-05-09 18:06:33.848397
630	\N	627	\N	PM: Flags	1	2013-06-14 00:00:00	2015-05-09 18:06:33.848485
631	\N	627	\N	AM: Flags	1	2013-06-14 00:00:00	2015-05-09 18:06:33.848573
632	\N	628	\N	PM: Flags	1	2013-06-14 00:00:00	2015-05-09 18:06:33.848666
633	\N	610	\N	PM: Flags	1	2013-06-14 00:00:00	2015-05-09 18:06:33.848754
634	\N	598	\N	AM: Flags	1	2013-06-14 00:00:00	2015-05-09 18:06:33.848842
635	\N	610	\N	AM: Flags	1	2013-06-14 00:00:00	2015-05-09 18:06:33.848958
636	\N	609	\N	PM: Flags	1	2013-06-14 00:00:00	2015-05-09 18:06:33.849067
637	\N	609	\N	AM: Flags	1	2013-06-14 00:00:00	2015-05-09 18:06:33.849164
638	\N	645	\N	AM: Flags	1	2013-06-14 00:00:00	2015-05-09 18:06:33.849272
639	\N	628	\N	AM: Flags	1	2013-06-14 00:00:00	2015-05-09 18:06:33.849378
640	\N	\N	\N	PM: Flags	1	2013-06-14 00:00:00	2015-05-09 18:06:33.849479
641	\N	\N	\N	AM: Flags	1	2013-06-14 00:00:00	2015-05-09 18:06:33.849568
642	\N	599	\N	PM: Flags	1	2013-06-14 00:00:00	2015-05-09 18:06:33.849656
643	\N	611	\N	PM: Flags	1	2013-06-14 00:00:00	2015-05-09 18:06:33.849744
644	\N	617	\N	PM: Flags	1	2013-06-14 00:00:00	2015-05-09 18:06:33.849832
645	\N	651	\N	AM: Flags	1	2013-06-14 00:00:00	2015-05-09 18:06:33.84992
646	\N	617	\N	AM: Flags	1	2013-06-14 00:00:00	2015-05-09 18:06:33.850011
647	\N	611	\N	AM: Flags	1	2013-06-14 00:00:00	2015-05-09 18:06:33.8501
648	\N	613	\N	PM: Flags	1	2013-06-14 00:00:00	2015-05-09 18:06:33.850188
649	\N	613	\N	AM: Flags	1	2013-06-14 00:00:00	2015-05-09 18:06:33.850276
650	\N	638	\N	PM: Flags	1	2013-06-14 00:00:00	2015-05-09 18:06:33.850363
651	\N	638	\N	AM: Flags	1	2013-06-14 00:00:00	2015-05-09 18:06:33.850451
652	\N	637	\N	AM: Flags	1	2013-06-14 00:00:00	2015-05-09 18:06:33.850539
653	\N	638	\N	PM: Flags	1	2013-05-25 00:00:00	2015-05-09 18:06:33.850629
654	\N	637	\N	PM: Flags	1	2013-05-25 00:00:00	2015-05-09 18:06:33.850786
655	\N	620	\N	PM: Flags	1	2013-05-25 00:00:00	2015-05-09 18:06:33.850939
656	\N	638	\N	AM: Flags	1	2013-05-25 00:00:00	2015-05-09 18:06:33.851048
657	\N	637	\N	AM: Flags	1	2013-05-25 00:00:00	2015-05-09 18:06:33.851174
658	\N	\N	\N	AM: Flags	1	2013-05-25 00:00:00	2015-05-09 18:06:33.851282
659	\N	\N	\N	AM: Flags	1	2013-05-25 00:00:00	2015-05-09 18:06:33.851378
660	\N	651	\N	PM: Flags	1	2013-05-25 00:00:00	2015-05-09 18:06:33.851473
661	\N	651	\N	AM: Flags	1	2013-05-25 00:00:00	2015-05-09 18:06:33.851579
662	\N	635	\N	AM: Flags	1	2013-05-25 00:00:00	2015-05-09 18:06:33.851669
663	\N	648	\N	PM: Flags	1	2013-05-25 00:00:00	2015-05-09 18:06:33.851759
664	\N	647	\N	PM: Flags	1	2013-05-25 00:00:00	2015-05-09 18:06:33.851854
665	\N	648	\N	AM: Flags	1	2013-05-25 00:00:00	2015-05-09 18:06:33.851943
666	\N	647	\N	AM: Flags	1	2013-05-25 00:00:00	2015-05-09 18:06:33.852051
667	\N	650	\N	PM: Flags	1	2013-05-25 00:00:00	2015-05-09 18:06:33.852143
668	\N	650	\N	AM: Flags	1	2013-05-25 00:00:00	2015-05-09 18:06:33.85225
669	\N	617	\N	PM: Flags	1	2013-05-25 00:00:00	2015-05-09 18:06:33.852357
670	\N	617	\N	AM: Flags	1	2013-05-25 00:00:00	2015-05-09 18:06:33.852449
671	\N	618	\N	PM: Flags	1	2013-05-25 00:00:00	2015-05-09 18:06:33.852551
672	\N	618	\N	AM: Flags	1	2013-05-25 00:00:00	2015-05-09 18:06:33.85264
673	\N	609	\N	AM: Flags	1	2013-05-25 00:00:00	2015-05-09 18:06:33.852742
674	\N	598	\N	PM: Flags	1	2013-05-25 00:00:00	2015-05-09 18:06:33.852846
675	\N	610	\N	PM: Flags	1	2013-05-25 00:00:00	2015-05-09 18:06:33.85294
676	\N	610	\N	AM: Flags	1	2013-05-25 00:00:00	2015-05-09 18:06:33.853034
677	\N	628	\N	AM: Flags	1	2013-05-25 00:00:00	2015-05-09 18:06:33.853127
678	\N	628	\N	PM: Flags	1	2013-05-25 00:00:00	2015-05-09 18:06:33.85323
679	\N	621	\N	PM: Flags	1	2013-05-25 00:00:00	2015-05-09 18:06:33.853317
680	\N	637	\N	PM: Garage Sale	1	2013-02-21 00:00:00	2015-05-09 18:06:33.853406
681	\N	628	\N	PM: Garage Sale	1	2013-02-21 00:00:00	2015-05-09 18:06:33.853498
682	\N	610	\N	PM: Garage Sale	1	2013-02-21 00:00:00	2015-05-09 18:06:33.853587
683	\N	648	\N	PM: Garage Sale	1	2013-02-21 00:00:00	2015-05-09 18:06:33.853676
684	\N	618	\N	PM: Garage Sale	1	2013-02-21 00:00:00	2015-05-09 18:06:33.853764
685	\N	631	\N	PM: Garage Sale	1	2013-02-21 00:00:00	2015-05-09 18:06:33.853852
686	\N	611	\N	PM: Garage Sale	1	2013-02-21 00:00:00	2015-05-09 18:06:33.853942
687	\N	617	\N	PM: Garage Sale	1	2013-02-20 00:00:00	2015-05-09 18:06:33.85403
688	\N	647	\N	PM: Garage Sale	1	2013-02-20 00:00:00	2015-05-09 18:06:33.854118
689	\N	614	\N	AM: Garage Sale	1	2013-02-20 00:00:00	2015-05-09 18:06:33.854206
690	\N	637	\N	AM: Garage Sale	1	2013-02-20 00:00:00	2015-05-09 18:06:33.854295
691	\N	620	\N	AM: Garage Sale	1	2013-02-20 00:00:00	2015-05-09 18:06:33.854383
692	\N	648	\N	AM: Garage Sale	1	2013-02-20 00:00:00	2015-05-09 18:06:33.854472
693	\N	647	\N	AM: Garage Sale	1	2013-02-20 00:00:00	2015-05-09 18:06:33.85456
694	\N	618	\N	AM: Garage Sale	1	2013-02-20 00:00:00	2015-05-09 18:06:33.854648
695	\N	617	\N	AM: Garage Sale	1	2013-02-20 00:00:00	2015-05-09 18:06:33.854736
696	\N	\N	\N	AM: Garage Sale	1	2013-02-20 00:00:00	2015-05-09 18:06:33.854842
697	\N	621	\N	PM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.854932
698	\N	638	\N	PM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.85502
699	\N	630	\N	PM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.855108
700	\N	609	\N	PM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.855197
701	\N	649	\N	PM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.855285
702	\N	648	\N	PM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.855373
703	\N	647	\N	PM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.855461
704	\N	604	\N	PM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.855549
705	\N	628	\N	PM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.855636
706	\N	610	\N	PM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.855725
707	\N	635	\N	PM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.855813
708	\N	618	\N	PM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.855901
709	\N	599	\N	PM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.856011
710	\N	617	\N	PM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.856106
711	\N	637	\N	PM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.856221
712	\N	645	\N	PM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.856318
713	\N	627	\N	AM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.856439
714	\N	621	\N	AM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.85653
715	\N	630	\N	AM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.85662
716	\N	649	\N	AM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.856723
717	\N	638	\N	AM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.856811
718	\N	613	\N	AM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.856899
719	\N	634	\N	AM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.856987
720	\N	647	\N	AM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.857075
721	\N	648	\N	AM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.857163
722	\N	620	\N	AM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.857251
723	\N	631	\N	AM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.857353
724	\N	611	\N	AM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.857444
725	\N	618	\N	AM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.857534
726	\N	636	\N	AM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.857665
727	\N	637	\N	AM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.857754
728	\N	635	\N	AM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.857842
729	\N	614	\N	AM: Flags	1	2013-02-18 00:00:00	2015-05-09 18:06:33.85793
746	5	\N	5083	Flag In	4	2015-05-11 21:40:19.511604	2015-05-11 21:40:19.511604
747	5	\N	5137	Flag In	1	2015-05-11 21:40:20.369812	2015-05-11 21:40:20.369812
748	5	\N	5138	Flag In	1	2015-05-11 21:40:21.15644	2015-05-11 21:40:21.15644
749	5	\N	5139	Flag In	1	2015-05-11 21:40:43.644601	2015-05-11 21:40:43.644601
750	5	\N	5140	Flag In	1	2015-05-11 21:40:44.17903	2015-05-11 21:40:44.17903
751	5	\N	5141	Flag In	1	2015-05-11 21:40:44.720267	2015-05-11 21:40:44.720267
753	5	\N	5142	Flag In	1	2015-05-11 21:40:45.751097	2015-05-11 21:40:45.751097
754	11	\N	5078	Flag In	3	2016-04-06 02:51:59.385901	2016-04-06 02:51:59.385901
755	11	\N	5084	Flag In	14	2016-04-06 02:51:59.884983	2016-04-06 02:51:59.884983
756	11	\N	5181	Flag In	3	2016-04-06 02:52:01.1304	2016-04-06 02:52:01.1304
757	13	\N	5079	Flag In	4	2016-04-06 23:34:24.328505	2016-04-06 23:34:24.328505
758	13	\N	5085	Flag In	3	2016-04-06 23:34:24.902491	2016-04-06 23:34:24.902491
759	13	\N	5171	Flag In	1	2016-04-06 23:34:25.290481	2016-04-06 23:34:25.290481
760	13	\N	5086	Flag In	1	2016-04-06 23:34:26.174354	2016-04-06 23:34:26.174354
762	24	\N	5085	Flag In	3	2016-05-03 00:17:40.131214	2016-05-03 00:17:40.131214
763	24	\N	5086	Flag In	1	2016-05-03 00:17:40.687021	2016-05-03 00:17:40.687021
764	24	\N	5079	Flag In	4	2016-05-03 00:17:41.139846	2016-05-03 00:17:41.139846
765	24	\N	5171	Flag In	1	2016-05-03 00:17:41.612102	2016-05-03 00:17:41.612102
766	24	\N	5172	Flag In	1	2016-05-03 00:17:42.380371	2016-05-03 00:17:42.380371
767	24	\N	5175	Flag In	1	2016-05-03 00:17:42.808327	2016-05-03 00:17:42.808327
768	25	\N	5080	Flag In	2	2016-05-03 00:25:09.551753	2016-05-03 00:25:09.551753
769	25	\N	5081	Flag In	1	2016-05-03 00:25:09.859379	2016-05-03 00:25:09.859379
770	25	\N	5082	Flag In	2	2016-05-03 00:25:10.227932	2016-05-03 00:25:10.227932
771	25	\N	5170	Flag In	1	2016-05-03 00:25:10.881063	2016-05-03 00:25:10.881063
772	26	\N	5181	Flag In	3	2016-05-03 00:25:54.244342	2016-05-03 00:25:54.244342
773	26	\N	5078	Flag In	3	2016-05-03 00:25:54.626886	2016-05-03 00:25:54.626886
774	26	\N	5084	Flag In	14	2016-05-03 00:25:55.021024	2016-05-03 00:25:55.021024
\.


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: scoutsfd
--

SELECT pg_catalog.setval('tasks_id_seq', 774, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: scoutsfd
--

COPY users (id, created_at, updated_at, email, encrypted_password, confirmation_token, remember_token, can_view_routes, first_name, last_name, cell_phone, landline, is_active, vehicle, group_id, route_id) FROM stdin;
595	2015-05-09 18:06:33.81373	2015-05-09 18:06:33.813738	allthewaylive14@aol.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Clayton	Baker	979-209-4716		f		\N	\N
596	2015-05-09 18:06:33.813925	2015-05-09 18:06:33.813932	homeschoolfun5@yahoo.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Daniel	Baker			f		\N	\N
597	2015-05-09 18:06:33.814076	2015-05-09 18:06:33.814083	lizajane@suddenlinkmail.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Lisa	Baker		979-846-1899	f		\N	\N
598	2015-05-09 18:06:33.814224	2015-05-09 18:06:33.81423	dpbcpa@aol.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	David	Bronstad		979-268-5372	f		\N	\N
599	2015-05-09 18:06:33.814384	2015-05-09 18:06:33.81439		$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Erik	Bronstad		979-268-5372	t	Pickup	\N	\N
600	2015-05-09 18:06:33.814525	2015-05-09 18:06:33.814531		$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Liesel	Bronstad		979-268-5372	f		\N	\N
601	2015-05-09 18:06:33.814664	2015-05-09 18:06:33.81467	joshuavcabrera@gmail.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Josh	Cabrera			t		\N	\N
602	2015-05-09 18:06:33.814824	2015-05-09 18:06:33.81483	kimiyecabrera@hotmail.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Kaji	Cabrera			t		\N	\N
603	2015-05-09 18:06:33.814966	2015-05-09 18:06:33.814972	kimiyecabrera@hotmail.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Kim	Cabrera			t		\N	\N
604	2015-05-09 18:06:33.815107	2015-05-09 18:06:33.815113	dacoats@gmail.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Alex	Coats	979-820-0422	979-220-8688	f		\N	\N
605	2015-05-09 18:06:33.815247	2015-05-09 18:06:33.815253	no1damonfan@gmail.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Austin	Coats		979-220-8688	f		\N	\N
606	2015-05-09 18:06:33.8154	2015-05-09 18:06:33.815406	wllamco@gmail.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Bill	Coats		979-220-8688	f		\N	\N
607	2015-05-09 18:06:33.815542	2015-05-09 18:06:33.815549	wllamco@gmail.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Debbie	Coats		979-220-8688	f		\N	\N
608	2015-05-09 18:06:33.815686	2015-05-09 18:06:33.815692		$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Heather	Demeny		979-575-3831	f		\N	\N
609	2015-05-09 18:06:33.81584	2015-05-09 18:06:33.815846	demjohn@hotmail.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	John	Demeny	979-574-8101	979-575-3831	t	Van	\N	\N
610	2015-05-09 18:06:33.815984	2015-05-09 18:06:33.815991	ninjanad@hotmail.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Nick	Demeny		979-575-3831	t		\N	\N
611	2015-05-09 18:06:33.816124	2015-05-09 18:06:33.81613		$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Andrew	Fackler		979-691-4642	t		\N	\N
612	2015-05-09 18:06:33.816268	2015-05-09 18:06:33.816274	conrad_fackler@yahoo.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Conrad	Fackler		979-691-4642	t	Van	\N	\N
613	2015-05-09 18:06:33.816413	2015-05-09 18:06:33.816419	dmafackler@gmail.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	David	Fackler	979-255-9469	979-691-4642	t	Van	\N	\N
614	2015-05-09 18:06:33.816553	2015-05-09 18:06:33.816559	jimmyfackler2244@gmail.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Jimmy	Fackler	979-492-3498	979-691-4642	f		\N	\N
615	2015-05-09 18:06:33.816693	2015-05-09 18:06:33.816699	jfajt@slb.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	James (Jim)	Fajt	832-316-1721	979-680-8353	t	SUV	\N	\N
616	2015-05-09 18:06:33.816833	2015-05-09 18:06:33.816839		$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Robert (Bobby)	Fajt			t		\N	\N
617	2015-05-09 18:06:33.816972	2015-05-09 18:06:33.816978		$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Stewart	Fritts		979-846-1899	t		\N	\N
618	2015-05-09 18:06:33.817111	2015-05-09 18:06:33.817117	garganobryn@aol.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Joseph	Gargano	979-422-5992	979-739-2052	t		\N	\N
619	2015-05-09 18:06:33.817252	2015-05-09 18:06:33.817258		$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	John	Gibbons			t	Pickup	\N	\N
620	2015-05-09 18:06:33.817395	2015-05-09 18:06:33.817401	davidapgilman@gmail.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	David	Gilman	979-446-2067	979-774-0582	f	Wagon	\N	\N
621	2015-05-09 18:06:33.817536	2015-05-09 18:06:33.817545	dgilman@tamu.edu	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Don	Gilman	979-229-1053	979-774-0582	t	Car	\N	\N
622	2015-05-09 18:06:33.81768	2015-05-09 18:06:33.817686		$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Lorraine	Gilman		979-774-0582	f	SUV	\N	\N
623	2015-05-09 18:06:33.817836	2015-05-09 18:06:33.817842	frankharris14@gmail.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Frank	Harris		979-567-1518	f		\N	\N
624	2015-05-09 18:06:33.81798	2015-05-09 18:06:33.817986	tengfya@gmail.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Campbell	Herman		979-846-1621	f		\N	\N
625	2015-05-09 18:06:33.818136	2015-05-09 18:06:33.818143	carmen@suddenlink.net	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Carmen	Herman		979-846-1621	f	SUV	\N	\N
626	2015-05-09 18:06:33.818281	2015-05-09 18:06:33.818287	forrest.r.herman@gmail.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Forrest	Herman		979-846-1621	f		\N	\N
627	2015-05-09 18:06:33.818422	2015-05-09 18:06:33.818428	jherman@cvm.tamu.edu	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	James	Herman	979-777-9163	979-846-1621	t	SUV	\N	\N
628	2015-05-09 18:06:33.818565	2015-05-09 18:06:33.818571	wittherman@gmail.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Witt	Herman	979-587-9815	979-846-1621	t	Pickup	\N	\N
629	2015-05-09 18:06:33.818707	2015-05-09 18:06:33.818713		$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Carmen	Herman			t	SUV	\N	\N
630	2015-05-09 18:06:33.818867	2015-05-09 18:06:33.818874	jodyjamesjohnson@aol.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Jody	Johnson	979-422-5992	979-739-2052	t	SUV	\N	\N
631	2015-05-09 18:06:33.819032	2015-05-09 18:06:33.819038	leijamanuel@gmail.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Andrew	Leija	979-402-5977		t		\N	\N
632	2015-05-09 18:06:33.819192	2015-05-09 18:06:33.819198		$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Manuel	Leija			t		\N	\N
633	2015-05-09 18:06:33.819342	2015-05-09 18:06:33.819347		$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Shirley	Leija			t	Van	\N	\N
634	2015-05-09 18:06:33.819478	2015-05-09 18:06:33.819483	daniel.martin@ars.usda.gov	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Daniel	Martin		979-485-8742	f		\N	\N
635	2015-05-09 18:06:33.819695	2015-05-09 18:06:33.819701		$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	John	Martin		979-485-8742	t	Car	\N	\N
636	2015-05-09 18:06:33.819837	2015-05-09 18:06:33.819843		$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Joshua	Martin		979-485-8742	t		\N	\N
637	2015-05-09 18:06:33.819976	2015-05-09 18:06:33.819981		$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Cole	Mason			f	Pickup	\N	\N
638	2015-05-09 18:06:33.820113	2015-05-09 18:06:33.820119	Jeffrey.Mason@luminant.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Jeff	Mason			f	Pickup	\N	\N
639	2015-05-09 18:06:33.820251	2015-05-09 18:06:33.820257		$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Andrew	Mays			t		\N	\N
640	2015-05-09 18:06:33.820393	2015-05-09 18:06:33.820398		$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Jean	Mays			t	Pickup	\N	\N
641	2015-05-09 18:06:33.82053	2015-05-09 18:06:33.820536		$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Charlie	McLaughlin			t		\N	\N
642	2015-05-09 18:06:33.820667	2015-05-09 18:06:33.820672	tim.mclaughlin@mac.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Tim	McLaughlin	415 699 1890		t	SUV	\N	\N
643	2015-05-09 18:06:33.820823	2015-05-09 18:06:33.820829	jamonroe848@gmail.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	James	Monroe	956-789-3723		t		\N	\N
644	2015-05-09 18:06:33.820966	2015-05-09 18:06:33.820972	churchoffice@stthomasbcs.org	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Rhoda	Montgomery			f		\N	\N
645	2015-05-09 18:06:33.821119	2015-05-09 18:06:33.821125	onlythreesofar@juno.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Jarod	Pratt		979-691-0560	t		\N	\N
646	2015-05-09 18:06:33.821256	2015-05-09 18:06:33.821262	laura.ripley@ars.usda.gov	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Laura	Ripley		979-567-1518	f		\N	\N
647	2015-05-09 18:06:33.821393	2015-05-09 18:06:33.821399	aaron.ronsonet@gmail.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Aaron	Ronsonet	979-422-4984		t		\N	\N
648	2015-05-09 18:06:33.821566	2015-05-09 18:06:33.821573	angry_dag@yahoo.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Dwayne	Ronsonet	979-422-4467		t		\N	\N
649	2015-05-09 18:06:33.821717	2015-05-09 18:06:33.821723	mronsonet@tamu.edu	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Mary	Ronsonet	979-229-4399		t	SUV	\N	\N
650	2015-05-09 18:06:33.82189	2015-05-09 18:06:33.821896	steve@totaltechus.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Steve	Ronsonet	979-422-4215		t	SUV	\N	\N
651	2015-05-09 18:06:33.822059	2015-05-09 18:06:33.822065		$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Isaac	Sarver			t	Car	\N	\N
652	2015-05-09 18:06:33.822211	2015-05-09 18:06:33.822218	smjcaj@gmail.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Angela	Shipley			t		\N	\N
653	2015-05-09 18:06:33.822353	2015-05-09 18:06:33.82236	smjcaj@gmail.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Jeremiah	Shipley			t		\N	\N
654	2015-05-09 18:06:33.82252	2015-05-09 18:06:33.822525	awenck95@yahoo.com	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Adam	Wenck	979-220-2411	979-694-1941	f		\N	\N
655	2015-05-09 18:06:33.822668	2015-05-09 18:06:33.822673	the5wencks@verizon.net	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Cheryl	Wenck	979-220-4048	979-694-1941	f		\N	\N
656	2015-05-09 18:06:33.822857	2015-05-09 18:06:33.822863	the5wencks@verizon.net	$2a$10$yTW6gj0n.vpDlLwv/oh.OepfRJDkevOtQ6CxwPE4ip3Rq5jQNk5WO	\N	$2a$10$yTW6gj0n.vpDlLwv/oh.Oe	\N	Fred	Wenck	979-220-6207	979-694-1941	f		\N	\N
657	2015-05-11 00:01:47.663001	2015-05-11 00:01:47.663001	troop1300leader@boyscoutsfd.com	$2a$10$G1Ida5avqO9gJRD7/mDEbexCFCr3dEnLC.hrpmMNwzeSyP3qifr7e	\N	f1ac319de7a1d180324ea0fdd348da4a1f0a0347	\N	\N	\N	\N	\N	\N	\N	\N	\N
658	2016-03-25 16:29:06.984724	2016-04-06 23:34:38.212983	nafealsawfta@gmail.com	$2a$10$JQGISWSZ1OL.egZn92/t4eDNeOv1tC1z5va58lFeDdLe8w4IBlewe	\N	5bca6cf3a925791d7528667afe5a9ae017649824	\N	Nafe	Alsawfta	\N	\N	\N	\N	\N	\N
594	2015-05-09 16:28:28.34633	2016-04-26 02:50:26.607034	admin@boyscoutsfd.com	$2a$10$DnlYg131u0OqPTilapzzOeCqVu69Zq/TSngHsToS0OxzHuNvs0Kra	\N	7a99ebfe12f85d4b02e2b485512caf457ee806f2	\N	AdminFirstName01	AdminLastName01	\N	\N	\N	\N	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: scoutsfd
--

SELECT pg_catalog.setval('users_id_seq', 658, true);


--
-- Name: groups_pkey; Type: CONSTRAINT; Schema: public; Owner: scoutsfd; Tablespace: 
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: groups_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: scoutsfd; Tablespace: 
--

ALTER TABLE ONLY groups_roles
    ADD CONSTRAINT groups_roles_pkey PRIMARY KEY (id);


--
-- Name: groups_users_pkey; Type: CONSTRAINT; Schema: public; Owner: scoutsfd; Tablespace: 
--

ALTER TABLE ONLY groups_users
    ADD CONSTRAINT groups_users_pkey PRIMARY KEY (id);


--
-- Name: members_runs_pkey; Type: CONSTRAINT; Schema: public; Owner: scoutsfd; Tablespace: 
--

ALTER TABLE ONLY members_runs
    ADD CONSTRAINT members_runs_pkey PRIMARY KEY (id);


--
-- Name: payments_pkey; Type: CONSTRAINT; Schema: public; Owner: scoutsfd; Tablespace: 
--

ALTER TABLE ONLY payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: scoutsfd; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: routes_pkey; Type: CONSTRAINT; Schema: public; Owner: scoutsfd; Tablespace: 
--

ALTER TABLE ONLY routes
    ADD CONSTRAINT routes_pkey PRIMARY KEY (id);


--
-- Name: routes_users_pkey; Type: CONSTRAINT; Schema: public; Owner: scoutsfd; Tablespace: 
--

ALTER TABLE ONLY routes_users
    ADD CONSTRAINT routes_users_pkey PRIMARY KEY (id);


--
-- Name: runs_pkey; Type: CONSTRAINT; Schema: public; Owner: scoutsfd; Tablespace: 
--

ALTER TABLE ONLY runs
    ADD CONSTRAINT runs_pkey PRIMARY KEY (id);


--
-- Name: runs_users_pkey; Type: CONSTRAINT; Schema: public; Owner: scoutsfd; Tablespace: 
--

ALTER TABLE ONLY runs_users
    ADD CONSTRAINT runs_users_pkey PRIMARY KEY (id);


--
-- Name: subscribers_pkey; Type: CONSTRAINT; Schema: public; Owner: scoutsfd; Tablespace: 
--

ALTER TABLE ONLY subscribers
    ADD CONSTRAINT subscribers_pkey PRIMARY KEY (id);


--
-- Name: subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: scoutsfd; Tablespace: 
--

ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: scoutsfd; Tablespace: 
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: scoutsfd; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_members_runs_on_run_id; Type: INDEX; Schema: public; Owner: scoutsfd; Tablespace: 
--

CREATE INDEX index_members_runs_on_run_id ON members_runs USING btree (run_id);


--
-- Name: index_members_runs_on_user_id; Type: INDEX; Schema: public; Owner: scoutsfd; Tablespace: 
--

CREATE INDEX index_members_runs_on_user_id ON members_runs USING btree (user_id);


--
-- Name: index_subscriptions_on_subscriber_id; Type: INDEX; Schema: public; Owner: scoutsfd; Tablespace: 
--

CREATE INDEX index_subscriptions_on_subscriber_id ON subscriptions USING btree (subscriber_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: scoutsfd; Tablespace: 
--

CREATE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_remember_token; Type: INDEX; Schema: public; Owner: scoutsfd; Tablespace: 
--

CREATE INDEX index_users_on_remember_token ON users USING btree (remember_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: scoutsfd; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_0b14ff9016; Type: FK CONSTRAINT; Schema: public; Owner: scoutsfd
--

ALTER TABLE ONLY members_runs
    ADD CONSTRAINT fk_rails_0b14ff9016 FOREIGN KEY (run_id) REFERENCES runs(id);


--
-- Name: fk_rails_af2b916821; Type: FK CONSTRAINT; Schema: public; Owner: scoutsfd
--

ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT fk_rails_af2b916821 FOREIGN KEY (subscriber_id) REFERENCES subscribers(id);


--
-- Name: fk_rails_df19f7a324; Type: FK CONSTRAINT; Schema: public; Owner: scoutsfd
--

ALTER TABLE ONLY members_runs
    ADD CONSTRAINT fk_rails_df19f7a324 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
