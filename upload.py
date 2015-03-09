from os.path import splitext
from zipfile import ZipFile
from datetime import datetime

import utils.db as db
from utils.markdown2 import markdown

from config import MEDIA

class Err(object):
    def __init__(self, err):
        self.err = err

def read_zip(z):
    """ Saves medias and returns content """
    with ZipFile(z) as zip:
        zip_list = zip.namelist()
        count = lambda n, ext: n+1 if ext.endswith('.md') else n
        number_md = reduce(count, zip_list, 0)
        if number_md != 1:
            return Err('Only one Markdown file')
        buf = None
        for f in zip_list:
            if f.endswith('.md'):
                buf = zip.read(f, 'r')
            else:
                save_path = MEDIA
                zip.extract(f, save_path)
        return buf

def read_upload(f):
    """ Read the uploaded file and return content """
    _, ext = splitext(f.filename)
    if ext in ('.md', '.markdown'):
        buf = f.file.read()
        return buf
    elif ext == '.zip':
        return read_zip(f.file)
    else:
        return Err('Extension not allowed')


def store_post(buf, filename):
    """ Extract metadata of content and stores a new post in DB """
    html = markdown(buf, extras=['metadata'])
    meta = html.metadata
    new_post = {
        'author': meta.get('author', 'Anonymous'),
        'title': meta.get('title', 'Untitled'),
        'tags': meta.get('tags', '').lower().split(),
        'lang': meta.get('lang', 'en'),
        'file': filename,
        'content': html,
        'date': datetime.now()
    }
    try:
        db.posts.insert(new_post)
    except:
        return Err('Database did not responded')
    else:
        return 0    # OK, everything went well


def published(upload):
    data = upload or Err('No file')
    if isinstance(data, Err): return data.err
    r = read_upload(data)
    if isinstance(r, Err): return r.err
    s = store_post(r, data.filename)
    if isinstance(r, Err): return s.err
    return 0

