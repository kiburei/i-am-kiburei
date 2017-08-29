--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: andrew
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO andrew;

--
-- Name: blogs; Type: TABLE; Schema: public; Owner: andrew
--

CREATE TABLE blogs (
    id integer NOT NULL,
    title character varying,
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE blogs OWNER TO andrew;

--
-- Name: blogs_id_seq; Type: SEQUENCE; Schema: public; Owner: andrew
--

CREATE SEQUENCE blogs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blogs_id_seq OWNER TO andrew;

--
-- Name: blogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrew
--

ALTER SEQUENCE blogs_id_seq OWNED BY blogs.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: andrew
--

CREATE TABLE comments (
    id integer NOT NULL,
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    blog_id integer,
    user_id integer
);


ALTER TABLE comments OWNER TO andrew;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: andrew
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comments_id_seq OWNER TO andrew;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrew
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: ids; Type: TABLE; Schema: public; Owner: andrew
--

CREATE TABLE ids (
    id integer NOT NULL,
    first_name character varying,
    second_name character varying,
    sir_name character varying,
    other_name character varying,
    dob date,
    bio character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ids OWNER TO andrew;

--
-- Name: ids_id_seq; Type: SEQUENCE; Schema: public; Owner: andrew
--

CREATE SEQUENCE ids_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ids_id_seq OWNER TO andrew;

--
-- Name: ids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrew
--

ALTER SEQUENCE ids_id_seq OWNED BY ids.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: andrew
--

CREATE TABLE projects (
    id integer NOT NULL,
    name character varying,
    url character varying,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    skills_id integer
);


ALTER TABLE projects OWNER TO andrew;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: andrew
--

CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE projects_id_seq OWNER TO andrew;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrew
--

ALTER SEQUENCE projects_id_seq OWNED BY projects.id;


--
-- Name: references; Type: TABLE; Schema: public; Owner: andrew
--

CREATE TABLE "references" (
    id integer NOT NULL,
    name character varying,
    message character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE "references" OWNER TO andrew;

--
-- Name: references_id_seq; Type: SEQUENCE; Schema: public; Owner: andrew
--

CREATE SEQUENCE references_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE references_id_seq OWNER TO andrew;

--
-- Name: references_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrew
--

ALTER SEQUENCE references_id_seq OWNED BY "references".id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: andrew
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO andrew;

--
-- Name: skills; Type: TABLE; Schema: public; Owner: andrew
--

CREATE TABLE skills (
    id integer NOT NULL,
    skill character varying,
    rating integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    project_id integer,
    description text
);


ALTER TABLE skills OWNER TO andrew;

--
-- Name: skills_id_seq; Type: SEQUENCE; Schema: public; Owner: andrew
--

CREATE SEQUENCE skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE skills_id_seq OWNER TO andrew;

--
-- Name: skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrew
--

ALTER SEQUENCE skills_id_seq OWNED BY skills.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: andrew
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    username character varying,
    admin boolean DEFAULT false
);


ALTER TABLE users OWNER TO andrew;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: andrew
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO andrew;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrew
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: blogs id; Type: DEFAULT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY blogs ALTER COLUMN id SET DEFAULT nextval('blogs_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: ids id; Type: DEFAULT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY ids ALTER COLUMN id SET DEFAULT nextval('ids_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY projects ALTER COLUMN id SET DEFAULT nextval('projects_id_seq'::regclass);


--
-- Name: references id; Type: DEFAULT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY "references" ALTER COLUMN id SET DEFAULT nextval('references_id_seq'::regclass);


--
-- Name: skills id; Type: DEFAULT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY skills ALTER COLUMN id SET DEFAULT nextval('skills_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: andrew
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2017-08-23 12:06:08.209287	2017-08-23 12:06:08.209287
\.


--
-- Data for Name: blogs; Type: TABLE DATA; Schema: public; Owner: andrew
--

COPY blogs (id, title, body, created_at, updated_at) FROM stdin;
\.


--
-- Name: blogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrew
--

SELECT pg_catalog.setval('blogs_id_seq', 1, false);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: andrew
--

COPY comments (id, body, created_at, updated_at, blog_id, user_id) FROM stdin;
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrew
--

SELECT pg_catalog.setval('comments_id_seq', 1, false);


--
-- Data for Name: ids; Type: TABLE DATA; Schema: public; Owner: andrew
--

COPY ids (id, first_name, second_name, sir_name, other_name, dob, bio, created_at, updated_at) FROM stdin;
\.


--
-- Name: ids_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrew
--

SELECT pg_catalog.setval('ids_id_seq', 1, false);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: andrew
--

COPY projects (id, name, url, description, created_at, updated_at, skills_id) FROM stdin;
3	Bunge La Wananchi	https://github.com/	Public Cyber space	2017-08-23 13:34:05.111642	2017-08-23 13:34:05.111642	4
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrew
--

SELECT pg_catalog.setval('projects_id_seq', 3, true);


--
-- Data for Name: references; Type: TABLE DATA; Schema: public; Owner: andrew
--

COPY "references" (id, name, message, created_at, updated_at) FROM stdin;
1	Jabavu	We have to call him engineer	2017-08-23 12:17:58.699922	2017-08-23 12:17:58.699922
2	The Jamdown Fratanerty	We have to call him engineer	2017-08-23 13:37:28.989383	2017-08-23 13:37:28.989383
3	Sam	My Hero	2017-08-23 13:38:41.669546	2017-08-23 13:38:41.669546
4	Betty	My Idol	2017-08-23 13:40:25.678573	2017-08-23 13:40:25.678573
5	Edward	He's Bad and Boujee	2017-08-23 13:40:59.466834	2017-08-23 13:40:59.466834
6	Killers	He murder erb	2017-08-23 13:41:34.4551	2017-08-23 13:41:34.4551
\.


--
-- Name: references_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrew
--

SELECT pg_catalog.setval('references_id_seq', 6, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: andrew
--

COPY schema_migrations (version) FROM stdin;
20170823115935
20170821060933
20170823062547
20170804091548
20170821060736
20170804101451
20170821052656
20170817084639
20170821091829
20170821085305
20170821063958
20170804101521
20170804084656
20170822054523
20170821143133
\.


--
-- Data for Name: skills; Type: TABLE DATA; Schema: public; Owner: andrew
--

COPY skills (id, skill, rating, created_at, updated_at, project_id, description) FROM stdin;
1	Ruby on Rails	8	2017-08-23 12:08:55.229086	2017-08-23 12:08:55.229086	\N	Ruby on Rails, or simply Rails, is a server-side web application framework written in Ruby under the MIT License. Rails is a model–view–controller framework, providing default structures for a database, a web service, and web pages
2	Sinatra	7	2017-08-23 12:09:39.209471	2017-08-23 12:09:39.209471	\N	Sinatra is a DSL for quickly creating web applications in Ruby with minimal effort: require 'sinatra' get '/frank-says' do 'Put this in your pipe & smoke it!' end.
3	Ember JS	10	2017-08-23 12:10:09.37076	2017-08-23 12:10:09.37076	\N	Write dramatically less code with Ember's Handlebars integrated templates that update automatically when the underlying data changes. Don't waste time ...
4	Angular JS	7	2017-08-23 12:10:50.569875	2017-08-23 12:10:50.569875	\N	AngularJS is what HTML would have been, had it been designed for building web-apps. Declarative templates with data-binding, MVW, MVVM, MVC,
\.


--
-- Name: skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrew
--

SELECT pg_catalog.setval('skills_id_seq', 4, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: andrew
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, username, admin) FROM stdin;
1	akiburei@gmail.com	$2a$11$3a3xUD99ECekCwrlhx4KFOWYHZtY5lH7zl2RbIzAQJxCaqOdaiJL.	\N	\N	\N	1	2017-08-23 12:07:00	2017-08-23 12:07:00	127.0.0.1	127.0.0.1	2017-08-23 12:07:50.822534	2017-08-23 12:08:15.200311		t
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrew
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: blogs blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: ids ids_pkey; Type: CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY ids
    ADD CONSTRAINT ids_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: references references_pkey; Type: CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY "references"
    ADD CONSTRAINT references_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: skills skills_pkey; Type: CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_comments_on_blog_id; Type: INDEX; Schema: public; Owner: andrew
--

CREATE INDEX index_comments_on_blog_id ON comments USING btree (blog_id);


--
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: andrew
--

CREATE INDEX index_comments_on_user_id ON comments USING btree (user_id);


--
-- Name: index_projects_on_skills_id; Type: INDEX; Schema: public; Owner: andrew
--

CREATE INDEX index_projects_on_skills_id ON projects USING btree (skills_id);


--
-- Name: index_skills_on_project_id; Type: INDEX; Schema: public; Owner: andrew
--

CREATE INDEX index_skills_on_project_id ON skills USING btree (project_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: andrew
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: andrew
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: comments fk_rails_03de2dc08c; Type: FK CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT fk_rails_03de2dc08c FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: projects fk_rails_2a1b0d00c4; Type: FK CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT fk_rails_2a1b0d00c4 FOREIGN KEY (skills_id) REFERENCES skills(id);


--
-- Name: comments fk_rails_b9ae98a823; Type: FK CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT fk_rails_b9ae98a823 FOREIGN KEY (blog_id) REFERENCES blogs(id);


--
-- Name: skills fk_rails_ca04e2fd46; Type: FK CONSTRAINT; Schema: public; Owner: andrew
--

ALTER TABLE ONLY skills
    ADD CONSTRAINT fk_rails_ca04e2fd46 FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- PostgreSQL database dump complete
--

