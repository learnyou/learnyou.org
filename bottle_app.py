#!/usr/bin/python
# -*- coding: utf-8 -*-

import io
from os import path
from sys import version as py_ver

from utils.db import db_client, ASCENDING, DESCENDING
from utils.auth import check
from utils.markdown2 import markdown

from bottle import (route, error, abort, static_file, response, template,
__version__, default_app, route, run, request, redirect, auth_basic)

from upload import published


db = db_client.posts
posts = db.posts

STATIC = './static'
MEDIA = './media'
CONTENT = './content'

@error(404)
def error_404(error):
    return '<h1>404</h1>\n<p>&#216;</p>'

@error(500)
def error_500(error):
    return '<h1>500</h1>\n<p>Something went wrong...</p>'

@error(401)
def authenticate(error):
    return 'You shall not pass'

@route('/')
def index():
    try:
        file_path = path.join(CONTENT, 'index.md')
        with io.open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
    except IOError:
        abort(404)
    else:
        html = markdown(content)
        return template('page', content=html)

@route('/blog')
def blog_index():
    articles = posts.find().sort('date', DESCENDING)
    return template('index', content=articles, title=None)


@route('/static/<file:path>')
def static(file):
    return static_file(file, root=STATIC)
@route('/media/<file:path>')
def media(file):
    return static_file(file, root=MEDIA)

@route('/doc/<file:path>')
def doc(file):
    post = posts.find_one({'file': file})
    return template('doc', post=post)

@route('/page/<filename>')
def fetch_page(filename):
    try:
        file_path = path.join(CONTENT, filename)
        with io.open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
    except IOError:
        abort(404)
    else:
        html = markdown(content)
        return template('page', content=html)

@route('/feed')
def feed():
    articles = posts.find().sort('date', DESCENDING).limit(10)
    updated = list(posts.find().sort('date', DESCENDING).limit(1))[0]['date']
    response.content_type = 'application/atom+xml; charset=utf-8'
    return template('atom', articles=articles, updated=updated)
                     
@route('/a/<name>')
def by_author(name):
    articles = posts.find({'author': name}).sort('date', DESCENDING)
    title = 'By %s' % name
    return template('by', content=articles, title=title)

@route('/t/<tag>')
def by_tag(tag):
    articles = posts.find({'tags': tag}).sort('date', DESCENDING)
    title = 'Tagged as "%s"' % tag
    return template('by', content=articles, title=title)

@route('/pub')
@auth_basic(check)
def publish():
    return template('pub', title=None, date=None)

@route('/pub', method='POST')
@auth_basic(check)
def publishing():
    data = request.files.get('content')
    status = published(data)
    if status == 0:
        return redirect('/doc/%s' % data.filename)
    else:
        return status
        
application = default_app()
if __name__ == '__main__':
    run(host='0.0.0.0', port=5000, debug=True)

