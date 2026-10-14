--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    description text NOT NULL,
    galaxy_type character varying(30) NOT NULL
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
-- Name: galaxy_planets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_planets (
    galaxy_id integer NOT NULL,
    planet_id integer NOT NULL,
    galaxy_planets_id character varying(50) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.galaxy_planets OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(50) NOT NULL,
    moon_id integer NOT NULL,
    has_life boolean NOT NULL,
    distance_from_earth integer NOT NULL,
    radius_in_km integer NOT NULL,
    planet_id integer
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    has_life boolean NOT NULL,
    description text NOT NULL,
    is_spherical boolean NOT NULL,
    star_id integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    distance_from_earth bigint NOT NULL,
    star_type character varying(30) NOT NULL,
    description text NOT NULL,
    galaxy_id integer
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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 13600, 'Our home galaxy containing the Solar System.', 'Spiral');
INSERT INTO public.galaxy VALUES ('Andromeda', 2, 10000, 'A large galaxy neighboring the Milky Way.', 'Spiral');
INSERT INTO public.galaxy VALUES ('Triangulum', 3, 10000, 'A small spiral galaxy in the Local Group.', 'Spiral');
INSERT INTO public.galaxy VALUES ('Whirlpool', 4, 9000, 'A spiral galaxy known for its prominent arms.', 'Spiral');
INSERT INTO public.galaxy VALUES ('Sombrero', 5, 13000, 'A galaxy with a bright central bulge and dust lane.', 'Spiral');
INSERT INTO public.galaxy VALUES ('Large Magellanic Cloud', 6, 13000, 'A satellite galaxy near the Milky Way.', 'Irregular');


--
-- Data for Name: galaxy_planets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_planets VALUES (1, 1, 'milky_way_Mercury', 'Mercury');
INSERT INTO public.galaxy_planets VALUES (1, 2, 'milky_way_Venus', 'Venus');
INSERT INTO public.galaxy_planets VALUES (1, 3, 'milky_way_Earth', 'Earth');
INSERT INTO public.galaxy_planets VALUES (1, 4, 'milky_way_Mars', 'Mars');
INSERT INTO public.galaxy_planets VALUES (1, 5, 'milky_way_Jupiter', 'Jupiter');
INSERT INTO public.galaxy_planets VALUES (1, 6, 'milky_way_Saturn', 'Saturn');
INSERT INTO public.galaxy_planets VALUES (1, 7, 'milky_way_Uranus', 'Uranus');
INSERT INTO public.galaxy_planets VALUES (1, 8, 'milky_way_Neptune', 'Neptune');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 21, false, 384400, 1737, 3);
INSERT INTO public.moon VALUES ('Phobos', 22, false, 78000000, 11, 4);
INSERT INTO public.moon VALUES ('Deimos', 23, false, 78000000, 6, 4);
INSERT INTO public.moon VALUES ('Io', 24, false, 628000000, 1821, 5);
INSERT INTO public.moon VALUES ('Europa', 25, false, 628000000, 1560, 5);
INSERT INTO public.moon VALUES ('Ganymede', 26, false, 628000000, 2634, 5);
INSERT INTO public.moon VALUES ('Callisto', 27, false, 628000000, 2410, 5);
INSERT INTO public.moon VALUES ('Amalthea', 28, false, 628000000, 84, 5);
INSERT INTO public.moon VALUES ('Himalia', 29, false, 628000000, 85, 5);
INSERT INTO public.moon VALUES ('Titan', 30, false, 1270000000, 2575, 6);
INSERT INTO public.moon VALUES ('Enceladus', 31, false, 1270000000, 252, 6);
INSERT INTO public.moon VALUES ('Rhea', 32, false, 1270000000, 764, 6);
INSERT INTO public.moon VALUES ('Iapetus', 33, false, 1270000000, 735, 6);
INSERT INTO public.moon VALUES ('Dione', 34, false, 1270000000, 561, 6);
INSERT INTO public.moon VALUES ('Tethys', 35, false, 1270000000, 531, 6);
INSERT INTO public.moon VALUES ('Miranda', 36, false, 2000000000, 236, 7);
INSERT INTO public.moon VALUES ('Ariel', 37, false, 2000000000, 579, 7);
INSERT INTO public.moon VALUES ('Umbriel', 38, false, 2000000000, 585, 7);
INSERT INTO public.moon VALUES ('Titania', 39, false, 2000000000, 789, 7);
INSERT INTO public.moon VALUES ('Triton', 40, false, 2000000000, 1353, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 1, false, 'The smallest planet in the Solar System.', true, 1);
INSERT INTO public.planet VALUES ('Venus', 2, false, 'A rocky planet with a dense atmosphere.', true, 1);
INSERT INTO public.planet VALUES ('Earth', 3, true, 'Our home planet and the only world known to support life.', true, 1);
INSERT INTO public.planet VALUES ('Mars', 4, false, 'A rocky planet known as the Red Planet.', true, 1);
INSERT INTO public.planet VALUES ('Jupiter', 5, false, 'The largest planet in the Solar System.', true, 1);
INSERT INTO public.planet VALUES ('Saturn', 6, false, 'A gas giant famous for its rings.', true, 1);
INSERT INTO public.planet VALUES ('Uranus', 7, false, 'An ice giant that rotates on its side.', true, 1);
INSERT INTO public.planet VALUES ('Neptune', 8, false, 'A distant ice giant with powerful winds.', true, 1);
INSERT INTO public.planet VALUES ('Vega b', 9, false, 'A hypothetical planet orbiting Vega.', true, 4);
INSERT INTO public.planet VALUES ('Altair b', 10, false, 'A fictional example of a planet orbiting Altair.', true, 5);
INSERT INTO public.planet VALUES ('Rigel b', 11, false, 'A fictional example of a planet orbiting Rigel.', true, 6);
INSERT INTO public.planet VALUES ('Proxima b', 12, false, 'A planet candidate orbiting Proxima Centauri.', true, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1, 149600000, 'G-type', 'The star at the center of our Solar System.', 1);
INSERT INTO public.star VALUES ('Sirius', 2, 81500000000000, 'A-type', 'A bright star in the night sky.', 1);
INSERT INTO public.star VALUES ('Proxima Centauri', 3, 40100000000000, 'M-type', 'The nearest known star to the Sun.', 1);
INSERT INTO public.star VALUES ('Vega', 4, 237000000000000, 'A-type', 'A bright star in the constellation Lyra.', 2);
INSERT INTO public.star VALUES ('Altair', 5, 168000000000000, 'A-type', 'A rapidly rotating star.', 3);
INSERT INTO public.star VALUES ('Rigel', 6, 800000000000000, 'B-type', 'A luminous blue supergiant.', 4);


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
-- Name: galaxy_planets galaxy_planets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planets
    ADD CONSTRAINT galaxy_planets_name_key UNIQUE (galaxy_planets_id);


--
-- Name: galaxy_planets galaxy_planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planets
    ADD CONSTRAINT galaxy_planets_pkey PRIMARY KEY (galaxy_planets_id);


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
-- Name: galaxy_planets galaxy_planets_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planets
    ADD CONSTRAINT galaxy_planets_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy_planets galaxy_planets_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planets
    ADD CONSTRAINT galaxy_planets_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

