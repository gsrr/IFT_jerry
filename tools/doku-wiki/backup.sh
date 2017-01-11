#!/bin/bash
rsync -a /var/www/html/dokuwiki/conf/ dokudata/conf/
rsync -a /var/www/html/dokuwiki/bin/ dokudata/bin/
rsync -a /var/www/html/dokuwiki/data/ dokudata/data/