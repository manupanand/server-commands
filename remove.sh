#!/bin/bash

# Function to remove Redis
remove_redis() {
  echo "Removing Redis..."
  sudo systemctl stop redis-server
  sudo systemctl disable redis-server
  sudo apt-get purge -y redis-server
  sudo apt-get autoremove -y
  sudo apt-get autoclean
  sudo rm -rf /etc/redis /var/lib/redis /var/log/redis
  echo "Redis removed successfully."
}

# Function to remove MongoDB
remove_mongodb() {
  echo "Removing MongoDB..."
  sudo systemctl stop mongod
  sudo systemctl disable mongod
  sudo apt-get purge -y mongodb-org
  sudo apt-get autoremove -y
  sudo apt-get autoclean
  sudo rm -rf /etc/mongod.conf /var/lib/mongodb /var/log/mongodb
  echo "MongoDB removed successfully."
}

# Function to remove PostgreSQL
remove_postgresql() {
  echo "Removing PostgreSQL..."
  sudo systemctl stop postgresql
  sudo systemctl disable postgresql
  sudo apt-get purge -y postgresql* libpq-dev
  sudo apt-get autoremove -y
  sudo apt-get autoclean
  sudo rm -rf /etc/postgresql /var/lib/postgresql /var/log/postgresql
  echo "PostgreSQL removed successfully."
}
# Function to remove MongoDB Compass
remove_mongo_compass() {
  echo "Removing MongoDB Compass..."
  sudo apt-get purge -y mongodb-compass
  sudo apt-get autoremove -y
  sudo apt-get autoclean
  echo "MongoDB Compass removed successfully."
}

# Confirm before proceeding
echo "This script will remove Redis, MongoDB, and PostgreSQL from your system."
echo "This includes configuration files and data directories."
read -p "Are you sure you want to proceed? (yes/no): " confirm

if [[ "$confirm" != "yes" ]]; then
  echo "Operation cancelled."
  exit 1
fi

# Execute removal functions
remove_redis
remove_mongodb
remove_postgresql
remove_mongo_compass

echo "All specified databases have been removed."
exit 0
