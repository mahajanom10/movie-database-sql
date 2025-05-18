CREATE DATABASE imdb;
-- 1.Top 10 highest rated movies (with at least 1000 votes)
SELECT * FROM imdb.imdb_cleaned WHERE no_of_votes >= 1000
ORDER BY imdb_rating desc
LIMIT 10;

-- 2. DRAMA Genre popularity over decade
SELECT
	FLOOR(released_year / 10) * 10 AS decade,
    genre,
    SUM(no_of_votes) AS total_votes
FROM imdb.imdb_cleaned
WHERE
	genre = 'Drama' AND 
	released_year IS NOT NULL 
    
GROUP BY decade 
ORDER BY decade ASC, total_votes DESC;

-- 3.Number of movies released per year 
SELECT released_year,
	COUNT(*) AS total_movies 
FROM imdb.imdb_cleaned
WHERE released_year IS NOT NULL
GROUP BY released_year
ORDER BY released_year;

-- 4.High Rated Movies with low popularity
SELECT * FROM imdb.imdb_cleaned
WHERE gross <= 1000000
ORDER BY imdb_rating DESC, gross ASC
LIMIT 20;

-- Movies with lowest ratings but many votes 
SELECT * FROM imdb.imdb_cleaned
ORDER BY imdb_rating ASC, no_of_votes DESC
LIMIT 15;