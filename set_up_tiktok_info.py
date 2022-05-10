import json
import csv
import random

#cannot download this data set: https://www.kaggle.com/datasets/yamqwe/tiktok-trending-tracks?select=tiktok.csv 
def set_up_profiles():
    #https://www.kaggle.com/datasets/lykin22/tiktok-trending-data
    f = open('source-datasets/users.json')

    # returns JSON object as
    # a dictionary
    data = json.load(f)
    
    # Iterating through the json
    # list
    username_list = []

    profiles_text_file = open("text-datasets/userprofile.txt", "w")

    profiles_text_file.write('Username' + ' , ' + 'personName' + ' , ' + 'userBio' + ' , ' + 'verified' + ' , ' + 'followerCount' + ' , ' + 'likeNumber' + '\n')
    for user in data['user']:

        current_stats = user['stats']
        user = UserProfile(user['id'], user["name"], user['bio'], user['verified'], current_stats['followers'], current_stats['likes'])
        
        username_list.append(user.username)
        
        profiles_text_file.write(user.username + ' % ' + user.personName + ' % ' + user.userBio + ' % ' + str(user.verified) + ' % ' + 
            str(user.followerCount) + ' % ' +  str(user.likeNumber) + ' % ' +  '\n')

    #https://www.kaggle.com/datasets/prasertk/top-1000-tiktok-influencers-ranking?resource=download
    with open('source-datasets/tiktok_top_1000.csv', newline='') as csvfile:
        reader = csv.DictReader(csvfile)

        for row in reader:
           # username, personName, userBio, verified,  followerCount, likeNumber)
            user = UserProfile(str('@' + row['Account']), row['Title'], write_bios_manually(row['Account']) ,True, row['Subscribers count'], row['Likes avg.'])
            
            if (user.username in username_list):
                continue

            profiles_text_file.write(user.username + ' % ' + user.personName + ' % ' +  user.userBio + ' % ' + str(user.verified) + ' % ' + 
                str(user.followerCount) + ' % ' +  str(user.likeNumber) + ' % ' +    '\n')

    
    # trending_artists = open('source-datasets/trending.json')
    # data = json.load(trending_artists)


    # for video in data['collector']:
    #     author_info = video['authorMeta']

    #     verification_result = str(author_info['verified'])


    #     user = UserProfile(str('@' + author_info['name']), author_info['nickName'], author_info['signature'] ,verification_result.capitalize(), random.randint(100000, 50000000), random.randint(100000, 50000000))
    #     if (user.username in username_list):
    #             continue

    #     profiles_text_file.write(user.username + ' % ' + user.personName + ' % ' +  user.userBio + ' % ' + str(user.verified) + ' % ' + 
    #         str(user.followerCount) + ' % ' +  str(user.likeNumber) + ' % ' +    '\n')


    f.close()

def set_up_videos():
    #https://www.kaggle.com/datasets/erikvdven/tiktok-trending-december-2020
    #corresponds to trending tik tok videos
    trending_video_json = open('source-datasets/trending.json')
    data = json.load(trending_video_json)

    text_file_video = open("text-datasets/video.txt", "w")

    text_file_video.write('videoId' + ' , ' + 'username' + ' , ' + 'caption' + ' , ' + 'comments' + ' , ' + 'likeCount' + ' , ' + '\n')

    for video in data['collector']:

        author_info = video['authorMeta']

        video = TikTokVideo(video['id'], author_info['name'], video['text'], video['commentCount'], video['diggCount'])
        text_file_video.write(video.videoId + ' $ ' + '@' + video.username + ' $ ' + video.caption + ' $ ' + 
            str(video.comments) + ' $ ' +  str(video.likeCount) + '$' '\n')

    trending_video_json.close()
    text_file_video.close()


def set_up_music():
    with open('source-datasets/audd_music.csv', newline='') as csvfile:
        
        reader = csv.DictReader(csvfile)

        text_file_song = open("text-datasets/song.txt", "w")
        text_file_song.write('AudioId' + ' , ' + 'Title' + ' , ' + 'Artist' + 
                 '\n')

        text_file_album = open("text-datasets/album.txt", "w")
        text_file_album.write('albumName' + ',' + 'artistName' + ',' + 'releaseYear' + ',' + 'label'
                '\n')

        text_file_artist = open("text-datasets/artist.txt", "w")
        text_file_artist.write('Artist' + ' , ' + 'audioId' +
                 '\n')

        for row in reader:
            current_song = Song(row['id'], row['title'], row['artist'])
            text_file_song.write(str(current_song.audioId) + ' # ' + current_song.title + ' # ' + current_song.artist + ' # ' +
                  '\n')
            
            release_date = row['release_date']
            release_year = release_date[0:4]
            current_album = Album(row['album'], row['artist'], release_year, row['label'])
            text_file_album.write(str(current_album.albumName) + ' # ' + current_album.artistName + ' # ' + current_album.releaseYear + ' # ' + current_album.label + '\n')
            
            current_artist = Artist(row['artist'], row['id'])
            text_file_artist.write(str(current_artist.artistName) + ' * ' + current_artist.audioId + ' * ' + '\n')

        text_file_song.close()
        text_file_album.close()
        text_file_artist.close()

        
