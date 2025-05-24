create database Assignment1;
use Assignment1;
--create table name airbnb_listings
CREATE TABLE airbnb_listing (
    id INT PRIMARY KEY,
    city VARCHAR(100),
    country VARCHAR(100),
    number_of_rooms INT,
    year_listed INT
);
--insert data
INSERT INTO airbnb_listing (id, city, country, number_of_rooms, year_listed)
VALUES 
(1, 'Karachi', 'Pakistan', 3, 2025),
(2, 'Paris', 'France', 5, 2018),
(3, 'Tokyo', 'Japan', 2, 2017),
(4, 'New York', 'USA', 2, 2022),
(5, 'Shanghai', 'China', 4, 2019);

--Querying Table:
--1.Get all the columns from a table  Student id: 186-NayyabFatima1305_Ba_Coursemea
SELECT * FROM airbnb_listing;

--2.Get the city column from the table  Student id: 186-NayyabFatima1305_Ba_Coursemea
SELECT city FROM airbnb_listing;

--3.Get the city and year_listed columns from the table  Student id: 186-NayyabFatima1305_Ba_Coursemea
SELECT city, year_listed FROM airbnb_listing;

--4.Get the listing id, city, ordered by the number_of_rooms in ascending order id: 186-NayyabFatima1305_Ba_Coursemea
SELECT id, city, number_of_rooms
FROM airbnb_listing
ORDER BY number_of_rooms ASC;

--5.Get the listing id, city, numer of rooms, ordered by the number_of_rooms in descending order id: 186-NayyabFatima1305_Ba_Coursemea
SELECT id, city, number_of_rooms
FROM airbnb_listing
ORDER BY number_of_rooms DESC;

--6.Get the first 3 rows from the airbnb_listings table id: 186-NayyabFatima1305_Ba_Coursemea
SELECT TOP 3 * FROM airbnb_listing;

--7.Get a unique list of cities where there are listings id: 186-NayyabFatima1305_Ba_Coursemea
SELECT DISTINCT city FROM airbnb_listing;

--Filtering Data:
--1.Get all the listings where number_of_rooms is more or equal to 3 id: 186-NayyabFatima1305_Ba_Coursemea
SELECT *
FROM airbnb_listing
WHERE number_of_rooms >= 3;

--2.Get all the listings where number_of_rooms is more than 3 id: 186-NayyabFatima1305_Ba_Coursemea
SELECT *
FROM airbnb_listing
WHERE number_of_rooms > 3;

--3.Get all the listings where number_of_rooms is exactly equal to 3 id: 186-NayyabFatima1305_Ba_Coursemea
SELECT *
FROM airbnb_listing
WHERE number_of_rooms = 3;

--4.Get all the listings where number_of_rooms is lower or equal to 3 id: 186-NayyabFatima1305_Ba_Coursemea
SELECT *
FROM airbnb_listing
WHERE number_of_rooms <= 3;

--5.Get all the listings where number_of_rooms is lower than 3 id: 186-NayyabFatima1305_Ba_Coursemea
SELECT *
FROM airbnb_listing
WHERE number_of_rooms < 3;

--6.Get all the listings with 3 to 6 rooms id: 186-NayyabFatima1305_Ba_Coursemea
SELECT *
FROM airbnb_listing
WHERE number_of_rooms BETWEEN 3 AND 6;

--Filtering on text columns
--7.Get all the listings that are based in 'Paris' id: 186-NayyabFatima1305_Ba_Coursemea
SELECT *
FROM airbnb_listing
WHERE city = 'Paris';

--8.Get the listings based in the an 'USA' ' and in ‘France' id: 186-NayyabFatima1305_Ba_Coursemea
SELECT *
FROM airbnb_listing
WHERE country IN ('USA', 'France');

--9.Get all the listings where the city starts with  'P' and where the city does not end in ‘t' id: 186-NayyabFatima1305_Ba_Coursemea
SELECT *
FROM airbnb_listing
WHERE city LIKE 'P%' AND city NOT LIKE '%t';

