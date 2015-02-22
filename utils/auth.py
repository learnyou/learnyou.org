from os import urandom
from base64 import b64encode

import pyscrypt as scrypt
from db import db_client
from bottle import redirect, request, response

db = db_client.posts
users = db.users

def gen_token():
    token = b64encode(urandom(1024))
    return token

def check(username, password):
    user = users.find_one({'username': username})
    if user:
        salt = user['salt']
        hpw = scrypt.hash(str(password), salt, 1024, 1, 1, 32).encode('hex')
        if hpw == user['password']:
            return True
    else:
        return False



