#!/bin/bash

sudo yum update
sudo amazon-linux-extras install nginx1 -y
sudo systemctl start nginx
sudo systemctl enable nginx 
sudo systemctl status nginx

echo "<h1> This app is deployed on Nginx by packer </h1>" > /var/www/html/index.html