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
loc_cost DECIMAL,
PRIMARY KEY (loc_id)
);

CREATE TABLE band( --this is information about celebrities
band_id INT,
band_name VARCHAR(32),
band_cost DECIMAL,
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
band_members DECIMAL,
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
staff_number_max DECIMAL,
staff_cost DECIMAL,
PRIMARY KEY (staff_id)
);

CREATE TABLE staff_list( --this is information about the staff who are at the event
event_id INT,
staff_id INT,
staff_number DECIMAL,
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