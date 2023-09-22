#!/bin/bash

service mysql start

sleep 5

mysql_secure_installation << EOF

n
Y
Y
Y
Y
EOF

mysql -u root  << EOF
CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress_user'@'%' IDENTIFIED BY 'wordpress_password';
FLUSH PRIVILEGES;
EOF


wget https://wordpress.org/latest.zip

unzip latest.zip -d /var/www/html/

cd /var/www/html/wordpress

cp wp-config-sample.php wp-config.php

sed -i "s/database_name_here/wordpress/g" wp-config.php

sed -i "s/username_here/wordpress_user/g" wp-config.php

sed -i "s/password_here/wordpress_password/g" wp-config.php

# sed -i "s/localhost/$(hostname -i)/g" wp-config.php

# rm -rf /var/www/html/index.html

chown -R www-data:www-data /var/www/html/wordpress/

nginx

# chmod -R 755 /var/www/html/wordpress

# service mysql stop

# sleep 5

# killall mysqld

# /usr/bin/mysqld_safe

echo "Success"

while true; do sleep 1000; done