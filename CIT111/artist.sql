-- MySQL Workbench Forward Engineering

CREATE DATABASE art_gallery;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

USE art_gallery;

CREATE TABLE artist(
artist_id INT NOT NULL AUTO_INCREMENT,
fname VARCHAR(20) NOT NULL,
mname VARCHAR(20),
lname VARCHAR(20) NOT NULL,
dob INT NOT NULL,
dod INT,
country VARCHAR(25),
local_artist ENUM('y','n'),
PRIMARY KEY(artist_id));

CREATE TABLE IF NOT EXISTS artwork (
  artwork_id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(50) NOT NULL,
  artyear INT NOT NULL,
  period VARCHAR(25) NULL DEFAULT NULL,
  arttype VARCHAR(20) NULL DEFAULT NULL,
  artfile VARCHAR(25) NOT NULL,
  artist_id INT NOT NULL,
  PRIMARY KEY (artwork_id),
    FOREIGN KEY (artist_id)
    REFERENCES artist (artist_id));
    
CREATE TABLE IF NOT EXISTS keyword (
  keyword_id INT NOT NULL AUTO_INCREMENT,
  keyword VARCHAR(15) NOT NULL,
  PRIMARY KEY (keyword_id))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS artwork_has_keyword (
  artwork_id INT NOT NULL,
  keyword_id INT NOT NULL,
  PRIMARY KEY (artwork_id, keyword_id),
  CONSTRAINT fk_artwork_has_keyword_artwork1
    FOREIGN KEY (artwork_id)
    REFERENCES artwork (artwork_id),
  CONSTRAINT fk_artwork_has_keyword_keyword1
    FOREIGN KEY (keyword_id)
    REFERENCES keyword (keyword_id))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- All the INSERT commands

SELECT * FROM artist;
INSERT INTO artist(fname, mname, lname, dob, dod, country, local_artist) VALUES
('Vincent', DEFAULT, 'Van Gogh', 1853,1890, 'France', 'n'),
('Rembrandt', 'Hermenszoon', 'Van Rijn', 1606,1669, 'Netherlands', 'n'),
('Leonardo', DEFAULT, 'da Vinci', 1452, 1519, 'Italy', 'n'),
('Venture', 'Lonzo', 'Coy', 1965, DEFAULT, 'United States', 'y'),
('Deborah', DEFAULT, 'Gill', 1970, DEFAULT, 'United States','y'),
('Claude', DEFAULT, 'Monet', 1840, 1926, 'France', 'n'),
('Pablo', DEFAULT, 'Picasso', 1904, 1973, 'Spain', 'n'),
('Michelangelo', 'di Lodovico','Simoni', 1475, 1564, 'Italy', 'n');

SELECT * FROM artwork;
INSERT INTO artwork(title, artyear, period, arttype,artfile,artist_id) VALUES
('Irises',1889, 'Impressionism', 'Oil', 'irises.jpg',(SELECT artist_id FROM artist WHERE artist_id=1)),
('The Starry Night',1889, 'Post-Impressionism', 'Oil', 'starrynight.jpg',(SELECT artist_id FROM artist WHERE artist_id=1)),
('Sunflowers',1888, 'Post-Impressionism','Oil','sunflowers.jpg',(SELECT artist_id FROM artist WHERE artist_id=1)),
('NightWatch',1642,'Baroque', 'Oil','nightwatch.jpg',(SELECT artist_id FROM artist WHERE artist_id=2)),
('Storm on the Sea of Galilee', 1633, 'Dutch Golden Age','Oil','stormgalilee.jpg',(SELECT artist_id FROM artist WHERE artist_id=2)),
('Head of a Woman',1508,'High Renaissance', 'Oil','headwoman.jpg',(SELECT artist_id FROM artist WHERE artist_id=3)),
('Last Supper',1498,'Renaissance', 'Tempra','lastsupper.jpg',(SELECT artist_id FROM artist WHERE artist_id=3)),
('Mona Lisa',1517,'Renaissance','Oil','monalisa.jpg',(SELECT artist_id FROM artist WHERE artist_id=3)),
('Hillside Stream',2005,'Modern','Oil','hillsidestream.jpg',(SELECT artist_id FROM artist WHERE artist_id=4)),
('Old Barn',1992,'Modern','Oil','oldbarn',(SELECT artist_id FROM artist WHERE artist_id=4)),
('Beach Baby',1999,'Modern','Watercolor','beachbaby.jpg',(SELECT artist_id FROM artist WHERE artist_id=5)),
('Women in the Garden',1886,'Impressionism','Oil','womengarde.jpg',(SELECT artist_id FROM artist WHERE artist_id=6)),
('Old Guitarist',1904,'Modern','Oil','guitarist.jpg',(SELECT artist_id FROM artist WHERE artist_id=7));

SELECT * FROM keyword;
INSERT INTO keyword(keyword_id,keyword)VALUES
(1,'flowers'),
(2,'blue'),
(3,'landscape'),
(4,'girl'),
(5,'people'),
(6,'battle'),
(7,'boat'),
(8,'water'),
(9,'Christ'),
(10,'food'),
(11,'baby');

SELECT * FROM artwork_has_keyword;

INSERT INTO artwork_has_keyword VALUES
(1,1),
(2,2),
(2,3),
(3,1),
(4,4),
(4,5),
(4,6),
(5,7),
(5,8),
(5,5),
(5,9),
(6,4),
(6,5),
(7,10),
(7,5),
(7,9),
(8,4),
(8,5),
(9,8),
(9,3),
(10,3),
(11,8),
(11,5),
(11,11),
(12,3),
(12,5),
(12,1),
(13,2),
(13,5);