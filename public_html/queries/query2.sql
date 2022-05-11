-- Query 2
-- What is the average follower count for profiles that had trending TikTok videos in December 2020 and also obtained more than 1200000 likes?
-- Return back the follower count which represents the average
-- good for php input!

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