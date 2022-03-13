--
-- PostgreSQL database dump
--

-- Dumped from database version 12.10
-- Dumped by pg_dump version 12.10

-- Started on 2022-03-13 14:31:31

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

--
-- TOC entry 3874 (class 1262 OID 16395)
-- Name: agrodash; Type: DATABASE; Schema: -; Owner: superuser
--

CREATE DATABASE agrodash WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE agrodash OWNER TO superuser;

\connect agrodash

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

--
-- TOC entry 2 (class 3079 OID 17649)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 3875 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 16427)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: superuser
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO superuser;

--
-- TOC entry 209 (class 1259 OID 16425)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: superuser
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO superuser;

--
-- TOC entry 3876 (class 0 OID 0)
-- Dependencies: 209
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superuser
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 212 (class 1259 OID 16437)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: superuser
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO superuser;

--
-- TOC entry 211 (class 1259 OID 16435)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: superuser
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO superuser;

--
-- TOC entry 3877 (class 0 OID 0)
-- Dependencies: 211
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superuser
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 208 (class 1259 OID 16419)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: superuser
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO superuser;

--
-- TOC entry 207 (class 1259 OID 16417)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: superuser
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO superuser;

--
-- TOC entry 3878 (class 0 OID 0)
-- Dependencies: 207
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superuser
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 214 (class 1259 OID 16445)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: superuser
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO superuser;

--
-- TOC entry 216 (class 1259 OID 16455)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: superuser
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO superuser;

--
-- TOC entry 215 (class 1259 OID 16453)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: superuser
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO superuser;

--
-- TOC entry 3879 (class 0 OID 0)
-- Dependencies: 215
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superuser
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 213 (class 1259 OID 16443)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: superuser
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO superuser;

--
-- TOC entry 3880 (class 0 OID 0)
-- Dependencies: 213
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superuser
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 218 (class 1259 OID 16463)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: superuser
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO superuser;

--
-- TOC entry 217 (class 1259 OID 16461)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: superuser
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO superuser;

--
-- TOC entry 3881 (class 0 OID 0)
-- Dependencies: 217
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superuser
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 223 (class 1259 OID 17637)
-- Name: authion_userfarm; Type: TABLE; Schema: public; Owner: superuser
--

