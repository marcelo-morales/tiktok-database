-- Query 14
-- Out of profiles that are verified in TikTok, list the username and number of likes for each of their TikTok 
-- Videos from December 2020. 

DELIMITER //

DROP PROCEDURE IF EXISTS Query14 //

CREATE PROCEDURE Query14()
BEGIN
    SELECT UserProfile.userName, UserProfile.likeNumber
    FROM UserProfile 
    WHERE UserProfile.verified LIKE '%True%'
    GROUP BY UserProfile.userName;

END; //

DELIMITER ;