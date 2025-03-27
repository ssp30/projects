create database Airbnb ;
use airbnb;

select * from  `booking and details`  ;
select * from  listing;

#1 Write a query to show names from Listings table
select name from `listing`;

#2 Write a query to fetch total listings from the listings table
select count(id) from listing ;

#3 Write a query to fetch total listing_id from the booking_details table
select count(listing_id)from `booking and details` ;

#4 Write a query to fetch host ids from listings table
select host_id from  listing;

#5 Write a query to fetch all unique host name from listings table
select distinct (host_name)from listing;

#6 Write a query to show all unique neighbourhood_group from listings table
select distinct(neighbourhood_group) from listing;

#7 Write a query to show all unique neighbourhood from listings table
select distinct(neighbourhood) from listing;

#8 Write a query to fetch unique room_type from listings tables
select distinct(room_type) from listing;

#9 Write a query to show all values of Brooklyn & Manhattan from listings tables
select * from listing where neighbourhood_group in("Brooklyn","Manhattan");

#10 Write a query to show maximum price from booking_details table
select max(price)from `booking and details` ;

#11 Write a query to show minimum price fron booking_details table
select min(price)from `booking and details` ;

#12 Write a query to show average price from booking_details table
select avg(price)from `booking and details` ;

#13 Write a query to show minimum value of minimum_nights from booking_details table
select min(minimum_nights)from `booking and details` ;

#14 Write a query to show maximum value of minimum_nights from booking_details table
select max(minimum_nights)from `booking and details` ;

#15 Write a query to show average availability_365 
select avg(availability_365)from `booking and details`;

#16 Write a query to show id , availability_365 and all availability_365 values greater than 300
select listing_id , availability_365 from `booking and details` where availability_365 >300;
                              #OR#
select list.id, book.availability_365 from `booking and details` book 
inner join listing list on list.id=book.listing_id 
where availability_365 >300;

#17   Write a query to show count of id where price is in between 300 to 400
select COUNT(LISTING_ID)ID,PRICE from `booking and details`
where PRICE between 300 and 400
group by PRICE;

#18 Write a query to show count of id where minimum_nights spend is less than 5
select count(listing_id ),minimum_nights from `booking and details`
where minimum_nights <5
group by minimum_nights ;

#19 Write a query to show count where minimum_nights spend is greater than 100
select count(listing_id ),minimum_nights from `booking and details`
where minimum_nights >100 group by minimum_nights
 ;

#20 Write a query to show all data of listings & booking_details
select list.* ,book.* from `booking and details` book
join listing list on list.id=book.listing_id ;

#21 Write a query to show host name and price 
select list.host_name,book.price from listing list 
inner join `booking and details` book on list.id=book.listing_id 
;

#22 Write a query to show room_type and price
select list.room_type,book.price from listing list 
inner join `booking and details` book on list.id=book.listing_id 

#23 Write a query to show neighbourhood_group & minimum_nights spend
select list.neighbourhood_group ,book.minimum_nights from listing list 
inner join `booking and details` book on list.id=book.listing_id ;

#24 Write a query to show neighbourhood & availability_365
select list.neighbourhood ,book.availability_365 from listing list 
inner join `booking and details` book on list.id=book.listing_id;

#25 Write a query to show total price by neighbourhood_group
select list.neighbourhood_group ,sum(book.price) from listing list 
inner join `booking and details` book on list.id=book.listing_id
group by list.neighbourhood_group ;

#26 Write a query to show maximum price by neighbourhood_group
select list.neighbourhood_group ,max(book.price) from listing list 
inner join `booking and details` book on list.id=book.listing_id
group by list.neighbourhood_group;

#27 Write a query to show maximum night spend by neighbourhood_group
select list.neighbourhood_group ,max(book.minimum_nights) Max_Nights_Spend from listing list 
inner join `booking and details` book on list.id=book.listing_id
group by list.neighbourhood_group
;
#28 Write a query to show maximum reviews_per_month spend by neighbourhood
select list.neighbourhood ,max(book.reviews_per_month) Max_review from listing list 
inner join `booking and details` book on list.id=book.listing_id
group by list.neighbourhood;

#29 Write a query to show maximum price by room type
select list.room_type ,max(book.price) Max_price from listing list 
inner join `booking and details` book on list.id=book.listing_id
group by list.room_type ;

#30 Write a query to show average number_of_reviews by room_type
select list.room_type ,avg(book.reviews_per_month) Avg_review from listing list 
inner join `booking and details` book on list.id=book.listing_id
group by list.room_type ;

#31 Write a query to show average price by room type
select list.room_type ,avg(book.price) Avg_price from listing list 
inner join `booking and details` book on list.id=book.listing_id
group by list.room_type ;

