/*
Marcelo Morales - lmoral10
Peter Novello - pnovell1
*/

DROP TABLE IF EXISTS Video;
DROP TABLE IF EXISTS UserProfile;
DROP TABLE IF EXISTS Song;
DROP TABLE IF EXISTS Artist;
DROP TABLE IF EXISTS Album;
DROP TABLE IF EXISTS Revenue;
DROP TABLE IF EXISTS Player;

CREATE TABLE Video (
  videoId BigInt NOT NULL,
  username VARCHAR(255),
  caption VARCHAR(255),
  commentCount SMALLINT NOT NULL,
  likeCount SMALLINT NOT NULL,
  PRIMARY KEY(videoId)
);

LOAD DATA LOCAL INFILE '/Users/marcelomorales/Desktop/SPRING2022JHU/databases/tiktok-database/text-datasets/video.txt'
INTO TABLE Video
FIELDS TERMINATED BY '$'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM Video;

CREATE TABLE UserProfile (
  username VARCHAR(255),
  personName VARCHAR(255),
  userBio VARCHAR(255),
  verified VARCHAR(255), 
  followerCount BIGINT NOT NULL,
  likeNumber BIGINT NOT NULL,
  PRIMARY KEY(username)
);

LOAD DATA LOCAL INFILE '/Users/marcelomorales/Desktop/SPRING2022JHU/databases/tiktok-database/text-datasets/userprofile.txt'
INTO TABLE UserProfile
FIELDS TERMINATED BY '%'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM UserProfile;


CREATE TABLE Song (
  audioId BigInt NOT NULL,
  title VARCHAR(500),
  artist VARCHAR(500), 
  PRIMARY KEY(audioId)
);

LOAD DATA LOCAL INFILE '/Users/marcelomorales/Desktop/SPRING2022JHU/databases/tiktok-database/text-datasets/song.txt'
INTO TABLE Song
FIELDS TERMINATED BY '#'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


SELECT * FROM Song;



CREATE TABLE Artist (
  artistName VARCHAR(500),
  audioId BigInt NOT NULL,
  PRIMARY KEY(audioId)
);

LOAD DATA LOCAL INFILE '/Users/marcelomorales/Desktop/SPRING2022JHU/databases/tiktok-database/text-datasets/artist.txt'
INTO TABLE Artist
FIELDS TERMINATED BY '*'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM Artist;




CREATE TABLE Album (
  albumName VARCHAR(500),
  artistName VARCHAR(500),
  releaseYear int NOT NULL,
  studio VARCHAR(500),
  PRIMARY KEY(albumName, artistName)
);

LOAD DATA LOCAL INFILE '/Users/marcelomorales/Desktop/SPRING2022JHU/databases/tiktok-database/text-datasets/album.txt'
INTO TABLE Album
FIELDS TERMINATED BY '#'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM Album;




CREATE TABLE Revenue (
  audioId BigInt NOT NULL,
  amount DECIMAL(10, 2),
  PRIMARY KEY(audioId)
);

LOAD DATA LOCAL INFILE '/Users/marcelomorales/Desktop/SPRING2022JHU/databases/tiktok-database/text-datasets/revenue.txt'
INTO TABLE Revenue
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM Revenue;


SELECT Song.title, Song.artist, MIN(Revenue.amount) AS Revenue
    FROM Song, Revenue
    WHERE Song.audioId = Revenue.audioId;
    

SELECT * FROM UserProfile;

SELECT AVG(UserProfile.followerCount)
    FROM UserProfile
    WHERE UserProfile.likeNumber > 1200000
    ;
    
    





