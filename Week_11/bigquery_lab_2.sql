SELECT COUNT(*)
FROM bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2022;

-- Exercise 1: Count the number of trips in January 2023 = 62,495

SELECT COUNT(pickup_datetime)
FROM bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2022
WHERE data_file_month = 1;


-- Exercise 2: Calculate the total revenue generated by taxi trips in 2023 = 14,714,800.66

SELECT SUM(total_amount)
FROM bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2022;


-- Exercise 3: Find the most popular pickup location = LOCATION 74 with 129,829

SELECT pickup_location_id, COUNT(*)
FROM bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2022
GROUP BY pickup_location_id
ORDER BY COUNT(*) DESC;


-- Exercise 4: Analyze the number of trips per hour of the day

SELECT EXTRACT(HOUR FROM pickup_datetime) AS Hour , COUNT(pickup_datetime)
FROM bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2022
GROUP BY Hour
ORDER BY Hour;


-- Exercise 5: Calculate the average trip distance = 88.615035503

SELECT AVG(trip_distance)
FROM bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2022;


-- Exercise 6: Find the longest trip by distance; 360,068.14

SELECT trip_distance
FROM bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2022
ORDER BY trip_distance DESC;


-- Exercise 7: Calculate the total number of passengers by payment type

SELECT payment_type, COUNT(passenger_count)
FROM bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2022
GROUP BY payment_type;


-- ** Exercise 8: Find the most common drop-off location for trips BY PAYMENT TYPE 1 = LOC. 74 --> 19,823

SELECT dropoff_location_id, COUNT(*)
FROM bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2022
WHERE payment_type = "1.0"
GROUP BY dropoff_location_id
ORDER BY COUNT(*) DESC;

-- Exercise 9: Calculate the total number of trips that had more than 4 passengers: 5 TO 9... WHEN MOSTLY 5 13,929

SELECT passenger_count, COUNT(pickup_datetime)
FROM bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2022
WHERE passenger_count >= 4
GROUP BY passenger_count
ORDER BY COUNT(pickup_datetime) DESC; 


SELECT passenger_count
FROM bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2022
GROUP BY passenger_count;

-- Exercise 10: Subquery - Find the average fare for trips longer than the average trip distance (Average FARE = 29.569618227)

SELECT AVG(fare_amount)
FROM bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2022
WHERE trip_distance >= (SELECT AVG(trip_distance)
                        FROM bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2022); 

