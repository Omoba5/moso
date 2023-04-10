#!/bin/bash

# Step 1: Ensure all apps are up to date
sudo apt-get update

# Have a short break to ensure the updates are completed before installation of Server Stack.
sleep 3

# Step 2: Install the necessary applications
sudo apt-get -y install nginx git

# Start the services
sudo systemctl start nginx
sudo systemctl enable nginx

echo "nginx up and running"

cd /var/www/html
sudo rm -rf *
sudo git clone GITLABREPOURL && echo "Moso interior downloaded sucessfully up and running"

sleep 4

# move the folder content to the html dir and delete the repo
sudo cp -R moso-interior/. . 
sudo rm -rf moso-interior

sudo chown -R www-data:www-data .
sudo find . -type d -exec chmod 755 {} \;
sudo find . -type f -exec chmod 644 {} \;

# Restarting the configured services
sudo systemctl restart nginx
