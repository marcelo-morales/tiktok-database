-- Query 12
-- “Out of original TikTok video audios, list the username and caption with captions that are longer than 50 characters?
-- Give me back the username of user who posted the video and caption of the video that fits the given descriptions.

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