#32 Write a query to show average night spend by room type
select list.room_type ,avg(book.minimum_nights) Avg_Night_Spend from listing list 
inner join `booking and details` book on list.id=book.listing_id
group by list.room_type ;

#33 Write a query to show average price by room type but average price is less than 100
select list.room_type ,avg(book.price) Avg_price from listing list 
inner join `booking and details` book on list.id=book.listing_id
group by list.room_type 
having Avg_price < 100;

#34 Write a query to show average night by neighbourhood and average_nights is greater than 5
select list.neighbourhood ,avg(book.minimum_nights) Avg_Nights from listing list 
inner join `booking and details` book on list.id=book.listing_id
group by list.neighbourhood
having avg_nights >5 order by avg_nights asc;

#35 Write a query to show all data from listings where price is greater than 200 using sub-query.
select * from listing where id in (select id from `booking and details` where price >200 );

#36 Write a query to show all values from booking_details table where host id is 314941 using sub-query.
select * from `booking and details` where listing_id  in(select listing_id from listing where host_id=314941);
select * from listing;

#37 Find all pairs of id having the same host id, each pair coming once only.
select distinct l1.id,l1.host_id from listing l1 ,listing l2
where l1.host_id=l2.host_id and l1.id <> l2.id order by id ;

#38 Write an sql query to show fetch all records that have the term cozy in name
select * from listing l where name like "%cozy%"

#39 Write an sql query to show price, host id, neighbourhood_group of manhattan neighbourhood_group.
select l.neighbourhood_group,l.host_name,b.price from listing l inner join `booking and details` b
on l.id=b.listing_id where neighbourhood_group="manhattan";

#40 Write a query to show id , host name, neighbourhood and price 
#   but only for Upper West Side & Williamsburg neighbourhood, also make sure price is greater than 100.
select l.id,l.host_name, l.neighbourhood,b.price from listing l
inner join `booking and details` b on l.id=b.listing_id 
where neighbourhood in ("upper west side","Williamsburg") and b.price >100;

#41 Write a query to show id , host name, neighbourhood 
#   and price for host name Elise and neighbourhood is Bedford-Stuyvesant.
select l.id,l.host_name, l.neighbourhood,b.price from listing l
inner join `booking and details` b on l.id=b.listing_id 
where l.neighbourhood="Bedford-Stuyvesant" and l.host_name="Elise";

select * from `booking and details`;

#42 Write a query to show host_name, availability_365,minimum_nights only for 100+ availability_365 and minimum_nights.
select l.id,l.host_name, b.availability_365,b.minimum_nights from `booking and details` b 
inner join listing l on l.id=b.listing_id where  b.availability_365>100
and b.minimum_nights>100 order by id;

#43 Write a query to show to fetch id , host_name , number_of_reviews, 
#    and reviews_per_month but show only that records where number of reviews are 500+ and review per month is 5+.
select l.id , l.host_name , b.number_of_reviews,b.reviews_per_month from listing l
inner join `booking and details` b on l.id=b.listing_id 
where b.number_of_reviews>500 and b.reviews_per_month>5;

#44 Write a query to show neighbourhood_group which have most total number of review .
select l.neighbourhood_group,max(b.number_of_reviews) from listing l 
inner join `booking and details` b on l.id=b.listing_id 
group by l.neighbourhood_group order by max(b.number_of_reviews) desc limit 1;

#45 Write a query to show host name which have most cheaper total price .
select l.host_name,sum(b.price) from listing l inner join `booking and details` b on l.id=b.listing_id 
group by l.host_name order by sum(b.price) asc limit 1;

#46 Write a query to show host name which have most costly total price .
select l.host_name,sum(b.price) from listing l inner join `booking and details` b on l.id=b.listing_id 
group by l.host_name order by sum(b.price) desc limit 1;

#47 Write a query to show host name which have max price using sub-query.
select l.host_name,b.price from listing l inner join 
`booking and details` b on l.id=b.listing_id 
where b.price=(select max(b.price)from `booking and details`);

#48 Write a query to show neighbourhood_group where price is less than 100.
select l.neighbourhood_group,b.price from listing l 
inner join `booking and details` b on l.id=b.listing_id 
where l.id in (select id from `booking and details`where price <100);

#49 Write a query to find max price, average availability_365 for each room type and order in ascending by maximum price.
select l.room_type,max(B.PRICE)maximum_price,avg(b.availability_365) avg_availability from listing l
inner join `booking and details` b on l.id=b.listing_id group by room_type
order by maximum_price;


select * from listing;
select * from `booking and details`;