--  Query 7
-- What is the average like count for profiles that had trending TikTok videos in December 2020?
-- Give me back the username and the average follow count for each profile

DELIMITER //

DROP PROCEDURE IF EXISTS Query7 //

CREATE PROCEDURE Query7()
BEGIN
    SELECT UserProfile.username, AVG(UserProfile.followerCount) AS 'averageFollowerCount'
    FROM UserProfile, Video
    WHERE UserProfile.username = Video.username; 
END; //

DELIMITER ;