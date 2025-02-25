CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(40) UNIQUE NOT NULL,
  description TEXT NOT NULL,
  has_life BOOLEAN NOT NULL,
  planet_number INT,
  age_in_billions_of_years NUMERIC(6,1)
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
    name VARCHAR(40) UNIQUE NOT NULL,
    description TEXT NOT NULL,
    has_life BOOLEAN NOT NULL,
    planet_number INT,
    age_in_billions_of_years NUMERIC(6,1)
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    star_id INT NOT NULL REFERENCES star(star_id),
    name VARCHAR(40) UNIQUE NOT NULL,
    description TEXT NOT NULL,
    has_life BOOLEAN NOT NULL,
    moon_number INT,
    age_in_millions_of_years NUMERIC(6,1)
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    planet_id INT NOT NULL REFERENCES planet(planet_id),
    name VARCHAR(40) UNIQUE NOT NULL,
    description TEXT NOT NULL,
    has_water BOOLEAN NOT NULL,
    age_in_millions_of_years NUMERIC(6,1)
);

CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    planet_id INT NOT NULL REFERENCES planet(planet_id),
    name VARCHAR(40) UNIQUE NOT NULL,
    description TEXT NOT NULL
);

INSERT INTO galaxy (name, description, has_life, planet_number, age_in_billions_of_years)
VALUES
  ('Milky Way', 'Spiral galaxy with a barred structure', true, 400, 13.6),
  ('Andromeda', 'Nearest spiral galaxy to Milky Way', true, 1000, 10.0),
  ('Triangulum', 'Small spiral galaxy in Local Group', false, 40, 12.0),
  ('Sombrero', 'Unbarred spiral with a bright nucleus', false, 200, 8.0),
  ('Whirlpool', 'Interacting grand-design spiral', true, 300, 11.5),
  ('Cartwheel', 'Ring galaxy from a collision', false, 150, 9.5);

INSERT INTO star (galaxy_id, name, description, has_life, planet_number, age_in_billions_of_years)
VALUES
  (1, 'Sun', 'G-type main-sequence star', true, 8, 4.6),           -- Milky Way
  (1, 'Sirius', 'Brightest star in the night sky', false, 2, 0.2),  -- Milky Way
  (2, 'Alpheratz', 'Binary star system', true, 5, 3.0),            -- Andromeda
  (3, 'Mirach', 'Red giant star', false, 0, 7.0),                  -- Triangulum
  (4, 'M104-S1', 'Central star near Sombrero core', false, 3, 5.5), -- Sombrero
  (5, 'Whirlpool-A', 'Massive blue supergiant', true, 10, 1.5);     -- Whirlpool

INSERT INTO planet (star_id, name, description, has_life, moon_number, age_in_millions_of_years)
VALUES
  (1, 'Earth', 'Blue planet with diverse life', true, 1, 4540.0),      -- Sun
  (1, 'Mars', 'Red planet with thin atmosphere', false, 2, 4500.0),     -- Sun
  (1, 'Jupiter', 'Gas giant with strong magnetic field', false, 95, 4600.0), -- Sun
  (2, 'Sirius-B1', 'Rocky exoplanet in habitable zone', false, 0, 200.0), -- Sirius
  (2, 'Sirius-B2', 'Frozen ice world', false, 1, 150.0),                -- Sirius
  (3, 'Andro-P1', 'Temperate terrestrial planet', true, 3, 2500.0),     -- Alpheratz
  (3, 'Andro-P2', 'Hot gas giant', false, 10, 3000.0),                  -- Alpheratz
  (3, 'Andro-P3', 'Ocean world with potential life', true, 2, 2800.0),  -- Alpheratz
  (5, 'Somb-P1', 'Dusty desert planet', false, 0, 4000.0),              -- M104-S1
  (6, 'Whirl-P1', 'Lush jungle planet', true, 4, 1000.0),               -- Whirlpool-A
  (6, 'Whirl-P2', 'Volcanic planet with thick clouds', false, 1, 1200.0), -- Whirlpool-A
  (6, 'Whirl-P3', 'Ringed ice giant', false, 20, 1100.0);               -- Whirlpool-A

INSERT INTO moon (planet_id, name, description, has_water, age_in_millions_of_years)
VALUES
  (1, 'Luna', 'Earth’s natural satellite', true, 4540.0),           -- Earth
  (2, 'Phobos', 'Small, irregular moon of Mars', false, 4500.0),     -- Mars
  (2, 'Deimos', 'Tiny, distant moon of Mars', false, 4500.0),        -- Mars
  (3, 'Io', 'Volcanic moon of Jupiter', false, 4600.0),              -- Jupiter
  (3, 'Europa', 'Icy moon with subsurface ocean', true, 4600.0),     -- Jupiter
  (3, 'Ganymede', 'Largest moon in solar system', true, 4600.0),     -- Jupiter
  (3, 'Callisto', 'Heavily cratered icy moon', true, 4600.0),        -- Jupiter
  (5, 'Sirius-B2-M1', 'Frozen moon with thin ice crust', true, 150.0), -- Sirius-B2
  (6, 'Andro-M1', 'Rocky moon with atmosphere', true, 2500.0),       -- Andro-P1
  (6, 'Andro-M2', 'Barren moon with craters', false, 2500.0),        -- Andro-P1
  (6, 'Andro-M3', 'Small icy moon', true, 2500.0),                   -- Andro-P1
  (7, 'Andro-G1', 'Gas giant moon with storms', false, 3000.0),      -- Andro-P2
  (7, 'Andro-G2', ' Dusty ring companion', false, 3000.0),           -- Andro-P2
  (8, 'Andro-O1', 'Water-covered moon', true, 2800.0),               -- Andro-P3
  (8, 'Andro-O2', 'Rocky moon with ice caps', true, 2800.0),         -- Andro-P3
  (10, 'Whirl-J1', 'Tropical moon with rivers', true, 1000.0),       -- Whirl-P1
  (10, 'Whirl-J2', 'Mountainous moon', false, 1000.0),               -- Whirl-P1
  (10, 'Whirl-J3', 'Icy moon with geysers', true, 1000.0),           -- Whirl-P1
  (10, 'Whirl-J4', 'Small rocky moon', false, 1000.0),               -- Whirl-P1
  (11, 'Whirl-V1', 'Lava-covered moon', false, 1200.0);              -- Whirl-P2

INSERT INTO species (planet_id, name, description)
VALUES
  (1, 'Humans', 'Bipedal mammals with advanced technology'),        -- Earth
  (1, 'Dolphins', 'Intelligent aquatic mammals'),                   -- Earth
  (6, 'Andromedans', 'Tall, blue-skinned humanoids'),               -- Andro-P1
  (6, 'Skree', 'Flying insectoids with hive minds'),                -- Andro-P1
  (8, 'Aquaforms', 'Gelatinous water-dwelling organisms'),          -- Andro-P3
  (8, 'Coralites', 'Sentient coral-like beings'),                   -- Andro-P3
  (10, 'Whirlites', 'Plant-based life with photosynthesis'),        -- Whirl-P1
  (10, 'Fungoids', 'Fungal species with spore communication'),      -- Whirl-P1
  (1, 'Octopods', 'Eight-limbed cephalopods with tool use'),        -- Earth
  (6, 'Luminara', 'Bioluminescent telepathic beings');              -- Andro-P1
