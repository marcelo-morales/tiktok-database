-- Query 1
-- Which song made the least amount of revenue in the timeframe of December 2020?
-- Return back the song title, artist, and the minimum amount of revenue

DELIMITER //

DROP PROCEDURE IF EXISTS Query1 //

CREATE PROCEDURE Query1()
BEGIN
    SELECT Song.title, Song.artist, MIN(Revenue.amount) AS Minimum_Revenue
        FROM Song, Revenue
        WHERE Song.audioId = Revenue.audioId;
END; //

DELIMITER ;