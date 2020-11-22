CREATE TABLE event( --this is information about the event
event_id INT, 
event_type VARCHAR(32),
event_name VARCHAR(32),
PRIMARY KEY (event_id)
); 

CREATE TABLE location( --this is information about the venue of the event
loc_id INT,
location VARCHAR(32),
country VARCHAR(32),
city VARCHAR(32),
loc_cost DECIMAL(15),
PRIMARY KEY (loc_id)
);

CREATE TABLE band( --this is information about celebrities
band_id INT,
band_name VARCHAR(32),
band_cost DECIMAL(15),
PRIMARY KEY (band_id)
);

CREATE TABLE instruments( --this is information about the instruments
instrument_id INT,
instrument_name VARCHAR(32),
PRIMARY KEY (instrument_id)
);

CREATE TABLE band_member( --this is information about group members
band_id INT,
band_member_id INT,
member_name VARCHAR(32),
PRIMARY KEY (band_id,band_member_id), --here i used double primary key
FOREIGN KEY (band_id) REFERENCES band(band_id)
);

CREATE TABLE band_member_instrument( --this is information about the instruments of group members
band_id INT,
band_members DECIMAL(15),
band_member_id INT,
instrument_id INT,
FOREIGN KEY (band_id,band_member_id) REFERENCES band_member(band_id,band_member_id), --here i used double foreign key
FOREIGN KEY (instrument_id) REFERENCES instruments(instrument_id)
);

CREATE TABLE date_time( --this is information about the date and time of the event
date_time_id INT,
date DATE,
time VARCHAR(32),
PRIMARY KEY (date_time_id)
);

CREATE TABLE staff( --this is information about the staff
staff_id INT,
staff_type VARCHAR(32),
staff_number_max DECIMAL(15),
staff_cost DECIMAL(15),
PRIMARY KEY (staff_id)
);

