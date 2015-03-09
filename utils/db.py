from pymongo import MongoClient, ASCENDING, DESCENDING


db_client = MongoClient()


def add_first_user():
    if not list(users.find()):
        salt = encodestring(urandom(40))
        admin_user = {
            'username': 'Enzo',
            'salt': salt,
            'password': hash('SG4jbA2', salt, 1024, 1, 1, 32).encode('hex')
        }
        users.insert(admin_user)

# post = {
#   'title': <str>
#   'author': <str>
#   'file': <str>
#   'content': <text>
#   'date': <date>
#   'lang': <str>
#   'tags': [<str>]
# }

# user = {
#   'username': <str>
#   'hashed_password': <hash>
#   'salt': <str>
# }

