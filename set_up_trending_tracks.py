import json

def set_up_profiles():
    #https://www.kaggle.com/datasets/lykin22/tiktok-trending-data
    f = open('users.json')

    # returns JSON object as
    # a dictionary
    data = json.load(f)
    
    # Iterating through the json
    # list
    text_file = open("userprofile.txt", "w")
    for user in data['user']:
        print(user)
        print('this is username' + str(user['id']))
        current_stats = user['stats']
        user = UserProfile(user['id'], user['bio'], user['verified'], current_stats['followers'], current_stats['likes'])

        print('this is like number for user ' + str(user.likeNumber))

        text_file.write(user.username + ' ' + user.userBio + ' ' + str(user.verified) + ' ' + 
        str(user.followCount) + ' ' +  str(user.likeNumber) +   '\n\n')

    # Closing file
    f.close()

def set_up_videos():
    #https://www.kaggle.com/datasets/erikvdven/tiktok-trending-december-2020
    #corresponds to trending tik tok videos
    f = open('trending.json')
    data = json.load(f)

    text_file = open("video.txt", "w")

    for video in  data['collector']:
        print('this is web video url' + video['webVideoUrl'])

        author_info = video['authorMeta']

        video = TikTokVideo(video['id'], author_info['name'], video['text'], video['commentCount'])
        text_file.write(video.videoId + ' ' + video.username + ' ' + video.caption + ' ' + 
        str(video.comments) +   '\n\n')

    f.close()


#take out folllowing count
class UserProfile:
  def __init__(self, username, userBio, verified,  followCount, likeNumber):
    self.username = username
    self.userBio = userBio
    self.verified = verified
    self.followCount = followCount
    #self.followingCount = followingCount
    self.likeNumber = likeNumber

class TikTokVideo:
  def __init__(self, videoId, username, caption, comments):
    self.videoId = videoId
    self.username = username
    self.caption = caption
    self.comments = comments


if __name__ == "__main__":
    #set_up_profiles()
    set_up_videos()