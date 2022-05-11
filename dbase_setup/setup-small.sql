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

CREATE TABLE Video (
  videoId BigInt NOT NULL,
  username VARCHAR(255),
  caption VARCHAR(255),
  commentCount BIGINT NOT NULL,
  likeCount BIGINT NOT NULL,
  PRIMARY KEY(videoId)
);

LOAD DATA LOCAL INFILE './text-datasets/video-small.txt'
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

LOAD DATA LOCAL INFILE './text-datasets/userprofile-small.txt'
INTO TABLE UserProfile
FIELDS TERMINATED BY '%'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM UserProfile;


CREATE TABLE Song (
  audioId BIGINT NOT NULL,
  title VARCHAR(500),
  artist VARCHAR(500), 
  PRIMARY KEY(audioId)
);

LOAD DATA LOCAL INFILE './text-datasets/song-small.txt'
INTO TABLE Song
FIELDS TERMINATED BY '#'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


SELECT * FROM Song;



CREATE TABLE Artist (
  artistName VARCHAR(500),
  audioId BIGINT NOT NULL,
  PRIMARY KEY(audioId)
);

LOAD DATA LOCAL INFILE './text-datasets/artist-small.txt'
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

LOAD DATA LOCAL INFILE './text-datasets/album-small.txt'
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

LOAD DATA LOCAL INFILE './text-datasets/revenue-small.txt'
INTO TABLE Revenue
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

DELIMITER //


-- Stored Procedures

DROP PROCEDURE IF EXISTS Query1 //

CREATE PROCEDURE Query1()
BEGIN
    SELECT Song.title, Song.artist, MIN(Revenue.amount) AS Minimum_Revenue
        FROM Song, Revenue
        WHERE Song.audioId = Revenue.audioId;
END; //

DELIMITER ;

DELIMITER //

DROP PROCEDURE IF EXISTS Query2 //

CREATE PROCEDURE Query2()
BEGIN
    SELECT ROUND(AVG(UserProfile.followerCount), 0)
        FROM UserProfile
        WHERE UserProfile.likeNumber > 1200000;

END; //

DELIMITER ;

DELIMITER //

DROP PROCEDURE IF EXISTS Query3 //

CREATE PROCEDURE Query3()
BEGIN
    SELECT Artist.artistName, COUNT(Artist.artistName) AS 'frequency'
    FROM Artist
    GROUP BY Artist.artistName
    ORDER BY
    COUNT(Artist.artistName) DESC;
    
END; //

DELIMITER ;


DELIMITER //

DROP PROCEDURE IF EXISTS Query4 //

CREATE PROCEDURE Query4()

BEGIN

    DECLARE currentYear INT;
    SET currentYear = 2022;

    SELECT Album.albumName, COUNT(Album.albumName) as 'frequency', Album.releaseYear
    FROM Album
    WHERE currentYear -  Album.releaseYear >= 2
    GROUP BY Album.albumName
    ORDER BY COUNT(Album.albumName) DESC ;
    
END; //

DELIMITER ;

DELIMITER //

DROP PROCEDURE IF EXISTS Query5 //

CREATE PROCEDURE Query5()
BEGIN
    SELECT Song.title, Revenue.amount
    FROM Song
    JOIN Revenue ON Song.audioId = Revenue.audioId
    WHERE Revenue.amount > 10000 
    GROUP BY Revenue.amount DESC;

END; //

DELIMITER ;

DELIMITER //

DROP PROCEDURE IF EXISTS Query6 //

CREATE PROCEDURE Query6()
BEGIN
     WITH averageViews(averageLikeNumber) as 
        (SELECT AVG(Video.likeCount)
        FROM Video)
        SELECT Video.username, Video.caption, Video.likeCount
        FROM Video, averageViews
        WHERE Video.likeCount > averageViews.averageLikeNumber;

END; //

DELIMITER ;

DELIMITER //

DROP PROCEDURE IF EXISTS Query7 //

CREATE PROCEDURE Query7()
BEGIN
    SELECT UserProfile.username, UserProfile.followerCount, AVG(UserProfile.likeNumber)
      FROM UserProfile
      GROUP BY UserProfile.username;
END; //

DELIMITER ;


DELIMITER //

DROP PROCEDURE IF EXISTS Query8 //

CREATE PROCEDURE Query8()
BEGIN

    SELECT Artist.artistname, Song.title
    FROM Artist
    JOIN Song ON Song.audioId = Artist.audioId
    WHERE Artist.artistname LIKE '%A%';

    
END; //

DELIMITER ;

DELIMITER //

DROP PROCEDURE IF EXISTS Query12 //

CREATE PROCEDURE Query12()
BEGIN
    SELECT Video.username, Video.caption
    FROM Video
    WHERE LENGTH(Video.caption) > 50
    GROUP BY Video.username;
    
END; //

DELIMITER ;

DELIMITER //

DROP PROCEDURE IF EXISTS Query14 //

CREATE PROCEDURE Query14()
BEGIN
    SELECT UserProfile.userName, UserProfile.likeNumber
    FROM UserProfile 
    WHERE UserProfile.verified LIKE '%True%'
    GROUP BY UserProfile.userName;

END; //

DELIMITER ;

DELIMITER //

