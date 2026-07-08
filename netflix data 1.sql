Create database netflix;
use netflix;

CREATE TABLE movies (
    id INT PRIMARY KEY AUTO_INCREMENT,
    release_date VARCHAR(20),
    title VARCHAR(255),
    popularity DECIMAL(10,3),
    vote_count INT,
    vote_average DECIMAL(3,1),
    original_language VARCHAR(10),
    genre VARCHAR(255)
);
select * from movies;

select count(*) As Total_movies from movies;
# Insight: The dataset contains 1285 movies, providing a large sample for analysis.

select avg(vote_average) as average_rating from movies;
# Insight: The average movie rating in the dataset is 6.68 out of 10, indicating that most movies received moderately positive reviews.

select avg(popularity) as average_popularity from movies;
# Insight: The average popularity score is 154.47, suggesting that the dataset contains several highly popular movies that increase the overall average.

select count(distinct(original_language)) as Total_languages from movies;
# Insight: The dataset contains movies in 22 different languages, indicating a diverse international collection rather than being limited to a single language.

# Top 10 most popular movies
select title,popularity from movies
order by popularity desc
limit 10;
# Insight: Movies such as Spider-Man: No Way Home and The Batman rank among the most popular, suggesting that recent blockbuster releases generate the highest audience engagement.

select title as top_rated_movies,vote_count as votes from movies
where vote_count > 1000
limit 10;
# Insight: The top-rated movies have received excellent audience ratings while maintaining a high vote count, indicating consistent appreciation from a large number of viewers.

select distinct(genre) as most_common_genre from movies
limit 10;
#Insight: Action and Crime are the most common genres in the dataset, indicating that these genres dominate movie production. The top 10 genres account for a significant portion of the movies, reflecting audience demand and industry preferences.

select distinct(original_language) as most_common_languages from movies
limit 10;
#Insight: english and japanese are the most common languages in the dataset.alter

SELECT RIGHT(release_date, 4) AS release_year,
       COUNT(*) AS total_movies
FROM movies
GROUP BY release_year
ORDER BY total_movies desc;
# Insight: The number of movies released varies from year to year, indicating fluctuations in film production over time. Some years have significantly more releases than others, reflecting changes in industry trends and production activity.

select distinct(original_language) as Language , avg(vote_average) as avg_rating
from movies
group by Language
order by avg_rating desc;
# Insight: Movies produced in different languages receive different average ratings, reflecting variations in storytelling, audience preferences, and regional cinema quality.

select distinct(genre) as genre,avg(vote_average) as avg_rating
from movies
group by genre
order by avg_rating desc;
#Insight: Certain genres achieve higher average popularity, suggesting they are more successful in attracting audiences compared to other genres.

select distinct(genre) as genre,title,max(vote_average) as high_rated_action_movies from movies
where genre = 'Action'
group by genre,title
order by high_rated_action_movies desc
limit 10;
#nsight: The highest-rated action movies have received strong audience appreciation, indicating that well-produced action films can perform exceptionally well in terms of viewer ratings.

select title,max(vote_count) as max_votes
from movies
group by title
order by max_votes desc
limit 10;
#Insight: Movies with the most votes are generally well-known and have reached a broad audience, making their ratings more reliable due to the large number of user reviews.

select original_language,max(popularity) as highest_popular
from movies
group by original_language
order by highest_popular desc;
#Insight: The most popular movie varies across languages, showing that every language has its own standout films that attract significant audience attention. This reflects the global diversity of successful movies.