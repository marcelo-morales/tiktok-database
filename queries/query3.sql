-- Query 3
-- “Which artists have the most trending songs from TikTok in December 2020?
-- Give me back the artist names in descending order that are part of these trending songs.


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