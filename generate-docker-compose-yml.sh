#!/bin/bash

# Set passwords first
num_pass_char=24

redmine_db_password=$(tr -dc A-Za-z0-9 </dev/urandom | head -c $num_pass_char ; echo '')
redmine_secret_key=$(tr -dc A-Za-z0-9 </dev/urandom | head -c $num_pass_char ; echo '')
mysql_root_password=$(tr -dc A-Za-z0-9 </dev/urandom | head -c $num_pass_char ; echo '')

# Replace the string with generated passwords.
cat docker-compose-template.yml | sed "s/___REDMINE_DB_PASSWORD___/$redmine_db_password/g" | \
sed "s/___REDMINE_SECRET_KEY___/$redmine_secret_key/g" |
sed "s/___MYSQL_ROOT_PASSWORD___/$mysql_root_password/g" > docker-compose.yml