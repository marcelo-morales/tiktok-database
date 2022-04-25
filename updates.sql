-- Insert a new TikTok Video!
INSERT INTO Video (videoId, username, caption, commentsCount, likeCount
)
VALUES (12345, 'marcelomorales', 'this is my first tiktok', 10, 50);

-- Let's make this TikTok Video be associated with song
INSERT INTO Song (audioId, title, artist)
VALUES ('98765', 'Despacito', 'Luis Fonsi');

-- This song has made a lot of revenue for TikTok!
INSERT INTO Revenue (audioId, amount)
VALUES (98765, 10000);

-- This song is also part of an album
INSERT INTO Album (albumName,artistName,releaseYear)
VALUES ('VIDA', 'Luis Fonsi', '2019');

-- Create a row for this new artist!
INSERT INTO Artist (artistName,audioId)
VALUES ('Luis Fonsi', '98765');

-- Deleting a tiktok video - foreign key contraints?
DELETE FROM Video WHERE videoId='12345';
