#!/bin/bash

git clone https://github.com/ActiveLearningStudio/curriki-tsugi-module.git /tmp/curriki
mkdir -p /var/www/html/mod/curriki
mv /tmp/curriki/* /var/www/html/mod/curriki/

