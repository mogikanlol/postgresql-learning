-- 3.6. Inheritance

CREATE TABLE capitals (
    name        text,
    population  real,
    elevation   int,    -- (in ft)
    state       char(2)
);

CREATE TABLE non_capitals (
    name        text,
    population  real,
    elevation   int     -- (in ft)
);

CREATE VIEW citis AS 
    SELECT name, population, elevation FROM capitals
        UNION
    SELECT name, population, elevation FROM non_capitals;

-- Better solution

CREATE TABLE cities (
    name        text,
    population  real,
    elevation   int     -- (in ft)
);

CREATE TABLE capitals (
    state       char(2) UNIQUE NOT NULL
) INHERITS (cities);


-- Query Parent and Child
SELECT name, elevation
    FROM cities
    WHERE elevation > 500;

-- Query Only Parent
SELECT name, elevation
    FROM ONLY cities
    WHERE elevation > 500;
