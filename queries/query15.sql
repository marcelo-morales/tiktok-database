-- Query 15
--For the artist who made the most revenue from TikTok videos in December 2020, list the song title, artist name
-- and revenue amoun, sorted in highest to lowest revenue amount if the artist has released multiple songs

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