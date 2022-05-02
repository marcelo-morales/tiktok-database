--  Query 6
--  Find all TikTok videos whose videos are more than the average number of likes?
-- Give me back the caption of the video and the number of likes this TikTok video has.

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