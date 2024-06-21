create Database Murder_mystry

Select * from Murder_Mystry_report

SELECT * 
FROM Murder_Mystry_report 
WHERE date = '2018-01-15'
AND city = 'SQL City'
AND type = 'murder';

--Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".

Select * from Person

SELECT * 
FROM person 
WHERE address_street_name = 'Northwestern Dr' 
ORDER BY address_number DESC;

--ID        Name        LicenseID  Address no. Address street name       SSN
--14887	 Morty Schapiro	 118009	   4919	        Northwestern Dr     	111564949

Select * from person where name like '%Annabel%' and address_street_name = 'franklin Ave';

--ID        Name        LicenseID  Address no. Address street name       SSN
--16371	 Annabel Miller	 490173	      103	     Franklin Ave	     318771143

Select * From Interview


Select * From Interview where person_id in (14887,16371)


--14887	I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".
--16371	I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.

Select * from Get_Fit_no_member

Select * from Get_Fit_no_member 
where membership_status = 'Gold' 
AND ID like '48Z%'

--48Z7A	28819	Joe Germuska	2016-03-05	gold
--48Z55	67318	Jeremy Bowers	2016-01-01	gold

Select * from Drivers_license

Select * from Drivers_license where plate_number like '%H42W%'

select p.name,p.id,plate_number from person p
left join drivers_license d on d.id=p.license_id where p.id in (67318,28819) and d.plate_number like '%H42w%'

--Murderer = Jeremy Bowers

select * from interview where person_id = '67318'

--I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.

select p.id, p.name, d.hair_color, d.height, d.gender,i.annual_income,d.car_make,d.car_model,f.event_name
from person p 
left join drivers_license d on d.id= p.license_id
left join income i on i.ssn=p.ssn
left join facebook_event_checkin f on p.id = f.person_id

where d.hair_color = 'red'
 and height between 65 and 67
 and d.gender = 'female'
 and car_make = 'tesla' and car_model = 'Model S'
 and f.event_name = 'SQL Symphony concert'

 --Murderer Miranda Priestly

 --Congrats, you found the brains behind the murder! Everyone in SQL City hails you as the greatest SQL detective of all time. Time to break out the champagne!







