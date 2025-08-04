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
-- Name: belts; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.belts (
    name character varying(30) NOT NULL,
    belts_id integer NOT NULL,
    length integer,
    number_of_asteroids integer NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.belts OWNER TO freecodecamp;

--
-- Name: belts_belts_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.belts_belts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.belts_belts_id_seq OWNER TO freecodecamp;

--
-- Name: belts_belts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.belts_belts_id_seq OWNED BY public.belts.belts_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size numeric(4,2) NOT NULL,
    radiation character varying(50),
    blackhole boolean DEFAULT true,
    life boolean DEFAULT false
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
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    size numeric(4,2),
    location character varying(30),
    planet_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    size numeric(4,2),
    life boolean DEFAULT false,
    water boolean DEFAULT false,
    moons integer,
    year_of_discovery date,
    description text,
    planet_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL
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
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    composition text,
    size numeric(4,2) NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: belts belts_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.belts ALTER COLUMN belts_id SET DEFAULT nextval('public.belts_belts_id_seq'::regclass);


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
-- Data for Name: belts; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.belts VALUES ('asteroid_belt', 1, 1000, 1000, 1);
INSERT INTO public.belts VALUES ('meteroid_belt', 2, 1000, 1000, 1);
INSERT INTO public.belts VALUES ('misc_belt', 3, 1000, 1000, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milkyway', 20.10, 'gamma', true, true);
INSERT INTO public.galaxy VALUES (2, 'cocoon', 10.05, 'alpha', true, false);
INSERT INTO public.galaxy VALUES (3, 'andromeda', 5.40, 'beta', false, false);
INSERT INTO public.galaxy VALUES (4, 'comet', 20.20, 'alpha', true, false);
INSERT INTO public.galaxy VALUES (5, 'terabaap', 5.05, 'theta', false, false);
INSERT INTO public.galaxy VALUES (6, 'coma', 12.15, 'omega', true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Luna', 1, 10.10, 'up', 1);
INSERT INTO public.moon VALUES ('Phobos', 2, 11.11, 'left', 2);
INSERT INTO public.moon VALUES ('Deimos', 3, 12.21, 'right', 2);
INSERT INTO public.moon VALUES ('Europa', 4, 13.21, 'down-right', 4);
INSERT INTO public.moon VALUES ('Io', 5, 13.21, 'down-right', 4);
INSERT INTO public.moon VALUES ('Callisto', 6, 13.21, 'down-right', 4);
INSERT INTO public.moon VALUES ('Europie', 7, 13.21, 'down-right', 4);
INSERT INTO public.moon VALUES ('Carme', 8, 13.21, 'down-right', 4);
INSERT INTO public.moon VALUES ('Sponde', 9, 13.21, 'down-right', 4);
INSERT INTO public.moon VALUES ('Thebe', 10, 13.21, 'down-right', 4);
INSERT INTO public.moon VALUES ('Elara', 11, 13.21, 'down-right', 4);
INSERT INTO public.moon VALUES ('Titan', 12, 13.21, 'Anywhere', 5);
INSERT INTO public.moon VALUES ('Dione', 13, 13.21, 'Anywhere', 5);
INSERT INTO public.moon VALUES ('Mimas', 14, 13.21, 'Anywhere', 5);
INSERT INTO public.moon VALUES ('Lapetus', 15, 13.21, 'Anywhere', 5);
INSERT INTO public.moon VALUES ('Telesto', 16, 13.21, 'Anywhere', 5);
INSERT INTO public.moon VALUES ('Rhea', 17, 13.21, 'Anywhere', 5);
INSERT INTO public.moon VALUES ('Hyperion', 18, 13.21, 'Anywhere', 5);
INSERT INTO public.moon VALUES ('Miranda', 19, 13.21, 'Anywhere', 6);
INSERT INTO public.moon VALUES ('Titania', 20, 13.21, 'Anywhere', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 51.01, true, true, 1, NULL, 'Only known planet to sustain life', 1, 1, 1);
INSERT INTO public.planet VALUES ('Mars', 65.23, false, true, 2, '1610-01-01', 'Called as red planet', 2, 1, 1);
INSERT INTO public.planet VALUES ('Venus', 40.00, false, false, 0, '1610-01-01', 'planet with volcanoes', 3, 1, 1);
INSERT INTO public.planet VALUES ('Jupiter', 90.99, false, false, 95, '1610-01-01', 'biggest planet made of gases', 4, 1, 1);
INSERT INTO public.planet VALUES ('Saturn', 78.76, false, false, 146, '1610-01-01', 'Planet with rings', 5, 1, 1);
INSERT INTO public.planet VALUES ('Mercury', 27.43, false, false, 0, '1610-01-01', 'Planet closest to sun', 6, 1, 1);
INSERT INTO public.planet VALUES ('Uranus', 70.00, false, false, 28, '1610-01-01', 'Ice cold planet', 7, 1, 1);
INSERT INTO public.planet VALUES ('Neptune', 65.90, false, false, 16, '1610-01-01', 'Farthest planet from sun', 8, 1, 1);
INSERT INTO public.planet VALUES ('Exoplanet', NULL, false, false, NULL, '2024-01-01', 'Planet Outside the solar system', 13, 2, 3);
INSERT INTO public.planet VALUES ('Proxima', NULL, false, false, NULL, '2024-01-01', 'Planet Outside the solar system', 10, 2, 2);
INSERT INTO public.planet VALUES ('Kepler', NULL, false, false, NULL, '2024-01-01', 'Planet Outside the solar system', 11, 2, 2);
INSERT INTO public.planet VALUES ('Cancri', NULL, false, false, NULL, '2024-01-01', 'Planet Outside the solar system', 12, 2, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 'H, He', 86.50, 1);
INSERT INTO public.star VALUES (2, 'vega', 'H, N', 50.50, 1);
INSERT INTO public.star VALUES (3, 'caster', 'C, N, He', 60.25, 2);
INSERT INTO public.star VALUES (4, 'Delta', 'Br, I', 43.94, 2);
INSERT INTO public.star VALUES (5, 'Mira', 'Ur, S', 60.43, 4);
INSERT INTO public.star VALUES (6, 'Ras', 'P, Pb', 32.57, 4);


--
-- Name: belts_belts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.belts_belts_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: belts belts_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.belts
    ADD CONSTRAINT belts_name_key UNIQUE (name);


--
-- Name: belts belts_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.belts
    ADD CONSTRAINT belts_pkey PRIMARY KEY (belts_id);


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
-- Name: belts belts_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.belts
    ADD CONSTRAINT belts_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
