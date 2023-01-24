
-- Question 3. Count records
select count(*) from trip_data
where date(lpep_pickup_datetime)='2019-01-15' and date(lpep_dropoff_datetime)='2019-01-15';

-- Question 4. Largest trip for each day
select date(lpep_pickup_datetime), max(trip_distance) 
from trip_data
group by 1
order by 2 Desc;

-- Question 5. The number of passengers
select passenger_count, count(passenger_count) as number_of_trips
from trip_data
where date(lpep_pickup_datetime) = '2019-01-01' and passenger_count in (2, 3)
group by 1;

-- Question 6. Largest tip
select z."Zone" 
from trip_data t join zones z
on t."DOLocationID"=z."LocationID"
where t.tip_amount = (
	select max(t2.tip_amount) largest_tip
	from trip_data t2 join zones z
	on t2."PULocationID"=z."LocationID"
	where z."Zone"='Astoria'
);
