--
-- PostgreSQL database dump
--

-- Dumped from database version 9.0.1
-- Dumped by pg_dump version 9.0.1
-- Started on 2012-01-22 17:16:52

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1509 (class 1259 OID 16401)
-- Dependencies: 6
-- Name: product; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE product (
    id_product bigint NOT NULL,
    code character varying(10) NOT NULL,
    name character varying(150) NOT NULL,
    description character varying(500),
    price numeric(6,2) NOT NULL
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 1511 (class 1259 OID 16419)
-- Dependencies: 6
-- Name: product_by_category; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE product_by_category (
    id_category integer NOT NULL,
    id_product bigint NOT NULL,
    id_prodcat bigint NOT NULL
);


ALTER TABLE public.product_by_category OWNER TO postgres;

--
-- TOC entry 1512 (class 1259 OID 16441)
-- Dependencies: 1511 6
-- Name: product_by_category_id_prodcat_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE product_by_category_id_prodcat_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_by_category_id_prodcat_seq OWNER TO postgres;

--
-- TOC entry 1802 (class 0 OID 0)
-- Dependencies: 1512
-- Name: product_by_category_id_prodcat_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE product_by_category_id_prodcat_seq OWNED BY product_by_category.id_prodcat;


--
-- TOC entry 1803 (class 0 OID 0)
-- Dependencies: 1512
-- Name: product_by_category_id_prodcat_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('product_by_category_id_prodcat_seq', 1, true);


--
-- TOC entry 1510 (class 1259 OID 16404)
-- Dependencies: 1509 6
-- Name: product_id_product_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE product_id_product_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_product_seq OWNER TO postgres;

--
-- TOC entry 1804 (class 0 OID 0)
-- Dependencies: 1510
-- Name: product_id_product_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE product_id_product_seq OWNED BY product.id_product;


--
-- TOC entry 1805 (class 0 OID 0)
-- Dependencies: 1510
-- Name: product_id_product_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('product_id_product_seq', 2, true);


--
-- TOC entry 1790 (class 2604 OID 16406)
-- Dependencies: 1510 1509
-- Name: id_product; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE product ALTER COLUMN id_product SET DEFAULT nextval('product_id_product_seq'::regclass);


--
-- TOC entry 1791 (class 2604 OID 16443)
-- Dependencies: 1512 1511
-- Name: id_prodcat; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE product_by_category ALTER COLUMN id_prodcat SET DEFAULT nextval('product_by_category_id_prodcat_seq'::regclass);


--
-- TOC entry 1798 (class 0 OID 16401)
-- Dependencies: 1509
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO product VALUES (1, 'CHOC500', 'Cereal Chocapic 500 gr.', 'Cereal con cholate', 24.00);
INSERT INTO product VALUES (2, 'ZUC500', 'Cereal Zucaritas 500 gr.', 'Cereal con Azucar', 24.00);


--
-- TOC entry 1799 (class 0 OID 16419)
-- Dependencies: 1511
-- Data for Name: product_by_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO product_by_category VALUES (1, 1, 1);


--
-- TOC entry 1795 (class 2606 OID 16448)
-- Dependencies: 1511 1511
-- Name: product_by_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product_by_category
    ADD CONSTRAINT product_by_category_pkey PRIMARY KEY (id_prodcat);


--
-- TOC entry 1793 (class 2606 OID 16423)
-- Dependencies: 1509 1509
-- Name: product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id_product);


--
-- TOC entry 1796 (class 2606 OID 16431)
-- Dependencies: 1507 1511
-- Name: product_by_category_id_category_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_by_category
    ADD CONSTRAINT product_by_category_id_category_fkey FOREIGN KEY (id_category) REFERENCES category(id_category);


--
-- TOC entry 1797 (class 2606 OID 16436)
-- Dependencies: 1792 1509 1511
-- Name: product_by_category_id_product_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_by_category
    ADD CONSTRAINT product_by_category_id_product_fkey FOREIGN KEY (id_product) REFERENCES product(id_product);


-- Completed on 2012-01-22 17:16:52

--
-- PostgreSQL database dump complete
--