--Filtering on multiple columns.
--10.Get all the listings in 'Paris' where number_of_rooms is bigger than 3 id: 186-NayyabFatima1305_Ba_Coursemea
SELECT *
FROM airbnb_listing
WHERE city = 'Paris' AND number_of_rooms > 3;

--11.Get all the listings in 'Paris' OR the ones that were listed after 2012 id: 186-NayyabFatima1305_Ba_Coursemea
SELECT *
FROM airbnb_listing
WHERE city = 'Paris' OR year_listed > 2012;

--Filtering on missing data.
--12.Return the listings where number_of_rooms is missing id: 186-NayyabFatima1305_Ba_Coursemea
SELECT *
FROM airbnb_listing
WHERE number_of_rooms IS NULL;

--13.Return the listings where number_of_rooms is not missing id: 186-NayyabFatima1305_Ba_Coursemea
SELECT *
FROM airbnb_listing
WHERE number_of_rooms IS NOT NULL;

--Aggregating Data
--Simple aggregations
--1.Get the total number of rooms available across all listings id: 186-NayyabFatima1305_Ba_Coursemea
SELECT SUM(number_of_rooms) AS total_rooms
FROM airbnb_listing;

--2.Get the average number of rooms per listing across all listings id: 186-NayyabFatima1305_Ba_Coursemea
SELECT AVG(number_of_rooms) AS average_rooms
FROM airbnb_listing;

--3.Get the listing with the highest number of rooms across all listings id: 186-NayyabFatima1305_Ba_Coursemea
SELECT TOP 1 *
FROM airbnb_listing
ORDER BY number_of_rooms DESC;

--4.Get the listing with the lowest number of rooms across all listings id: 186-NayyabFatima1305_Ba_Coursemea
SELECT TOP 1 *
FROM airbnb_listing
ORDER BY number_of_rooms ASC;

--Grouping, filtering, and sorting
--5.Get the total number of rooms for each country id: 186-NayyabFatima1305_Ba_Coursemea
SELECT country, sum(number_of_rooms) AS total_rooms
FROM airbnb_listing
GROUP BY country; 

--6.Get the average number of rooms for each country id: 186-NayyabFatima1305_Ba_Coursemea
SELECT country, AVG(number_of_rooms) AS average_rooms
FROM airbnb_listing
GROUP BY country;

--7.Get the listing with the maximum number of rooms per country id: 186-NayyabFatima1305_Ba_Coursemea
SELECT country, MAX(number_of_rooms) AS MAX_rooms 
FROM airbnb_listing
GROUP BY country;

--8.Get the listing with the lowest amount of rooms per country id: 186-NayyabFatima1305_Ba_Coursemea
SELECT country, MIN(number_of_rooms) AS MIN_rooms
FROM airbnb_listing
GROUP BY country;

--9.For each country, get the average number of rooms per listing, sorted by ascending order id: 186-NayyabFatima1305_Ba_Coursemea
SELECT country, AVG(number_of_rooms) AS average_rooms
FROM airbnb_listing
GROUP BY country
ORDER BY average_rooms ASC;

--10.For Japan and the USA, get the average number of rooms per listing in each country id: 186-NayyabFatima1305_Ba_Coursemea
SELECT country, AVG(number_of_rooms) AS average_rooms
FROM airbnb_listing
WHERE country IN ('Japan', 'USA')
GROUP BY country;

--11.Get the number of cities per country, where there are listings id: 186-NayyabFatima1305_Ba_Coursemea
SELECT country, COUNT(DISTINCT city) AS number_of_cities
FROM airbnb_listing
GROUP BY country;

--12.Get all the years where there were more than 100 ids per year id: 186-NayyabFatima1305_Ba_Coursemea
SELECT year_listed, COUNT(id) AS listings_count
FROM airbnb_listing
GROUP BY year_listed
HAVING COUNT(id) > 100;
