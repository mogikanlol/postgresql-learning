-- 2.6. Joins Between Tables

SELECT * 
    FROM weather, cities
    WHERE city = name;

SELECT weather.city, weather.temp_lo, weather.temp_hi,
        weather.prcp, weather.date, cities.location
    FROM weather, cities
    WHERE cities.name = weather.city;

SELECT * 
    FROM weather INNER JOIN cities ON (weather.city = cities.name);

SELECT *
    FROM weather LEFT OUTER JOIN cities ON (weather.city = cities.name);

SELECT W1.city, W1.temp_lo AS low, W1.temp_hi AS high,
        W2.city, W2.temp_lo AS low, W2.temp_hi AS high
        FROM weather W1, weather W2
        WHERE W1.temp_lo < W2.temp_lo
        AND W1.temp_hi > W2.temp_hi;

SELECT *
    FROM weather w, cities c
    WHERE w.city = c.name;