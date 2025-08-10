create database OLA

use OLA

create view Successful_Booking as
select * from Bookings where Booking_Status = 'Success'

--1.Retrieve all successful bookings:
select * from Successful_Booking


create view ride_distance_for_each_vehicle as
select vehicle_type,avg(ride_distance) as avg_distance from Bookings
group by vehicle_type

--2.Find the average ride distance for each vehicle type:
select * from ride_distance_for_each_vehicle


create view canceled_rides_by_customers as
select count(*) as Number_of_Canceled_Rides from Bookings where Booking_Status = 'Canceled by Customer'

--3.Get the total number of canceled rides by customers:
select * from canceled_rides_by_customers


create view top_5_customers as
select top 5 customer_id, count(booking_id) as total_rides from Bookings
group by customer_id
order by total_rides desc

--4.List the top 5 customers who booked the highest number of rides:
select * from top_5_customers


create view rides_canceled_by_drivers as 
select count(*) as total_canceled_rides from Bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue'

--5.Get the number of rides cancelled by drivers due to personal and car-related issues:
select * from rides_canceled_by_drivers


create view max_min_driver_rating as
select max(driver_ratings) as max_rating, min(driver_ratings) as min_rating from Bookings
where Vehicle_Type = 'Prime Sedan'
--6.Find the maximum and minimum driver ratings for Prime Sedan bookings:
select * from max_min_driver_rating


create view UPI_payment as
select * from Bookings
where Payment_Method = 'UPI'
--7.Retrieve all rides where payment was made using UPI:
select * from UPI_payment

create view avg_customer_rating as
select vehicle_type, avg(customer_rating) as avg_customer_rating from Bookings
group by Vehicle_Type

--8.Find the average customer rating per vehicle type:
select * from avg_customer_rating


create view total_successful_bookings as
select sum(booking_value) as total_successful_value from Bookings
where Booking_Status = 'Success'
--9.Calculate the total booking value of rides completed successfully:
select * from total_successful_bookings


create view all_incomplete_rides as
select booking_id, incomplete_rides_reason
from Bookings
where Incomplete_Rides = 'True'
--10.List all incomplete rides along with the reason:
select * from all_incomplete_rides