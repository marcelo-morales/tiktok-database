-- Query 1
-- Which song made the least amount of revenue in the timeframe of December 2020?
SELECT Song.title, Song.artist, MIN(Revenue.amount)
    FROM Song, Revenue
    WHERE Song.audioId = Revenue.audioId;

-- Query 2
-- What is the average follower count for profiles that had trending TikTok videos in December 2020?
SELECT AVG(UserProfile.followerCount)
    FROM UserProfile as U, Video as V
    WHERE UserProfile.username = Video.username;

-- Query 3
-- “Which artists have the most trending songs from TikTok in December 2020?
SELECT Artist.artist
    COUNT (Artist.artist) as 'frequency'
    FROM Artist
    GROUP BY Artist.artist
    ORDER BY 'frequency' DESC 
    LIMIT 1;

--  Query 4
--  “What album has the most trending songs in TikTok in December 2020?”
SELECT Album.albumName
    COUNT (Album.albumName) as 'frequency'
    FROM Album
    GROUP BY Album.albumName
    ORDER BY 'frequency' DESC 
    LIMIT 1;

--  Query 5
--  “Which songs that are not part of an album, have just been released as singles, and have made a revenue greater than $10,000?”
SELECT Song.title
    FROM Song, Revenue
    WHERE Revenue.amount > 10000 AND Song.albumName = NULL
    GROUP BY Song.amount ;

--  Query 6
--  How many comments does the TikTok video with the most revenue have?

--  Query 7
-- What is the average follower count for profiles that had trending TikTok videos in December 2020?
SELECT UserProfile.username, AVG(UserProfile.followerCount)
    FROM UserProfile, Video
    WHERE UserProfile.username = Video.username; 

-- Query 9
-- List the caption and sound/song used for the TikTok video that has the longest caption from all unverified users
SELECT Video.caption, Song.title
    FROM Video, Song
    WHERE Video.audioId = Song.audioId 
    ORDER BY LEN(Video.caption) DESC
    LIMIT 1;

-- Query 10
-- How many profiles were unverified and did not utilize hashtags in their caption from the trending TikTok video dataset?
SELECT UserProfile.username
    FROM UserProfile, Video
    WHERE UserProfile.verified  LIKE '%False%' AND
    Video.caption NOT IN '%#%' AND UserProfile.username = Video.username ;

-- Query 11
-- What is the mean like number for a TikTok video with more than one hashtag
SELECT Video.caption, AVG(Video.likeNumber)
    FROM Video
    WHERE Video.caption LIKE '%#%';


-- Query 12
-- “Out of original TikTok video audios, list the username and caption with captions that are longer than 50 characters?

SELECT Video.username, Video.caption
FROM Video
WHERE LENGTH(Video.caption) > 50
GROUP BY Video.username;


-- Query 13
 -- "Out of profiles that are verified in TikTok, list the minimum number of followers and maximum numbers of likes, as well as the associated userID"

SELECT UserProfile.userName, MIN(UserProfile.followerCount), MAX(UserProfile.likeCount)
FROM UserProfile
WHERE UserProfile.verified = 'True'
GROUP BY UserProfile.userName;


-- Query 14

-- "Out of profiles that are verified in TikTok, list the username and number of likes for each of their TikTok Videos from December 2020. 

-- Query 15

--" For the artist who made the most revenue from TikTok videos in December 2020, list each of their audios in terms of least to greatest revenue"