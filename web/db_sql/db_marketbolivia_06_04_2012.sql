--
-- PostgreSQL database dump
--

-- Dumped from database version 9.0.1
-- Dumped by pg_dump version 9.0.1
-- Started on 2012-04-05 20:56:52

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 1897 (class 1262 OID 16392)
-- Name: marketbolivia; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE marketbolivia WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE marketbolivia OWNER TO postgres;

\connect marketbolivia

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 334 (class 2612 OID 11574)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE OR REPLACE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1526 (class 1259 OID 16393)
-- Dependencies: 1820 1821 6
-- Name: category; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE category (
    "idCategory" integer NOT NULL,
    code character varying(3) NOT NULL,
    name character varying(50) NOT NULL,
    "parentId" integer NOT NULL,
    "creationDate" date DEFAULT now() NOT NULL,
    "modificationDate" date,
    status bit(1) DEFAULT B'1'::"bit" NOT NULL,
    "lastModUser" bigint NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 1527 (class 1259 OID 16396)
-- Dependencies: 6 1526
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
-- TOC entry 1900 (class 0 OID 0)
-- Dependencies: 1527
-- Name: category_id_category_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE category_id_category_seq OWNED BY category."idCategory";


--
-- TOC entry 1901 (class 0 OID 0)
-- Dependencies: 1527
-- Name: category_id_category_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('category_id_category_seq', 1, false);


--
-- TOC entry 1531 (class 1259 OID 16449)
-- Dependencies: 1828 1829 6
-- Name: currency; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE currency (
    isocode character varying(3) NOT NULL,
    country character varying(40),
    name character varying(40) NOT NULL,
    symbol character varying(20),
    "decimalMark" character(1),
    "thousandsSeparator" character(1),
    "creationDate" date DEFAULT now() NOT NULL,
    "modificationDate" date,
    status bit(1) DEFAULT B'1'::"bit",
    "lastModUser" bigint NOT NULL
);


ALTER TABLE public.currency OWNER TO postgres;

--
-- TOC entry 1528 (class 1259 OID 16401)
-- Dependencies: 1823 1824 6
-- Name: product; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE product (
    "idProduct" bigint NOT NULL,
    code character varying(10) NOT NULL,
    name character varying(150) NOT NULL,
    description character varying(500),
    "creationDate" date DEFAULT now() NOT NULL,
    "modificationDate" date,
    status bit(1) DEFAULT B'1'::"bit" NOT NULL,
    "lastModUser" bigint NOT NULL
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 1530 (class 1259 OID 16419)
-- Dependencies: 1825 1826 6
-- Name: product_category_store_mapping; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE product_category_store_mapping (
    "idCategory" integer NOT NULL,
    "idProduct" bigint NOT NULL,
    "creationDate" date DEFAULT now() NOT NULL,
    "modificationDate" date,
    status bit(1) DEFAULT B'1'::"bit" NOT NULL,
    "lastModUser" bigint NOT NULL,
    "idProductCategoryStoreMapping" bigint NOT NULL,
    "idStore" bigint NOT NULL,
    price numeric(6,2) NOT NULL
);


ALTER TABLE public.product_category_store_mapping OWNER TO postgres;

--
-- TOC entry 1538 (class 1259 OID 16689)
-- Dependencies: 1530 6
-- Name: product_category_store_mappin_idProductCategoryStoreMapping_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "product_category_store_mappin_idProductCategoryStoreMapping_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."product_category_store_mappin_idProductCategoryStoreMapping_seq" OWNER TO postgres;

--
-- TOC entry 1902 (class 0 OID 0)
-- Dependencies: 1538
-- Name: product_category_store_mappin_idProductCategoryStoreMapping_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "product_category_store_mappin_idProductCategoryStoreMapping_seq" OWNED BY product_category_store_mapping."idProductCategoryStoreMapping";


--
-- TOC entry 1903 (class 0 OID 0)
-- Dependencies: 1538
-- Name: product_category_store_mappin_idProductCategoryStoreMapping_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"product_category_store_mappin_idProductCategoryStoreMapping_seq"', 2, true);


--
-- TOC entry 1529 (class 1259 OID 16404)
-- Dependencies: 6 1528
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
-- TOC entry 1904 (class 0 OID 0)
-- Dependencies: 1529
-- Name: product_id_product_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE product_id_product_seq OWNED BY product."idProduct";


--
-- TOC entry 1905 (class 0 OID 0)
-- Dependencies: 1529
-- Name: product_id_product_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('product_id_product_seq', 2, true);


--
-- TOC entry 1539 (class 1259 OID 16747)
-- Dependencies: 1840 1841 1842 1528 6
-- Name: product_special; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE product_special (
)
INHERITS (product);


ALTER TABLE public.product_special OWNER TO postgres;

--
-- TOC entry 1541 (class 1259 OID 16778)
-- Dependencies: 1844 1845 6
-- Name: rol; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE rol (
    "idRol" bigint NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(500),
    "creationDate" date DEFAULT now() NOT NULL,
    "modificationDate" date,
    status bit(1) DEFAULT B'1'::"bit" NOT NULL,
    "lastModUser" bigint NOT NULL
);


ALTER TABLE public.rol OWNER TO postgres;

--
-- TOC entry 1540 (class 1259 OID 16776)
-- Dependencies: 1541 6
-- Name: rol_idRol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "rol_idRol_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rol_idRol_seq" OWNER TO postgres;

--
-- TOC entry 1906 (class 0 OID 0)
-- Dependencies: 1540
-- Name: rol_idRol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "rol_idRol_seq" OWNED BY rol."idRol";


--
-- TOC entry 1907 (class 0 OID 0)
-- Dependencies: 1540
-- Name: rol_idRol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"rol_idRol_seq"', 1, false);


--
-- TOC entry 1537 (class 1259 OID 16677)
-- Dependencies: 1837 1838 1839 6
-- Name: store; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE store (
    "idStore" bigint NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(500),
    phone character varying(10) NOT NULL,
    address character varying(150) NOT NULL,
    "idGeography" bigint NOT NULL,
    "parentId" bigint DEFAULT 0 NOT NULL,
    "creationDate" date DEFAULT now() NOT NULL,
    "modificationDate" date,
    status bit(1) DEFAULT B'1'::"bit" NOT NULL,
    "lastModUser" bigint NOT NULL
);


ALTER TABLE public.store OWNER TO postgres;

--
-- TOC entry 1536 (class 1259 OID 16675)
-- Dependencies: 6 1537
-- Name: store_storeId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "store_storeId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."store_storeId_seq" OWNER TO postgres;

--
-- TOC entry 1908 (class 0 OID 0)
-- Dependencies: 1536
-- Name: store_storeId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "store_storeId_seq" OWNED BY store."idStore";


--
-- TOC entry 1909 (class 0 OID 0)
-- Dependencies: 1536
-- Name: store_storeId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"store_storeId_seq"', 1, true);


--
-- TOC entry 1533 (class 1259 OID 16461)
-- Dependencies: 1831 1832 6
-- Name: unit; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE unit (
    "idUnit" integer NOT NULL,
    name character varying(50) NOT NULL,
    status bit(1) DEFAULT B'1'::"bit" NOT NULL,
    "creationDate" date DEFAULT now() NOT NULL,
    "modificationDate" date,
    "lastModUser" bigint NOT NULL
);


ALTER TABLE public.unit OWNER TO postgres;

--
-- TOC entry 1532 (class 1259 OID 16459)
-- Dependencies: 6 1533
-- Name: unit_idUnit_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "unit_idUnit_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."unit_idUnit_seq" OWNER TO postgres;

--
-- TOC entry 1910 (class 0 OID 0)
-- Dependencies: 1532
-- Name: unit_idUnit_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "unit_idUnit_seq" OWNED BY unit."idUnit";


--
-- TOC entry 1911 (class 0 OID 0)
-- Dependencies: 1532
-- Name: unit_idUnit_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"unit_idUnit_seq"', 138, true);


--
-- TOC entry 1535 (class 1259 OID 16492)
-- Dependencies: 1834 1835 6
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
    "creationDate" date DEFAULT now() NOT NULL,
    "modificationDate" date,
    status bit(1) DEFAULT B'1'::"bit" NOT NULL,
    "lastModUser" bigint NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 1534 (class 1259 OID 16490)
-- Dependencies: 6 1535
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
-- TOC entry 1912 (class 0 OID 0)
-- Dependencies: 1534
-- Name: user_idUser_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "user_idUser_seq" OWNED BY "user"."idUser";


--
-- TOC entry 1913 (class 0 OID 0)
-- Dependencies: 1534
-- Name: user_idUser_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"user_idUser_seq"', 2, true);


--
-- TOC entry 1819 (class 2604 OID 16398)
-- Dependencies: 1527 1526
-- Name: idCategory; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE category ALTER COLUMN "idCategory" SET DEFAULT nextval('category_id_category_seq'::regclass);


--
-- TOC entry 1822 (class 2604 OID 16406)
-- Dependencies: 1529 1528
-- Name: idProduct; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE product ALTER COLUMN "idProduct" SET DEFAULT nextval('product_id_product_seq'::regclass);


--
-- TOC entry 1827 (class 2604 OID 16691)
-- Dependencies: 1538 1530
-- Name: idProductCategoryStoreMapping; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE product_category_store_mapping ALTER COLUMN "idProductCategoryStoreMapping" SET DEFAULT nextval('"product_category_store_mappin_idProductCategoryStoreMapping_seq"'::regclass);


--
-- TOC entry 1843 (class 2604 OID 16781)
-- Dependencies: 1540 1541 1541
-- Name: idRol; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE rol ALTER COLUMN "idRol" SET DEFAULT nextval('"rol_idRol_seq"'::regclass);


--
-- TOC entry 1836 (class 2604 OID 16680)
-- Dependencies: 1537 1536 1537
-- Name: idStore; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE store ALTER COLUMN "idStore" SET DEFAULT nextval('"store_storeId_seq"'::regclass);


--
-- TOC entry 1830 (class 2604 OID 16464)
-- Dependencies: 1532 1533 1533
-- Name: idUnit; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE unit ALTER COLUMN "idUnit" SET DEFAULT nextval('"unit_idUnit_seq"'::regclass);


--
-- TOC entry 1833 (class 2604 OID 16495)
-- Dependencies: 1535 1534 1535
-- Name: idUser; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE "user" ALTER COLUMN "idUser" SET DEFAULT nextval('"user_idUser_seq"'::regclass);


--
-- TOC entry 1886 (class 0 OID 16393)
-- Dependencies: 1526
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO category ("idCategory", code, name, "parentId", "creationDate", "modificationDate", status, "lastModUser") VALUES (2, 'BEB', 'Bebidas', 0, '2012-02-05', NULL, B'1', 1);
INSERT INTO category ("idCategory", code, name, "parentId", "creationDate", "modificationDate", status, "lastModUser") VALUES (3, 'CAR', 'Carnes', 0, '2012-02-05', NULL, B'1', 1);
INSERT INTO category ("idCategory", code, name, "parentId", "creationDate", "modificationDate", status, "lastModUser") VALUES (4, 'FRU', 'Frutas y Verduras', 0, '2012-02-05', NULL, B'1', 1);
INSERT INTO category ("idCategory", code, name, "parentId", "creationDate", "modificationDate", status, "lastModUser") VALUES (5, 'PES', 'Pescados y Mariscos', 0, '2012-02-05', NULL, B'1', 1);
INSERT INTO category ("idCategory", code, name, "parentId", "creationDate", "modificationDate", status, "lastModUser") VALUES (6, 'CER', 'Cereales', 1, '2012-02-05', NULL, B'1', 1);
INSERT INTO category ("idCategory", code, name, "parentId", "creationDate", "modificationDate", status, "lastModUser") VALUES (1, 'ALI', 'Alimentacion', 0, '2012-02-05', NULL, B'1', 1);


--
-- TOC entry 1889 (class 0 OID 16449)
-- Dependencies: 1531
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('AED', NULL, 'United Arab Emirates Dirham', 'Ø¯.Ø¥', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('AFN', NULL, 'Afghan Afghani', 'Ø‹', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('ALL', NULL, 'Albanian Lek', 'L', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('AMD', NULL, 'Armenian Dram', 'Õ¤Ö€.', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('ANG', NULL, 'Netherlands Antillean Gulden', 'Æ’', ',', '.', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('AOA', NULL, 'Angolan Kwanza', 'Kz', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('ARS', NULL, 'Argentine Peso', '$', ',', '.', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('AUD', NULL, 'Australian Dollar', '$', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('AWG', NULL, 'Aruban Florin', 'Æ’', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('AZN', NULL, 'Azerbaijani Manat', NULL, '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('BAM', NULL, 'Bosnia and Herzegovina Convertible Mark', 'KM or ÐšÐœ', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('BBD', NULL, 'Barbadian Dollar', '$', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('BDT', NULL, 'Bangladeshi Taka', 'à§³', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('BGN', NULL, 'Bulgarian Lev', 'Ð»Ð²', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('BHD', NULL, 'Bahraini Dinar', 'Ø¨.Ø¯', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('BIF', NULL, 'Burundian Franc', 'Fr', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('BMD', NULL, 'Bermudian Dollar', '$', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('BND', NULL, 'Brunei Dollar', '$', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('BOB', NULL, 'Bolivian Boliviano', 'Bs.', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('BRL', NULL, 'Brazilian Real', 'R$ ', ',', '.', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('BSD', NULL, 'Bahamian Dollar', '$', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('BTN', NULL, 'Bhutanese Ngultrum', NULL, '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('BWP', NULL, 'Botswana Pula', 'P', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('BYR', NULL, 'Belarusian Ruble', 'Br', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('BZD', NULL, 'Belize Dollar', '$', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('CAD', NULL, 'Canadian Dollar', '$', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('CDF', NULL, 'Congolese Franc', 'Fr', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('CHF', NULL, 'Swiss Franc', 'Fr', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('CLP', NULL, 'Chilean Peso', '$', ',', '.', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('CNY', NULL, 'Chinese Renminbi Yuan', 'Â¥', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('COP', NULL, 'Colombian Peso', '$', ',', '.', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('CRC', NULL, 'Costa Rican ColÃ³n', 'â‚¡', ',', '.', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('CUC', NULL, 'Cuban Convertible Peso', '$', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('CUP', NULL, 'Cuban Peso', '$', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('CVE', NULL, 'Cape Verdean Escudo', '$ or Esc', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('CZK', NULL, 'Czech Koruna', 'KÄ', ',', '.', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('DJF', NULL, 'Djiboutian Franc', 'Fr', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('DKK', NULL, 'Danish Krone', 'kr', ',', '.', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('DOP', NULL, 'Dominican Peso', '$', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('DZD', NULL, 'Algerian Dinar', 'Ø¯.Ø¬', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('EEK', NULL, 'Estonian Kroon', 'KR', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('EGP', NULL, 'Egyptian Pound', 'Â£ or Ø¬.Ù…', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('ERN', NULL, 'Eritrean Nakfa', 'Nfk', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('ETB', NULL, 'Ethiopian Birr', NULL, '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('EUR', NULL, 'Euro', 'â‚¬', ',', '.', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('FJD', NULL, 'Fijian Dollar', '$', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('FKP', NULL, 'Falkland Pound', 'Â£', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('GBP', NULL, 'British Pound', 'Â£', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('GEL', NULL, 'Georgian Lari', 'áƒš', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('GHS', NULL, 'Ghanaian Cedi', 'â‚µ', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('GIP', NULL, 'Gibraltar Pound', 'Â£', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('GMD', NULL, 'Gambian Dalasi', 'D', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('GNF', NULL, 'Guinean Franc', 'Fr', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('GTQ', NULL, 'Guatemalan Quetzal', 'Q', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('GYD', NULL, 'Guyanese Dollar', '$', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('HKD', NULL, 'Hong Kong Dollar', '$', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('HNL', NULL, 'Honduran Lempira', 'L', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('HRK', NULL, 'Croatian Kuna', 'kn', ',', '.', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('HTG', NULL, 'Haitian Gourde', 'G', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('HUF', NULL, 'Hungarian Forint', 'Ft', ',', '.', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('IDR', NULL, 'Indonesian Rupiah', 'Rp', ',', '.', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('ILS', NULL, 'Israeli New Sheqel', 'â‚ª', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('INR', NULL, 'Indian Rupee', 'â‚¨', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('IQD', NULL, 'Iraqi Dinar', 'Ø¹.Ø¯', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('IRR', NULL, 'Iranian Rial', 'ï·¼', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('ISK', NULL, 'Icelandic KrÃ³na', 'kr', ',', '.', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('JMD', NULL, 'Jamaican Dollar', '$', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('JOD', NULL, 'Jordanian Dinar', 'Ø¯.Ø§', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('JPY', NULL, 'Japanese Yen', 'Â¥', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('KES', NULL, 'Kenyan Shilling', 'Sh', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('KGS', NULL, 'Kyrgyzstani Som', NULL, '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('KHR', NULL, 'Cambodian Riel', 'áŸ›', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('KMF', NULL, 'Comorian Franc', 'Fr', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('KPW', NULL, 'North Korean Won', 'â‚©', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('KRW', NULL, 'South Korean Won', 'â‚©', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('KWD', NULL, 'Kuwaiti Dinar', 'Ø¯.Ùƒ', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('KYD', NULL, 'Cayman Islands Dollar', '$', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('KZT', NULL, 'Kazakhstani Tenge', 'ã€’', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('LAK', NULL, 'Lao Kip', 'â‚­', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('LBP', NULL, 'Lebanese Lira', 'Ù„.Ù„', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('LKR', NULL, 'Sri Lankan Rupee', 'â‚¨', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('LRD', NULL, 'Liberian Dollar', '$', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('LSL', NULL, 'Lesotho Loti', 'L', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('LTL', NULL, 'Lithuanian Litas', 'Lt', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('LVL', NULL, 'Latvian Lats', 'Ls', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('LYD', NULL, 'Libyan Dinar', 'Ù„.Ø¯', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('MAD', NULL, 'Moroccan Dirham', 'Ø¯.Ù….', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('MDL', NULL, 'Moldovan Leu', 'L', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('MGA', NULL, 'Malagasy Ariary', NULL, '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('MKD', NULL, 'Macedonian Denar', 'Ð´ÐµÐ½', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('MMK', NULL, 'Myanmar Kyat', 'K', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('MNT', NULL, 'Mongolian TÃ¶grÃ¶g', 'â‚®', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('MOP', NULL, 'Macanese Pataca', 'P', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('MRO', NULL, 'Mauritanian Ouguiya', 'UM', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('MUR', NULL, 'Mauritian Rupee', 'â‚¨', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('MVR', NULL, 'Maldivian Rufiyaa', 'Þƒ.', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('MWK', NULL, 'Malawian Kwacha', 'MK', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('MXN', NULL, 'Mexican Peso', '$', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('MYR', NULL, 'Malaysian Ringgit', 'RM', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('MZN', NULL, 'Mozambican Metical', 'MTn', ',', '.', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('NAD', NULL, 'Namibian Dollar', '$', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('NGN', NULL, 'Nigerian Naira', 'â‚¦', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('NIO', NULL, 'Nicaraguan CÃ³rdoba', 'C$', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('NOK', NULL, 'Norwegian Krone', 'kr', ',', '.', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('NPR', NULL, 'Nepalese Rupee', 'â‚¨', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('NZD', NULL, 'New Zealand Dollar', '$', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('OMR', NULL, 'Omani Rial', 'Ø±.Ø¹.', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('PAB', NULL, 'Panamanian Balboa', 'B/.', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('PEN', NULL, 'Peruvian Nuevo Sol', 'S/.', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('PGK', NULL, 'Papua New Guinean Kina', 'K', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('PHP', NULL, 'Philippine Peso', 'â‚±', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('PKR', NULL, 'Pakistani Rupee', 'â‚¨', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('PLN', NULL, 'Polish ZÅ‚oty', 'zÅ‚', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('PYG', NULL, 'Paraguayan GuaranÃ­', 'â‚²', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('QAR', NULL, 'Qatari Riyal', 'Ø±.Ù‚', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('RON', NULL, 'Romanian Leu', 'L', ',', '.', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('RSD', NULL, 'Serbian Dinar', 'din. or Ð´Ð¸Ð½.', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('RUB', NULL, 'Russian Ruble', 'Ñ€.', ',', '.', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('RWF', NULL, 'Rwandan Franc', 'Fr', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('SAR', NULL, 'Saudi Riyal', 'Ø±.Ø³', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('SBD', NULL, 'Solomon Islands Dollar', '$', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('SCR', NULL, 'Seychellois Rupee', 'â‚¨', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('SDG', NULL, 'Sudanese Pound', 'Â£', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('SEK', NULL, 'Swedish Krona', 'kr', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('SGD', NULL, 'Singapore Dollar', '$', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('SHP', NULL, 'Saint Helenian Pound', 'Â£', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('SKK', NULL, 'Slovak Koruna', 'Sk', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('SLL', NULL, 'Sierra Leonean Leone', 'Le', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('SOS', NULL, 'Somali Shilling', 'Sh', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('SRD', NULL, 'Surinamese Dollar', '$', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('STD', NULL, 'SÃ£o TomÃ© and PrÃ­ncipe Dobra', 'Db', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('SVC', NULL, 'Salvadoran ColÃ³n', 'â‚¡', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('SYP', NULL, 'Syrian Pound', 'Â£ or Ù„.Ø³', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('SZL', NULL, 'Swazi Lilangeni', 'L', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('THB', NULL, 'Thai Baht', 'à¸¿', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('TJS', NULL, 'Tajikistani Somoni', 'Ð…Ðœ', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('TMM', NULL, 'Turkmenistani Manat', 'm', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('TND', NULL, 'Tunisian Dinar', 'Ø¯.Øª', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('TOP', NULL, 'Tongan PaÊ»anga', 'T$', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('TRY', NULL, 'Turkish New Lira', 'YTL', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('TTD', NULL, 'Trinidad and Tobago Dollar', '$', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('TWD', NULL, 'New Taiwan Dollar', '$', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('TZS', NULL, 'Tanzanian Shilling', 'Sh', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('UAH', NULL, 'Ukrainian Hryvnia', 'â‚´', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('UGX', NULL, 'Ugandan Shilling', 'Sh', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('USD', NULL, 'United States Dollar', '$', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('UYU', NULL, 'Uruguayan Peso', '$', ',', '.', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('UZS', NULL, 'Uzbekistani Som', NULL, '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('VEF', NULL, 'Venezuelan BolÃ­var', 'Bs F', ',', '.', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('VND', NULL, 'Vietnamese Äá»“ng', 'â‚«', ',', '.', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('VUV', NULL, 'Vanuatu Vatu', 'Vt', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('WST', NULL, 'Samoan Tala', 'T', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('XAF', NULL, 'Central African Cfa Franc', 'Fr', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('XCD', NULL, 'East Caribbean Dollar', '$', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('XOF', NULL, 'West African Cfa Franc', 'Fr', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('XPF', NULL, 'Cfp Franc', 'Fr', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('YER', NULL, 'Yemeni Rial', 'ï·¼', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('ZAR', NULL, 'South African Rand', 'R', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('ZMK', NULL, 'Zambian Kwacha', 'ZK', '.', ',', '2012-02-05', NULL, B'1', 1);
INSERT INTO currency (isocode, country, name, symbol, "decimalMark", "thousandsSeparator", "creationDate", "modificationDate", status, "lastModUser") VALUES ('ZWD', NULL, 'Zimbabwean Dollar', '$', '.', ',', '2012-02-05', NULL, B'1', 1);


--
-- TOC entry 1887 (class 0 OID 16401)
-- Dependencies: 1528
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO product ("idProduct", code, name, description, "creationDate", "modificationDate", status, "lastModUser") VALUES (1, 'CHOC500', 'Cereal Chocapic 500 gr.', 'Cereal con cholate', '2012-02-06', NULL, B'1', 1);
INSERT INTO product ("idProduct", code, name, description, "creationDate", "modificationDate", status, "lastModUser") VALUES (2, 'ZUC500', 'Cereal Zucaritas 500 gr.', 'Cereal con Azucar', '2012-02-06', NULL, B'1', 1);


--
-- TOC entry 1888 (class 0 OID 16419)
-- Dependencies: 1530
-- Data for Name: product_category_store_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO product_category_store_mapping ("idCategory", "idProduct", "creationDate", "modificationDate", status, "lastModUser", "idProductCategoryStoreMapping", "idStore", price) VALUES (1, 1, '2012-02-06', NULL, B'1', 1, 1, 1, 20.00);
INSERT INTO product_category_store_mapping ("idCategory", "idProduct", "creationDate", "modificationDate", status, "lastModUser", "idProductCategoryStoreMapping", "idStore", price) VALUES (6, 2, '2012-02-06', NULL, B'1', 1, 2, 1, 20.00);


--
-- TOC entry 1893 (class 0 OID 16747)
-- Dependencies: 1539
-- Data for Name: product_special; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 1894 (class 0 OID 16778)
-- Dependencies: 1541
-- Data for Name: rol; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 1892 (class 0 OID 16677)
-- Dependencies: 1537
-- Data for Name: store; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO store ("idStore", name, description, phone, address, "idGeography", "parentId", "creationDate", "modificationDate", status, "lastModUser") VALUES (1, 'Micromercado Acha', 'Comida rapida', '4444444', 'Calle Gral. Acha', 3, 0, '2012-04-06', NULL, B'1', 1);


--
-- TOC entry 1890 (class 0 OID 16461)
-- Dependencies: 1533
-- Data for Name: unit; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (1, 'ACRE', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (2, 'AMPER', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (3, 'AMPOLLETA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (4, 'AÃ‘O', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (5, 'APARATO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (6, 'ARTEFACTO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (7, 'ATADO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (8, 'BIMESTRE', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (9, 'BITE', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (10, 'BLOC', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (11, 'BLOQUE', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (12, 'BOLA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (13, 'BOLETO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (14, 'BOLSA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (15, 'BOTE', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (16, 'BOTELLA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (17, 'BULTO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (18, 'CAJA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (19, 'CANICA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (20, 'CÃPSULA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (21, 'CARRETE', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (22, 'CENTIGRAMO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (23, 'CENTILITRO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (24, 'CIENTO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (25, 'CILINDRO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (26, 'CONJUNTO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (27, 'CUBETA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (28, 'CUBO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (29, 'CURSO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (30, 'DECALITRO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (31, 'DECENA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (32, 'DECIBEL', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (33, 'DECIGRAMO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (34, 'DÃA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (35, 'DOCENA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (36, 'EJEMPLAR', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (37, 'ELEMENTO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (38, 'ENVASE', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (39, 'EQUIPO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (40, 'ESFERA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (41, 'ESTUCHE', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (42, 'ESTUDIO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (43, 'EVENTO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (44, 'FAJILLA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (45, 'FRASCO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (46, 'FRASCO AMPULA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (47, 'GALÃ“N', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (48, 'GIGABITE', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (49, 'GLOBO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (50, 'GRAMO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (51, 'GRUESA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (52, 'GUARDIA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (53, 'HOJA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (54, 'HORA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (55, 'HORA CLASE', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (56, 'HORA HOMBRE', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (57, 'JORNADA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (58, 'JORNAL', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (59, 'JUEGO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (60, 'KILO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (61, 'KILOBITE', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (62, 'KILÃ“METRO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (63, 'KILOWATT', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (64, 'LÃMINA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (65, 'LATA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (66, 'LIBRA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (67, 'LICENCIA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (68, 'LITRO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (69, 'MANOJO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (70, 'MANUAL', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (71, 'MÃQUINA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (72, 'MEGABITE', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (73, 'MES', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (74, 'METRO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (75, 'METRO CUADRADO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (76, 'METRO CÃšBICO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (77, 'MILIGRAMO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (78, 'MILILITRO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (79, 'MILLA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (80, 'MILLAR', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (81, 'MODELO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (82, 'MODELO DE DATOS', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (83, 'MÃ“DULO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (84, 'MONEDA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (85, 'ONZA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (86, 'PAQUETE', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (87, 'PAR', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (88, 'PARTIDA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (89, 'PASTILLA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (90, 'PERMISO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (91, 'PERNOCTA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (92, 'PIE', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (93, 'PIE CUADRADO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (94, 'PIE CÃšBICO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (95, 'PIEZA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (96, 'PÃLDORA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (97, 'PLIEGO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (98, 'POLIZA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (99, 'PORRÃ“N', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (100, 'PRENDA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (101, 'PROGRAMA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (102, 'PROYECTO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (103, 'PRUEBA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (104, 'PULGADA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (105, 'PULGADA CUADRADA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (106, 'PULGADA CÃšBICA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (107, 'QUINTAL', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (108, 'RECETA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (109, 'RECIPIENTE', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (110, 'ROLLO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (111, 'SEMANA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (112, 'SEMESTRE', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (113, 'SEMOVIENTE', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (114, 'SERVICIO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (115, 'SISTEMA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (116, 'SOBRE', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (117, 'SOLUCIÃ“N', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (118, 'SUSPENSIÃ“N', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (119, 'TAMBOR', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (120, 'TARJETA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (121, 'TERABITE', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (122, 'TERCIA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (123, 'TIRA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (124, 'TONELADA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (125, 'TONELADA MÃ‰TRICA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (126, 'TRAMO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (127, 'TRIMESTRE', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (128, 'TUBO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (129, 'TURNO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (130, 'UNIDAD', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (131, 'VALE', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (132, 'VALIJA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (133, 'VEHÃCULO', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (134, 'VIAJE', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (135, 'WATT', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (136, 'YARDA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (137, 'YARDA CUADRADA', B'1', '2012-02-06', NULL, 1);
INSERT INTO unit ("idUnit", name, status, "creationDate", "modificationDate", "lastModUser") VALUES (138, 'YARDA CÃšBICA', B'1', '2012-02-06', NULL, 1);


--
-- TOC entry 1891 (class 0 OID 16492)
-- Dependencies: 1535
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "user" ("idUser", name, "lastName", email, password, "birthDate", phone, address, "creationDate", "modificationDate", status, "lastModUser") VALUES (1, 'Alvaro Rodrigo', 'Orellana Chavarria', 'tiveor@gmail.com', 'tivesillo88', '2012-02-26', '70776566', 'Pasteur 123', '2012-02-06', NULL, B'1', 1);


--
-- TOC entry 1847 (class 2606 OID 16400)
-- Dependencies: 1526 1526
-- Name: category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY category
    ADD CONSTRAINT category_pkey PRIMARY KEY ("idCategory");


--
-- TOC entry 1859 (class 2606 OID 16514)
-- Dependencies: 1531 1531
-- Name: currency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY currency
    ADD CONSTRAINT currency_pkey PRIMARY KEY (isocode);


--
-- TOC entry 1857 (class 2606 OID 16709)
-- Dependencies: 1530 1530
-- Name: product_category_store_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY product_category_store_mapping
    ADD CONSTRAINT product_category_store_mapping_pkey PRIMARY KEY ("idProductCategoryStoreMapping");


--
-- TOC entry 1851 (class 2606 OID 16423)
-- Dependencies: 1528 1528
-- Name: product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY product
    ADD CONSTRAINT product_pkey PRIMARY KEY ("idProduct");


--
-- TOC entry 1871 (class 2606 OID 16758)
-- Dependencies: 1539 1539
-- Name: product_special_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY product_special
    ADD CONSTRAINT product_special_pkey PRIMARY KEY ("idProduct");


--
-- TOC entry 1874 (class 2606 OID 16789)
-- Dependencies: 1541 1541
-- Name: rol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY ("idRol");


--
-- TOC entry 1868 (class 2606 OID 16688)
-- Dependencies: 1537 1537
-- Name: store_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY store
    ADD CONSTRAINT store_pkey PRIMARY KEY ("idStore");


--
-- TOC entry 1863 (class 2606 OID 16466)
-- Dependencies: 1533 1533
-- Name: unit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY unit
    ADD CONSTRAINT unit_pkey PRIMARY KEY ("idUnit");


--
-- TOC entry 1866 (class 2606 OID 16506)
-- Dependencies: 1535 1535
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY ("idUser");


--
-- TOC entry 1848 (class 1259 OID 16566)
-- Dependencies: 1526
-- Name: fki_; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX fki_ ON category USING btree ("lastModUser");


--
-- TOC entry 1860 (class 1259 OID 16582)
-- Dependencies: 1531
-- Name: fki_1; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX fki_1 ON currency USING btree ("lastModUser");


--
-- TOC entry 1849 (class 1259 OID 16606)
-- Dependencies: 1528
-- Name: fki_2; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX fki_2 ON product USING btree ("lastModUser");


--
-- TOC entry 1852 (class 1259 OID 16638)
-- Dependencies: 1530
-- Name: fki_3; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX fki_3 ON product_category_store_mapping USING btree ("lastModUser");


--
-- TOC entry 1861 (class 1259 OID 16674)
-- Dependencies: 1533
-- Name: fki_4; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX fki_4 ON unit USING btree ("lastModUser");


--
-- TOC entry 1853 (class 1259 OID 16720)
-- Dependencies: 1530
-- Name: fki_cat; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX fki_cat ON product_category_store_mapping USING btree ("idCategory");


--
-- TOC entry 1854 (class 1259 OID 16726)
-- Dependencies: 1530
-- Name: fki_prod; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX fki_prod ON product_category_store_mapping USING btree ("idProduct");


--
-- TOC entry 1872 (class 1259 OID 16795)
-- Dependencies: 1541
-- Name: fki_r_us; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX fki_r_us ON rol USING btree ("lastModUser");


--
-- TOC entry 1869 (class 1259 OID 16769)
-- Dependencies: 1539
-- Name: fki_special_user; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX fki_special_user ON product_special USING btree ("lastModUser");


--
-- TOC entry 1855 (class 1259 OID 16732)
-- Dependencies: 1530
-- Name: fki_store; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX fki_store ON product_category_store_mapping USING btree ("idStore");


--
-- TOC entry 1864 (class 1259 OID 16775)
-- Dependencies: 1535
-- Name: fki_u_us; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX fki_u_us ON "user" USING btree ("lastModUser");


--
-- TOC entry 1875 (class 2606 OID 16561)
-- Dependencies: 1865 1526 1535
-- Name: category_lastModUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category
    ADD CONSTRAINT "category_lastModUser_fkey" FOREIGN KEY ("lastModUser") REFERENCES "user"("idUser");


--
-- TOC entry 1881 (class 2606 OID 16577)
-- Dependencies: 1531 1535 1865
-- Name: currency_lastModUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY currency
    ADD CONSTRAINT "currency_lastModUser_fkey" FOREIGN KEY ("lastModUser") REFERENCES "user"("idUser");


--
-- TOC entry 1877 (class 2606 OID 16715)
-- Dependencies: 1530 1526 1846
-- Name: product_category_store_mapping_idCategory_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_category_store_mapping
    ADD CONSTRAINT "product_category_store_mapping_idCategory_fkey" FOREIGN KEY ("idCategory") REFERENCES category("idCategory");


--
-- TOC entry 1878 (class 2606 OID 16721)
-- Dependencies: 1850 1528 1530
-- Name: product_category_store_mapping_idProduct_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_category_store_mapping
    ADD CONSTRAINT "product_category_store_mapping_idProduct_fkey" FOREIGN KEY ("idProduct") REFERENCES product("idProduct");


--
-- TOC entry 1879 (class 2606 OID 16727)
-- Dependencies: 1867 1537 1530
-- Name: product_category_store_mapping_idStore_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_category_store_mapping
    ADD CONSTRAINT "product_category_store_mapping_idStore_fkey" FOREIGN KEY ("idStore") REFERENCES store("idStore");


--
-- TOC entry 1880 (class 2606 OID 16733)
-- Dependencies: 1530 1865 1535
-- Name: product_category_store_mapping_lastModUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_category_store_mapping
    ADD CONSTRAINT "product_category_store_mapping_lastModUser_fkey" FOREIGN KEY ("lastModUser") REFERENCES "user"("idUser");


--
-- TOC entry 1876 (class 2606 OID 16601)
-- Dependencies: 1535 1865 1528
-- Name: product_lastModUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product
    ADD CONSTRAINT "product_lastModUser_fkey" FOREIGN KEY ("lastModUser") REFERENCES "user"("idUser");


--
-- TOC entry 1884 (class 2606 OID 16764)
-- Dependencies: 1535 1865 1539
-- Name: product_special_lastModUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_special
    ADD CONSTRAINT "product_special_lastModUser_fkey" FOREIGN KEY ("lastModUser") REFERENCES "user"("idUser");


--
-- TOC entry 1885 (class 2606 OID 16790)
-- Dependencies: 1865 1535 1541
-- Name: rol_lastModUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rol
    ADD CONSTRAINT "rol_lastModUser_fkey" FOREIGN KEY ("lastModUser") REFERENCES "user"("idUser");


--
-- TOC entry 1882 (class 2606 OID 16669)
-- Dependencies: 1533 1865 1535
-- Name: unit_lastModUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unit
    ADD CONSTRAINT "unit_lastModUser_fkey" FOREIGN KEY ("lastModUser") REFERENCES "user"("idUser");


--
-- TOC entry 1883 (class 2606 OID 16770)
-- Dependencies: 1535 1535 1865
-- Name: user_lastModUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT "user_lastModUser_fkey" FOREIGN KEY ("lastModUser") REFERENCES "user"("idUser");


--
-- TOC entry 1899 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2012-04-05 20:56:52

--
-- PostgreSQL database dump complete
--

