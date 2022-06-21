
-- Very Easy
CREATE DATABASE sqlGuide;
USE sqlGuide;

CREATE TABLE favCars(
carMake		VARCHAR(20),
carModel	VARCHAR(20),
carYear 	YEAR);

INSERT INTO favCars
VALUES 
('Pontiac',	'Solstice',	2005),
('Toyota',	'Corolla E70',1980),
('Pontiac',	'FireBird', 2022);

INSERT INTO favCars
VALUES
('Volvo', '240', 1977),
('Delorean','DMC-12',1981);

-- Easy

CREATE TABLE favBooks(
title	VARCHAR(50),
publishDate	DATE,
authorFirstName	VARCHAR(50),
authorLastName	VARCHAR(50));

INSERT INTO favBooks
VALUES
('Gregor the Overlander','2003-09-01',	'Suzanne',	'Collins'),
('One Piece Volume 76',	'2014-12-27',	'Eiichiro',	'Oda'),
("Dead Dead Demon's Dededede Destruction",	'2014-09-30',	'Inio',	'Asano'),
('Dorohedoro',	'2000-11-30',	'Q',	'Hayashida'),
('Akira','1982-12-20','Katushiro','Otomo'); 

INSERT INTO favBooks
VALUES
("Jojo's Bizarre Adventure: Steel Ball Run",'2004-01-19','Hirohiko','Araki'),
('Monster','1994-12-01','Naoki','Urasawa');

SET SQL_SAFE_UPDATES=0;


DELETE FROM favBooks 
ORDER BY publishDate
ASC LIMIT 1;

SELECT * FROM favBooks;

-- Medium
CREATE TABLE favMovies(
title	VARCHAR(50),
publishDate	DATE,
rating	DECIMAL(3,1));

INSERT INTO favMovies
VALUES
("Howl's Moving Castle",'2004-11-20',8.2),
('Forrest Gump',"1994-07-06",8.8),
('Lilo & Stitch',"2002-06-21",7.3),
('Drive',"2011-09-16",7.8),
('Toy Story 2', "1999-11-24",7.9),
('Zootopia',"2016-03-04",8),
('The End of Evangelion',"1997-06-19",8),
('Akira',"1988-07-16",8),
('Redline',"2010-10-09",7.5),
('Shrek 2',"2004-05-19",7.3);

SELECT * FROM favMovies
WHERE title LIKE("s%")
ORDER BY publishDate DESC;
-- Hard
CREATE TABLE favMoviesCopy 
AS SELECT *  FROM  favMovies;

ALTER TABLE favMoviesCopy
ADD COLUMN directorFirstName VARCHAR(50),
ADD COLUMN directorLastName VARCHAR(50);

SET SQL_SAFE_UPDATES=0;
UPDATE favMoviesCopy SET directorFirstName="Hayao", directorLastName='Miyazaki' WHERE title="Howl's Moving Castle";
UPDATE favMoviesCopy SET directorFirstName='Robert', directorLastName='Zemeckis' WHERE title='Forrest Gump';
UPDATE favMoviesCopy SET directorFirstName='Chris', directorLastName='Sanders' WHERE title='Lilo & Stitch';
UPDATE favMoviesCopy SET directorFirstName='Nicolas', directorLastName='Refn' WHERE title='Drive';
UPDATE favMoviesCopy SET directorFirstName='John', directorLastName='Lasseter' WHERE title='Toy Story 2';
UPDATE favMoviesCopy SET directorFirstName='Byron', directorLastName='Howard' WHERE title='Zootopia';
UPDATE favMoviesCopy SET directorFirstName='Hideaki', directorLastName='Anno' WHERE title='The End of Evangelion';
UPDATE favMoviesCopy SET directorFirstName='Katsuhiro', directorLastName='Otomo' WHERE title='Akira';
UPDATE favMoviesCopy SET directorFirstName='Takeshi', directorLastName='Koike' WHERE title='Redline';
UPDATE favMoviesCopy SET directorFirstName='Andrew', directorLastName='Adamson' WHERE title='Shrek 2';

SELECT CONCAT(`directorFirstName`, " ", `directorLastName`) AS "directorFullName" FROM favMoviesCopy;

SELECT * FROM favMoviesCopy
ORDER BY directorLastName ASC;

SET SQL_SAFE_UPDATES=0;

SELECT * FROM favMoviesCopy ORDER BY directorLastName ASC;

DELETE FROM favMoviesCopy WHERE directorLastName REGEXP '[R-Z]$';

SELECT * FROM favMoviesCopy LIMIT 3;

-- Very Hard

CREATE TABLE favCarsCopy
AS SELECT *  FROM  favCars;

ALTER TABLE favCarsCopy
ADD COLUMN carColor VARCHAR(50),
ADD COLUMN carPrice	INT(6);

INSERT INTO favCarsCopy
VALUES
('Toyota','Corolla',2002,	'silver','15068'),
('BMW',	'E30 M3',	1982,	'red',	'60756'),
('Subaru','WRX',	2005,	'blue',	'20620');

SELECT CONCAT (`carMake`, " - ", `carModel`) AS "carmakeModel" from favCarsCopy;

ALTER TABLE favCarsCopy
ADD COLUMN carMakeCount INT;

SELECT carMake, COUNT(carMake) FROM favCarsCopy GROUP BY carMake HAVING COUNT(carMake)>1;