CREATE TABLE public.authion_userfarm (
    id bigint NOT NULL,
    farm_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authion_userfarm OWNER TO superuser;

--
-- TOC entry 222 (class 1259 OID 17635)
-- Name: authion_userfarm_id_seq; Type: SEQUENCE; Schema: public; Owner: superuser
--

CREATE SEQUENCE public.authion_userfarm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authion_userfarm_id_seq OWNER TO superuser;

--
-- TOC entry 3882 (class 0 OID 0)
-- Dependencies: 222
-- Name: authion_userfarm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superuser
--

ALTER SEQUENCE public.authion_userfarm_id_seq OWNED BY public.authion_userfarm.id;


--
-- TOC entry 230 (class 1259 OID 18683)
-- Name: dashboard_contour; Type: TABLE; Schema: public; Owner: superuser
--

CREATE TABLE public.dashboard_contour (
    id bigint NOT NULL,
    contour_id integer NOT NULL,
    area double precision,
    crop character varying(255),
    crop_plan double precision,
    crop_real double precision,
    farm_name character varying(255) NOT NULL,
    farm_id integer NOT NULL,
    geometry public.geometry(Polygon,3857) NOT NULL
);


ALTER TABLE public.dashboard_contour OWNER TO superuser;

--
-- TOC entry 229 (class 1259 OID 18681)
-- Name: dashboard_contour_id_seq; Type: SEQUENCE; Schema: public; Owner: superuser
--

CREATE SEQUENCE public.dashboard_contour_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_contour_id_seq OWNER TO superuser;

--
-- TOC entry 3883 (class 0 OID 0)
-- Dependencies: 229
-- Name: dashboard_contour_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superuser
--

ALTER SEQUENCE public.dashboard_contour_id_seq OWNED BY public.dashboard_contour.id;


--
-- TOC entry 220 (class 1259 OID 16523)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: superuser
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO superuser;

--
-- TOC entry 219 (class 1259 OID 16521)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: superuser
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO superuser;

--
-- TOC entry 3884 (class 0 OID 0)
-- Dependencies: 219
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superuser
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 206 (class 1259 OID 16409)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: superuser
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO superuser;

--
-- TOC entry 205 (class 1259 OID 16407)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: superuser
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO superuser;

--
-- TOC entry 3885 (class 0 OID 0)
-- Dependencies: 205
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superuser
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 204 (class 1259 OID 16398)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: superuser
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO superuser;

--
-- TOC entry 203 (class 1259 OID 16396)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: superuser
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO superuser;

--
-- TOC entry 3886 (class 0 OID 0)
-- Dependencies: 203
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superuser
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 221 (class 1259 OID 16554)
-- Name: django_session; Type: TABLE; Schema: public; Owner: superuser
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO superuser;

--
-- TOC entry 3640 (class 2604 OID 16430)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 3641 (class 2604 OID 16440)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 3639 (class 2604 OID 16422)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 3642 (class 2604 OID 16448)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 3643 (class 2604 OID 16458)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 3644 (class 2604 OID 16466)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 3647 (class 2604 OID 17640)
-- Name: authion_userfarm id; Type: DEFAULT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.authion_userfarm ALTER COLUMN id SET DEFAULT nextval('public.authion_userfarm_id_seq'::regclass);


--
-- TOC entry 3649 (class 2604 OID 18686)
-- Name: dashboard_contour id; Type: DEFAULT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.dashboard_contour ALTER COLUMN id SET DEFAULT nextval('public.dashboard_contour_id_seq'::regclass);


--
-- TOC entry 3645 (class 2604 OID 16526)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 3638 (class 2604 OID 16412)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 3637 (class 2604 OID 16401)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 3853 (class 0 OID 16427)
-- Dependencies: 210
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: superuser
--



--
-- TOC entry 3855 (class 0 OID 16437)
-- Dependencies: 212
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: superuser
--



--
-- TOC entry 3851 (class 0 OID 16419)
-- Dependencies: 208
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: superuser
--

INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add FX ma''suli', 7, 'add_userfarm');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change FX ma''suli', 7, 'change_userfarm');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete FX ma''suli', 7, 'delete_userfarm');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can view FX ma''suli', 7, 'view_userfarm');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can add Kontur ', 8, 'add_contour');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can change Kontur ', 8, 'change_contour');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can delete Kontur ', 8, 'delete_contour');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can view Kontur ', 8, 'view_contour');


--
-- TOC entry 3857 (class 0 OID 16445)
-- Dependencies: 214
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: superuser
--

INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (1, 'pbkdf2_sha256$320000$4upiy2od7i7yoEcTUgSBEM$PhUPvc5K8ql5AlQbS1lymqItnZQtg4a3RuTeR7O1O8s=', '2022-03-13 01:45:05.986114+05', true, 'admin', '', '', '', true, true, '2022-03-12 16:41:14.350229+05');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (2, 'pbkdf2_sha256$320000$uF7QRCI3jkoq4SeXmi6tBB$cR/mvlZUzmsoroyUJ9dSJRhYMlnkbwNUIEiajIN9+ls=', '2022-03-13 10:57:18.810567+05', false, 'farmer1', 'Abror', 'Mamataliev', '', false, true, '2022-03-12 17:43:40.647445+05');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (4, 'pbkdf2_sha256$320000$nlY4mXvd8UCcIF7Wa1KdwP$3lXwhP98rM7TT+avp0x/RlQ+F/bvhJNt1iv5mBmNzMA=', '2022-03-13 13:57:31.326996+05', false, '+998938848100', 'Ulug''bek', 'Abdusamatov', '', false, true, '2022-03-13 13:56:48.140884+05');


