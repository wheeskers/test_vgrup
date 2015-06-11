#!/bin/bash

virtualenv -p /usr/local/bin/python2.7 /home/vagrant/askbot_env
/home/vagrant/askbot_env/bin/pip install askbot psycopg2 uwsgi
/home/vagrant/askbot_env/bin/askbot-setup -n askbot_instance -e 1 -d app_test_db -u app_user -p app_user_test_pass
/home/vagrant/askbot_env/bin/python2.7 /home/vagrant/askbot_instance/manage.py syncdb
/home/vagrant/askbot_env/bin/python2.7 /home/vagrant/askbot_instance/manage.py migrate askbot
/home/vagrant/askbot_env/bin/python2.7 /home/vagrant/askbot_instance/manage.py migrate django_authopenid
