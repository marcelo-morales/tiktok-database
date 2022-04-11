CREATE TABLE Video (
  videoId BigInt NOT NULL,
  username VARCHAR(255),
  caption VARCHAR(255),
  comments VARCHAR(255),
  PRIMARY KEY(videoId)
);

LOAD DATA LOCAL INFILE '/Users/marcelomorales/Desktop/SPRING2022JHU/databases/tiktok-database/video.txt'
INTO TABLE Video
FIELDS TERMINATED BY '$'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM Video;


CREATE TABLE UserProfile (
  username VARCHAR(255),
  userBio VARCHAR(255),
  verified VARCHAR(255), 
  followerCount int NOT NULL,
  PRIMARY KEY(username)
);

LOAD DATA LOCAL INFILE '/Users/marcelomorales/Desktop/SPRING2022JHU/databases/tiktok-database/userprofile.txt'
INTO TABLE UserProfile
FIELDS TERMINATED BY '$'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM UserProfile;


CREATE TABLE Song (
  audioId BigInt NOT NULL,
  title VARCHAR(255),
  artist VARCHAR(255), 
  PRIMARY KEY(audioId)
);

LOAD DATA LOCAL INFILE '/Users/marcelomorales/Desktop/SPRING2022JHU/databases/tiktok-database/song.txt'
INTO TABLE Song
FIELDS TERMINATED BY '#'
LINES TERMINATED BY '\n';
SELECT * FROM Song;




CREATE TABLE Artist (
  artistName VARCHAR(255),
  audioId BigInt NOT NULL,
  PRIMARY KEY(artistName)
);

LOAD DATA LOCAL INFILE '/Users/marcelomorales/Desktop/SPRING2022JHU/databases/tiktok-database/artist.txt'
INTO TABLE Artist
FIELDS TERMINATED BY '*'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM Artist;




CREATE TABLE Album (
  albumName VARCHAR(255),
  artistName VARCHAR(255),
  releaseYear int NOT NULL,
  PRIMARY KEY(albumName, artistName)
);

LOAD DATA LOCAL INFILE '/Users/marcelomorales/Desktop/SPRING2022JHU/databases/tiktok-database/album.txt'
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

LOAD DATA LOCAL INFILE '/Users/marcelomorales/Desktop/SPRING2022JHU/databases/tiktok-database/revenue.txt'
INTO TABLE Revenue
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM Revenue;






