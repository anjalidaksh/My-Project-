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

- Distribution of age certification
```mysql
SELECT age_certification, COUNT(*) as total_titles 
FROM project_data.titles
GROUP BY age_certification 
ORDER BY total_titles DESC;

```
Result:  

![Screenshot 2024-06-14 152055](https://github.com/anjalidaksh/My-Project-/assets/167796617/e95d9742-2c52-4ee0-b716-6a85eab5fbed)

Analyzing age certification can provide insights into the distribution of content ratings on Netflix, helping us understand the types of content available for different age groups.

# 3. What are the most common content types (movies, TV shows) on Netflix?

- Common types
```mysql
SELECT type, COUNT(*) as total_titles 
FROM project_data.titles
GROUP BY type 
ORDER BY total_titles DESC 
LIMIT 5;

```
Result:  

![Screenshot 2024-06-14 171252](https://github.com/anjalidaksh/My-Project-/assets/167796617/832e3189-de12-4e57-817f-889d1e1b71d4) 

A list of the top content types (e.g., movies, TV shows), along with the count of titles in each type.

- Conclusion 

The analysis of the Netflix dataset provides a comprehensive understanding of its content distribution, age certification, and other critical metrics. By leveraging these insights, Netflix can continue to innovate and improve its offerings, ensuring it remains a leading player in the streaming industry. The platform's ability to cater to diverse tastes and preferences through a varied content library and strategic market focus will be crucial for its sustained growth and success.

















