--  Query 5
--  “Which songs that are not part of an album, have just been released as singles, and have made a revenue greater than $10,000?”
-- Give me back the song titles and revenue.

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