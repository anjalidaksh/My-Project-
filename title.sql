select * from project_data.titles;
--- 1. What were the top 10 movies according to IMDB score?
select title,type,imdb_score from project_data.titles
where imdb_score >= 8.0 and type = 'movie'
order by imdb_score desc
limit 10;
--- 2. What were the top 10 shows according to IMDB score?
select title, type,imdb_score from project_data.titles
where imdb_score >= 8.0 and type = 'show'
order by imdb_score desc
limit 10;
--- 3.What were the bottom 10 movies according to IMDB score? 
select title, type,imdb_score from project_data.titles
where type = 'movie'
order by imdb_score asc
limit 10;
--- 4. What were the bottom 10 shows according to IMDB score?
select title, type,imdb_score from project_data.titles
where type = 'show'
order by imdb_score asc
limit 10;
--- 5.What were the average IMDB and TMDB scores for shows and movies? 
SELECT DISTINCT type, 
ROUND(AVG(imdb_score),2) AS avg_imdb_score,
ROUND(AVG(tmdb_score),2) as avg_tmdb_score
FROM project_data.titles
GROUP BY type ;
--- 6. Count of movies and shows in each decade
SELECT CONCAT(FLOOR(release_year / 10) * 10, 's') AS decade,
	COUNT(*) AS movies_shows_count
FROM project_data.titles
WHERE release_year >= 1940
GROUP BY CONCAT(FLOOR(release_year / 10) * 10, 's')
ORDER BY decade;
--- 7.What were the 5 most common age certifications for movies?
SELECT age_certification, 
COUNT(*) AS certification_count
FROM project_data.titles
WHERE type = 'Movie' 
AND age_certification != 'N/A'
GROUP BY age_certification
ORDER BY certification_count DESC
LIMIT 5;
--- 8.Calculating the average runtime of movies and TV shows separately
Select type,
ROUND(AVG(runtime),2) AS avg_runtime_min
FROM project_data.titles
WHERE type = 'Movie'
UNION ALL
SELECT type,
ROUND(AVG(runtime),2) AS avg_runtime_min
FROM project_Data.titles
WHERE type = 'Show';
--- 9. Which shows on Netflix have the most seasons? 
SELECT title, 
SUM(seasons) AS total_seasons
FROM project_data.titles 
WHERE type = 'Show'
GROUP BY title
ORDER BY total_seasons DESC
LIMIT 10;
--- 10. What are the top 3 genres?
select genres,count(*) as total_count from project_data.titles
where type = 'movie' or type = 'show'
group by genres
order by total_count desc
limit 3;

