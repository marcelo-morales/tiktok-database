-- Query 10
-- Return a list of userNames of people who have videos with captions that are less than 10 characters but bios longer than 20 characters


DELIMITER //

DROP PROCEDURE IF EXISTS Query10 //

CREATE PROCEDURE Query10()
BEGIN

SELECT UserProfile.userName
FROM UserProfile NATURAL JOIN Video 
WHERE LENGTH(Video.caption) < 10 AND LENGTH(UserProfile.userBio) > 20 
GROUP BY UserProfile.userName
    
END; //

DELIMITER ;