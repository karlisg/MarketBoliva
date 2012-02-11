--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE OR REPLACE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE category (
    id_category integer NOT NULL,
    code character varying(3) NOT NULL,
    name character varying(50) NOT NULL,
    parent_id integer NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_id_category_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE category_id_category_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_category_seq OWNER TO postgres;

--
-- Name: category_id_category_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE category_id_category_seq OWNED BY category.id_category;


--
-- Name: category_id_category_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('category_id_category_seq', 1, false);


--
-- Name: id_category; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE category ALTER COLUMN id_category SET DEFAULT nextval('category_id_category_seq'::regclass);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO category (id_category, code, name, parent_id) VALUES (1, 'ALI', 'Alimentacion', 0);
INSERT INTO category (id_category, code, name, parent_id) VALUES (2, 'BEB', 'Bebidas', 0);
INSERT INTO category (id_category, code, name, parent_id) VALUES (3, 'CAR', 'Carnes', 0);
INSERT INTO category (id_category, code, name, parent_id) VALUES (4, 'FRU', 'Frutas y Verduras', 0);
INSERT INTO category (id_category, code, name, parent_id) VALUES (5, 'PES', 'Pescados y Mariscos', 0);


--
-- Name: category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id_category);


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

