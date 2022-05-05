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
  commentCount SMALLINT NOT NULL,
  likeCount SMALLINT NOT NULL,
  PRIMARY KEY(videoId)
);

LOAD DATA LOCAL INFILE './text-datasets/video.txt'
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

LOAD DATA LOCAL INFILE './text-datasets/userprofile.txt'
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

LOAD DATA LOCAL INFILE './text-datasets/song.txt'
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

LOAD DATA LOCAL INFILE './text-datasets/artist.txt'
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

LOAD DATA LOCAL INFILE './text-datasets/album.txt'
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

LOAD DATA LOCAL INFILE './text-datasets/revenue.txt'
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
    SELECT AVG(UserProfile.followerCount)
        FROM UserProfile
        WHERE UserProfile.likeNumber > 1200000
    ;
    
    ;
END; //

DELIMITER ;

DELIMITER //

DROP PROCEDURE IF EXISTS Query3 //

CREATE PROCEDURE Query3()
BEGIN

    SELECT Artist.artistName, COUNT (Artist.artistName) AS 'frequency'
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

    SELECT Album.albumName, COUNT (Album.albumName) as 'frequency', Album.releaseYear
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
    SELECT UserProfile.username, AVG(UserProfile.followerCount) AS 'averageFollowerCount'
    FROM UserProfile, Video
    WHERE UserProfile.username = Video.username; 
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






-- SELECT * FROM Revenue;


-- SELECT Song.title, Song.artist, MIN(Revenue.amount) AS Revenue
--     FROM Song, Revenue
--     WHERE Song.audioId = Revenue.audioId;
    

-- SELECT * FROM UserProfile;

-- SELECT AVG(UserProfile.followerCount)
--     FROM UserProfile
--     WHERE UserProfile.likeNumber > 1200000
--     ;
    
-- SELECT Artist.artistName, COUNT (Artist.artistName) as 'frequency'
--     FROM Artist
--     ORDER BY 'frequency';
    
 
--  SELECT Artist.artistName, COUNT (Artist.artistName) AS 'frequency'
--  FROM Artist
--  GROUP BY Artist.artistName
--  ORDER BY
--  COUNT(Artist.artistName) DESC;
    
    
-- SELECT * FROM Artist;

-- SELECT * FROM Album;


-- SELECT Album.albumName, COUNT (Album.albumName) as 'frequency', Album.releaseYear
--     FROM Album
--     WHERE 2022 -  Album.releaseYear >= 2
--     GROUP BY Album.albumName
--     ORDER BY COUNT(Album.albumName) DESC ;


-- SELECT * FROM Song;
-- SELECT * FROM Album;

-- SELECT Song.title, Song.artist, MIN(Revenue.amount) AS Minimum_Revenue
--         FROM Song, Revenue
--         WHERE Song.audioId = Revenue.audioId;
        
--  SELECT AVG(UserProfile.followerCount) AS Average_Follower_Count
--         FROM UserProfile
--         WHERE UserProfile.likeNumber > 1200000;


-- SELECT Song.title, Album.studio
--     FROM Song
--     JOIN Album ON Song.artist = Album.artistName ;
    

        
--  WITH averageViews(averageLikeNumber) as 
--         (SELECT AVG(Video.likeCount)
--         FROM Video)
--         SELECT Video.username, Video.caption, Video.likeCount
--         FROM Video, averageViews
--         WHERE Video.likeCount > averageViews.averageLikeNumber;
        
-- SELECT * FROM Video;
-- SELECT * FROM UserProfile;

-- SELECT UserProfile.username, AVG(UserProfile.likeNumber)
--     FROM UserProfile; 
    
-- SELECT UserProfile.username, AVG(UserProfile.followerCount)
--     FROM UserProfile, Video
--     WHERE UserProfile.username = Video.username; 
    
    
 
-- WITH maxArtist AS (
--     SELECT MAX(Revenue.amount) AS 'highest', Artist.audioID AS 'maxArtist'
--     FROM Revenue NATURAL JOIN Artist
-- )
-- SELECT Song.title, Song.artist, Revenue.amount 
-- FROM Song JOIN maxArtist ON
--      Song.audioID = maxArtist.maxArtist
--      JOIN Revenue ON
--      Song.audioID = Revenue.audioID
-- ORDER BY Revenue.amount ASC;


-- SELECT UserProfile.userName
-- FROM UserProfile 
-- WHERE UserProfile.verified LIKE '%True%'
-- GROUP BY UserProfile.userName;




-- SELECT UserProfile.userName, UserProfile.likeNumber
-- FROM UserProfile 
-- WHERE UserProfile.verified LIKE '%True%'
-- GROUP BY UserProfile.userName;


-- SELECT Video.username, Video.caption
--     FROM Video
--     WHERE LENGTH(Video.caption) > 50
--     GROUP BY Video.username;
    

-- SELECT Video.caption, AVG(Video.likeCount)
--     FROM Video
--     WHERE Video.caption LIKE '%#%';

-- SELECT * FROM UserProfile;
-- SELECT * FROM Video;
-- SELECT * FROM Song;
-- SELECT * FROm Artist;



-- SELECT Artist.artistname, Song.title
--     FROM Artist
--     JOIN Song ON Song.audioId = Artist.audioId
--     WHERE Artist.artistname LIKE '%A%';
    
    
-- SELECT Song.title, Revenue.amount
--     FROM Song
--     JOIN Revenue ON Song.audioId = Revenue.audioId
--     WHERE Revenue.amount > 10000 
--     GROUP BY Revenue.amount DESC;
    
    
    
--   SELECT Artist.artistName, COUNT (Artist.artistName) AS 'frequency'
--     FROM Artist
--     GROUP BY Artist.artistName
--     ORDER BY
--     COUNT(Artist.artistName) DESC;
    
    
--     DECLARE @currentYear INT;
--     SET @currentYear = 2022;

--     SELECT Album.albumName, COUNT (Album.albumName) as 'frequency', Album.releaseYear
--     FROM Album
--     WHERE currentYear -  Album.releaseYear >= 2
--     GROUP BY Album.albumName
--     ORDER BY COUNT(Album.albumName) DESC ;
