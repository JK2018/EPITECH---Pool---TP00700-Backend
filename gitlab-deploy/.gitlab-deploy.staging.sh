# !/bin/bash
# Get servers list:
set — f
git clone git@gitlab.com:commea_a2/timemanagerbackend.git && echo "clonage en cours..." \ 
&& git checkout master && echo "docker-compose..." && docker-compose build && docker-compose-up
