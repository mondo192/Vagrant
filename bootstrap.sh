#!/usr/bin/env bash

PASSWORD='12345678'

# Upgrade and upgrade 
sudo apt-get update && \ 
sudo apt-get -y --with-new-pkgs upgrade && \
sudo apt-get -y autoremove && sudo apt-get autoclean

# Install apache and php
sudo apt-get -y install apache2 php7.4

# Setup hosts file
VHOST=$(cat <<EOF
<VirtualHost *:80>
    DocumentRoot "/var/www/html/class"
	<Directory  "/var/www/html/class">  
	    AllowOveride All
		Require all granted
	</Directory>
</VirtualHost>
EOF
)
echo "${HOST}" > /etc/apache2/sites-available/000-default.conf

# Enable mod_rewrite
sudo a2enmod rewrite

# Restart apache service
systemctl restart apache2
