# Netflix Shows and Movies Project
![dcl-650-Bx5-8M-y0sI-unsplash](https://github.com/anjalidaksh/My-Project-/assets/167796617/a17bbf03-f619-4a7f-9dd6-4e3d69d9f04d)

**Tools Used:** Excel, MySQL 

[Datasets Used](https://www.kaggle.com/datasets/victorsoeiro/netflix-tv-shows-and-movies?select=titles.csv)





- **Business Problem:** Netflix aims to extract valuable insights from their extensive dataset of shows and movies to better serve their subscribers. However, they are overwhelmed by the sheer volume of data, which consists of approximately 82,000 rows. They require a robust and scalable data analytics solution to efficiently analyze this vast dataset and uncover meaningful patterns and trends.

- **How I Plan On Solving the Problem:**  To meet Netflix's need for extracting valuable insights from their extensive dataset using only MySQL, I follow these steps: Data Cleaning and Preparation, Basic Descriptive Analysis, Viewer Ratings and Popularity Trends, Genre Preferences, Viewership Patterns, Creating Summary Tables for Faster Analysis, Advanced Analysis, and Optimizing SQL Queries. By implementing these steps, I effectively analyze Netflix's vast dataset using SQL. This method allows for the extraction of meaningful insights, including viewer preferences, popularity trends, and key metrics, facilitating data-driven decision-making without the need for additional tools.

- ## Questions I Wanted To Answer From the Dataset:

## 1. Which movies and shows on Netflix ranked in the top 10 and bottom 10 based on their IMDB scores?

- Top 10 Movies
```mysql
SELECT title, 
type, 
imdb_score
FROM shows_movies.titles
WHERE imdb_score >= 8.0
AND type = 'MOVIE'
ORDER BY imdb_score DESC
LIMIT 10
```
Result: 
