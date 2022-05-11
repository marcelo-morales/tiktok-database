-- Query 9
-- List the user bios of all verified users who have over 100,000 likes and whose bios contain the word "hey"

DELIMITER //

DROP PROCEDURE IF EXISTS Query9 //

CREATE PROCEDURE Query9()
BEGIN

SELECT UserProfile.userBio
FROM UserProfile
WHERE UserProfile.userBio LIKE '%hey%' AND UserProfile.verified LIKE '%True%'
HAVING UserProfile.likeCount > 100000;

    
END; //

DELIMITER ;