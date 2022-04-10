CREATE TABLE Video (
  videoId int NOT NULL,
  username VARCHAR(255),
  caption VARCHAR(255),
  comments VARCHAR(255),
  PRIMARY KEY(videoId)
);

LOAD DATA LOCAL INFILE '/Users/marcelomorales/Desktop/SPRING2022JHU/databases/tiktok-database/video-small.txt'
INTO TABLE Video
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE UserProfile (
  username VARCHAR(255),
  userBio VARCHAR(255),
  verified VARCHAR(255), 
  followerCount int NOT NULL,
  PRIMARY KEY(username)
);

LOAD DATA LOCAL INFILE '/Users/marcelomorales/Desktop/SPRING2022JHU/databases/tiktok-database/userprofile-small.txt'
INTO TABLE Video
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE Song (
  audioId int NOT NULL,
  title VARCHAR(255),
  artist VARCHAR(255), 
  PRIMARY KEY(audioId)
);

LOAD DATA LOCAL INFILE '/Users/marcelomorales/Desktop/SPRING2022JHU/databases/tiktok-database/song-small.txt'
INTO TABLE Video
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE Artist (
  artistName VARCHAR(255),
  audioId int NOT NULL,
  PRIMARY KEY(artistName)
);

LOAD DATA LOCAL INFILE '/Users/marcelomorales/Desktop/SPRING2022JHU/databases/tiktok-database/artist-small.txt'
INTO TABLE Video
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE Album (
  albumName VARCHAR(255),
  artistName VARCHAR(255),
  releaseYear int NOT NULL,
  PRIMARY KEY(albumName, artistName)
);

LOAD DATA LOCAL INFILE '/Users/marcelomorales/Desktop/SPRING2022JHU/databases/tiktok-database/album-small.txt'
INTO TABLE Video
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE Revenue (
  audioId VARCHAR(255),
  amount DOUBLE
);

LOAD DATA LOCAL INFILE '/Users/marcelomorales/Desktop/SPRING2022JHU/databases/tiktok-database/revenue-small.txt'
INTO TABLE Video
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



