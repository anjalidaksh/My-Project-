# Netflix Shows and Movies Project
![dcl-650-Bx5-8M-y0sI-unsplash](https://github.com/anjalidaksh/My-Project-/assets/167796617/a17bbf03-f619-4a7f-9dd6-4e3d69d9f04d)

**Tools Used:** Excel, MySQL 

[Datasets Used](https://www.kaggle.com/datasets/victorsoeiro/netflix-tv-shows-and-movies?select=titles.csv)





- **Business Problem:** Netflix aims to extract valuable insights from their extensive dataset of shows and movies to better serve their subscribers. However, they are overwhelmed by the sheer volume of data, which consists of approximately 82,000 rows. They require a robust and scalable data analytics solution to efficiently analyze this vast dataset and uncover meaningful patterns and trends.

- **How I Plan On Solving the Problem:**  To meet Netflix's need for extracting valuable insights from their extensive dataset using only MySQL, I follow these steps: Data Cleaning and Preparation, Basic Descriptive Analysis, Viewer Ratings and Popularity Trends, Genre Preferences, Viewership Patterns, Creating Summary Tables for Faster Analysis, Advanced Analysis, and Optimizing SQL Queries. By implementing these steps, I effectively analyze Netflix's vast dataset using SQL. This method allows for the extraction of meaningful insights, including viewer preferences, popularity trends, and key metrics, facilitating data-driven decision-making without the need for additional tools.

- ## Questions I Wanted To Answer From the Dataset:

## 1. What are the most common genres on Netflix?

- Top 10 Movies
```mysql
SELECT genres, COUNT(*) AS genres_count
FROM  project_data.titles
GROUP BY genres
ORDER BY genres_count DESC
LIMIT 5;

```
Result: 

![Screenshot 2024-06-14 150257](https://github.com/anjalidaksh/My-Project-/assets/167796617/a190550e-77f9-4020-859d-4b2bbf9f0002) 

A list of the top 5 most common genres, along with the count of titles in each genre.

## 2.  What is the distribution of age certifications on Netflix?

-- Top rated movies and shows 
-- my sql 
SELECT age_certification, 
COUNT(*) AS certification_count
FROM shows_movies.titles
WHERE type = 'Movie' 
AND age_certification != 'N/A'
GROUP BY age_certification
ORDER BY certification_count DESC
LIMIT 5;
Result : 

![Screenshot 2024-06-14 152055](https://github.com/anjalidaksh/My-Project-/assets/167796617/e95d9742-2c52-4ee0-b716-6a85eab5fbed)

Analyzing age certification can provide insights into the distribution of content ratings on Netflix, helping us understand the types of content available for different age groups.



