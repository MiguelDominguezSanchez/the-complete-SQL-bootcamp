-- -- -- 2. Setting up New Database for Assessment Exercises

-- -- -- Restoring Exercises Database 
-- 
-- We will use a new database for a set of exercise questions.
-- This database has a public and cd schema. 
-- This means the queries for the FROM 
-- tables will have cd. in front of them, for example:
-- -- SELECT * FROM cd.bookings
-- -- SELECT * FROM cd.facilities 

--

SELECT * FROM cd.facilities

--

SELECT * FROM cd.bookings

--

SELECT * FROM cd.members

-- 

-- -- -- 4. Solution to Assessment Test 2

-- 

SELECT * FROM cd.facilities

--

SELECT name,membercost FROM cd.facilities 

--

SELECT facid,name,membercost,monthlymaintenance 
FROM cd.facilities 
WHERE membercost > 0 

--

SELECT facid,name,membercost,monthlymaintenance 
FROM cd.facilities 
WHERE membercost > 0 AND 
membercost < (monthlymaintenance/50.0)

--

SELECT facid,name,membercost,monthlymaintenance 
FROM cd.facilities 
WHERE membercost > 0 AND 
membercost < ((1/50.0) *monthlymaintenance)

--

SELECT * FROM cd.facilities 
WHERE name ILIKE '%tennis%'

--

SELECT * FROM cd.facilities 
WHERE name ILIKE '%Tennis%'

--

SELECT * FROM cd.facilities 
WHERE facid = 1 OR facid = 5;

--

SELECT * FROM cd.facilities 
WHERE facid IN (1,5) 

--

SELECT memid,surname,first_name,joindate 
FROM cd.members 
WHERE joindate >= '2012-09-01'

--

SELECT DISTINCT surname FROM cd.members 
ORDER BY surname LIMIT 10

--

SELECT joindate 
FROM cd.members

--

SELECT MAX(joindate) 
FROM cd.members

--

SELECT MIN(joindate)
FROM cd.members 

--

SELECT COUNT(*)
FROM cd.facilities 
WHERE guestcost >= 10 

-- 

SELECT * 
FROM cd.facilities 
WHERE guestcost >= 10

--

SELECT facid,SUM(slots) AS total_slots 
FROM cd.bookings 
WHERE starttime >= '2012-09-01' AND 
starttime <= '2012-10-01'
GROUP BY facid ORDER BY SUM(slots)

-- 

SELECT facid,SUM(slots) AS total_slots
FROM cd.bookings
GROUP BY facid 
HAVING SUM(slots) > 1000 
ORDER BY facid

-- 

SELECT * FROM cd.bookings 

--

SELECT * FROM cd.facilities 

--

SELECT cd.bookings.starttime,cd.facilities.name 
FROM cd.facilities 
INNER JOIN cd.bookings 
ON cd.facilities.facid = cd.bookings.facid 
WHERE cd.facilities.facid IN (0,1)
AND cd.bookings.starttime >= '2012-09-21'
AND cd.bookings.starttime < '2012-09-21'
ORDER BY cd.bookings.starttime

--

SELECT cd.bookings.starttime
FROM cd.bookings 
INNER JOIN cd.members ON 
cd.members.memid = cd.bookings.memid 

-- 

SELECT cd.bookings.starttime 
FROM cd.bookings 
INNER JOIN cd.members ON 
cd.members.memid = cd.bookings.memid 
WHERE cd.members.firstname = 'David'
AND cd.members.surname = 'Farrell'