DROP PROCEDURE IF EXISTS Query15 //

CREATE PROCEDURE Query15()
BEGIN
     
    WITH maxArtist AS (
        SELECT MAX(Revenue.amount) AS 'highest', Artist.audioID AS 'maxArtist'
        FROM Revenue NATURAL JOIN Artist
    )
    SELECT Song.title, Song.artist, Revenue.amount 
    FROM Song JOIN maxArtist ON
        Song.audioID = maxArtist.maxArtist
        JOIN Revenue ON
        Song.audioID = Revenue.audioID
    ORDER BY Revenue.amount ASC;
    
END; //

DELIMITER ;



DELIMITER //

DROP PROCEDURE IF EXISTS TikTokProfileInfo //

CREATE PROCEDURE TikTokProfileInfo(IN usernameInput VARCHAR(50))
BEGIN
      SELECT username, personName, followerCount, likeNumber, userBio
      FROM UserProfile
      WHERE usernameInput = username
      ORDER BY username;
END; //

DELIMITER ;

DELIMITER //

DROP PROCEDURE IF EXISTS RevenueMoreThan //

CREATE PROCEDURE RevenueMoreThan(IN revenueAmount BigInt)
BEGIN
      SELECT Song.title, Revenue.amount
      FROM Song, Revenue
      WHERE Song.audioId = Revenue.audioId AND Revenue.amount > revenueAmount;
END; //

DELIMITER ;

DELIMITER //

DROP PROCEDURE IF EXISTS InsertNewVideo //

CREATE PROCEDURE InsertNewVideo(IN videoIdParam BigInt, IN usernameParam VARCHAR(255), IN captionParam VARCHAR(255), 
  IN commentCountParam SMALLINT, IN likeCountParam SMALLINT
 )
BEGIN
      INSERT INTO Video (videoId, username, caption, commentCount, likeCount)
      VALUES (videoIdParam, usernameParam, captionParam, commentCountParam, likeCountParam);

      SELECT Video.videoId, Video.username, Video.caption, Video.commentCount, Video.likeCount
      FROM Video;

END; //

DELIMITER ;

DELIMITER //

DROP PROCEDURE IF EXISTS DeleteVideo //

CREATE PROCEDURE DeleteVideo(IN videoIdParam BigInt)
BEGIN
      
  DELETE FROM Video WHERE videoId=videoIdParam;

  SELECT Video.videoId, Video.username, Video.caption, Video.commentCount, Video.likeCount
  FROM Video;


END; //


DELIMITER ;

DELIMITER //

DROP PROCEDURE IF EXISTS InsertNewSong //

CREATE PROCEDURE InsertNewSong(IN audioIdParam BigInt, IN titleParam VARCHAR(255), IN artistParam VARCHAR(255), 
  IN amountParam SMALLINT
 )
BEGIN
     INSERT INTO Song (audioId, title, artist)
     VALUES (audioIdParam, titleParam, artistParam);


     INSERT INTO Revenue (audioId, amount)
     VALUES (audioIdParam, amountParam);

     SELECT Song.audioId, Song.title, Song.artist, Revenue.amount
     FROM Song, Revenue
     WHERE Song.audioId = Revenue.audioID;

END; //

DELIMITER ;

DELIMITER //

DROP PROCEDURE IF EXISTS DeleteSong //

CREATE PROCEDURE DeleteSong(IN audioIdParam BigInt)
BEGIN
      
  DELETE FROM Song WHERE Song.audioId=audioIdParam;
  DELETE FROM Revenue WHERE Revenue.audioId=audioIdParam;

  SELECT Song.audioId, Song.title, Song.artist, Revenue.amount
  FROM Song
  JOIN Revenue ON Song.audioId = Revenue.audioId;  

END; //

DELIMITER ;

DELIMITER //

DROP PROCEDURE IF EXISTS Query9 //

CREATE PROCEDURE Query9()
BEGIN

SELECT  UserProfile.username, UserProfile.userBio
FROM UserProfile
WHERE UserProfile.userBio LIKE '%hey%' AND UserProfile.verified LIKE '%True%'
AND UserProfile.likeNumber > 100000;

    
END; //

DELIMITER ;


DELIMITER //

DROP PROCEDURE IF EXISTS Query10 //

CREATE PROCEDURE Query10()
BEGIN

SELECT Album.albumName, Album.artistName,  Album.releaseYear, Album.studio
FROM Album
WHERE Album.releaseYear > 2020;
    
END; //

DELIMITER ;


DELIMITER //

DROP PROCEDURE IF EXISTS Query11 //

CREATE PROCEDURE Query11()
BEGIN

SELECT Video.videoId, Video.caption
FROM Video
WHERE Video.caption LIKE '%#fyp%' OR Video.caption LIKE '%#foryoupage%' OR Video.caption LIKE '%#foryou%'
AND Video.likeCount > 1000000;
    
END; //

DELIMITER ;

DELIMITER //

DROP PROCEDURE IF EXISTS Query13 //

CREATE PROCEDURE Query13()
BEGIN

  SELECT Album.studio,  COUNT(Album.studio)
  FROM Album
  GROUP BY Album.studio
  ORDER BY
  COUNT(Album.studio) DESC;
    
END; //

DELIMITER ;




