-- 3.3. Foreign Keys

CREATE TABLE cities (
    city        varchar(80) primary key,
    location    point
);

CREATE TABLE weather (
    city        varchar(80) references cities(city),
    temp_lo     int,
    temp_hi     int,
    prcp        real,
    date        date
);

INSERT INTO weather VALUES ('Berkley', 45, 53, 0.0, '1994-11-28');