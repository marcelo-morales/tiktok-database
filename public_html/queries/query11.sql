-- Query 11
-- Return the video ID and usernames associated with videos that want to be on the main "for you page" on tiktok and received over 1,000,000 likes

DELIMITER //

DROP PROCEDURE IF EXISTS Query11 //

CREATE PROCEDURE Query11()
BEGIN

SELECT Video.videoId, Video.caption
FROM Video
WHERE Video.caption LIKE '%#fyp%' OR Video.caption LIKE '%#foryoupage%' OR Video.caption LIKE '%#foryou%'
HAVING Video.likeCount > 1000000;
    
END; //

DELIMITER ;