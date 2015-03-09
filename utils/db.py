from pymongo import MongoClient, ASCENDING, DESCENDING


client = MongoClient()
db = client.posts

posts = db.posts
users = db.users

def posts_by_date(lim=0, descending=True):
    order = DESCENDING if descending else ASCENDING
    return posts.find().sort('date', order).limit(lim)

def posts_by_author(author, lim=0, descending=True):
    order = DESCENDING if descending else ASCENDING
    return posts.find({'author': author}).sort('date', order).limit(lim)

def posts_by_tag(tag, lim=0, descending=True):
    order = DESCENDING if descending else ASCENDING
    return posts.find({'tags': tag}).sort('date', order).limit(lim)

def user(username):
    return users.find_one({'username': username})

def post(file):
    return posts.find_one({'file': file})