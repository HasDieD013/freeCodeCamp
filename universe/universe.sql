--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age integer NOT NULL,
    diameter numeric(10,2),
    has_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    diameter numeric(10,2) NOT NULL,
    has_water boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer,
    distance_from_star numeric(10,2),
    has_atmosphere boolean,
    number_of_moons integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: space_object; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_object (
    space_object_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type text,
    discovery_date character varying(10) NOT NULL
);


ALTER TABLE public.space_object OWNER TO freecodecamp;

--
-- Name: space_object_space_object_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_object_space_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_object_space_object_id_seq OWNER TO freecodecamp;

--
-- Name: space_object_space_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_object_space_object_id_seq OWNED BY public.space_object.space_object_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    temperature numeric(10,2),
    mass numeric(10,2) NOT NULL,
    is_main_sequence boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: space_object space_object_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_object ALTER COLUMN space_object_id SET DEFAULT nextval('public.space_object_space_object_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 14, 100000.00, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10, 220000.00, false);
INSERT INTO public.galaxy VALUES (3, 'Magellanic Clouds', 11, 14000.00, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 10, 100000.00, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 10, 50000.00, false);
INSERT INTO public.galaxy VALUES (6, 'Triangulum Galaxy', 10, 50000.00, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Moon', 1, 3476.00, false);
INSERT INTO public.moon VALUES (22, 'Phobos', 2, 22.20, false);
INSERT INTO public.moon VALUES (23, 'Deimos', 2, 12.60, false);
INSERT INTO public.moon VALUES (24, 'Io', 5, 3643.00, false);
INSERT INTO public.moon VALUES (25, 'Europa', 5, 3122.00, true);
INSERT INTO public.moon VALUES (26, 'Ganymede', 5, 5262.00, true);
INSERT INTO public.moon VALUES (27, 'Callisto', 5, 4821.00, false);
INSERT INTO public.moon VALUES (28, 'Titan', 6, 5150.00, true);
INSERT INTO public.moon VALUES (29, 'Enceladus', 6, 504.00, true);
INSERT INTO public.moon VALUES (30, 'Mimas', 6, 397.00, false);
INSERT INTO public.moon VALUES (31, 'Dione', 6, 1123.00, false);
INSERT INTO public.moon VALUES (32, 'Tethys', 6, 1062.00, false);
INSERT INTO public.moon VALUES (33, 'Iapetus', 6, 1476.00, false);
INSERT INTO public.moon VALUES (34, 'Hyperion', 6, 410.00, false);
INSERT INTO public.moon VALUES (35, 'Titania', 7, 1578.00, false);
INSERT INTO public.moon VALUES (36, 'Oberon', 7, 1523.00, false);
INSERT INTO public.moon VALUES (37, 'Umbriel', 7, 1170.00, false);
INSERT INTO public.moon VALUES (38, 'Ariel', 7, 1158.00, false);
INSERT INTO public.moon VALUES (39, 'Miranda', 7, 472.00, false);
INSERT INTO public.moon VALUES (40, 'Triton', 8, 2707.00, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1.00, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 1.50, true, 2);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 0.70, true, 0);
INSERT INTO public.planet VALUES (4, 'Mercury', 1, 0.40, false, 0);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 5.20, true, 79);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 9.50, true, 82);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 19.20, true, 27);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 30.10, true, 14);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 4, 0.05, true, 0);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 5, 1.05, true, 0);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 6, 0.03, true, 0);
INSERT INTO public.planet VALUES (12, 'GJ 1214b', 6, 0.02, true, 0);


--
-- Data for Name: space_object; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_object VALUES (1, 'Comet Halley', 'comet', '240 BC');
INSERT INTO public.space_object VALUES (2, 'Asteroid Ceres', 'asteroid', '1801-01-01');
INSERT INTO public.space_object VALUES (3, 'Nebula Orion', 'nebula', '1610');
INSERT INTO public.space_object VALUES (4, 'Pulsar Crab', 'pulsar', '1054');
INSERT INTO public.space_object VALUES (5, 'Black Hole Sagittarius A*', 'black hole', '1974');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778.00, 1.00, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 9940.00, 2.00, true);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 3500.00, 15.00, false);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 2788.00, 0.12, true);
INSERT INTO public.star VALUES (5, 'Vega', 1, 9600.00, 2.10, true);
INSERT INTO public.star VALUES (6, 'Polaris', 1, 9200.00, 8.00, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_object_space_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_object_space_object_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: space_object space_object_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_object
    ADD CONSTRAINT space_object_name_key UNIQUE (name);


--
-- Name: space_object space_object_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_object
    ADD CONSTRAINT space_object_pkey PRIMARY KEY (space_object_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