--
-- TOC entry 3859 (class 0 OID 16455)
-- Dependencies: 216
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: superuser
--



--
-- TOC entry 3861 (class 0 OID 16463)
-- Dependencies: 218
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: superuser
--



--
-- TOC entry 3866 (class 0 OID 17637)
-- Dependencies: 223
-- Data for Name: authion_userfarm; Type: TABLE DATA; Schema: public; Owner: superuser
--

INSERT INTO public.authion_userfarm (id, farm_id, user_id) VALUES (2, 171, 2);
INSERT INTO public.authion_userfarm (id, farm_id, user_id) VALUES (3, 174, 4);


--
-- TOC entry 3868 (class 0 OID 18683)
-- Dependencies: 230
-- Data for Name: dashboard_contour; Type: TABLE DATA; Schema: public; Owner: superuser
--

INSERT INTO public.dashboard_contour (id, contour_id, area, crop, crop_plan, crop_real, farm_name, farm_id, geometry) VALUES (15, 1934, 1090.282605908811, NULL, NULL, NULL, 'Akbar FX', 173, '0103000020110F000001000000050000008C2FE52310605D4131A6ECCC1B475341D76F9AD720605D418626D8D02E475341E76F606D24605D41782618B72B4753419DAFDEBF13605D4124E6ABA3184753418C2FE52310605D4131A6ECCC1B475341');
INSERT INTO public.dashboard_contour (id, contour_id, area, crop, crop_plan, crop_real, farm_name, farm_id, geometry) VALUES (1, 1918, 408.8793747574091, NULL, NULL, NULL, 'Novomoskovskaya FX', 171, '0103000020110F00000100000005000000770214D3F56D5D41ADB02A58BD4E534176C2C1FAFE6D5D419CA6F2CCC24E53417F66C127016E5D4165B8551EBF4E5341CFEE81F7F76D5D41277A1FB2B94E5341770214D3F56D5D41ADB02A58BD4E5341');
INSERT INTO public.dashboard_contour (id, contour_id, area, crop, crop_plan, crop_real, farm_name, farm_id, geometry) VALUES (3, 1921, 156558.41439790465, NULL, NULL, NULL, 'Seleksiya FX', 174, '0103000020110F0000010000001B0000006D6F5A8D02715D41F3F7A42F3A56534124468F130A715D4133F0D80716565341FCA9AE9A04715D411D80C72109565341785CAFDB0A715D41443D36EFD95553412141F8DE12715D41EADD3C9FCD555341F13051461B715D41652FF197AC55534120B027CA0D715D418B1860D2A255534134DCF65C06715D410D4D0AD66E5553414C904A9627715D4174EB7D6A6B5553410789204639715D41D04018775C555341AFA3C8F981715D4149A68AF67155534125C5F82583715D41FB203B4376555341E849D7DB75715D41E9F46BB07D55534199A2E6FE6F715D4160383D06895553412CB24D748B715D410774730E9D55534142B32F6F9D715D41973F9830A45553411112B8C1A0715D4121AF3819A855534115DD6BE69E715D4134E566EFBB5553417BBE0EF970715D4188570BF1BF555341C5ADF66270715D4176359BA1E2555341284B57222E715D41EC56CBCDE355534140D3AAEE29715D419CAD18C101565341C60868C734715D411CF6804B04565341DDC5076F32715D410DEC52E215565341EE6006ED25715D414BF84441285653419392DDB11E715D41C45DB7C03D5653416D6F5A8D02715D41F3F7A42F3A565341');
INSERT INTO public.dashboard_contour (id, contour_id, area, crop, crop_plan, crop_real, farm_name, farm_id, geometry) VALUES (4, 1922, 31857.338215760887, NULL, NULL, NULL, 'Seleksiya FX', 174, '0103000020110F0000010000000A0000003DFB26FC96715D41621BC8654456534149440084A2715D41BD44620510565341EE1A66E4D6715D41975BF3CA19565341CAE468E8EF715D41B00F47043B5653413F75C8FFEB715D414F5E28BE46565341AA4D1FA4E1715D4180907080485653412F353BE6BC715D4127C2474541565341C087D1D9AD715D414F5E28BE465653413E1DC825A1715D413BA18816495653413DFB26FC96715D41621BC86544565341');
INSERT INTO public.dashboard_contour (id, contour_id, area, crop, crop_plan, crop_real, farm_name, farm_id, geometry) VALUES (5, 1923, 15541.368248791434, NULL, NULL, NULL, 'Seleksiya FX', 174, '0103000020110F00000100000006000000336B9A96FD715D41084D9F2A3D5653411343803DEA715D418E565C96225653418836EECCE9715D410CCB2B2F225653412381B2C814725D41D98E8429055653411E9EBCBD27725D411CBD17B221565341336B9A96FD715D41084D9F2A3D565341');
INSERT INTO public.dashboard_contour (id, contour_id, area, crop, crop_plan, crop_real, farm_name, farm_id, geometry) VALUES (6, 1924, 15580.518359720707, NULL, NULL, NULL, 'Seleksiya FX', 174, '0103000020110F00000100000005000000AE3971E9D6715D41ABAFE7F401565341AECD0B64EA715D41576EC4E11D565341ECF83EC113725D41EFB718A1015653411A4C114201725D41C10E55DAE4555341AE3971E9D6715D41ABAFE7F401565341');
INSERT INTO public.dashboard_contour (id, contour_id, area, crop, crop_plan, crop_real, farm_name, farm_id, geometry) VALUES (7, 1925, 10606.674537360668, NULL, NULL, NULL, 'Seleksiya FX', 174, '0103000020110F000001000000050000001CD30B9BDB715D415D58D5A4FA555341483847BBCE715D41AE34B584E655534113022527F8715D41F033CCACCA555341D0CC946504725D41EE3429E8DE5553411CD30B9BDB715D415D58D5A4FA555341');
INSERT INTO public.dashboard_contour (id, contour_id, area, crop, crop_plan, crop_real, farm_name, farm_id, geometry) VALUES (8, 1926, 900.8735578730702, NULL, NULL, NULL, 'Novomoskovskaya FX', 171, '0103000020110F0000010000000500000098CBBF37026E5D4102A3F0F2D04E53416DF6F996056E5D410D7307D9D24E534106D5450C116E5D41B3EA935FBC4E53416570306E0D6E5D413FDAAD7DBA4E534198CBBF37026E5D4102A3F0F2D04E5341');
INSERT INTO public.dashboard_contour (id, contour_id, area, crop, crop_plan, crop_real, farm_name, farm_id, geometry) VALUES (9, 1927, 1418.373300805688, NULL, NULL, NULL, 'Novomoskovskaya FX', 171, '0103000020110F000001000000080000001BA59AAD116E5D41B0751456B44E5341C4507304156E5D411344EE4CB64E5341315AF9D8236E5D41D62DEC4E9B4E534165F5EB4D256E5D41113BD4C89A4E534100738CDD226E5D41842C9F39914E5341E1D715DF1E6E5D41180D1878924E5341BB4E0880206E5D416A3E8C62994E53411BA59AAD116E5D41B0751456B44E5341');
INSERT INTO public.dashboard_contour (id, contour_id, area, crop, crop_plan, crop_real, farm_name, farm_id, geometry) VALUES (10, 1928, 6803.400910804048, NULL, NULL, NULL, 'Novomoskovskaya FX', 171, '0103000020110F0000010000000900000064015B3F7C6E5D41410AEFAD1C4F534138D63006836E5D4160A0DA1D094F53414C5906308A6E5D41D6D1A7970B4F53417B91E23A896E5D41608CA5570E4F534197561C9AAA6E5D411115A8081A4F5341DDB9A667A56E5D419681C0BD284F5341B58D1FF3976E5D41A8F8E806244F53418DA1FB29976E5D4153837923264F534164015B3F7C6E5D41410AEFAD1C4F5341');
INSERT INTO public.dashboard_contour (id, contour_id, area, crop, crop_plan, crop_real, farm_name, farm_id, geometry) VALUES (11, 1929, 3571.453224696219, NULL, NULL, NULL, 'Novomoskovskaya FX', 171, '0103000020110F000001000000050000005A846487BA6E5D41F17FF620F64E534139D449D7DA6E5D411D6AED20014F534136EBA7FFDE6E5D41FB7A3F53F64E5341029D9EFCBD6E5D41E0D2543EEB4E53415A846487BA6E5D41F17FF620F64E5341');
INSERT INTO public.dashboard_contour (id, contour_id, area, crop, crop_plan, crop_real, farm_name, farm_id, geometry) VALUES (12, 1929, 3409.539933115244, NULL, NULL, NULL, 'Novomoskovskaya FX', 171, '0103000020110F000001000000050000000E4C6DA8BE6E5D419BD40DA4E84E534154B1EFA7E06E5D4187491137F34E5341E4D3F85AE46E5D41D7B6C3D1E94E5341D72FE44EC26E5D41625C9032DE4E53410E4C6DA8BE6E5D419BD40DA4E84E5341');
INSERT INTO public.dashboard_contour (id, contour_id, area, crop, crop_plan, crop_real, farm_name, farm_id, geometry) VALUES (13, 1930, 1942.6353125348687, NULL, NULL, NULL, 'Novomoskovskaya FX', 171, '0103000020110F000001000000070000001CA3AAF2CC6E5D41C7A960F2174F534171626793D46E5D41A167D8901A4F53411DCCAF75D56E5D41FE230B2D184F534141FA63B3D86E5D4188093B39194F5341A672D911DE6E5D415AA0DA1D094F5341827A8B61D36E5D41FCFD9960054F53411CA3AAF2CC6E5D41C7A960F2174F5341');
INSERT INTO public.dashboard_contour (id, contour_id, area, crop, crop_plan, crop_real, farm_name, farm_id, geometry) VALUES (14, 1931, 532.9171774983406, NULL, NULL, NULL, 'Akbar FX', 173, '0103000020110F00000100000005000000643ACF6C1A605D419F864AF334475341873ACE9C22605D411CDC13513E475341EC8FB63626605D4164310F2F3B475341C7CFCFEA1D605D418F26CAD131475341643ACF6C1A605D419F864AF334475341');
INSERT INTO public.dashboard_contour (id, contour_id, area, crop, crop_plan, crop_real, farm_name, farm_id, geometry) VALUES (16, 1932, 8865.949741274118, NULL, NULL, NULL, 'Akbar FX', 173, '0103000020110F0000010000000C0000005B049406EE5F5D410B11673D224753416C04C4E6F15F5D41CBBBB53627475341F659E313FE5F5D41486644AF1C47534161AFA8FC02605D411311E3FB23475341ADAF806D14605D41D7100308164753410B77028023605D41EF82893C284753416A05D2E82C605D411ED87A2920475341BCAF587719605D4114661E5911475341C4CB8FD002605D41D32CAC2EFC46534129AF68AFF95F5D4129F4DDED08475341D79271D500605D41F79E8832114753415B049406EE5F5D410B11673D22475341');
INSERT INTO public.dashboard_contour (id, contour_id, area, crop, crop_plan, crop_real, farm_name, farm_id, geometry) VALUES (17, 1933, 1108.876195795834, NULL, NULL, NULL, 'Akbar FX', 173, '0103000020110F000001000000050000006D21611815605D417811292C3A475341615A5FA018605D41A29F5CFC36475341135AF17907605D41832D926C23475341913D76F703605D41579F9083264753416D21611815605D417811292C3A475341');


