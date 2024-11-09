select * from airlines
select distinct [IATA_CODE] from airports 
select * from flights 
select  count([TAIL_NUMBER]) from flights
select  count(distinct[TAIL_NUMBER]) from flights
--Checking nulls --
select YEAR, MONTH, DAY, DAY_OF_WEEK, AIRLINE, FLIGHT_NUMBER, TAIL_NUMBER, ORIGIN_AIRPORT,
       DESTINATION_AIRPORT, SCHEDULED_DEPARTURE, DEPARTURE_TIME, DEPARTURE_DELAY, TAXI_OUT, 
	   WHEELS_OFF, SCHEDULED_TIME, ELAPSED_TIME, AIR_TIME, DISTANCE, WHEELS_ON, TAXI_IN, 
	   SCHEDULED_ARRIVAL, ARRIVAL_TIME, ARRIVAL_DELAY, DIVERTED, CANCELLED, CANCELLATION_REASON,
	   AIR_SYSTEM_DELAY, SECURITY_DELAY, AIRLINE_DELAY, LATE_AIRCRAFT_DELAY, WEATHER_DELAY 
from flights
WHERE YEAR is null or MONTH is null or DAY is null or DAY_OF_WEEK is null or FLIGHT_NUMBER is null or ORIGIN_AIRPORT is null or
       DESTINATION_AIRPORT is null or SCHEDULED_DEPARTURE is null or DEPARTURE_TIME is null or DEPARTURE_DELAY is null or TAXI_OUT is null or 
	   WHEELS_OFF is null or SCHEDULED_TIME is null or ELAPSED_TIME is null or AIR_TIME is null or DISTANCE is null or WHEELS_ON is null or TAXI_IN is null or 
	   SCHEDULED_ARRIVAL is null or ARRIVAL_TIME is null or ARRIVAL_DELAY is null or DIVERTED is null or CANCELLED is null or CANCELLATION_REASON is null or
	   AIR_SYSTEM_DELAY is null or SECURITY_DELAY is null or AIRLINE_DELAY is null or LATE_AIRCRAFT_DELAY is null or WEATHER_DELAY  is null 
     


-- Duplicates-- 
select  year , month ,Day , AIRLINE ,[FLIGHT_NUMBER],[ORIGIN_AIRPORT] , count(*)
from flights 
group by year , month ,Day , AIRLINE ,[FLIGHT_NUMBER],[ORIGIN_AIRPORT]
having count(*) > 1








-- adding realtions --


alter table flights 
	add constraint FK_Airline
	foreign key ([AIRLINE]) references airlines (IATA_CODE)
	
alter table flights 
	add constraint FK_orignairport
	foreign key ([ORIGIN_AIRPORT]) references airports (IATA_CODE)
	
alter table flights 
	add constraint FK_destionariport
	foreign key ([DESTINATION_AIRPORT]) references airports  (IATA_CODE)

select * from flights
select min(ORIGIN_AIRPORT) from flights 

select min(ORIGIN_AIRPORT) from flights 
select count(distinct ORIGIN_AIRPORT) from flights where ORIGIN_AIRPORT = 'YUM' and CANCELLED = 1
select ORIGIN_AIRPORT from flights where  CANCELLED = 1
select distinct day from flights

SELECT 
    YEAR, MONTH, DAY, DAY_OF_WEEK ,f.AIRLINE AS FLIGHT_AIRLINE, FLIGHT_NUMBER, TAIL_NUMBER,  ORIGIN_AIRPORT, 
    DESTINATION_AIRPORT, SCHEDULED_DEPARTURE, DEPARTURE_TIME, DEPARTURE_DELAY,TAXI_OUT, WHEELS_OFF,SCHEDULED_TIME, 
    ELAPSED_TIME,AIR_TIME,DISTANCE,WHEELS_ON,TAXI_IN,SCHEDULED_ARRIVAL,ARRIVAL_TIME,ARRIVAL_DELAY,DIVERTED,CANCELLED, 
    CANCELLATION_REASON,a.IATA_CODE AS AIRLINE_CODE, a.AIRLINE AS AIRLINE_NAME,
    -- Origin airport details
    ap_origin.AIRPORT AS ORIGIN_AIRPORT_NAME, ap_origin.CITY AS ORIGIN_CITY,  ap_origin.STATE AS ORIGIN_STATE,ap_origin.COUNTRY AS ORIGIN_COUNTRY,
    -- Destination airport details
	ap_dest.IATA_CODE as DESTINATION_AIRPORT_code,ap_dest.AIRPORT AS DESTINATION_AIRPORT_NAME, ap_dest.CITY AS DESTINATION_CITY, 
    ap_dest.STATE AS DESTINATION_STATE, ap_dest.COUNTRY AS DESTINATION_COUNTRY
FROM flights f
JOIN airlines a ON f.AIRLINE = a.IATA_CODE
JOIN airports ap_origin ON f.ORIGIN_AIRPORT = ap_origin.IATA_CODE
JOIN airports ap_dest ON f.DESTINATION_AIRPORT = ap_dest.IATA_CODE;

--Breakdown questions--
--most airport cancel 
--most airport with A OR B OR C OR D 
-- MOST Tail Number  Used 
-- MOst tial number cancel 
-- most airport with dealy and cancel 
-- most airpor without dealy and no cancel
-- most city traveled to 
-- most city traveld From 
-- same way with states 
-- most country traveld to 
-- most country travelled from 
-- tail number with postive delay in departure and cancel 
--realtion between cancel & delay 
--relation distance & cancel 



