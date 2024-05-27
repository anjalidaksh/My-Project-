-- What were the top 10 movies according to IMDB score?
select * from project_data.titles;
select type,title,imdb_score from project_data.titles
where type= 'movie' and imdb_score>=8
order by imdb_score desc
limit 10;
-- What were the top 10 shows according to IMDB score? 
select type,title,imdb_score from project_data.titles
where type= 'show' and imdb_score>=8
order by imdb_score desc
limit 10;
-- What were the bottom 10 movies according to IMDB score? 
SELECT title, 
type, 
imdb_score
FROM project_data.titles
WHERE type = 'MOVIE'
ORDER BY imdb_score ASC
LIMIT 10;
-- What were the average IMDB and TMDB scores for shows and movies? 
select distinct type,
round(AVG(imdb_score),2) AS avg_imdb_score,
round(AVG(tmdb_score),2) as avg_tmdb_score
FROM project_data.titles
GROUP BY type 
-- Count of movies and shows in each decade ?
Select CONCAT(FLOOR(release_year / 10) * 10, 's') AS decade
COUNT(*) AS movies_shows_count
FROM project_data.titles
WHERE release_year >= 1940
GROUP BY CONCAT(FLOOR(release_year / 10) * 10, 's')
ORDER BY decade;
-- What were the average IMDB and TMDB scores for each production country?
select distinct production_countries,
round(avg(imdb_score),2) as avg_imdb_score,
round(avg(tmdb_score),2) as avg_tmdb_score
from project_data.titles 
group by production_countries
order by avg_imdb_score desc;
-- What were the average IMDB and TMDB scores for each age certification for shows and movies?
select distinct age_certification,
round(avg(imdb_score),2) as avg_imdb_score,
round(avg(tmdb_score),2) as avg_tmdb_score
from project_data.titles
group by age_certification
order by avg_imdb_score desc;
-- What were the 5 most common age certifications for movies?
select distinct age_certification,
count(*)  as certification_count
from project_data.titles
where type = 'movie'
and age_certification  != 'N/A'
group by age_certification
order by certification_count desc
limit 5;
-- Who were the top 20 actors that appeared the most in movies/shows? 
select distinct name as actor,
count(*) as number_of_appearences
from project_data.credits
where role = 'actor'
group by name 
order by number_of_appearences desc 
limit 20;
-- Who were the top 20 directors that directed the most movies/shows?
select distinct name as directors,
count(*) as number_of_appearences 
from project_data.credits 
where role = 'director'
group by name 
order by number_of_appearences desc 
limit 20;
-- Calculating the average runtime of movies and TV shows separately?
select 'movies' as content_type,
round(avg(runtime),2) as avg_runtime_min 
from project_data.titles 
where type = 'movie'
union all
select 'show' as content_type,
round(avg(runtime),2) as avg_runtime_min
from project_data.titles
WHERE type = 'Show';

-- Finding the titles and  directors of movies released on or after 1987?
SELECT DISTINCT t.title, c.name AS director 
FROM project_data.titles AS t
JOIN project_data.credits AS c 
ON t.id = c.id
WHERE t.type = 'Movie' 
AND c.role = 'director';
-- Which shows on Netflix have the most seasons? 
SELECT title, 
SUM(seasons) AS total_seasons
FROM project_data.titles 
WHERE type = 'Show'
GROUP BY title
ORDER BY total_seasons DESC
LIMIT 10;
-- Which genres had the most movies? 
SELECT genres, 
COUNT(*) AS title_count
FROM project_data.titles 
WHERE type = 'Movie'
GROUP BY genres
ORDER BY title_count DESC
LIMIT 10;
-- Which genres had the most shows? 
SELECT genres, 
COUNT(*) AS title_count
FROM project_data.titles 
WHERE type = 'Show'
GROUP BY genres
ORDER BY title_count DESC
LIMIT 10;
-- Titles and Directors of movies with high IMDB scores (>7.5) and high TMDB popularity scores (>80)?
SELECT t.title, 
c.name AS director
FROM project_data.titles AS t
JOIN project_data.credits AS c 
ON t.id = c.id
WHERE t.type = 'Movie' 
AND t.imdb_score > 7.5 
AND t.tmdb_popularity > 80 
AND c.role = 'director';
-- What were the total number of titles for each year? 
SELECT release_year, 
COUNT(*) AS title_count
FROM project_data.titles 
GROUP BY release_year
ORDER BY release_year DESC;
-- Actors who have starred in the most highly rated movies or shows? 
SELECT c.name AS actor, 
COUNT(*) AS num_highly_rated_titles
FROM project_data.credits AS c
JOIN project_data.titles AS t 
ON c.id = t.id
WHERE c.role = 'actor'
AND (t.type = 'Movie' OR t.type = 'Show')
AND t.imdb_score > 8.0
AND t.tmdb_score > 8.0
GROUP BY c.name
ORDER BY num_highly_rated_titles DESC;
-- Which actors/actresses played the same character in multiple movies or TV shows? 
SELECT c.name AS actor_actress, 
c.character, 
COUNT(DISTINCT t.title) AS num_titles
FROM project_data.credits AS c
JOIN project_data.titles AS t 
ON c.id = t.id
WHERE c.role = 'actor' OR c.role = 'actress'
GROUP BY c.name, c.character
HAVING COUNT(DISTINCT t.title) > 1;
-- What were the top 3 most common genres?
SELECT t.genres, 
COUNT(*) AS genre_count
FROM project_data.titles AS t
WHERE t.type = 'Movie'
GROUP BY t.genres
ORDER BY genre_count DESC
LIMIT 3;
-- Average IMDB score for leading actors/actresses in movies or shows ?
SELECT c.name AS actor_actress, 
ROUND(AVG(t.imdb_score),2) AS average_imdb_score
FROM project_data.credits AS c
JOIN project_data.titles AS t 
ON c.id = t.id
WHERE c.role = 'actor' OR c.role = 'actress'
AND c.character = 'leading role'
GROUP BY c.name
ORDER BY average_imdb_score DESC;









