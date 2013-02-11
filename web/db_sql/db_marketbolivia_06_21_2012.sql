--
-- PostgreSQL database dump
--

-- Dumped from database version 9.0.1
-- Dumped by pg_dump version 9.0.1
-- Started on 2012-06-21 14:41:14

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 337 (class 2612 OID 11574)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE OR REPLACE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- TOC entry 1538 (class 1259 OID 16943)
-- Dependencies: 6
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
-- TOC entry 1907 (class 0 OID 0)
-- Dependencies: 1538
-- Name: category_id_category_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('category_id_category_seq', 1, false);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1537 (class 1259 OID 16927)
-- Dependencies: 1836 1837 1838 6
-- Name: category; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE category (
    "idCategory" integer DEFAULT nextval('category_id_category_seq'::regclass) NOT NULL,
    code character varying(3) NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(500) NOT NULL,
    "parentId" integer NOT NULL,
    "creationDate" date DEFAULT now() NOT NULL,
    "modificationDate" date,
    status bit(1) DEFAULT B'1'::"bit" NOT NULL,
    "lastModUser" bigint NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 1542 (class 1259 OID 17007)
-- Dependencies: 1843 1844 6
-- Name: category_product_mapping; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE category_product_mapping (
    "idCategory_product_mapping" bigint NOT NULL,
    "idCategory" bigint NOT NULL,
    "idProduct" bigint NOT NULL,
    "creationDate" date DEFAULT now() NOT NULL,
    "modificationDate" date,
    status bit(1) DEFAULT B'1'::"bit" NOT NULL,
    "lastModUser" bigint NOT NULL
);


ALTER TABLE public.category_product_mapping OWNER TO postgres;

--
-- TOC entry 1541 (class 1259 OID 17005)
-- Dependencies: 6 1542
-- Name: category_product_mapping_idCategory_product_mapping_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "category_product_mapping_idCategory_product_mapping_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."category_product_mapping_idCategory_product_mapping_seq" OWNER TO postgres;

--
-- TOC entry 1908 (class 0 OID 0)
-- Dependencies: 1541
-- Name: category_product_mapping_idCategory_product_mapping_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "category_product_mapping_idCategory_product_mapping_seq" OWNED BY category_product_mapping."idCategory_product_mapping";


--
-- TOC entry 1909 (class 0 OID 0)
-- Dependencies: 1541
-- Name: category_product_mapping_idCategory_product_mapping_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"category_product_mapping_idCategory_product_mapping_seq"', 1, false);


--
-- TOC entry 1532 (class 1259 OID 16849)
-- Dependencies: 1828 1829 6
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE customer (
    "idCustomer" bigint NOT NULL,
    name character varying(80) NOT NULL,
    "lastName" character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(16) NOT NULL,
    "birthDate" date NOT NULL,
    phone character varying(10),
    cellphone character varying(10),
    address character varying(150),
    city character varying(15) NOT NULL,
    zone character varying(55) NOT NULL,
    postcode character varying(10),
    "creationDate" date DEFAULT now() NOT NULL,
    "modificationDate" date,
    status bit(1) DEFAULT B'1'::"bit" NOT NULL,
    "lastModUser" bigint NOT NULL
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 1531 (class 1259 OID 16847)
-- Dependencies: 6 1532
-- Name: customer_idCustomer_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "customer_idCustomer_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."customer_idCustomer_seq" OWNER TO postgres;

--
-- TOC entry 1910 (class 0 OID 0)
-- Dependencies: 1531
-- Name: customer_idCustomer_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "customer_idCustomer_seq" OWNED BY customer."idCustomer";


--
-- TOC entry 1911 (class 0 OID 0)
-- Dependencies: 1531
-- Name: customer_idCustomer_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"customer_idCustomer_seq"', 1, false);


--
-- TOC entry 1543 (class 1259 OID 17030)
-- Dependencies: 6
-- Name: order_id_order_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE order_id_order_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_id_order_seq OWNER TO postgres;

--
-- TOC entry 1912 (class 0 OID 0)
-- Dependencies: 1543
-- Name: order_id_order_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('order_id_order_seq', 1, false);


--
-- TOC entry 1544 (class 1259 OID 17066)
-- Dependencies: 1845 1846 1847 1848 1849 1850 6
-- Name: order; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE "order" (
    "idOrder" integer DEFAULT nextval('order_id_order_seq'::regclass) NOT NULL,
    "dateOrder" date DEFAULT now() NOT NULL,
    "idStore" bigint NOT NULL,
    "idCustomer" bigint NOT NULL,
    description character varying(500) NOT NULL,
    "totalProducts" numeric(4,0),
    "orderAmount" numeric(6,2),
    delivery bit(1) DEFAULT B'0'::"bit" NOT NULL,
    "deliveryAmount" numeric(4,2),
    "totalAmount" numeric(6,2),
    "deliveryAddress" character varying(500) NOT NULL,
    "orderStatus" character(1) DEFAULT 'P'::bpchar NOT NULL,
    "creationDate" date DEFAULT now() NOT NULL,
    "modificationDate" date,
    status bit(1) DEFAULT B'1'::"bit" NOT NULL,
    "lastModUser" bigint NOT NULL
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- TOC entry 1545 (class 1259 OID 17096)
-- Dependencies: 6
-- Name: order_product_mapping_id_order_product_mapping_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE order_product_mapping_id_order_product_mapping_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_product_mapping_id_order_product_mapping_seq OWNER TO postgres;

--
-- TOC entry 1913 (class 0 OID 0)
-- Dependencies: 1545
-- Name: order_product_mapping_id_order_product_mapping_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('order_product_mapping_id_order_product_mapping_seq', 1, false);


--
-- TOC entry 1546 (class 1259 OID 17098)
-- Dependencies: 1851 1852 1853 6
-- Name: order_product_mapping; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE order_product_mapping (
    "idOrder_product_mapping" integer DEFAULT nextval('order_product_mapping_id_order_product_mapping_seq'::regclass) NOT NULL,
    "idOrder" bigint NOT NULL,
    "idProduct" bigint NOT NULL,
    "quantityProduct" numeric(4,0),
    "unitPrice" numeric(3,2),
    "partialAmount" numeric(6,2),
    "creationDate" date DEFAULT now() NOT NULL,
    "modificationDate" date,
    status bit(1) DEFAULT B'1'::"bit" NOT NULL,
    "lastModUser" bigint NOT NULL
);


ALTER TABLE public.order_product_mapping OWNER TO postgres;

--
-- TOC entry 1539 (class 1259 OID 16946)
-- Dependencies: 6
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
-- TOC entry 1914 (class 0 OID 0)
-- Dependencies: 1539
-- Name: product_id_product_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('product_id_product_seq', 1, false);


--
-- TOC entry 1540 (class 1259 OID 16948)
-- Dependencies: 1839 1840 1841 6
-- Name: product; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE product (
    "idProduct" bigint DEFAULT nextval('product_id_product_seq'::regclass) NOT NULL,
    code character varying(10) NOT NULL,
    name character varying(150) NOT NULL,
    description character varying(500),
    price numeric(6,2),
    "imgProduct" character varying(500),
    "customerRating" numeric(4,0),
    "creationDate" date DEFAULT now() NOT NULL,
    "modificationDate" date,
    status bit(1) DEFAULT B'1'::"bit" NOT NULL,
    "lastModUser" bigint NOT NULL
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 1534 (class 1259 OID 16889)
-- Dependencies: 6
-- Name: store_idStore_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "store_idStore_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."store_idStore_seq" OWNER TO postgres;

--
-- TOC entry 1915 (class 0 OID 0)
-- Dependencies: 1534
-- Name: store_idStore_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"store_idStore_seq"', 1, false);


--
-- TOC entry 1533 (class 1259 OID 16874)
-- Dependencies: 1830 1831 1832 6
-- Name: store; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE store (
    "idStore" bigint DEFAULT nextval('"store_idStore_seq"'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(500),
    "logoStore" character varying(500),
    phone character varying(10) NOT NULL,
    phone1 character varying(10),
    address character varying(150) NOT NULL,
    city character varying(15) NOT NULL,
    zone character varying(55) NOT NULL,
    "creationDate" date DEFAULT now() NOT NULL,
    "modificationDate" date,
    status bit(1) DEFAULT B'1'::"bit" NOT NULL,
    "lastModUser" bigint NOT NULL
);


ALTER TABLE public.store OWNER TO postgres;

--
-- TOC entry 1530 (class 1259 OID 16815)
-- Dependencies: 1825 1826 6
-- Name: user; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE "user" (
    "idUser" bigint NOT NULL,
    name character varying(80) NOT NULL,
    "lastName" character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(16) NOT NULL,
    "birthDate" date NOT NULL,
    phone character varying(10),
    address character varying(150),
    city character varying(15) NOT NULL,
    "creationDate" date DEFAULT now() NOT NULL,
    "modificationDate" date,
    status bit(1) DEFAULT B'1'::"bit" NOT NULL,
    "lastModUser" bigint NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 1529 (class 1259 OID 16813)
-- Dependencies: 1530 6
-- Name: user_idUser_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "user_idUser_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."user_idUser_seq" OWNER TO postgres;

--
-- TOC entry 1916 (class 0 OID 0)
-- Dependencies: 1529
-- Name: user_idUser_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "user_idUser_seq" OWNED BY "user"."idUser";


--
-- TOC entry 1917 (class 0 OID 0)
-- Dependencies: 1529
-- Name: user_idUser_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"user_idUser_seq"', 1, false);


--
-- TOC entry 1536 (class 1259 OID 16898)
-- Dependencies: 1834 1835 6
-- Name: user_store_mapping; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE user_store_mapping (
    "idUser_store_mapping" bigint NOT NULL,
    "idStore" bigint NOT NULL,
    "idUser" bigint NOT NULL,
    "creationDate" date DEFAULT now() NOT NULL,
    "modificationDate" date,
    status bit(1) DEFAULT B'1'::"bit" NOT NULL,
    "lastModUser" bigint NOT NULL
);


ALTER TABLE public.user_store_mapping OWNER TO postgres;

--
-- TOC entry 1535 (class 1259 OID 16892)
-- Dependencies: 1536 6
-- Name: user_store_mapping_idUser_store_mapping_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "user_store_mapping_idUser_store_mapping_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."user_store_mapping_idUser_store_mapping_seq" OWNER TO postgres;

--
-- TOC entry 1918 (class 0 OID 0)
-- Dependencies: 1535
-- Name: user_store_mapping_idUser_store_mapping_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "user_store_mapping_idUser_store_mapping_seq" OWNED BY user_store_mapping."idUser_store_mapping";


--
-- TOC entry 1919 (class 0 OID 0)
-- Dependencies: 1535
-- Name: user_store_mapping_idUser_store_mapping_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"user_store_mapping_idUser_store_mapping_seq"', 1, false);


--
-- TOC entry 1842 (class 2604 OID 17010)
-- Dependencies: 1542 1541 1542
-- Name: idCategory_product_mapping; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE category_product_mapping ALTER COLUMN "idCategory_product_mapping" SET DEFAULT nextval('"category_product_mapping_idCategory_product_mapping_seq"'::regclass);


--
-- TOC entry 1827 (class 2604 OID 16852)
-- Dependencies: 1532 1531 1532
-- Name: idCustomer; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE customer ALTER COLUMN "idCustomer" SET DEFAULT nextval('"customer_idCustomer_seq"'::regclass);


--
-- TOC entry 1824 (class 2604 OID 16818)
-- Dependencies: 1530 1529 1530
-- Name: idUser; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE "user" ALTER COLUMN "idUser" SET DEFAULT nextval('"user_idUser_seq"'::regclass);


--
-- TOC entry 1833 (class 2604 OID 16901)
-- Dependencies: 1536 1535 1536
-- Name: idUser_store_mapping; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE user_store_mapping ALTER COLUMN "idUser_store_mapping" SET DEFAULT nextval('"user_store_mapping_idUser_store_mapping_seq"'::regclass);


--
-- TOC entry 1897 (class 0 OID 16927)
-- Dependencies: 1537
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY category ("idCategory", code, name, description, "parentId", "creationDate", "modificationDate", status, "lastModUser") FROM stdin;
\.


--
-- TOC entry 1899 (class 0 OID 17007)
-- Dependencies: 1542
-- Data for Name: category_product_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY category_product_mapping ("idCategory_product_mapping", "idCategory", "idProduct", "creationDate", "modificationDate", status, "lastModUser") FROM stdin;
\.


--
-- TOC entry 1894 (class 0 OID 16849)
-- Dependencies: 1532
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customer ("idCustomer", name, "lastName", email, password, "birthDate", phone, cellphone, address, city, zone, postcode, "creationDate", "modificationDate", status, "lastModUser") FROM stdin;
\.


--
-- TOC entry 1900 (class 0 OID 17066)
-- Dependencies: 1544
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "order" ("idOrder", "dateOrder", "idStore", "idCustomer", description, "totalProducts", "orderAmount", delivery, "deliveryAmount", "totalAmount", "deliveryAddress", "orderStatus", "creationDate", "modificationDate", status, "lastModUser") FROM stdin;
\.


--
-- TOC entry 1901 (class 0 OID 17098)
-- Dependencies: 1546
-- Data for Name: order_product_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY order_product_mapping ("idOrder_product_mapping", "idOrder", "idProduct", "quantityProduct", "unitPrice", "partialAmount", "creationDate", "modificationDate", status, "lastModUser") FROM stdin;
\.


--
-- TOC entry 1898 (class 0 OID 16948)
-- Dependencies: 1540
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY product ("idProduct", code, name, description, price, "imgProduct", "customerRating", "creationDate", "modificationDate", status, "lastModUser") FROM stdin;
\.


--
-- TOC entry 1895 (class 0 OID 16874)
-- Dependencies: 1533
-- Data for Name: store; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY store ("idStore", name, description, "logoStore", phone, phone1, address, city, zone, "creationDate", "modificationDate", status, "lastModUser") FROM stdin;
\.


--
-- TOC entry 1893 (class 0 OID 16815)
-- Dependencies: 1530
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "user" ("idUser", name, "lastName", email, password, "birthDate", phone, address, city, "creationDate", "modificationDate", status, "lastModUser") FROM stdin;
\.


--
-- TOC entry 1896 (class 0 OID 16898)
-- Dependencies: 1536
-- Data for Name: user_store_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_store_mapping ("idUser_store_mapping", "idStore", "idUser", "creationDate", "modificationDate", status, "lastModUser") FROM stdin;
\.


--
-- TOC entry 1865 (class 2606 OID 16936)
-- Dependencies: 1537 1537
-- Name: category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY category
    ADD CONSTRAINT category_pkey PRIMARY KEY ("idCategory");


--
-- TOC entry 1871 (class 2606 OID 17014)
-- Dependencies: 1542 1542
-- Name: category_product_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY category_product_mapping
    ADD CONSTRAINT category_product_mapping_pkey PRIMARY KEY ("idCategory_product_mapping");


--
-- TOC entry 1859 (class 2606 OID 16859)
-- Dependencies: 1532 1532
-- Name: customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY ("idCustomer");


--
-- TOC entry 1873 (class 2606 OID 17078)
-- Dependencies: 1544 1544
-- Name: order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_pkey PRIMARY KEY ("idOrder");


--
-- TOC entry 1875 (class 2606 OID 17105)
-- Dependencies: 1546 1546
-- Name: order_product_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY order_product_mapping
    ADD CONSTRAINT order_product_mapping_pkey PRIMARY KEY ("idOrder_product_mapping");


--
-- TOC entry 1869 (class 2606 OID 16958)
-- Dependencies: 1540 1540
-- Name: product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY product
    ADD CONSTRAINT product_pkey PRIMARY KEY ("idProduct");


--
-- TOC entry 1861 (class 2606 OID 16883)
-- Dependencies: 1533 1533
-- Name: store_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY store
    ADD CONSTRAINT store_pkey PRIMARY KEY ("idStore");


--
-- TOC entry 1857 (class 2606 OID 16822)
-- Dependencies: 1530 1530
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY ("idUser");


--
-- TOC entry 1863 (class 2606 OID 16907)
-- Dependencies: 1536 1536
-- Name: user_store_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY user_store_mapping
    ADD CONSTRAINT user_store_mapping_pkey PRIMARY KEY ("idUser_store_mapping");


--
-- TOC entry 1866 (class 1259 OID 16942)
-- Dependencies: 1537
-- Name: fki_; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX fki_ ON category USING btree ("lastModUser");


--
-- TOC entry 1867 (class 1259 OID 16964)
-- Dependencies: 1540
-- Name: fki_2; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX fki_2 ON product USING btree ("lastModUser");


--
-- TOC entry 1854 (class 1259 OID 16865)
-- Dependencies: 1530
-- Name: fki_c_us; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX fki_c_us ON "user" USING btree ("lastModUser");


--
-- TOC entry 1855 (class 1259 OID 16828)
-- Dependencies: 1530
-- Name: fki_u_us; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX fki_u_us ON "user" USING btree ("lastModUser");


--
-- TOC entry 1882 (class 2606 OID 16937)
-- Dependencies: 1530 1537 1856
-- Name: category_lastModUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category
    ADD CONSTRAINT "category_lastModUser_fkey" FOREIGN KEY ("lastModUser") REFERENCES "user"("idUser");


--
-- TOC entry 1885 (class 2606 OID 17020)
-- Dependencies: 1864 1537 1542
-- Name: category_product_mapping_idCategory_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category_product_mapping
    ADD CONSTRAINT "category_product_mapping_idCategory_fkey" FOREIGN KEY ("idCategory") REFERENCES category("idCategory");


--
-- TOC entry 1884 (class 2606 OID 17015)
-- Dependencies: 1542 1540 1868
-- Name: category_product_mapping_idProduct_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category_product_mapping
    ADD CONSTRAINT "category_product_mapping_idProduct_fkey" FOREIGN KEY ("idProduct") REFERENCES product("idProduct");


--
-- TOC entry 1877 (class 2606 OID 16860)
-- Dependencies: 1530 1856 1532
-- Name: customer_lastModUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT "customer_lastModUser_fkey" FOREIGN KEY ("lastModUser") REFERENCES "user"("idUser");


--
-- TOC entry 1888 (class 2606 OID 17084)
-- Dependencies: 1532 1544 1858
-- Name: order_idCustomer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT "order_idCustomer_fkey" FOREIGN KEY ("idCustomer") REFERENCES customer("idCustomer");


--
-- TOC entry 1887 (class 2606 OID 17079)
-- Dependencies: 1544 1860 1533
-- Name: order_idStore_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT "order_idStore_fkey" FOREIGN KEY ("idStore") REFERENCES store("idStore");


--
-- TOC entry 1889 (class 2606 OID 17089)
-- Dependencies: 1544 1856 1530
-- Name: order_lastModUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT "order_lastModUser_fkey" FOREIGN KEY ("lastModUser") REFERENCES "user"("idUser");


--
-- TOC entry 1890 (class 2606 OID 17106)
-- Dependencies: 1544 1546 1872
-- Name: order_product_mapping_idOrder_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY order_product_mapping
    ADD CONSTRAINT "order_product_mapping_idOrder_fkey" FOREIGN KEY ("idOrder") REFERENCES "order"("idOrder");


--
-- TOC entry 1891 (class 2606 OID 17111)
-- Dependencies: 1540 1546 1868
-- Name: order_product_mapping_idProduct_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY order_product_mapping
    ADD CONSTRAINT "order_product_mapping_idProduct_fkey" FOREIGN KEY ("idProduct") REFERENCES product("idProduct");


--
-- TOC entry 1892 (class 2606 OID 17116)
-- Dependencies: 1856 1530 1546
-- Name: order_product_mapping_lastModUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY order_product_mapping
    ADD CONSTRAINT "order_product_mapping_lastModUser_fkey" FOREIGN KEY ("lastModUser") REFERENCES "user"("idUser");


--
-- TOC entry 1883 (class 2606 OID 16959)
-- Dependencies: 1856 1540 1530
-- Name: product_lastModUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product
    ADD CONSTRAINT "product_lastModUser_fkey" FOREIGN KEY ("lastModUser") REFERENCES "user"("idUser");


--
-- TOC entry 1880 (class 2606 OID 16913)
-- Dependencies: 1536 1533 1860
-- Name: store_idStore_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_store_mapping
    ADD CONSTRAINT "store_idStore_fkey" FOREIGN KEY ("idStore") REFERENCES store("idStore");


--
-- TOC entry 1881 (class 2606 OID 16918)
-- Dependencies: 1856 1530 1536
-- Name: store_idUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_store_mapping
    ADD CONSTRAINT "store_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES "user"("idUser");


--
-- TOC entry 1878 (class 2606 OID 16884)
-- Dependencies: 1530 1533 1856
-- Name: store_lastModUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY store
    ADD CONSTRAINT "store_lastModUser_fkey" FOREIGN KEY ("lastModUser") REFERENCES "user"("idUser");


--
-- TOC entry 1879 (class 2606 OID 16908)
-- Dependencies: 1856 1536 1530
-- Name: store_lastModUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_store_mapping
    ADD CONSTRAINT "store_lastModUser_fkey" FOREIGN KEY ("lastModUser") REFERENCES "user"("idUser");


--
-- TOC entry 1886 (class 2606 OID 17025)
-- Dependencies: 1530 1542 1856
-- Name: store_lastModUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category_product_mapping
    ADD CONSTRAINT "store_lastModUser_fkey" FOREIGN KEY ("lastModUser") REFERENCES "user"("idUser");


--
-- TOC entry 1876 (class 2606 OID 16823)
-- Dependencies: 1530 1530 1856
-- Name: user_lastModUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT "user_lastModUser_fkey" FOREIGN KEY ("lastModUser") REFERENCES "user"("idUser");


--
-- TOC entry 1906 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2012-06-21 14:41:14

--
-- PostgreSQL database dump complete
--

