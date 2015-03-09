from os import urandom
from base64 import b64encode

import pyscrypt as scrypt
import utils.db as db
from bottle import redirect, request, response

def gen_token():
    token = b64encode(urandom(1024))
    return token

def check(username, password):
    user = db.user(username)
    if user:
        salt = user['salt']
        hpw = scrypt.hash(str(password), salt, 1024, 1, 1, 32).encode('hex')
        if hpw == user['password']:
            return True
    else:
        return False