CREATE TABLE staff_list( --this is information about the staff who are at the event
event_id INT,
staff_id INT,
staff_number DECIMAL(15),
FOREIGN KEY (event_id) REFERENCES event(event_id),
FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

CREATE TABLE organization( --this is information about the event that is currently taking place
event_id INT,
band_id INT,
loc_id INT,
date_time_id INT,
FOREIGN KEY (event_id) REFERENCES event(event_id),
FOREIGN KEY (band_id) REFERENCES band(band_id),
FOREIGN KEY (loc_id) REFERENCES location(loc_id),
FOREIGN KEY (date_time_id) REFERENCES date_time(date_time_id)
);

--number 4
ALTER TABLE instruments ALTER COLUMN instrument_name VARCHAR(33);
ALTER TABLE instruments ADD instrument_age;
ALTER TABLE instruments DROP COLUMN instrument_age;
ALTER TABLE instruments ADD CONSTRAINT instrument_constraint;
ALTER TABLE instruments DROP CONSTRAINT instrument_constraint;

--number 5
INSERT INTO event (event_id, event_type, event_name)
VALUES (1,'Banquet','banquet_nazarbayev'),
(2,'Concert','astana_arena_DOS'),
(3,'Party','Club_night'),
(4,'Wedding','Maksat_Zhanerke'),
(5,'Graduation','AITU_graduation'),
(6,'Open_Area','Astana_Central_Park'),
(7,'Tour_of_Band','Green_Day_Tour'),
(8,'Birthday','Birthday_of_Kamila'),
(9,'Concert','Velo_Track_Concert'),
(10,'Open_Area','EXPO_Open_Area'),
(11,'Christmas','Christmas_eve');

INSERT INTO location (loc_id,location,country,city,loc_cost)
VALUES (201,'Line_Brew','KAZ','Nur_Sultan',1000),
(202,'Astana_Arena','KAZ','Nur_Sultan',10000),
(203,'Staver','KAZ','Uskaman',500),
(204,'Restaurant_Almaty','KAZ','Almaty',800),
(205,'AITU','KAZ','Nur_Sultan',0),
(206,'Astana_Central_Park','KAZ','Nur_Sultan',2500),
(207,'Barys_Arena','KAZ','Nur_Sultan',4500),
(208,'Vista','KAZ','Almaty',1500),
(209,'Velo_Track','KAZ','Nur_Sultan',3500),
(210,'EXPO','KAZ','Nur_Sultan',1500),
(211,'Abu_dabi_plaza','KAZ','Nur_Sultan',2000);

INSERT INTO band (band_id,band_name,band_cost)
VALUES (101,'Oasis',10000),
(102,'Green_day',15000),
(103,'Cucumber',500),
(104,'Dosmukasan',2500),
(105,'Aitu_music',0),
(106,'Ed_Sheeran',30000),
(107,'AC/DC',20000),
(108,'Metallica',18000),
(109,'Dimash_Kudaibergen',8000),
(110,'Arctic_Monkeys',13000),
(111,'Beatles',15000);

INSERT INTO instruments (instrument_id,instrument_name)
VALUES (301,'guitar'),
(302,'vocal'),
(303,'drums'),
(304,'bass_guitar'),
(305,'piano'),
(306,'ukulele'),
(307,'violin'),
(308,'keyboard'),
(309,'guitar_acoustic'),
(310,'electric_drums'),
(311,'dombyra');

INSERT INTO band_member (band_id,band_member_id,member_name)
VALUES (101,1,'Noel_Galaggher'),
(101,2,'Liam_Galagher'),
(101,3,'Alan_White'),
(101,4,'Andy_Bell'),
(102,1,'Billie_J_Armstrong'),
(102,2,'Mike_Dirnt'),
(102,3,'Tre_Cool'),
(103,1,'Ruslan_Syzdykov'),
(103,2,'Vitaliy_Ten'),
(103,3,'Oleg_Hodykin'),
(103,4,'Vyacheslav_Bibaev'),
(103,5,'Vladimir_Ryabcev'),
(104,1,'Dosim_Suleev'),
(104,2,'Murat_Kusainov'),
(104,3,'Kamit_Sanbaev'),
(104,4,'Alexander_Litvinov'),
(105,1,'Kamila_Saulebayeva'),
(105,2,'Zharylkassynov_Alisher'),
(105,3,'Yerbol_Bekbolat'),
(105,4,'Kanafina_Ayaulym'),
(105,5,'Aida_Zinurkyzy'),
(106,1,'Ed_Sheeran'),
(107,1,'Angus_Yang'),
(107,2,'Steve_Yang'),
(107,3,'Brian_Johnson'),
(107,4,'Phil_Radd'),
(107,5,'Cleeff_Williams'),
(108,1,'James_Hatfield'),
(108,2,'Lars_Ulrih'),
(108,3,'Kirk_Hemmet'),
(108,4,'Robert_Truhilio'),
(109,1,'Dimash_Kudaibergen'),
(110,1,'Alex_Terner'),
(110,2,'Nick_O_Melly'),
(110,3,'Jamie_Cook'),
(110,4,'Matt_Helders'),
(111,1,'John_lennon'),
(111,2,'Paul_McCartney'),
(111,3,'George_Harrison'),
(111,4,'Ringo_Starr');

INSERT INTO band_member_instrument (band_id,band_members,band_member_id,instrument_id)
VALUES
(101,4,1,301),(101,4,2,302),(101,4,3,303),(101,4,4,304),
(102,3,1,302),(102,3,1,301),(102,3,2,304),(102,3,3,303),
(103,5,1,303),(103,5,2,301),(103,5,3,304),(103,5,4,301),(103,5,5,302),
(104,4,1,304),(104,4,2,301),(104,4,3,302),(104,4,4,303),
(105,5,1,302),(105,5,2,301),(105,5,3,301),(105,5,4,305),(105,5,5,306),
(106,1,1,301),(106,1,1,302),
(107,5,1,306),(107,5,2,305),(107,5,3,308),(107,5,4,309),(107,5,5,304),
(108,4,1,307),(108,4,2,301),(108,4,3,310),(108,4,4,303),
(109,1,1,302),(109,1,1,311),
(110,4,1,305),(110,4,2,301),(110,4,3,306),(110,4,4,309),
(111,4,1,306),(111,4,2,308),(111,4,3,301),(111,4,4,302);

INSERT INTO date_time (date_time_id,date,time)
VALUES 
(501,'2019/01/15','20:00'),
(502,'2019/03/05','19:40'),
(503,'2019/11/19','15:00'),
(504,'2020/08/12','12:00'),
(505,'2018/04/10','15:30'),
(506,'2017/07/17','20:00'),
(507,'2020/10/10','18:00'),
(508,'2019/03/13','21:10'),
(509,'2018/08/18','19:40'),
(510,'2020/09/07','1:00'),
(511,'2019/06/19','3:00');

INSERT INTO staff (staff_id,staff_type,staff_number_max,staff_cost)
VALUES 
(401,'security',50,110),
(402,'waiter',100,80),
(403,'loader',10,75),
(404,'cook',25,120),
(405,'photographer',5,130),
(406,'cameraman',3,90),
(407,'cleaner',11,60),
(408,'manager',2,200),
(409,'narrator',1,150),
(410,'guest_taker',4,100),
(411,'visagiste',2,110);

INSERT INTO staff_list (event_id,staff_id,staff_number)
VALUES
(1,401,10),(1,402,15),(1,403,3),(1,404,8),(1,405,2),(1,406,1),(1,407,2),(1,408,1),(1,410,1),
(2,401,5),(2,403,10),(2,405,3),(2,406,2),(2,407,3),(2,408,1),(2,409,1),(2,411,3),
(3,401,2),(3,402,1),(3,403,1),(3,404,2),(3,407,2),(3,408,1),
(4,401,2),(4,402,10),(4,404,5),(4,405,1),(4,406,1),(4,407,5),(4,408,1),(4,409,1),(4,410,1),
(5,401,1),(5,405,1),(5,406,1),(5,407,10),(5,409,2),
(6,404,2),(6,405,1),(6,406,1),
(7,401,10),(7,402,1),(7,403,5),(7,405,2),(7,406,2),(7,407,5),(7,408,1),(7,409,1),(7,411,2),
(8,402,5),(8,404,2),(8,405,1),(8,406,1),(8,409,1),(8,410,1),
(9,401,20),(9,402,2),(9,405,2),(9,406,2),(9,407,5),(9,409,1),(9,411,2),
(10,404,2),(10,405,1),(10,406,1),
(11,401,15),(11,403,5),(11,404,3),(11,405,2),(11,406,2),(11,408,1),(11,409,1),(11,411,2);

INSERT INTO staff_list (event_id,staff_id,staff_number)
VALUES 
(11,401,15),
(11,403,5),
(11,404,3),
(11,405,2),
(11,406,2),
(11,408,1),
(11,409,1),
(11,411,2);

INSERT INTO organization (event_id,band_id,loc_id,date_time_id)
VALUES 
(1,101,201,501),
(2,102,202,502),
(3,103,203,503),
(4,104,204,504),
(5,105,205,505),
(6,106,206,506),
(7,107,207,507),
(8,109,208,508),
(9,108,209,509),
(10,110,210,510),
(11,111,211,511);

UPDATE event SET event_name = 'Christamas_event' WHERE event_id = 11;
DELETE FROM event WHERE event_name = 'Christmas_event';

UPDATE organization SET loc_id = 210, band_id = 110 WHERE event_id = 11;
DELETE FROM organization WHERE event_id = 11;

UPDATE location SET city = 'Ust_Kamenogorsk' WHERE city = 'Uskaman';
DELETE FROM location WHERE location = 'Abu_dabi_plaza';

UPDATE band_member_instrument SET band_member_id = 3 WHERE band_id = 111 and band_member_id = 4;
UPDATE band_member_instrument SET band_members = 3 WHERE band_id = 111;
DELETE FROM band_member_instrument WHERE band_id = 111;

UPDATE band_member SET member_name = 'Kirk_Ghemmet' WHERE band_id = 108 and band_member_id = 3;
DELETE FROM band_member WHERE band_id = 111;

UPDATE band SET band_cost = 600 WHERE band_name = 'Cucumber';
DELETE FROM band WHERE band_id = 111;

UPDATE staff_list SET staff_number = 2 WHERE event_id = 10 and staff_id = 406;
DELETE FROM staff_list WHERE staff_id = 410;

UPDATE staff SET staff_cost = 120 WHERE staff_id = 411;
DELETE FROM staff WHERE staff_id = 410;

UPDATE date_time SET time = '20:20' WHERE date_time_id = 501;
DELETE FROM date_time WHERE date_time_id = 511;

UPDATE instruments SET instrument_name = 'electric_giutar' WHERE instrument_id = 311;
DELETE FROM instruments WHERE instrument_id = 311;

--number 6
SELECT DISTINCT * FROM event WHERE event_id BETWEEN 5 AND 9;                                                                         --(1)
SELECT loc_id,COUNT(location) AS nameLength, LENGTH(location) AS sumOfLength FROM location GROUP BY loc_id;                          --(2)
SELECT SUM(band_cost) AS sumCost FROM band WHERE band_id > 103 and band_id < 106;                                                    --(3)
SELECT band.band_id,member_name FROM band_member JOIN band ON band.band_id = band_member.band_id;                                    --(4)

SELECT band_member.band_id,band_member.band_member_id,member_name,instrument_id FROM band_member INNER JOIN band_member_instrument   --(5)
ON band_member.band_member_id = band_member_instrument.band_member_id AND band_member.band_id = band_member_instrument.band_id;

SELECT member_name,instrument_name FROM band_member_instrument LEFT JOIN instruments                                                 --(6)
ON band_member_instrument.instrument_id = instruments.instrument_id RIGHT JOIN band_member
ON band_member.band_id = band_member_instrument.band_id AND band_member.band_member_id = band_member_instrument.band_member_id;

SELECT date,time FROM date_time WHERE time > '15:00';                                                                                --(7)
SELECT SUM(staff_number_max) AS allStaff FROM staff;                                                                                 --(8)
SELECT to_char(AVG(staff_cost),'999.99') AS avgCost FROM staff WHERE staff_cost > 90;                                                --(9)
SELECT MAX(staff_number) AS maxStaff, MIN(staff_number) AS minStaff FROM staff_list;                                                 --(10)

--number 7
SELECT event_name,date,time FROM date_time JOIN organization ON  --(1)
date_time.date_time_id = organization.date_time_id JOIN event ON
event.event_id = organization.event_id;

SELECT event_id,staff_type,staff_cost,staff_number,(staff_cost * staff_number) AS sumCost FROM staff JOIN staff_list ON --(2)
staff.staff_id = staff_list.staff_id;

SELECT event_name,band_name FROM event JOIN organization ON
event.event_id = organization.event_id JOIN band ON band.band_id = organization.band_id ORDER BY event_name; --(3)

SELECT band_name,location,country,city,loc_cost FROM band JOIN organization ON
band.band_id = organization.band_id JOIN location ON location.loc_id = organization.loc_id; --(4)

SELECT event_name,location,country,city FROM event JOIN organization ON --(5)
event.event_id = organization.event_id JOIN location ON 
location.loc_id = organization.loc_id;

SELECT * FROM event;
SELECT * FROM location;
SELECT * FROM band;
SELECT * FROM instruments;
SELECT * FROM band_member;
SELECT * FROM band_member_instrument;
SELECT * FROM date_time;
SELECT * FROM staff;
SELECT * FROM staff_list;
SELECT * FROM organization;