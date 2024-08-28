--select the total number of incidents by year in this data set

SELECT year, count(*) as crimes_per_year
FROM bigquery-public-data.chicago_crime.crime
GROUP BY year
ORDER BY crimes_per_year DESC
LIMIT 5;


--retrieve the unique districst of chicago

SELECT DISTINCT district
FROM bigquery-public-data.chicago_crime.crime;


---HOW MANY PEOPLE WHERE ARRESTED OR NOT IN DISTRICT 24

SELECT arrest, COUNT(unique_key)
FROM bigquery-public-data.chicago_crime.crime
WHERE district = 24
GROUP BY arrest;

