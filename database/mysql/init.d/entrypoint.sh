#!/bin/bash

# Wait for MySQL to start
until mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "select 1" &> /dev/null; do
  echo "Waiting for MySQL to be ready..."
  sleep 3
done

# Execute SQL commands
mysql -u root -p${MYSQL_ROOT_PASSWORD} <<EOF
GRANT SELECT, RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO '${MYSQL_USER}'@'%';
GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF
