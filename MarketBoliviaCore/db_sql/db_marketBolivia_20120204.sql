--
-- PostgreSQL database dump
--

-- Dumped from database version 9.0.1
-- Dumped by pg_dump version 9.0.1
-- Started on 2012-02-05 00:10:49

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 320 (class 2612 OID 11574)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE OR REPLACE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1512 (class 1259 OID 16393)
-- Dependencies: 1799 1800 6
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
    "lastModUser" integer
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 1513 (class 1259 OID 16396)
-- Dependencies: 6 1512
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
-- TOC entry 1825 (class 0 OID 0)
-- Dependencies: 1513
-- Name: category_id_category_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE category_id_category_seq OWNED BY category."idCategory";


--
-- TOC entry 1826 (class 0 OID 0)
-- Dependencies: 1513
-- Name: category_id_category_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('category_id_category_seq', 1, false);


--
-- TOC entry 1518 (class 1259 OID 16449)
-- Dependencies: 6
-- Name: currency; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE currency (
    isocode character varying(3) NOT NULL,
    country character varying(40),
    name character varying(40) NOT NULL,
    symbol character varying(20),
    "decimalMark" character(1),
    "thousandsSeparator" character(1)
);


ALTER TABLE public.currency OWNER TO postgres;

--
-- TOC entry 1514 (class 1259 OID 16401)
-- Dependencies: 6
-- Name: product; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE product (
    "idProduct" bigint NOT NULL,
    code character varying(10) NOT NULL,
    name character varying(150) NOT NULL,
    description character varying(500)
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 1516 (class 1259 OID 16419)
-- Dependencies: 6
-- Name: product_by_category; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE product_by_category (
    "idCategory" integer NOT NULL,
    "idProduct" bigint NOT NULL,
    "idProdcat" bigint NOT NULL
);


ALTER TABLE public.product_by_category OWNER TO postgres;

--
-- TOC entry 1517 (class 1259 OID 16441)
-- Dependencies: 1516 6
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
-- TOC entry 1827 (class 0 OID 0)
-- Dependencies: 1517
-- Name: product_by_category_id_prodcat_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE product_by_category_id_prodcat_seq OWNED BY product_by_category."idProdcat";


--
-- TOC entry 1828 (class 0 OID 0)
-- Dependencies: 1517
-- Name: product_by_category_id_prodcat_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('product_by_category_id_prodcat_seq', 2, true);


--
-- TOC entry 1515 (class 1259 OID 16404)
-- Dependencies: 1514 6
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
-- TOC entry 1829 (class 0 OID 0)
-- Dependencies: 1515
-- Name: product_id_product_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE product_id_product_seq OWNED BY product."idProduct";


--
-- TOC entry 1830 (class 0 OID 0)
-- Dependencies: 1515
-- Name: product_id_product_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('product_id_product_seq', 2, true);


--
-- TOC entry 1520 (class 1259 OID 16461)
-- Dependencies: 1804 6
-- Name: unit; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE unit (
    "idUnit" integer NOT NULL,
    name character varying(50) NOT NULL,
    status bit(1) DEFAULT B'1'::"bit" NOT NULL
);


ALTER TABLE public.unit OWNER TO postgres;

--
-- TOC entry 1519 (class 1259 OID 16459)
-- Dependencies: 6 1520
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
-- TOC entry 1831 (class 0 OID 0)
-- Dependencies: 1519
-- Name: unit_idUnit_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "unit_idUnit_seq" OWNED BY unit."idUnit";


--
-- TOC entry 1832 (class 0 OID 0)
-- Dependencies: 1519
-- Name: unit_idUnit_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"unit_idUnit_seq"', 138, true);


--
-- TOC entry 1798 (class 2604 OID 16398)
-- Dependencies: 1513 1512
-- Name: idCategory; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE category ALTER COLUMN "idCategory" SET DEFAULT nextval('category_id_category_seq'::regclass);


--
-- TOC entry 1801 (class 2604 OID 16406)
-- Dependencies: 1515 1514
-- Name: idProduct; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE product ALTER COLUMN "idProduct" SET DEFAULT nextval('product_id_product_seq'::regclass);


--
-- TOC entry 1802 (class 2604 OID 16443)
-- Dependencies: 1517 1516
-- Name: idProdcat; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE product_by_category ALTER COLUMN "idProdcat" SET DEFAULT nextval('product_by_category_id_prodcat_seq'::regclass);


--
-- TOC entry 1803 (class 2604 OID 16464)
-- Dependencies: 1520 1519 1520
-- Name: idUnit; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE unit ALTER COLUMN "idUnit" SET DEFAULT nextval('"unit_idUnit_seq"'::regclass);


--
-- TOC entry 1815 (class 0 OID 16393)
-- Dependencies: 1512
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO category VALUES (2, 'BEB', 'Bebidas', 0, '2012-02-05', NULL, B'1', NULL);
INSERT INTO category VALUES (3, 'CAR', 'Carnes', 0, '2012-02-05', NULL, B'1', NULL);
INSERT INTO category VALUES (4, 'FRU', 'Frutas y Verduras', 0, '2012-02-05', NULL, B'1', NULL);
INSERT INTO category VALUES (5, 'PES', 'Pescados y Mariscos', 0, '2012-02-05', NULL, B'1', NULL);
INSERT INTO category VALUES (6, 'CER', 'Cereales', 1, '2012-02-05', NULL, B'1', NULL);
INSERT INTO category VALUES (1, 'ALI', 'Alimentacion', 0, '2012-02-05', NULL, B'1', NULL);


--
-- TOC entry 1818 (class 0 OID 16449)
-- Dependencies: 1518
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO currency VALUES ('AED', NULL, 'United Arab Emirates Dirham', 'د.إ', '.', ',');
INSERT INTO currency VALUES ('AFN', NULL, 'Afghan Afghani', '؋', '.', ',');
INSERT INTO currency VALUES ('ALL', NULL, 'Albanian Lek', 'L', '.', ',');
INSERT INTO currency VALUES ('AMD', NULL, 'Armenian Dram', 'դր.', '.', ',');
INSERT INTO currency VALUES ('ANG', NULL, 'Netherlands Antillean Gulden', 'ƒ', ',', '.');
INSERT INTO currency VALUES ('AOA', NULL, 'Angolan Kwanza', 'Kz', '.', ',');
INSERT INTO currency VALUES ('ARS', NULL, 'Argentine Peso', '$', ',', '.');
INSERT INTO currency VALUES ('AUD', NULL, 'Australian Dollar', '$', '.', ',');
INSERT INTO currency VALUES ('AWG', NULL, 'Aruban Florin', 'ƒ', '.', ',');
INSERT INTO currency VALUES ('AZN', NULL, 'Azerbaijani Manat', NULL, '.', ',');
INSERT INTO currency VALUES ('BAM', NULL, 'Bosnia and Herzegovina Convertible Mark', 'KM or КМ', '.', ',');
INSERT INTO currency VALUES ('BBD', NULL, 'Barbadian Dollar', '$', '.', ',');
INSERT INTO currency VALUES ('BDT', NULL, 'Bangladeshi Taka', '৳', '.', ',');
INSERT INTO currency VALUES ('BGN', NULL, 'Bulgarian Lev', 'лв', '.', ',');
INSERT INTO currency VALUES ('BHD', NULL, 'Bahraini Dinar', 'ب.د', '.', ',');
INSERT INTO currency VALUES ('BIF', NULL, 'Burundian Franc', 'Fr', '.', ',');
INSERT INTO currency VALUES ('BMD', NULL, 'Bermudian Dollar', '$', '.', ',');
INSERT INTO currency VALUES ('BND', NULL, 'Brunei Dollar', '$', '.', ',');
INSERT INTO currency VALUES ('BOB', NULL, 'Bolivian Boliviano', 'Bs.', '.', ',');
INSERT INTO currency VALUES ('BRL', NULL, 'Brazilian Real', 'R$ ', ',', '.');
INSERT INTO currency VALUES ('BSD', NULL, 'Bahamian Dollar', '$', '.', ',');
INSERT INTO currency VALUES ('BTN', NULL, 'Bhutanese Ngultrum', NULL, '.', ',');
INSERT INTO currency VALUES ('BWP', NULL, 'Botswana Pula', 'P', '.', ',');
INSERT INTO currency VALUES ('BYR', NULL, 'Belarusian Ruble', 'Br', '.', ',');
INSERT INTO currency VALUES ('BZD', NULL, 'Belize Dollar', '$', '.', ',');
INSERT INTO currency VALUES ('CAD', NULL, 'Canadian Dollar', '$', '.', ',');
INSERT INTO currency VALUES ('CDF', NULL, 'Congolese Franc', 'Fr', '.', ',');
INSERT INTO currency VALUES ('CHF', NULL, 'Swiss Franc', 'Fr', '.', ',');
INSERT INTO currency VALUES ('CLP', NULL, 'Chilean Peso', '$', ',', '.');
INSERT INTO currency VALUES ('CNY', NULL, 'Chinese Renminbi Yuan', '¥', '.', ',');
INSERT INTO currency VALUES ('COP', NULL, 'Colombian Peso', '$', ',', '.');
INSERT INTO currency VALUES ('CRC', NULL, 'Costa Rican Colón', '₡', ',', '.');
INSERT INTO currency VALUES ('CUC', NULL, 'Cuban Convertible Peso', '$', '.', ',');
INSERT INTO currency VALUES ('CUP', NULL, 'Cuban Peso', '$', '.', ',');
INSERT INTO currency VALUES ('CVE', NULL, 'Cape Verdean Escudo', '$ or Esc', '.', ',');
INSERT INTO currency VALUES ('CZK', NULL, 'Czech Koruna', 'Kč', ',', '.');
INSERT INTO currency VALUES ('DJF', NULL, 'Djiboutian Franc', 'Fr', '.', ',');
INSERT INTO currency VALUES ('DKK', NULL, 'Danish Krone', 'kr', ',', '.');
INSERT INTO currency VALUES ('DOP', NULL, 'Dominican Peso', '$', '.', ',');
INSERT INTO currency VALUES ('DZD', NULL, 'Algerian Dinar', 'د.ج', '.', ',');
INSERT INTO currency VALUES ('EEK', NULL, 'Estonian Kroon', 'KR', '.', ',');
INSERT INTO currency VALUES ('EGP', NULL, 'Egyptian Pound', '£ or ج.م', '.', ',');
INSERT INTO currency VALUES ('ERN', NULL, 'Eritrean Nakfa', 'Nfk', '.', ',');
INSERT INTO currency VALUES ('ETB', NULL, 'Ethiopian Birr', NULL, '.', ',');
INSERT INTO currency VALUES ('EUR', NULL, 'Euro', '€', ',', '.');
INSERT INTO currency VALUES ('FJD', NULL, 'Fijian Dollar', '$', '.', ',');
INSERT INTO currency VALUES ('FKP', NULL, 'Falkland Pound', '£', '.', ',');
INSERT INTO currency VALUES ('GBP', NULL, 'British Pound', '£', '.', ',');
INSERT INTO currency VALUES ('GEL', NULL, 'Georgian Lari', 'ლ', '.', ',');
INSERT INTO currency VALUES ('GHS', NULL, 'Ghanaian Cedi', '₵', '.', ',');
INSERT INTO currency VALUES ('GIP', NULL, 'Gibraltar Pound', '£', '.', ',');
INSERT INTO currency VALUES ('GMD', NULL, 'Gambian Dalasi', 'D', '.', ',');
INSERT INTO currency VALUES ('GNF', NULL, 'Guinean Franc', 'Fr', '.', ',');
INSERT INTO currency VALUES ('GTQ', NULL, 'Guatemalan Quetzal', 'Q', '.', ',');
INSERT INTO currency VALUES ('GYD', NULL, 'Guyanese Dollar', '$', '.', ',');
INSERT INTO currency VALUES ('HKD', NULL, 'Hong Kong Dollar', '$', '.', ',');
INSERT INTO currency VALUES ('HNL', NULL, 'Honduran Lempira', 'L', '.', ',');
INSERT INTO currency VALUES ('HRK', NULL, 'Croatian Kuna', 'kn', ',', '.');
INSERT INTO currency VALUES ('HTG', NULL, 'Haitian Gourde', 'G', '.', ',');
INSERT INTO currency VALUES ('HUF', NULL, 'Hungarian Forint', 'Ft', ',', '.');
INSERT INTO currency VALUES ('IDR', NULL, 'Indonesian Rupiah', 'Rp', ',', '.');
INSERT INTO currency VALUES ('ILS', NULL, 'Israeli New Sheqel', '₪', '.', ',');
INSERT INTO currency VALUES ('INR', NULL, 'Indian Rupee', '₨', '.', ',');
INSERT INTO currency VALUES ('IQD', NULL, 'Iraqi Dinar', 'ع.د', '.', ',');
INSERT INTO currency VALUES ('IRR', NULL, 'Iranian Rial', '﷼', '.', ',');
INSERT INTO currency VALUES ('ISK', NULL, 'Icelandic Króna', 'kr', ',', '.');
INSERT INTO currency VALUES ('JMD', NULL, 'Jamaican Dollar', '$', '.', ',');
INSERT INTO currency VALUES ('JOD', NULL, 'Jordanian Dinar', 'د.ا', '.', ',');
INSERT INTO currency VALUES ('JPY', NULL, 'Japanese Yen', '¥', '.', ',');
INSERT INTO currency VALUES ('KES', NULL, 'Kenyan Shilling', 'Sh', '.', ',');
INSERT INTO currency VALUES ('KGS', NULL, 'Kyrgyzstani Som', NULL, '.', ',');
INSERT INTO currency VALUES ('KHR', NULL, 'Cambodian Riel', '៛', '.', ',');
INSERT INTO currency VALUES ('KMF', NULL, 'Comorian Franc', 'Fr', '.', ',');
INSERT INTO currency VALUES ('KPW', NULL, 'North Korean Won', '₩', '.', ',');
INSERT INTO currency VALUES ('KRW', NULL, 'South Korean Won', '₩', '.', ',');
INSERT INTO currency VALUES ('KWD', NULL, 'Kuwaiti Dinar', 'د.ك', '.', ',');
INSERT INTO currency VALUES ('KYD', NULL, 'Cayman Islands Dollar', '$', '.', ',');
INSERT INTO currency VALUES ('KZT', NULL, 'Kazakhstani Tenge', '〒', '.', ',');
INSERT INTO currency VALUES ('LAK', NULL, 'Lao Kip', '₭', '.', ',');
INSERT INTO currency VALUES ('LBP', NULL, 'Lebanese Lira', 'ل.ل', '.', ',');
INSERT INTO currency VALUES ('LKR', NULL, 'Sri Lankan Rupee', '₨', '.', ',');
INSERT INTO currency VALUES ('LRD', NULL, 'Liberian Dollar', '$', '.', ',');
INSERT INTO currency VALUES ('LSL', NULL, 'Lesotho Loti', 'L', '.', ',');
INSERT INTO currency VALUES ('LTL', NULL, 'Lithuanian Litas', 'Lt', '.', ',');
INSERT INTO currency VALUES ('LVL', NULL, 'Latvian Lats', 'Ls', '.', ',');
INSERT INTO currency VALUES ('LYD', NULL, 'Libyan Dinar', 'ل.د', '.', ',');
INSERT INTO currency VALUES ('MAD', NULL, 'Moroccan Dirham', 'د.م.', '.', ',');
INSERT INTO currency VALUES ('MDL', NULL, 'Moldovan Leu', 'L', '.', ',');
INSERT INTO currency VALUES ('MGA', NULL, 'Malagasy Ariary', NULL, '.', ',');
INSERT INTO currency VALUES ('MKD', NULL, 'Macedonian Denar', 'ден', '.', ',');
INSERT INTO currency VALUES ('MMK', NULL, 'Myanmar Kyat', 'K', '.', ',');
INSERT INTO currency VALUES ('MNT', NULL, 'Mongolian Tögrög', '₮', '.', ',');
INSERT INTO currency VALUES ('MOP', NULL, 'Macanese Pataca', 'P', '.', ',');
INSERT INTO currency VALUES ('MRO', NULL, 'Mauritanian Ouguiya', 'UM', '.', ',');
INSERT INTO currency VALUES ('MUR', NULL, 'Mauritian Rupee', '₨', '.', ',');
INSERT INTO currency VALUES ('MVR', NULL, 'Maldivian Rufiyaa', 'ރ.', '.', ',');
INSERT INTO currency VALUES ('MWK', NULL, 'Malawian Kwacha', 'MK', '.', ',');
INSERT INTO currency VALUES ('MXN', NULL, 'Mexican Peso', '$', '.', ',');
INSERT INTO currency VALUES ('MYR', NULL, 'Malaysian Ringgit', 'RM', '.', ',');
INSERT INTO currency VALUES ('MZN', NULL, 'Mozambican Metical', 'MTn', ',', '.');
INSERT INTO currency VALUES ('NAD', NULL, 'Namibian Dollar', '$', '.', ',');
INSERT INTO currency VALUES ('NGN', NULL, 'Nigerian Naira', '₦', '.', ',');
INSERT INTO currency VALUES ('NIO', NULL, 'Nicaraguan Córdoba', 'C$', '.', ',');
INSERT INTO currency VALUES ('NOK', NULL, 'Norwegian Krone', 'kr', ',', '.');
INSERT INTO currency VALUES ('NPR', NULL, 'Nepalese Rupee', '₨', '.', ',');
INSERT INTO currency VALUES ('NZD', NULL, 'New Zealand Dollar', '$', '.', ',');
INSERT INTO currency VALUES ('OMR', NULL, 'Omani Rial', 'ر.ع.', '.', ',');
INSERT INTO currency VALUES ('PAB', NULL, 'Panamanian Balboa', 'B/.', '.', ',');
INSERT INTO currency VALUES ('PEN', NULL, 'Peruvian Nuevo Sol', 'S/.', '.', ',');
INSERT INTO currency VALUES ('PGK', NULL, 'Papua New Guinean Kina', 'K', '.', ',');
INSERT INTO currency VALUES ('PHP', NULL, 'Philippine Peso', '₱', '.', ',');
INSERT INTO currency VALUES ('PKR', NULL, 'Pakistani Rupee', '₨', '.', ',');
INSERT INTO currency VALUES ('PLN', NULL, 'Polish Złoty', 'zł', '.', ',');
INSERT INTO currency VALUES ('PYG', NULL, 'Paraguayan Guaraní', '₲', '.', ',');
INSERT INTO currency VALUES ('QAR', NULL, 'Qatari Riyal', 'ر.ق', '.', ',');
INSERT INTO currency VALUES ('RON', NULL, 'Romanian Leu', 'L', ',', '.');
INSERT INTO currency VALUES ('RSD', NULL, 'Serbian Dinar', 'din. or дин.', '.', ',');
INSERT INTO currency VALUES ('RUB', NULL, 'Russian Ruble', 'р.', ',', '.');
INSERT INTO currency VALUES ('RWF', NULL, 'Rwandan Franc', 'Fr', '.', ',');
INSERT INTO currency VALUES ('SAR', NULL, 'Saudi Riyal', 'ر.س', '.', ',');
INSERT INTO currency VALUES ('SBD', NULL, 'Solomon Islands Dollar', '$', '.', ',');
INSERT INTO currency VALUES ('SCR', NULL, 'Seychellois Rupee', '₨', '.', ',');
INSERT INTO currency VALUES ('SDG', NULL, 'Sudanese Pound', '£', '.', ',');
INSERT INTO currency VALUES ('SEK', NULL, 'Swedish Krona', 'kr', '.', ',');
INSERT INTO currency VALUES ('SGD', NULL, 'Singapore Dollar', '$', '.', ',');
INSERT INTO currency VALUES ('SHP', NULL, 'Saint Helenian Pound', '£', '.', ',');
INSERT INTO currency VALUES ('SKK', NULL, 'Slovak Koruna', 'Sk', '.', ',');
INSERT INTO currency VALUES ('SLL', NULL, 'Sierra Leonean Leone', 'Le', '.', ',');
INSERT INTO currency VALUES ('SOS', NULL, 'Somali Shilling', 'Sh', '.', ',');
INSERT INTO currency VALUES ('SRD', NULL, 'Surinamese Dollar', '$', '.', ',');
INSERT INTO currency VALUES ('STD', NULL, 'São Tomé and Príncipe Dobra', 'Db', '.', ',');
INSERT INTO currency VALUES ('SVC', NULL, 'Salvadoran Colón', '₡', '.', ',');
INSERT INTO currency VALUES ('SYP', NULL, 'Syrian Pound', '£ or ل.س', '.', ',');
INSERT INTO currency VALUES ('SZL', NULL, 'Swazi Lilangeni', 'L', '.', ',');
INSERT INTO currency VALUES ('THB', NULL, 'Thai Baht', '฿', '.', ',');
INSERT INTO currency VALUES ('TJS', NULL, 'Tajikistani Somoni', 'ЅМ', '.', ',');
INSERT INTO currency VALUES ('TMM', NULL, 'Turkmenistani Manat', 'm', '.', ',');
INSERT INTO currency VALUES ('TND', NULL, 'Tunisian Dinar', 'د.ت', '.', ',');
INSERT INTO currency VALUES ('TOP', NULL, 'Tongan Paʻanga', 'T$', '.', ',');
INSERT INTO currency VALUES ('TRY', NULL, 'Turkish New Lira', 'YTL', '.', ',');
INSERT INTO currency VALUES ('TTD', NULL, 'Trinidad and Tobago Dollar', '$', '.', ',');
INSERT INTO currency VALUES ('TWD', NULL, 'New Taiwan Dollar', '$', '.', ',');
INSERT INTO currency VALUES ('TZS', NULL, 'Tanzanian Shilling', 'Sh', '.', ',');
INSERT INTO currency VALUES ('UAH', NULL, 'Ukrainian Hryvnia', '₴', '.', ',');
INSERT INTO currency VALUES ('UGX', NULL, 'Ugandan Shilling', 'Sh', '.', ',');
INSERT INTO currency VALUES ('USD', NULL, 'United States Dollar', '$', '.', ',');
INSERT INTO currency VALUES ('UYU', NULL, 'Uruguayan Peso', '$', ',', '.');
INSERT INTO currency VALUES ('UZS', NULL, 'Uzbekistani Som', NULL, '.', ',');
INSERT INTO currency VALUES ('VEF', NULL, 'Venezuelan Bolívar', 'Bs F', ',', '.');
INSERT INTO currency VALUES ('VND', NULL, 'Vietnamese Đồng', '₫', ',', '.');
INSERT INTO currency VALUES ('VUV', NULL, 'Vanuatu Vatu', 'Vt', '.', ',');
INSERT INTO currency VALUES ('WST', NULL, 'Samoan Tala', 'T', '.', ',');
INSERT INTO currency VALUES ('XAF', NULL, 'Central African Cfa Franc', 'Fr', '.', ',');
INSERT INTO currency VALUES ('XCD', NULL, 'East Caribbean Dollar', '$', '.', ',');
INSERT INTO currency VALUES ('XOF', NULL, 'West African Cfa Franc', 'Fr', '.', ',');
INSERT INTO currency VALUES ('XPF', NULL, 'Cfp Franc', 'Fr', '.', ',');
INSERT INTO currency VALUES ('YER', NULL, 'Yemeni Rial', '﷼', '.', ',');
INSERT INTO currency VALUES ('ZAR', NULL, 'South African Rand', 'R', '.', ',');
INSERT INTO currency VALUES ('ZMK', NULL, 'Zambian Kwacha', 'ZK', '.', ',');
INSERT INTO currency VALUES ('ZWD', NULL, 'Zimbabwean Dollar', '$', '.', ',');


--
-- TOC entry 1816 (class 0 OID 16401)
-- Dependencies: 1514
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO product VALUES (1, 'CHOC500', 'Cereal Chocapic 500 gr.', 'Cereal con cholate');
INSERT INTO product VALUES (2, 'ZUC500', 'Cereal Zucaritas 500 gr.', 'Cereal con Azucar');


--
-- TOC entry 1817 (class 0 OID 16419)
-- Dependencies: 1516
-- Data for Name: product_by_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO product_by_category VALUES (1, 1, 1);
INSERT INTO product_by_category VALUES (6, 2, 2);


--
-- TOC entry 1819 (class 0 OID 16461)
-- Dependencies: 1520
-- Data for Name: unit; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO unit VALUES (1, 'ACRE', B'1');
INSERT INTO unit VALUES (2, 'AMPER', B'1');
INSERT INTO unit VALUES (3, 'AMPOLLETA', B'1');
INSERT INTO unit VALUES (4, 'AÑO', B'1');
INSERT INTO unit VALUES (5, 'APARATO', B'1');
INSERT INTO unit VALUES (6, 'ARTEFACTO', B'1');
INSERT INTO unit VALUES (7, 'ATADO', B'1');
INSERT INTO unit VALUES (8, 'BIMESTRE', B'1');
INSERT INTO unit VALUES (9, 'BITE', B'1');
INSERT INTO unit VALUES (10, 'BLOC', B'1');
INSERT INTO unit VALUES (11, 'BLOQUE', B'1');
INSERT INTO unit VALUES (12, 'BOLA', B'1');
INSERT INTO unit VALUES (13, 'BOLETO', B'1');
INSERT INTO unit VALUES (14, 'BOLSA', B'1');
INSERT INTO unit VALUES (15, 'BOTE', B'1');
INSERT INTO unit VALUES (16, 'BOTELLA', B'1');
INSERT INTO unit VALUES (17, 'BULTO', B'1');
INSERT INTO unit VALUES (18, 'CAJA', B'1');
INSERT INTO unit VALUES (19, 'CANICA', B'1');
INSERT INTO unit VALUES (20, 'CÁPSULA', B'1');
INSERT INTO unit VALUES (21, 'CARRETE', B'1');
INSERT INTO unit VALUES (22, 'CENTIGRAMO', B'1');
INSERT INTO unit VALUES (23, 'CENTILITRO', B'1');
INSERT INTO unit VALUES (24, 'CIENTO', B'1');
INSERT INTO unit VALUES (25, 'CILINDRO', B'1');
INSERT INTO unit VALUES (26, 'CONJUNTO', B'1');
INSERT INTO unit VALUES (27, 'CUBETA', B'1');
INSERT INTO unit VALUES (28, 'CUBO', B'1');
INSERT INTO unit VALUES (29, 'CURSO', B'1');
INSERT INTO unit VALUES (30, 'DECALITRO', B'1');
INSERT INTO unit VALUES (31, 'DECENA', B'1');
INSERT INTO unit VALUES (32, 'DECIBEL', B'1');
INSERT INTO unit VALUES (33, 'DECIGRAMO', B'1');
INSERT INTO unit VALUES (34, 'DÍA', B'1');
INSERT INTO unit VALUES (35, 'DOCENA', B'1');
INSERT INTO unit VALUES (36, 'EJEMPLAR', B'1');
INSERT INTO unit VALUES (37, 'ELEMENTO', B'1');
INSERT INTO unit VALUES (38, 'ENVASE', B'1');
INSERT INTO unit VALUES (39, 'EQUIPO', B'1');
INSERT INTO unit VALUES (40, 'ESFERA', B'1');
INSERT INTO unit VALUES (41, 'ESTUCHE', B'1');
INSERT INTO unit VALUES (42, 'ESTUDIO', B'1');
INSERT INTO unit VALUES (43, 'EVENTO', B'1');
INSERT INTO unit VALUES (44, 'FAJILLA', B'1');
INSERT INTO unit VALUES (45, 'FRASCO', B'1');
INSERT INTO unit VALUES (46, 'FRASCO AMPULA', B'1');
INSERT INTO unit VALUES (47, 'GALÓN', B'1');
INSERT INTO unit VALUES (48, 'GIGABITE', B'1');
INSERT INTO unit VALUES (49, 'GLOBO', B'1');
INSERT INTO unit VALUES (50, 'GRAMO', B'1');
INSERT INTO unit VALUES (51, 'GRUESA', B'1');
INSERT INTO unit VALUES (52, 'GUARDIA', B'1');
INSERT INTO unit VALUES (53, 'HOJA', B'1');
INSERT INTO unit VALUES (54, 'HORA', B'1');
INSERT INTO unit VALUES (55, 'HORA CLASE', B'1');
INSERT INTO unit VALUES (56, 'HORA HOMBRE', B'1');
INSERT INTO unit VALUES (57, 'JORNADA', B'1');
INSERT INTO unit VALUES (58, 'JORNAL', B'1');
INSERT INTO unit VALUES (59, 'JUEGO', B'1');
INSERT INTO unit VALUES (60, 'KILO', B'1');
INSERT INTO unit VALUES (61, 'KILOBITE', B'1');
INSERT INTO unit VALUES (62, 'KILÓMETRO', B'1');
INSERT INTO unit VALUES (63, 'KILOWATT', B'1');
INSERT INTO unit VALUES (64, 'LÁMINA', B'1');
INSERT INTO unit VALUES (65, 'LATA', B'1');
INSERT INTO unit VALUES (66, 'LIBRA', B'1');
INSERT INTO unit VALUES (67, 'LICENCIA', B'1');
INSERT INTO unit VALUES (68, 'LITRO', B'1');
INSERT INTO unit VALUES (69, 'MANOJO', B'1');
INSERT INTO unit VALUES (70, 'MANUAL', B'1');
INSERT INTO unit VALUES (71, 'MÁQUINA', B'1');
INSERT INTO unit VALUES (72, 'MEGABITE', B'1');
INSERT INTO unit VALUES (73, 'MES', B'1');
INSERT INTO unit VALUES (74, 'METRO', B'1');
INSERT INTO unit VALUES (75, 'METRO CUADRADO', B'1');
INSERT INTO unit VALUES (76, 'METRO CÚBICO', B'1');
INSERT INTO unit VALUES (77, 'MILIGRAMO', B'1');
INSERT INTO unit VALUES (78, 'MILILITRO', B'1');
INSERT INTO unit VALUES (79, 'MILLA', B'1');
INSERT INTO unit VALUES (80, 'MILLAR', B'1');
INSERT INTO unit VALUES (81, 'MODELO', B'1');
INSERT INTO unit VALUES (82, 'MODELO DE DATOS', B'1');
INSERT INTO unit VALUES (83, 'MÓDULO', B'1');
INSERT INTO unit VALUES (84, 'MONEDA', B'1');
INSERT INTO unit VALUES (85, 'ONZA', B'1');
INSERT INTO unit VALUES (86, 'PAQUETE', B'1');
INSERT INTO unit VALUES (87, 'PAR', B'1');
INSERT INTO unit VALUES (88, 'PARTIDA', B'1');
INSERT INTO unit VALUES (89, 'PASTILLA', B'1');
INSERT INTO unit VALUES (90, 'PERMISO', B'1');
INSERT INTO unit VALUES (91, 'PERNOCTA', B'1');
INSERT INTO unit VALUES (92, 'PIE', B'1');
INSERT INTO unit VALUES (93, 'PIE CUADRADO', B'1');
INSERT INTO unit VALUES (94, 'PIE CÚBICO', B'1');
INSERT INTO unit VALUES (95, 'PIEZA', B'1');
INSERT INTO unit VALUES (96, 'PÍLDORA', B'1');
INSERT INTO unit VALUES (97, 'PLIEGO', B'1');
INSERT INTO unit VALUES (98, 'POLIZA', B'1');
INSERT INTO unit VALUES (99, 'PORRÓN', B'1');
INSERT INTO unit VALUES (100, 'PRENDA', B'1');
INSERT INTO unit VALUES (101, 'PROGRAMA', B'1');
INSERT INTO unit VALUES (102, 'PROYECTO', B'1');
INSERT INTO unit VALUES (103, 'PRUEBA', B'1');
INSERT INTO unit VALUES (104, 'PULGADA', B'1');
INSERT INTO unit VALUES (105, 'PULGADA CUADRADA', B'1');
INSERT INTO unit VALUES (106, 'PULGADA CÚBICA', B'1');
INSERT INTO unit VALUES (107, 'QUINTAL', B'1');
INSERT INTO unit VALUES (108, 'RECETA', B'1');
INSERT INTO unit VALUES (109, 'RECIPIENTE', B'1');
INSERT INTO unit VALUES (110, 'ROLLO', B'1');
INSERT INTO unit VALUES (111, 'SEMANA', B'1');
INSERT INTO unit VALUES (112, 'SEMESTRE', B'1');
INSERT INTO unit VALUES (113, 'SEMOVIENTE', B'1');
INSERT INTO unit VALUES (114, 'SERVICIO', B'1');
INSERT INTO unit VALUES (115, 'SISTEMA', B'1');
INSERT INTO unit VALUES (116, 'SOBRE', B'1');
INSERT INTO unit VALUES (117, 'SOLUCIÓN', B'1');
INSERT INTO unit VALUES (118, 'SUSPENSIÓN', B'1');
INSERT INTO unit VALUES (119, 'TAMBOR', B'1');
INSERT INTO unit VALUES (120, 'TARJETA', B'1');
INSERT INTO unit VALUES (121, 'TERABITE', B'1');
INSERT INTO unit VALUES (122, 'TERCIA', B'1');
INSERT INTO unit VALUES (123, 'TIRA', B'1');
INSERT INTO unit VALUES (124, 'TONELADA', B'1');
INSERT INTO unit VALUES (125, 'TONELADA MÉTRICA', B'1');
INSERT INTO unit VALUES (126, 'TRAMO', B'1');
INSERT INTO unit VALUES (127, 'TRIMESTRE', B'1');
INSERT INTO unit VALUES (128, 'TUBO', B'1');
INSERT INTO unit VALUES (129, 'TURNO', B'1');
INSERT INTO unit VALUES (130, 'UNIDAD', B'1');
INSERT INTO unit VALUES (131, 'VALE', B'1');
INSERT INTO unit VALUES (132, 'VALIJA', B'1');
INSERT INTO unit VALUES (133, 'VEHÍCULO', B'1');
INSERT INTO unit VALUES (134, 'VIAJE', B'1');
INSERT INTO unit VALUES (135, 'WATT', B'1');
INSERT INTO unit VALUES (136, 'YARDA', B'1');
INSERT INTO unit VALUES (137, 'YARDA CUADRADA', B'1');
INSERT INTO unit VALUES (138, 'YARDA CÚBICA', B'1');


--
-- TOC entry 1806 (class 2606 OID 16400)
-- Dependencies: 1512 1512
-- Name: category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY category
    ADD CONSTRAINT category_pkey PRIMARY KEY ("idCategory");


--
-- TOC entry 1810 (class 2606 OID 16448)
-- Dependencies: 1516 1516
-- Name: product_by_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product_by_category
    ADD CONSTRAINT product_by_category_pkey PRIMARY KEY ("idProdcat");


--
-- TOC entry 1808 (class 2606 OID 16423)
-- Dependencies: 1514 1514
-- Name: product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product
    ADD CONSTRAINT product_pkey PRIMARY KEY ("idProduct");


--
-- TOC entry 1812 (class 2606 OID 16466)
-- Dependencies: 1520 1520
-- Name: unit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unit
    ADD CONSTRAINT unit_pkey PRIMARY KEY ("idUnit");


--
-- TOC entry 1813 (class 2606 OID 16431)
-- Dependencies: 1512 1805 1516
-- Name: product_by_category_id_category_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_by_category
    ADD CONSTRAINT product_by_category_id_category_fkey FOREIGN KEY ("idCategory") REFERENCES category("idCategory");


--
-- TOC entry 1814 (class 2606 OID 16436)
-- Dependencies: 1807 1516 1514
-- Name: product_by_category_id_product_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_by_category
    ADD CONSTRAINT product_by_category_id_product_fkey FOREIGN KEY ("idProduct") REFERENCES product("idProduct");


--
-- TOC entry 1824 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2012-02-05 00:10:50

--
-- PostgreSQL database dump complete
--

