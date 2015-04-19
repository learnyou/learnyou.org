#!/bin/sh

./main.hs rebuild
mv _site www
tar czvf www.tar.gz www
scp www.tar.gz root@learnyou.org:/usr/share/nginx/www.tar.gz
rm _site www www.tar.gz -rv
