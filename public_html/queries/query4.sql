--  Query 4
--  What album has the most trending songs in TikTok in December 2020 and has been released in the past 2 years?
-- Give me back the album name, and release year in descending order.


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