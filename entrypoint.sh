#!/bin/bash

# Check if the local folder is empty
if [ "$(ls -A /var/www/html)" ]; then
    echo "Local folder is not empty. Skipping file copy."
else
    echo "Local folder is empty. Copying files from container."
    cp -R /var/www/container_files/* /var/www/html/
fi

chown -R www-data:www-data /var/www/html
chmod -R 777 /var/www/html

# Start the Apache server in the foreground
exec apache2-foreground
