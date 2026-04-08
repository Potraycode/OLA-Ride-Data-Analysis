use ola;

# 1. Retrieve all successful bookings:

CREATE VIEW success_bookings AS
SELECT *
FROM bookings
WHERE booking_status = 'success';

SELECT * FROM success_bookings;

# 2. Find the average ride distance for each vehicle type:

CREATE VIEW Ride_dist_of_each_vehicle AS
SELECT 
	vehicle_type,
    round(avg(Ride_Distance),1) AS Average_distance
FROM bookings
GROUP BY vehicle_type
ORDER BY Average_distance DESC;

SELECT * FROM Ride_dist_of_each_vehicle;

# 3. Get the total number of cancelled rides by customers:
CREATE VIEW cancelled_rides_by_customers AS
SELECT
	"Cancelled Rides" AS Ride_status,
    count(*)
FROM bookings
WHERE Booking_Status = 'Canceled by Customer';

SELECT * FROM cancelled_rides_by_customers;

# 4. List the top 5 customers who booked the highest number of rides:

CREATE VIEW Top_5_customers AS
SELECT 
	Customer_ID,
    count(customer_id) AS total_rides
FROM bookings
GROUP BY customer_id 
ORDER BY total_rides DESC
LIMIT 5;

SELECT * FROM Top_5_customers;

# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:

Create View Rides_cancelled_by_Drivers_P_C_Issues As
SELECT 
	'Cancelled via driver' AS ride_status,
    count(*) AS total_count
FROM bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

SELECT * FROM Rides_cancelled_by_Drivers_P_C_Issues;

# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

Create View Max_Min_Driver_Rating As
SELECT 
	min(driver_ratings) AS Min_rating,
	max(driver_ratings) AS Max_rating
FROM bookings
where Vehicle_Type = 'prime sedan';

SELECT * FROM Max_Min_Driver_Rating;

# 7. Retrieve all rides where payment was made using UPI:

Create View UPI_Payment As
SELECT 
	*
FROM bookings
WHERE Payment_Method = 'UPI';

SELECT * FROM UPI_Payment;

# 8. Find the average customer rating per vehicle type:

Create View AVG_Cust_Rating As
SELECT 
	Vehicle_Type,
    round(avg(Customer_Rating),3) AS average_cust_rating
FROM bookings
GROUP BY Vehicle_Type
ORDER BY average_cust_rating DESC;

SELECT * FROM AVG_Cust_Rating;

# 9. Calculate the total booking value of rides completed successfully:

Create View total_successful_ride_value As
SELECT 
	'Successful' AS Bookings,
    sum(Booking_Value) AS Total_amount
FROM bookings
WHERE Booking_Status = 'success';

SELECT * FROM total_successful_ride_value;

# 10. List all incomplete rides along with the reason:

Create View Incomplete_Rides_reasons As
SELECT 
	booking_id,
    Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides_Reason IS NOT NULL;

SELECT * FROM Incomplete_Rides_reasons;

# -----------------------------------------------------------------------------------------------

#1. Retrieve all successful bookings:
SELECT * FROM success_bookings;

#2. Find the average ride distance for each vehicle type:
SELECT * FROM Ride_dist_of_each_vehicle;

#3. Get the total number of cancelled rides by customers:
Select * from cancelled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:
Select * from Top_5_Customers;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Select * from Rides_cancelled_by_Drivers_P_C_Issues;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Select * from Max_Min_Driver_Rating;

#7. Retrieve all rides where payment was made using UPI:
Select * from UPI_Payment;

#8. Find the average customer rating per vehicle type:
Select * from AVG_Cust_Rating;

#9. Calculate the total booking value of rides completed successfully:
Select * from total_successful_ride_value;

#10. List all incomplete rides along with the reason:
Select * from Incomplete_Rides_reasons;

