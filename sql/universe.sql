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
    name character varying(40) NOT NULL,
    description text NOT NULL,
    has_life boolean NOT NULL,
    planet_number integer,
    age_in_billions_of_years numeric(6,1)
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
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text NOT NULL,
    has_water boolean NOT NULL,
    age_in_millions_of_years numeric(6,1)
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
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text NOT NULL,
    has_life boolean NOT NULL,
    moon_number integer,
    age_in_millions_of_years numeric(6,1)
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
-- Name: species; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.species (
    species_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.species OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.species_species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.species_species_id_seq OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.species_species_id_seq OWNED BY public.species.species_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text NOT NULL,
    has_life boolean NOT NULL,
    planet_number integer,
    age_in_billions_of_years numeric(6,1)
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
-- Name: species species_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species ALTER COLUMN species_id SET DEFAULT nextval('public.species_species_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral galaxy with a barred structure', true, 400, 13.6);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy to Milky Way', true, 1000, 10.0);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Small spiral galaxy in Local Group', false, 40, 12.0);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Unbarred spiral with a bright nucleus', false, 200, 8.0);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Interacting grand-design spiral', true, 300, 11.5);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Ring galaxy from a collision', false, 150, 9.5);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Luna', 'Earth’s natural satellite', true, 4540.0);
INSERT INTO public.moon VALUES (2, 2, 'Phobos', 'Small, irregular moon of Mars', false, 4500.0);
INSERT INTO public.moon VALUES (3, 2, 'Deimos', 'Tiny, distant moon of Mars', false, 4500.0);
INSERT INTO public.moon VALUES (4, 3, 'Io', 'Volcanic moon of Jupiter', false, 4600.0);
INSERT INTO public.moon VALUES (5, 3, 'Europa', 'Icy moon with subsurface ocean', true, 4600.0);
INSERT INTO public.moon VALUES (6, 3, 'Ganymede', 'Largest moon in solar system', true, 4600.0);
INSERT INTO public.moon VALUES (7, 3, 'Callisto', 'Heavily cratered icy moon', true, 4600.0);
INSERT INTO public.moon VALUES (8, 5, 'Sirius-B2-M1', 'Frozen moon with thin ice crust', true, 150.0);
INSERT INTO public.moon VALUES (9, 6, 'Andro-M1', 'Rocky moon with atmosphere', true, 2500.0);
INSERT INTO public.moon VALUES (10, 6, 'Andro-M2', 'Barren moon with craters', false, 2500.0);
INSERT INTO public.moon VALUES (11, 6, 'Andro-M3', 'Small icy moon', true, 2500.0);
INSERT INTO public.moon VALUES (12, 7, 'Andro-G1', 'Gas giant moon with storms', false, 3000.0);
INSERT INTO public.moon VALUES (13, 7, 'Andro-G2', ' Dusty ring companion', false, 3000.0);
INSERT INTO public.moon VALUES (14, 8, 'Andro-O1', 'Water-covered moon', true, 2800.0);
INSERT INTO public.moon VALUES (15, 8, 'Andro-O2', 'Rocky moon with ice caps', true, 2800.0);
INSERT INTO public.moon VALUES (16, 10, 'Whirl-J1', 'Tropical moon with rivers', true, 1000.0);
INSERT INTO public.moon VALUES (17, 10, 'Whirl-J2', 'Mountainous moon', false, 1000.0);
INSERT INTO public.moon VALUES (18, 10, 'Whirl-J3', 'Icy moon with geysers', true, 1000.0);
INSERT INTO public.moon VALUES (19, 10, 'Whirl-J4', 'Small rocky moon', false, 1000.0);
INSERT INTO public.moon VALUES (20, 11, 'Whirl-V1', 'Lava-covered moon', false, 1200.0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', 'Blue planet with diverse life', true, 1, 4540.0);
INSERT INTO public.planet VALUES (2, 1, 'Mars', 'Red planet with thin atmosphere', false, 2, 4500.0);
INSERT INTO public.planet VALUES (3, 1, 'Jupiter', 'Gas giant with strong magnetic field', false, 95, 4600.0);
INSERT INTO public.planet VALUES (4, 2, 'Sirius-B1', 'Rocky exoplanet in habitable zone', false, 0, 200.0);
INSERT INTO public.planet VALUES (5, 2, 'Sirius-B2', 'Frozen ice world', false, 1, 150.0);
INSERT INTO public.planet VALUES (6, 3, 'Andro-P1', 'Temperate terrestrial planet', true, 3, 2500.0);
INSERT INTO public.planet VALUES (7, 3, 'Andro-P2', 'Hot gas giant', false, 10, 3000.0);
INSERT INTO public.planet VALUES (8, 3, 'Andro-P3', 'Ocean world with potential life', true, 2, 2800.0);
INSERT INTO public.planet VALUES (9, 5, 'Somb-P1', 'Dusty desert planet', false, 0, 4000.0);
INSERT INTO public.planet VALUES (10, 6, 'Whirl-P1', 'Lush jungle planet', true, 4, 1000.0);
INSERT INTO public.planet VALUES (11, 6, 'Whirl-P2', 'Volcanic planet with thick clouds', false, 1, 1200.0);
INSERT INTO public.planet VALUES (12, 6, 'Whirl-P3', 'Ringed ice giant', false, 20, 1100.0);


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.species VALUES (1, 1, 'Humans', 'Bipedal mammals with advanced technology');
INSERT INTO public.species VALUES (2, 1, 'Dolphins', 'Intelligent aquatic mammals');
INSERT INTO public.species VALUES (3, 6, 'Andromedans', 'Tall, blue-skinned humanoids');
INSERT INTO public.species VALUES (4, 6, 'Skree', 'Flying insectoids with hive minds');
INSERT INTO public.species VALUES (5, 8, 'Aquaforms', 'Gelatinous water-dwelling organisms');
INSERT INTO public.species VALUES (6, 8, 'Coralites', 'Sentient coral-like beings');
INSERT INTO public.species VALUES (7, 10, 'Whirlites', 'Plant-based life with photosynthesis');
INSERT INTO public.species VALUES (8, 10, 'Fungoids', 'Fungal species with spore communication');
INSERT INTO public.species VALUES (9, 1, 'Octopods', 'Eight-limbed cephalopods with tool use');
INSERT INTO public.species VALUES (10, 6, 'Luminara', 'Bioluminescent telepathic beings');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'G-type main-sequence star', true, 8, 4.6);
INSERT INTO public.star VALUES (2, 1, 'Sirius', 'Brightest star in the night sky', false, 2, 0.2);
INSERT INTO public.star VALUES (3, 2, 'Alpheratz', 'Binary star system', true, 5, 3.0);
INSERT INTO public.star VALUES (4, 3, 'Mirach', 'Red giant star', false, 0, 7.0);
INSERT INTO public.star VALUES (5, 4, 'M104-S1', 'Central star near Sombrero core', false, 3, 5.5);
INSERT INTO public.star VALUES (6, 5, 'Whirlpool-A', 'Massive blue supergiant', true, 10, 1.5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: species_species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.species_species_id_seq', 10, true);


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
-- Name: species species_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_name_key UNIQUE (name);


--
-- Name: species species_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (species_id);


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
-- Name: species species_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

