-- 1. Total trips and average fare by day of week
SELECT
    strftime('%w', tpep_pickup_datetime) AS day_of_week,
    COUNT(*) AS total_trips,
    ROUND(AVG(fare_amount), 2) AS avg_fare
FROM taxi_trips
GROUP BY day_of_week
ORDER BY day_of_week;

-- 2. Top 10 busiest pickup hours
SELECT
    strftime('%H', tpep_pickup_datetime) AS hour,
    COUNT(*) AS trip_count,
    ROUND(AVG(fare_amount), 2) AS avg_fare
FROM taxi_trips
GROUP BY hour
ORDER BY trip_count DESC
LIMIT 10;

-- 3. Revenue by payment type
SELECT
    payment_type,
    COUNT(*) AS trips,
    ROUND(SUM(total_amount), 2) AS total_revenue,
    ROUND(AVG(tip_amount), 2) AS avg_tip
FROM taxi_trips
GROUP BY payment_type;

-- 4. Average speed by vendor
SELECT
    VendorID,
    ROUND(AVG(trip_distance /
        ((julianday(tpep_dropoff_datetime) -
          julianday(tpep_pickup_datetime)) * 24)), 2) AS avg_speed_mph
FROM taxi_trips
WHERE trip_distance > 0
  AND tpep_dropoff_datetime > tpep_pickup_datetime
GROUP BY VendorID;

-- 5. Tip percentage distribution
SELECT
    CASE
        WHEN tip_amount = 0 THEN 'No tip'
        WHEN tip_amount / fare_amount < 0.10 THEN 'Under 10%'
        WHEN tip_amount / fare_amount < 0.20 THEN '10-20%'
        ELSE 'Over 20%'
    END AS tip_bucket,
    COUNT(*) AS count
FROM taxi_trips
WHERE fare_amount > 0
GROUP BY tip_bucket;

-- 6. Long vs short trips revenue comparison
SELECT
    CASE
        WHEN trip_distance < 2 THEN 'Short (<2 mi)'
        WHEN trip_distance < 10 THEN 'Medium (2-10 mi)'
        ELSE 'Long (10+ mi)'
    END AS trip_category,
    COUNT(*) AS trips,
    ROUND(AVG(total_amount), 2) AS avg_revenue
FROM taxi_trips
GROUP BY trip_category;

-- 7. Passenger count vs average tip
SELECT
    passenger_count,
    ROUND(AVG(tip_amount), 2) AS avg_tip,
    COUNT(*) AS trips
FROM taxi_trips
WHERE passenger_count BETWEEN 1 AND 6
GROUP BY passenger_count
ORDER BY passenger_count;
