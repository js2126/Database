CREATE DATABASE Project1;

CREATE TABLE customer (
	cid	CHAR(4)	PRIMARY KEY,
	firstName VARCHAR(255),
	lastName VARCHAR(255),	
	gender CHAR(1)  CHECK ( gender IN ('F', 'M') ),
	town VARCHAR(255)
);

CREATE TABLE hotel (
	hid	CHAR(4)	PRIMARY KEY,
	name VARCHAR(255),
	town VARCHAR(255),
	UNIQUE(name, town)
);

CREATE TABLE room (
	hid	CHAR(4),
	num	INTEGER CHECK (num > 0),
	type CHAR(6) CHECK (type IN ('Single', 'Double', 'Family')),
	PRIMARY KEY (hid, num),
	FOREIGN KEY (hid) REFERENCES hotel (hid)
);

DROP TABLE IF EXISTS room;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS hotel;

CREATE TABLE booking (
	hid CHAR(4),
	cid CHAR(4),
	dstart DATE,
	ndays VARCHAR(4),
	PRIMARY KEY (hid, cid, dstart),
	room INTEGER CHECK (room > 0)
); 

ALTER TABLE booking
ADD FOREIGN KEY (cid) REFERENCES customer(cid);

ALTER TABLE booking
ADD FOREIGN KEY (hid, room) REFERENCES room (hid, num);

SELECT * FROM booking;

INSERT INTO booking
VALUES ('A212', '6C31', '11/03/1986', '453', '2');

INSERT INTO booking
VALUES ('C2A1', '3C4T', '11/03/1986', '23', '3');

ALTER TABLE booking
ADD Hotel VARCHAR(50);

ALTER TABLE booking
ADD Location VARCHAR(50);

UPDATE booking
SET Hotel = 'Hamlets'
WHERE hid = 'A212';

UPDATE booking
SET Location = 'London'
WHERE hid = 'A212';

UPDATE booking
SET Hotel = 'Xero'
WHERE hid = 'C2A1';

UPDATE booking
SET Location = 'Manchester'
WHERE hid = 'C2A1';

ALTER TABLE booking
ADD Room_Type VARCHAR(50);

ALTER TABLE booking
ADD Dates VARCHAR(60);

UPDATE booking
SET Room_Type = 'Double'
WHERE hid = 'A212';

UPDATE booking
SET Room_Type = 'Single'
WHERE hid = 'C2A1';

ALTER TABLE booking
DROP COLUMN Dates;

ALTER TABLE booking
ADD start_date DATE;

ALTER TABLE booking
ADD end_date DATE;

UPDATE booking
SET start_date = '6/20/1986'
WHERE hid = 'A212';

UPDATE booking
SET end_date = '6/25/1986'
where hid = 'A212';

UPDATE booking
SET ndays = '6'
WHERE hid = 'A212';

UPDATE booking
SET ndays = '10'
WHERE hid = 'C2A1';

UPDATE booking
SET start_date = '3/15/1986'
WHERE hid = 'C2A1';

UPDATE booking
SET end_date = '3/24/1986'
WHERE hid = 'C2A1';

SELECT * FROM booking;

INSERT INTO booking (
	hid,
	cid,
	dstart,
	ndays,
	room,
	Hotel,
	Location,
	Room_Type,
	start_date,
	end_date
 )
 VALUES (
	'Z1A5',
	'7C28',
	'11/29/1988',
	'6',
	'2',
	'Hampton',
	'Leeds',
	'Double',
	'11/29/1988',
	'12/12/1988'
),
(
	'A6Y5',
	'5G9Y',
	'04/5/1989',
	'5',
	'2',
	'Peyington',
	'Yorkshire',
	'Single',
	'4/5/1989',
	'4/20/1989'
),
(
	'A6Y5',
	'556Y',
	'04/12/1989',
	'5',
	'3',
	'Peyington',
	'Yorkshire',
	'Triple',
	'4/12/1989',
	'4/25/1989'
),
(
	'Z1A5',
	'7C23',
	'11/24/1988',
	'8',
	'1',
	'Hampton',
	'Leeds',
	'Double',
	'11/24/1988',
	'12/12/1988'
);

SELECT * FROM booking;