--
-- TOC entry 3863 (class 0 OID 16523)
-- Dependencies: 220
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: superuser
--

INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (1, '2022-03-12 17:43:41.281379+05', '2', 'farmer1', 1, '[{"added": {}}]', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (2, '2022-03-13 01:40:17.6796+05', '2', 'farmer1', 1, '[{"added": {}}]', 7, 1);


--
-- TOC entry 3849 (class 0 OID 16409)
-- Dependencies: 206
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: superuser
--

INSERT INTO public.django_content_type (id, app_label, model) VALUES (1, 'admin', 'logentry');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (2, 'auth', 'permission');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (3, 'auth', 'group');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (4, 'auth', 'user');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (6, 'sessions', 'session');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (7, 'authion', 'userfarm');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (8, 'dashboard', 'contour');


--
-- TOC entry 3847 (class 0 OID 16398)
-- Dependencies: 204
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: superuser
--

INSERT INTO public.django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2022-03-12 15:11:16.84655+05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (2, 'auth', '0001_initial', '2022-03-12 15:11:16.996133+05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (3, 'admin', '0001_initial', '2022-03-12 15:11:17.05518+05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2022-03-12 15:11:17.070097+05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2022-03-12 15:11:17.083201+05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2022-03-12 15:11:17.122093+05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2022-03-12 15:11:17.140363+05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (8, 'auth', '0003_alter_user_email_max_length', '2022-03-12 15:11:17.155255+05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (9, 'auth', '0004_alter_user_username_opts', '2022-03-12 15:11:17.168253+05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (10, 'auth', '0005_alter_user_last_login_null', '2022-03-12 15:11:17.18167+05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (11, 'auth', '0006_require_contenttypes_0002', '2022-03-12 15:11:17.185659+05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2022-03-12 15:11:17.197669+05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (13, 'auth', '0008_alter_user_username_max_length', '2022-03-12 15:11:17.220259+05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2022-03-12 15:11:17.235574+05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (15, 'auth', '0010_alter_group_name_max_length', '2022-03-12 15:11:17.25241+05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (16, 'auth', '0011_update_proxy_permissions', '2022-03-12 15:11:17.268412+05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2022-03-12 15:11:17.283442+05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (18, 'sessions', '0001_initial', '2022-03-12 15:11:17.31012+05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (19, 'authion', '0001_initial', '2022-03-12 21:39:10.956142+05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (20, 'dashboard', '0001_initial', '2022-03-13 00:23:41.05732+05');


--
-- TOC entry 3864 (class 0 OID 16554)
-- Dependencies: 221
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: superuser
--

INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('e3921lhev2oqtg6fk60xnrnalsddeg4y', '.eJxVjDkOwjAUBe_iGlmx4-WHkp4zWH-xcQAlUpxUiLtDpBTQvpl5L5VwW2vaWl7SKOqsnDr9boT8yNMO5I7TbdY8T-sykt4VfdCmr7Pk5-Vw_w4qtvqtaRBPAakUC5iJomNiikH6XIS9CASCIJ1Ftj4YBiidMzFAtkNvPKj3BzDrONE:1nTK2d:aedxAgx6RvdYfiGq_JBPxbiID-P5NcRUrQlJxZKpf4A', '2022-03-27 13:57:31.333542+05');


--
-- TOC entry 3636 (class 0 OID 17959)
-- Dependencies: 225
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: superuser
--



--
-- TOC entry 3887 (class 0 OID 0)
-- Dependencies: 209
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superuser
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3888 (class 0 OID 0)
-- Dependencies: 211
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superuser
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3889 (class 0 OID 0)
-- Dependencies: 207
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superuser
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 32, true);


--
-- TOC entry 3890 (class 0 OID 0)
-- Dependencies: 215
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superuser
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 3891 (class 0 OID 0)
-- Dependencies: 213
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superuser
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 4, true);


--
-- TOC entry 3892 (class 0 OID 0)
-- Dependencies: 217
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superuser
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3893 (class 0 OID 0)
-- Dependencies: 222
-- Name: authion_userfarm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superuser
--

SELECT pg_catalog.setval('public.authion_userfarm_id_seq', 3, true);


--
-- TOC entry 3894 (class 0 OID 0)
-- Dependencies: 229
-- Name: dashboard_contour_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superuser
--

SELECT pg_catalog.setval('public.dashboard_contour_id_seq', 17, true);


--
-- TOC entry 3895 (class 0 OID 0)
-- Dependencies: 219
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superuser
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 2, true);


--
-- TOC entry 3896 (class 0 OID 0)
-- Dependencies: 205
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superuser
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 8, true);


--
-- TOC entry 3897 (class 0 OID 0)
-- Dependencies: 203
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superuser
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);


--
-- TOC entry 3663 (class 2606 OID 16552)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 3668 (class 2606 OID 16479)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 3671 (class 2606 OID 16442)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3665 (class 2606 OID 16432)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3658 (class 2606 OID 16470)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 3660 (class 2606 OID 16424)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 3679 (class 2606 OID 16460)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 3682 (class 2606 OID 16494)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 3673 (class 2606 OID 16450)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3685 (class 2606 OID 16468)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3688 (class 2606 OID 16508)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 3676 (class 2606 OID 16546)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 3698 (class 2606 OID 17642)
-- Name: authion_userfarm authion_userfarm_pkey; Type: CONSTRAINT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.authion_userfarm
    ADD CONSTRAINT authion_userfarm_pkey PRIMARY KEY (id);


--
-- TOC entry 3704 (class 2606 OID 18691)
-- Name: dashboard_contour dashboard_contour_pkey; Type: CONSTRAINT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.dashboard_contour
    ADD CONSTRAINT dashboard_contour_pkey PRIMARY KEY (id);


--
-- TOC entry 3691 (class 2606 OID 16532)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3653 (class 2606 OID 16416)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 3655 (class 2606 OID 16414)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3651 (class 2606 OID 16406)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3695 (class 2606 OID 16561)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 3661 (class 1259 OID 16553)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: superuser
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 3666 (class 1259 OID 16490)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: superuser
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 3669 (class 1259 OID 16491)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: superuser
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 3656 (class 1259 OID 16476)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: superuser
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 3677 (class 1259 OID 16506)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: superuser
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 3680 (class 1259 OID 16505)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: superuser
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 3683 (class 1259 OID 16520)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: superuser
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 3686 (class 1259 OID 16519)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: superuser
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 3674 (class 1259 OID 16547)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: superuser
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 3699 (class 1259 OID 17648)
-- Name: authion_userfarm_user_id_4894f7a8; Type: INDEX; Schema: public; Owner: superuser
--

CREATE INDEX authion_userfarm_user_id_4894f7a8 ON public.authion_userfarm USING btree (user_id);


--
-- TOC entry 3702 (class 1259 OID 18692)
-- Name: dashboard_contour_geometry_24dc8e63_id; Type: INDEX; Schema: public; Owner: superuser
--

CREATE INDEX dashboard_contour_geometry_24dc8e63_id ON public.dashboard_contour USING gist (geometry);


--
-- TOC entry 3689 (class 1259 OID 16543)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: superuser
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 3692 (class 1259 OID 16544)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: superuser
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 3693 (class 1259 OID 16563)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: superuser
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 3696 (class 1259 OID 16562)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: superuser
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 3707 (class 2606 OID 16485)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3706 (class 2606 OID 16480)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3705 (class 2606 OID 16471)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3709 (class 2606 OID 16500)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3708 (class 2606 OID 16495)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3711 (class 2606 OID 16514)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3710 (class 2606 OID 16509)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3714 (class 2606 OID 17643)
-- Name: authion_userfarm authion_userfarm_user_id_4894f7a8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.authion_userfarm
    ADD CONSTRAINT authion_userfarm_user_id_4894f7a8_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3712 (class 2606 OID 16533)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3713 (class 2606 OID 16538)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: superuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2022-03-13 14:31:32

--
-- PostgreSQL database dump complete
--