def set_up_revenue():
    #a song makes about $0.003 to $0.005 per stream
    #we have approximated the revenue using 
    print('revenue can be found in revenue.txt file')


def write_bios_manually():
    tiktok_artist_bios = {"@charlidamelio" : "", 
    "@chipmunksoftiktok": "this is bio",
    "@billieeilish" : "i am the greatest",
    "@badbunny" : "i am the baddest buny",
    "@yessicadcs" : "i am yes",
    "@the_pruld" : " i am prul",
    "@lukedonkin" : "i am luke",
    "@mastertingus" : "call me master",
   "@txt.bighitent" : " i am the brightest",
   "@besttoks": "come here for the best tiktoks",
   "@machinegunkelly" : "i am in a band",
    "@jenniferkershner" : "hey its jen",
    "@noahschnapp" : "i am friends w charli",
    "@bdylanhollis" : "im bod dyland", 
    "@fisherbenny" : "fishing is my passion",
    "@sylvaniandrama" : "come here for some drama",
    "@iamferv" : "what is going on ya'll", 
    "@mercyfno" : "laugh",
    "@userbigbabywithdaoil" : "oil oil",
    "@bellapoarch" : "i nod my head and make money"
    "@jacobwitzling" : "whats up its jacob",
    "@karna.val" : "its karna yall",
    "@kimberly.loaiza" : "heyyyy",
    "@parthpatel___" : "sign up for new updates daily",
    "@enhypen" : "yo",
    "@jasminechiswell" : "hey im the modern day marilyn..oh and knight is great",
    "@khaby.lame": "whats up today",
    "@y_chun": "i love life",
    "@miakhalifa" : "no im not an actress",
    "@domelipa" :  "no im not dua lipa",
    "@deepins" : "welcome to my page",
    "@kennethkaas" : "hi my name is kenneth",
    "@swagboygorringe" : "yes i am swaggy",
    "@official_nct" : "subscribe down below",
    "@jao" : "new music out",
    "@kjsmoothh" : "yo",
    "@loganpaul" : "new youtube video out",
    "@pongamoslo_a_prueba" : "ask whatever questions you want!",
    "@nei.okey" : "click the link in the bio for more",
    "@bintangemontersenyum" : "bingy",
    "@mero_428" : "doing this for fun",
    "@zeth" : "thanks for visiting",
    "@addisonre" : "Obsessed is now out",
    "@savanahmosss" : "new skincare routine out",
    "@kaliandarie" : "its so nice to finally meet you",
    "@nilered" : "hey",
    "@.raquel_e" : "new music out soon",
    "@mackenzieziegler" : "watch me dance",
    "@kimandnorth" : "me and my bestie. account run by an adult",
    "@druskitv" : "new episode out now on all platforms",
    "@nicolebernaal" : "hey its so nice to finally see u",
    "@alexisomman" : "dance with me",
    "@trungruoi93" : "come for a new sports event", 
    "@the_trickstars": "yes we do tricks",
    "@os.sksk" : "cashapp: xoxo",
    "@alexitoxedits" : "edits of my fav singers",
    "@soysuco" : "hola todos",
    "@evcnoble" : "i am royalty",
    "@nekoglai" : "heyyyy",
    "@evlawler" : "lets read together",
    "@ahw5d" : "It's ahmed",
    "@axelwebber" : "lets dance",
    "@madison.darwin" : "no i did not create biology",
    "@strangehumano" : "i am not strange, im human!",
    "@alexschlab" : "new makeup tutorial out",
    "@masonramsey" : "my dad cany cook",
    "@connordewolfe" : "yessssir",
    "@drewafualo" : "giving yall the best advice",
    "@johnnysins" : "check out my link for more"

    }



#take out folllowing count
class UserProfile:
  def __init__(self, username, personName, userBio, verified,  followerCount, likeNumber):
    self.username = username
    self.personName = personName
    self.userBio = userBio
    self.verified = verified
    self.followerCount = followerCount
    self.likeNumber = likeNumber

class TikTokVideo:
  def __init__(self, videoId, username, caption, comments, likeCount):
    self.videoId = videoId
    self.username = username
    self.caption = caption
    self.comments = comments
    self.likeCount = likeCount

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
    def __init__(self, albumName, artistName, releaseYear, label):
        self.albumName = albumName
        self.artistName = artistName
        self.releaseYear = releaseYear
        self.label = label

class Revenue:
    def __init__(self, audioId, amount):
        self.audioId = audioId
        self.amount = amount


if __name__ == "__main__":
    set_up_profiles()
    set_up_videos()
    set_up_music()
    set_up_revenue()
    print("All the text files have been filled with data")
