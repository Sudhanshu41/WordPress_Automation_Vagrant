#!/bin/bash

echo "Updating system..."
sudo apt update -y

echo "Installing dependencies..."
sudo apt install apache2 \
ghostscript \
libapache2-mod-php \
mysql-server \
php \
php-bcmath \
php-curl \
php-imagick \
php-intl \
php-json \
php-mbstring \
php-mysql \
php-xml \
php-zip -y

echo "Creating web directory..."
sudo mkdir -p /srv/www
sudo chown www-data: /srv/www

echo "Downloading WordPress..."
curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www

echo "Configuring Apache site..."

sudo bash -c 'cat > /etc/apache2/sites-available/wordpress.conf <<EOF
<VirtualHost *:80>
    DocumentRoot /srv/www/wordpress

    <Directory /srv/www/wordpress>
        Options FollowSymLinks
        AllowOverride Limit Options FileInfo
        DirectoryIndex index.php
        Require all granted
    </Directory>

    <Directory /srv/www/wordpress/wp-content>
        Options FollowSymLinks
        Require all granted
    </Directory>
</VirtualHost>
EOF'

echo "Enabling Apache configuration..."

sudo a2ensite wordpress
sudo a2enmod rewrite
sudo a2dissite 000-default

sudo systemctl reload apache2

echo "Creating WordPress database..."

sudo mysql -e "CREATE DATABASE wordpress;"
sudo mysql -e "CREATE USER 'wordpress'@'localhost' IDENTIFIED BY 'password';"
sudo mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"

echo "Configuring wp-config..."

sudo -u www-data cp /srv/www/wordpress/wp-config-sample.php /srv/www/wordpress/wp-config.php

sudo -u www-data sed -i "s/database_name_here/wordpress/" /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i "s/username_here/wordpress/" /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i "s/password_here/password/" /srv/www/wordpress/wp-config.php

echo "Restarting Apache..."
sudo systemctl restart apache2

echo "WordPress installation completed!"
