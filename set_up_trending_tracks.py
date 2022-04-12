import json
import csv

#cannot download this data set: https://www.kaggle.com/datasets/yamqwe/tiktok-trending-tracks?select=tiktok.csv 
def set_up_profiles():
    #https://www.kaggle.com/datasets/lykin22/tiktok-trending-data
    f = open('users.json')

    # returns JSON object as
    # a dictionary
    data = json.load(f)
    
    # Iterating through the json
    # list
    username_list = []

    text_file = open("userprofile.txt", "w")
    for user in data['user']:
        print(user)
        current_stats = user['stats']
        user = UserProfile(user['id'], user['bio'], user['verified'], current_stats['followers'], current_stats['likes'])
        
        username_list.append(user.username)
        
        text_file.write(user.username + ' $ ' + user.userBio + ' $ ' + str(user.verified) + ' $ ' + 
            str(user.followerCount) + ' $ ' +  str(user.likeNumber) +   '\n')

    with open('tiktok_top_1000.csv', newline='') as csvfile:
        reader = csv.DictReader(csvfile)

        for row in reader:
            user = UserProfile(str('@' + row['Account']), row['Title'], True, row['Subscribers count'], row['Likes avg.'])
            
            if (user.username in username_list):
                continue

            text_file.write(user.username + ' $ ' + user.userBio + ' $ ' + str(user.verified) + ' $ ' + 
                str(user.followerCount) + ' $ ' +  str(user.likeNumber) +   '\n')

    f.close()

def set_up_videos():
    #https://www.kaggle.com/datasets/erikvdven/tiktok-trending-december-2020
    #corresponds to trending tik tok videos
    f = open('trending.json')
    data = json.load(f)

    text_file = open("video.txt", "w")

    for video in  data['collector']:

        author_info = video['authorMeta']

        video = TikTokVideo(video['id'], author_info['name'], video['text'], video['commentCount'])
        text_file.write(video.videoId + ' $ ' + video.username + ' $ ' + video.caption + ' $ ' + 
            str(video.comments) +   '\n')

    f.close()


def set_up_music():
    with open('audd_music.csv', newline='') as csvfile:
  
        text_file_song = open("song.txt", "w")
        reader = csv.DictReader(csvfile)
        text_file_song.write('AudioId' + ' # ' + 'Title' + ' # ' + 'Artist' + 
                 '\n')

        text_file_album = open("album.txt", "w")
        text_file_album.write('albumName' + ',' + 'artistName' + ',' + 'releaseYear' + 
                '\n')

        text_file_artist = open("artist.txt", "w")
        text_file_artist.write('Artist' + ' * ' + 'audioId' +
                 '\n')

        for row in reader:
            current_song = Song(row['id'], row['title'], row['artist'])
            text_file_song.write(str(current_song.audioId) + ' # ' + current_song.title + ' # ' + current_song.artist +
                  '\n')
            
            release_date = row['release_date']
            release_year = release_date[0:4]
            current_album = Album(row['album'], row['artist'], release_year)
            text_file_album.write(str(current_album.albumName) + ' # ' + current_album.artistName + ' # ' + current_album.releaseYear +  '\n')
            
            current_artist = Artist(row['artist'], row['id'])
            text_file_artist.write(str(current_artist.artistName) + ' * ' + current_artist.audioId +  '\n')

        
def set_up_revenue():
    #a song makes about $0.003 to $0.005 per stream
    #we have approximated the revenue using 
    print('revenue can be found in revenue.txt file')


#take out folllowing count
class UserProfile:
  def __init__(self, username, userBio, verified,  followerCount, likeNumber):
    self.username = username
    self.userBio = userBio
    self.verified = verified
    self.followerCount = followerCount
    #self.followingCount = followingCount
    self.likeNumber = likeNumber

class TikTokVideo:
  def __init__(self, videoId, username, caption, comments):
    self.videoId = videoId
    self.username = username
    self.caption = caption
    self.comments = comments

class Song:
    def __init__(self, audioId, title, artist):
        self.audioId = audioId
        self.title = title
        self.artist = artist

class Artist:
    def __init__(self, artistName, audioId):
        self.artistName = artistName
        self.audioId = audioId
      

class Album:
    def __init__(self, albumName, artistName, releaseYear):
        self.albumName = albumName
        self.artistName = artistName
        self.releaseYear = releaseYear

class Revenue:
    def __init__(self, audioId, amount):
        self.audioId = audioId
        self.amount = amount


if __name__ == "__main__":
    set_up_profiles()
    set_up_videos()
    set_up_music()
    set_up_revenue()